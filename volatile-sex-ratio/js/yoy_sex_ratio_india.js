$(document).ready(function(){
  var map = L.map('yoy_sex_ratio', {
        center: [23, 83],
        zoom: 4,
      });

  var mapbox_token = 'pk.eyJ1IjoiZng4NiIsImEiOiJjajhsdzhmOGMwczJ4MndtdXNkbm1jcGxrIn0.YsCl0mpdTQyMPd0URDwweA',
      mapbox_tile_url = 'https://api.tiles.mapbox.com/v4/mapbox.light/{z}/{x}/{y}.png?access_token=',
      osm_tile_url = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  var tileLayer = L.tileLayer(mapbox_tile_url+mapbox_token, {
        maxZoom: 18
        });

  map.addLayer(tileLayer);
  var state_data = (function() {
        var df = null;
        $.ajax({
            'async': false,
            'global': false,
            'url': "data/yoy_sex_ratio.json",
            'dataType': "json",
            'success': function (data) {
                df = data;
            }
        });
        return df;
    })();;

  var indi_state = new L.LayerGroup();
  function zoomToFeature(e) {
      var state =  e.target.feature.properties.ST_NM.toUpperCase();
      url = url.update({'State':state, 'level':'City', 'Metric_Low':null, 'Metric_High':null})
      window.location.href = url;
  }
  
  function resetHighlight(e) {
      var layer = e.target;
      layer.setStyle({
          weight: 2,
          color: 'transparent',
          dashArray: '',
          fillOpacity: 0.7
      });
      if (!L.Browser.ie && !L.Browser.opera) {
          layer.bringToFront();
      }
      info.update();
  }

  function highlightFeature_updateLegend(e) {
    var layer = e.target;
    info.update(layer.feature.properties);
    layer.setStyle({
        weight: 2,
        color: '#666',
        dashArray: '',
        fillOpacity: 0.7
    });
    layer.on('mouseover', function (e) {
       this.openPopup();
    });
    if (!L.Browser.ie && !L.Browser.opera) {
        layer.bringToFront();
    }
  }

  function onEachFeature(feature, layer) {
      layer.on({
        mouseover: highlightFeature_updateLegend,
        mouseout: resetHighlight,
        click: zoomToFeature
      });
  }
  
  $.getJSON('data/india.json', function(topo){
      var geojson = topojson.feature(topo, topo.objects[Object.keys(topo.objects)[0]]);
      L.geoJson(geojson, {
          style: function(feature) {
            return {
              fillColor: getColor(state_data['totals_diff'][feature.properties.ST_NM]),
              opacity:1,
              weight: 2,
              color: 'transparent',
              dashArray: '3',
              fillOpacity: .65,
            }
          },
          onEachFeature: onEachFeature,
        }).addTo(indi_state);

    });

  map.addLayer(indi_state);

  // information
  var info = L.control();
  info.onAdd = function (map) {
      this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
      this.update();
      return this._div;
  };
  // method that we will use to update the control based on feature properties passed
  info.update = function (props) {
      this._div.innerHTML = '<h4>Absolute change in sex ratio (NFHS 2005 vs NFHS 2015)</h4>' +  (props ?
          '<b>' + props.ST_NM + '</b> : ' + state_data['totals_diff'][props.ST_NM] + 
          ' females per 1000 males': 'Hover over a state');
  };
  info.addTo(map);

  // draw a legend 
  var sex_ratio = [-100, -30, 0, 30, 100];
  function getColor(d) {
    return d > 100  ? '#1a9641'  :
           d > 30  ? '#a6d96a'  :
           d > 0  ?  '#ffffbf'  :
           d > -30 ? '#fdae61'  :
           d > -100 ? '#d7191c' :
                      '';
  }
  var legend = L.control({position: 'topright'});
  legend.onAdd = function (map) {
      var div = L.DomUtil.create('div', 'info legend'),
          labels = [];

      for (var i = 0; i < sex_ratio.length; i++) {
          div.innerHTML +=
              '<i style="background-color:' + getColor(sex_ratio[i] + 1) + ';"></i> ' +
              sex_ratio[i] + ' &ndash; ' + sex_ratio[i + 1] + '<br>';
      }
      return div;
  };
  legend.addTo(map);


});
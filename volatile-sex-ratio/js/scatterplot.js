/* script-transition.js */

// geometry of inner svg plotting area
var margin = {
    top: 40,
    right: 20,
    bottom: 70,
    left: 60
};
var width = 800 - margin.left - margin.right;
var height = 400 - margin.top - margin.bottom;

// details about the data
var dataFileName = "data/sex_ratio_change.csv",
    varNames = {
        "xData": "st_2015",
        "xLabelText": "sex ratio as per NFHS-2015",
        "yData": "nfhs_change",
        "yLabelText": "absolute change in sex ratio"
    };

// x-axis
var xValue = function(d) { return d[varNames.xData]; },
    xScale = d3.scaleLinear().range([0, width]),
    xMap = function(d) { return xScale(xValue(d)); },
    xAxis = d3.axisBottom(xScale).ticks(7);

// y-axis
var yValue = function(d) { return d[varNames.yData]; },
    yScale = d3.scaleLinear().range([height, 0]),
    yMap = function(d) { return yScale(yValue(d)); },
    yAxis = d3.axisLeft(yScale).ticks(4);

var scatterSize = 10;
function getColor(d) {
    if(d.length > 0){
        d = parseFloat(d);
        return d > 30  ? '#1a9641'  :
               d > 0  ?  '#ffff00'  :
               d > -30 ? '#fdae61'  :
               d > -100 ? '#d7191c' :
                          '';}
    else{
        console.log(d, parseFloat(d))
        return '#ccc'
    }
  }

var svg = d3.select("div.scatter").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

function setupData() {
    d3.csv(dataFileName, type, function(error, data) {
        window.data = data;
        console.log("loading data from csv")

        // xScale.domain(d3.extent(data, function(d) { return d[varNames['xData']]; }));
        xScale.domain([600, 1150]);
        yScale.domain([-200, 100]);

        var tooltip = d3.select(".scatter").append("div")
                  .attr("class", "tooltip")
                  .style("opacity", 0);

        var tipMouseover = function(d) {
            var html  = "<table><caption><b>"+ d.state + "</b></caption><tbody><tr>"+
                "<td></td><td></td></tr>" ;
                if(varNames['xData'] !== 'st_2011'){
                    html +="<tr><td>In NFHS 2015-16:    " + 
                            (d.nfhs_change>0?" rose by ": "fell by ") + 
                            Math.abs(d.nfhs_change) + "</td>" +
                            "<td>, to " + d.st_2015 + "</td></tr>"
                } else{
                    html += "<tr><td>In Census 2010-11: " + 
                            (d.census_change>0? " rose by ": "fell by ") + 
                            Math.abs(d.census_change) + "</td>" +
                            "<td>, to " + d.st_2011 + "</td></tr>"}
                
                html += "</tbody></table>";

            tooltip.html(html)
              .style("left", (d3.event.pageX + 15) + "px")
              .style("top", (d3.event.pageY - 28) + "px")
            .transition()
              .duration(200)
              .style("opacity", .9);

            d3.selectAll(".state")
                  .style("opacity", function(e) {
                    return (e.state === d.state) ? 1.0 : 0.2;
                });

        };

        var tipMouseout = function(d) {
            tooltip.transition()
                .duration(300) // ms
                .style("opacity", 0);

            d3.selectAll(".state")
                  .style("opacity", function(e) {
                    return 1;
                });
        };

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.append('line')
            .attr('x1', 0)
            .attr('y1', yScale(0))
            .attr('x2', width)
            .attr('y2', yScale(0))
            .attr('stroke-width', 2)
            .attr('stroke', '#ccc')
            .attr('stroke-dasharray', (10, 10));

        svg.append("text")    
            .attr("class", "x_axis_label")         
            .attr("transform",
                "translate(" + (width/2) + " ," + 
                               (height + margin.top + 20) + ")")
            .style("text-anchor", "middle")
            .style("font-size", '16px')
            .text(varNames.xLabelText);

        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 0 - margin.left)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .style("font-size", '16px')
            .text(varNames.yLabelText);

        svg.append("text")
            .attr("transform", "rotate(-90)")
            .attr("class", "y_axis_label")
            .attr("y", 0 - margin.left)
            .attr("x",0 - (height / 2))
            .attr("dy", "1em")
            .style("text-anchor", "middle")
            .text(varNames.yLabelText);

        svg.append("g").selectAll(".circle")
            .data(data)
            .enter().append("circle")
            .attr('class', 'state')
            .attr("transform", "translate(" + margin.left + ", 0)")
            .attr("cx", xMap)
            .attr("cy", yMap)
            .attr("r", scatterSize)
            .style('fill', 'transparent')
            .attr('stroke-width', 4)
            // .attr('stroke', function(d){ return d[varNames['yData']]>=0? "#008fd5": "#ff2700"})
            .attr('stroke', function(d){ return getColor(d[varNames['yData']])})
            .on("mouseover", tipMouseover)
            .on("mouseout", tipMouseout);;
    });
}

// type conversion - helper
function type(d) {
    // numeric data
    // d['census_change'] = +d['census_change'];
    // d['nfhs_change'] = +d['nfhs_change'];
    d['st_2015'] = +d['st_2015'];
    d['st_2011'] = +d['st_2011'];
    return d;
}

setupData();

function update_data() {
    if(varNames['yData'] == 'nfhs_change'){
        varNames['yData'] = 'census_change';
        varNames['xData'] = 'st_2011';
        varNames['xLabelText'] = "sex ratio as per Census-2011";
    } else {
        varNames['yData'] = 'nfhs_change';
        varNames['xData'] = 'st_2015';
        varNames['xLabelText'] = "sex ratio as per NFHS 2015-16";
    }
    // console.log(varNames)
    animateData(window.data);
}

// On click, update with new data
function animateData(data) {

    if(varNames['xData'] == 'st_2011'){
        d3.select('span.survey_name').text("Census 2010-11");
    }
    else {
        d3.select('span.survey_name').text("NFHS 2015-16");
    }

    d3.select('.x_axis_label').text(varNames['xLabelText']);
    svg.selectAll("circle")
        .data(data)
        .transition()
        .duration(3000)
        .attr("r", scatterSize) // Change size
        .ease(d3.easeQuadInOut)
        .attr("cx", function(d) {
            return xScale(d[varNames['xData']]);
        })
        .attr("cy", function(d) {
            return yScale(d[varNames['yData']]);
        })
        .attr('stroke', function(d){ console.log(d);
                                return getColor(d[varNames['yData']])})
        // .on("interrupt", function(d) {
        //     // TODO : why isn't color updating after transition
        //     d3.select(this)
        //         .attr("r", scatterSize)
        //         .attr('stroke', function(d){ console.log(d);
        //                                     return getColor(d[varNames['yData']])});
        // });

}
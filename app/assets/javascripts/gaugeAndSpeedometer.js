var svg = d3.select("#speedometer")
        .append("svg:svg")
        .attr("width", 400)
        .attr("height", 400);


var gauge = iopctrl.arcslider()
        .radius(120)
        .events(false)
        .indicator(iopctrl.defaultGaugeIndicator);
gauge.axis().orient("in")
        .normalize(true)
        .ticks(12)
        .tickSubdivide(3)
        .tickSize(10, 8, 10)
        .tickPadding(5)
        .scale(d3.scale.linear()
                .domain([0, 160])
                .range([-3*Math.PI/4, 3*Math.PI/4]));

var segDisplay = iopctrl.segdisplay()
        .width(80)
        .digitCount(6)
        .negative(false)
        .decimals(0);

svg.append("g")
        .attr("class", "segdisplay")
        .attr("transform", "translate(130, 200)")
        .call(segDisplay);

svg.append("g")
        .attr("class", "gauge")
        .call(gauge);

segDisplay.value(<%= @car.mileage %>);
gauge.value((<%= @car.mileage %>/60000)*60);

    console.log(gauge.value);
    

var config2 = liquidFillGaugeDefaultSettings();
    config2.circleColor = "#D4AB6A";
    config2.textColor = "#7D604D";
    config2.waveTextColor = "#7D604D";
    config2.waveColor = "#3B2D24";
    config2.circleThickness = 0.1;
    config2.circleFillGap = 0.2;
    config2.textVertPosition = 0.8;
    config2.waveAnimateTime = 2000;
    config2.waveHeight = 0.3;
    config2.waveCount = 1;
var gauge3 = loadLiquidFillGauge("fillgauge3", (<%= @car.mileage %>/5000)*100, config2);        
var config3 = liquidFillGaugeDefaultSettings();

function NewValue(){
    if(Math.random() > .5){
        return Math.round(Math.random()*100);
    } else {
        return (Math.random()*100).toFixed(1);
    }
}
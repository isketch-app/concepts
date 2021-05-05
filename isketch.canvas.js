var is_timer  = document.getElementById("isketch-canvas");
var ctx       = is_timer.getContext("2d");

var stroke    = "black";
var mousedown = false;
var drawings  = [
    {
        type: "line",
        stroke: "black",
        width: 5,
        points: [
            {
                x: 0,
                y: 20
            }, {
                x: 30,
                y: 60
            }, 
        ]
    }
];

ctx.strokeStyle = stroke;

function loop() {

    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, is_timer.width, is_timer.height);
    

    
    drawings.forEach(function(draw) {
        if(draw.type == "line") {
            ctx.strokeStyle = draw.stroke;
            ctx.lineWidth = draw.width;
            ctx.beginPath();
            ctx.moveTo(draw.points[0].x, draw.points[0].y);
            draw.points.forEach(function(point) {
                ctx.lineTo(point.x, point.y);
            });
            ctx.stroke();
        }
    });


    requestAnimationFrame(loop);
}

is_timer.onpointerup = function() {
    mousedown = false;
}

is_timer.onpointerdown = function(e) {
    mousedown = true;
    drawings.push({
        type: "line",
        stroke: "black",
        width: 30,
        points: [
            {
                x: e.offsetX,
                y: e.offsetY
            }
        ]
    });
}

is_timer.onpointermove = function(e) {
    if(mousedown) {
        drawings[drawings.length - 1].points.push({
            x: e.offsetX,
            y: e.offsetY
        });
    }
}

is_timer.onpointerleave = function() {
    mousedown = false;
}

loop();
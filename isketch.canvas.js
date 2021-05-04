var is_timer  = document.getElementById("isketch-canvas");
var ctx       = is_timer.getContext("2d");

var stroke    = "black 3px";
var mousedown = false;
var drawings  = {
    lines: [
        {
            stroke: "black",
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
    ]
};

ctx.strokeStyle = stroke;

function loop() {

    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, is_timer.width, is_timer.height);
    

    
    drawings.lines.forEach(function(line) {
        ctx.strokeStyle = line.stroke;
        ctx.beginPath();
        ctx.moveTo(line.points[0].x, line.points[0].y);
        line.points.forEach(function(point) {
            ctx.lineTo(point.x, point.y);
        });
        ctx.stroke();
    });


    requestAnimationFrame(loop);
}

is_timer.onmouseup = function() {
    mousedown = false;
}

is_timer.onmousedown = function(e) {
    mousedown = true;
    drawings.lines.push({
        stroke: "black",
        points: [
            {
                x: e.offsetX,
                y: e.offsetY
            }
        ]
    });
}

is_timer.onmousemove = function(e) {
    if(mousedown) {
        drawings.lines[drawings.lines.length - 1].points.push({
            x: e.offsetX,
            y: e.offsetY
        });
    }
}

loop();
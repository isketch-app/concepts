var is_timer = document.getElementById("isketch-timer");
var ctx      = is_timer.getContext("2d");

var colorTM  = "pink";
var stroke   = "pink";
var radius   = 50;
var originX  = 55;
var originY  = 55;
var startRad = (Math.PI / 2 * -1);
var endRad   = (Math.PI / 2 * 3);
var radDiff  = endRad - startRad;
var timerMS  = 1000;
var startMS  = 0;

ctx.strokeStyle = stroke;

function loop() {
    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, is_timer.width, is_timer.height);
    ctx.fillStyle = colorTM;
    ctx.beginPath();
    ctx.moveTo(originX, originY);
    var timerRatio = ((performance.now() - startMS) / timerMS);
    ctx.arc(originX, originY, radius, startRad, (radDiff * timerRatio) + startRad);
    ctx.lineTo(originX, originY);
    ctx.fill();
    ctx.stroke();
    if(timerRatio >= 1) {
        startTimer();
        return;
    }
    requestAnimationFrame(loop);
}

function startTimer() {
    startMS = performance.now();
    requestAnimationFrame(loop);
}

startTimer();
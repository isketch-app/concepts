var is_timer = document.getElementById("isketch-timer");
var ctx      = is_timer.getContext("2d");

var colorTM  = "skyblue";
var colorTM2 = "pink";
var stroke   = "transparent";
var warnAt   = 0.25;
var radius   = 50;
var originX  = 55;
var originY  = 55;
var startRad = (Math.PI / 2 * -1);
var endRad   = (Math.PI / 2 * 3);
var radDiff  = endRad - startRad;
var timerMS  = 10000;
var startMS  = 0;
var isTick   = false;
var tickingr = 250;
var ticking  = new Audio("isketch.timer.tick.ogg");
var ding     = new Audio("isketch.timer.ding.ogg");

ctx.strokeStyle = stroke;
setInterval(tick, tickingr);

function loop() {
    var timerRatio = ((performance.now() - startMS) / timerMS);
    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, is_timer.width, is_timer.height);
    if(timerRatio >= 1) {
        isTick = false;
        ding.play();
        return;
    }
    if(timerRatio >= warnAt) {
        isTick = true;
        ctx.fillStyle = colorTM2;
    } else {
        isTick = false;
        ctx.fillStyle = colorTM;
    }
    ctx.beginPath();
    ctx.moveTo(originX, originY);
    ctx.arc(originX, originY, radius, (radDiff * timerRatio) + startRad, startRad);
    ctx.lineTo(originX, originY);
    ctx.fill();
    ctx.stroke();
    requestAnimationFrame(loop);
}

function startTimer() {
    startMS = performance.now();
    ctx.fillStyle = colorTM;
    requestAnimationFrame(loop);
}

function tick() {
    if(isTick) {
        ticking.play();
    }
}
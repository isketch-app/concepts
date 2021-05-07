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
var ding     = new Audio("isketch.timer.ding.ogg");

var audioCtx = new AudioContext();
var req      = new Request("isketch.timer.tick.ogg");
var audioSrc = null;
var audioBuf = null;


fetch(req).then(function(resp) {
    resp.arrayBuffer().then(function(buffer) {
        audioCtx.decodeAudioData(buffer, function(decoded) {
            audioBuf = decoded;
        });
    });
});

ctx.strokeStyle = stroke;

function loop() {
    var timerRatio = ((performance.now() - startMS) / timerMS);
    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, is_timer.width, is_timer.height);
    if(timerRatio >= 1) {
        stopTick();
        ding.play();
        return;
    }
    if(timerRatio >= warnAt) {
        startTick();
        ctx.fillStyle = colorTM2;
    } else {
        stopTick();
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

function startTick() {
    if (isTick) return;
    if (audioSrc != null ) audioSrc.stop(0);
    isTick = true;
    audioSrc = audioCtx.createBufferSource();
    audioSrc.buffer = audioBuf;
    audioSrc.loop = true;
    audioSrc.connect(audioCtx.destination);
    audioSrc.start(0);
}

function stopTick() {
    if (audioSrc != null ) audioSrc.stop(0);
    isTick = false;
}
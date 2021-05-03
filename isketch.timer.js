var is_timer = document.getElementById("isketch-timer");
var ctx = is_timer.getContext("2d");

var count = 0;
var radius = 50;

function loop() {
    ctx.fillStyle = "#fff"
    ctx.fillRect(0, 0, 100, 100);
    
    
    ctx.beginPath();
    ctx.arc(50, 50, 50, 1, 2);

    ctx.stroke();

    requestAnimationFrame(loop);
}
requestAnimationFrame(loop);


setInterval(function() {
    count += Math.PI;
}, 100);
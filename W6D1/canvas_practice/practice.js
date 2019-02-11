document.addEventListener("DOMContentLoaded", function(){

    function init(){
        window.requestAnimationFrame(draw)
    }

    function draw(){
        let time = new Date();

        const canvas = document.getElementById('mycanvas')
        canvas.setAttribute("width", "500")
        canvas.setAttribute("height", "500")
    
        const ctx = canvas.getContext('2d')

        ctx.clearRect(0, 0, 500, 500);

        ctx.fillStyle = "purple";
        ctx.fillStyle = (time.getMilliseconds()/6) % 2 ? 'black' : 'white'
        // ctx.strokeStyle =time.getMilliseconds()% 200 === 0 ? 'white' : 'black'
        ctx.fillRect(0, 0, 500, 500);
        
    
        ctx.beginPath();
        ctx.arc(250, 250, 50, 0, Math.PI * 2, true); // Outer circle
        ctx.moveTo(285, 250);
        ctx.arc(250, 250, 35, 0, Math.PI, false);  // Mouth (clockwise)
        ctx.moveTo(240, 240);
        ctx.arc(235, 240, 5, 0, Math.PI * 2, true);  // Left eye
        ctx.moveTo(270, 240);
        ctx.arc(265, 240, 5, 0, Math.PI * 2, true);  // Right eye
        ctx.lineWidth = 10
        ctx.stroke();

        window.requestAnimationFrame(draw)

    }
init();   
});


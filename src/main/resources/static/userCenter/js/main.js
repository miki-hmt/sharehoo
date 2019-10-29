var cxt=document.getElementById("myCanvas").getContext("2d");
function myDate(){
    cxt.clearRect(0,0,230,230);
    var now= new Date();
    var shi= now.getHours();
    var fen= now.getMinutes();
    var miao= now.getSeconds();
    //时针
    cxt.save();
    cxt.beginPath();
    cxt.lineWidth=25;
    cxt.fillStyle="white";
    cxt.strokeStyle="white";
    cxt.translate(115,115);
    cxt.rotate(shi*30*Math.PI/180);
    cxt.lineCap="round";
    cxt.moveTo(0,-60);
    cxt.lineTo(0,15);
    cxt.fill();
    cxt.stroke();
    cxt.closePath();
    cxt.restore();
    //fengzheng
    cxt.save();
    cxt.beginPath();
    cxt.fillStyle="white";
    cxt.strokeStyle="white";
    cxt.lineCap="round";
    cxt.lineWidth=20;
    cxt.translate(115,115);
    cxt.rotate(fen*6*Math.PI/180);
    cxt.moveTo(0,-80);
    cxt.lineTo(0,10);
    cxt.fill();
    cxt.stroke();
    cxt.closePath();
    cxt.restore();

    cxt.save();
    cxt.beginPath();
    cxt.fillStyle="white";
    cxt.strokeStyle="white";
    cxt.lineWidth="7";
    cxt.translate(115,115);
    cxt.rotate(miao*6*Math.PI/180);
    cxt.lineCap="round";
    cxt.moveTo(0,-110);
    cxt.lineTo(0,30);
    cxt.fill();
    cxt.stroke();
    cxt.closePath();
    cxt.restore();
    //得到当前时间
    cxt.beginPath();
    cxt.strokeStyle="white";
    cxt.fillStyle="#4E433B";
    var str=now.toLocaleTimeString();
    cxt.fillText(str,90,160);
    cxt.fill();
    cxt.stroke();
    cxt.closePath();
    //---螺丝钉
    cxt.beginPath();

    cxt.strokeStyle="gray";
    cxt.fillStyle="#4E433B";
    cxt.arc(115,115,10,0,360);
    cxt.fill();
    cxt.stroke();
    cxt.closePath();
}
function login(){
    var logObj=document.getElementById("login");
    logObj.style.setProperty("visibility"," visible");
    logObj.style.setProperty("-webkit-animation","myanimation 1s linear")
}
window.setInterval(myDate,10);

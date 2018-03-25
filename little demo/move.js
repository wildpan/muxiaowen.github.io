function getstyle(obj,name){
	if(obj.currentStyle){
		return obj.currentStyle[name];
	}else{
		return getComputedStyle(obj,0)[name];
	}
}
function startmove(obj,attr,itarget){
	clearInterval(obj.timer);
	obj.timer=setInterval(function(){
		var cur=0;
		
		if(attr=='opacity'){
			cur=Math.round(parseFloat(getstyle(obj,attr))*100);
		}else{
			cur=parseInt(getstyle(obj,attr));
		}
		
		var speed=(itarget-cur)/6;
		speed=speed>0?Math.ceil(speed):Math.floor(speed);
		
		if(cur==itarget){
			clearInterval(obj.timer);
		}else{
			if(attr=='opacity'){
				obj.style.filter='alpha(opacity:'+(cur+speed)+')';
				obj.style..opacity=(cur+speed)/100;	
			}else{
				obj.style[attr]=cur+speed+'px';
			}
		}
	},30);
}
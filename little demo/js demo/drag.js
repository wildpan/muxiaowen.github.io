// JavaScript Document
function drag(id){
	var _this=this;
	this.disx=0;
    this.disy=0;
	
	this.odiv=document.getElementById(id);
	this.odiv.onmousedown=function(ev){
		_this.fndown(ev);
	}
}		
drag.prototype.fndown=function(ev){
	var _this=this;
	var oev=ev||event;
	
	this.disx=oev.clientX-this.odiv.offsetLeft;
	this.disy=oev.clientY-this.odiv.offsetTop;
	document.onmousemove=function(ev){
		_this.fnmove(ev);
	}
	document.onmouseup=function(ev){
		_this.fnup(ev);
	}
}
drag.prototype.fnmove=function(ev){
	var oev=ev||event;
	
	this.odiv.style.left=oev.clientX-this.disx+'px';
	this.odiv.style.top=oev.clientY-this.disy+'px';
}
drag.prototype.fnup=function(ev){
	document.onmousemove=null;
	document.onmouseup=null;
}

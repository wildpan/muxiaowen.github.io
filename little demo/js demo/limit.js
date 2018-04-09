// JavaScript Document
function limitdrag(id){
	drag.call(this,id);
}
for(var i in drag.prototype){
	limitdrag.prototype[i]=drag.prototype[i];
}
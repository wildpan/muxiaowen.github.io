//1、创建Ajax对象
function ajax(url,fnsecc,fnfail)
{
if(window.XMLHttpRequest)
{
	 var oAjax=new XMLHttpRequest();
}
else
{
	 var oAjax=new ActiveXObject("Microsoft.XMLHTTP");
}
};

//2、连接服务器
//open(方法，文件名，异步传输)
oAjax.open('GET',url,true);
//3、发送请求

oAjax.sent();
//4、接收返回值

oAjax.onreadystatechange=function(){
if(oAjax.readyState==4){//读取完成
	if(oAjax,status==200){
		fnsecc(oAjax.responseText);
	}
	else{
		if(fnfail){
			fnfail(oAjax.status);
		}
	}
}	
};
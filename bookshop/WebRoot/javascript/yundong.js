//onload函数
function addLoadEvent(func){
	var oldonload = window.onload;
	if(typeof window.onload !='function'){
	window.onload = func;
	}
	else{
	window.onload=function(){
		oldonload();
		func();
	}
}
}


//书单展示
function showbook()
{
	var oul=document.getElementById('ul1');
	var ali=oul.getElementsByTagName('li');
	var odiv=document.getElementById('book-list');
	var adiv=odiv.getElementsByTagName('div');
		
		for(var i=0;i<ali.length;i++){
			
			ali[i].index=i;
			ali[i].onclick=function(){
				for(var i=0;i<ali.length;i++){
					adiv[i].style.display='none';
				}				
			adiv[this.index].style.display='block';
			};
		}
	}


//showPic
function showPic() {
    var container = document.getElementById('container');
    var list = document.getElementById('list');
    var buttons = document.getElementById('buttons').getElementsByTagName('span');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');
    var index = 1;
    var timer;

    function animate(offset) {
        //获取的是style.left，是相对左边获取距离，所以第一张图后style.left都为负值，
        //且style.left获取的是字符串，需要用parseInt()取整转化为数字。
        var newLeft = parseInt(list.style.left) + offset;
        list.style.left = newLeft + 'px';
        //无限滚动判断
        if (newLeft > -300) {
            list.style.left = -1500 + 'px';
        }
        if (newLeft < -1500) {
            list.style.left = -300 + 'px';
        }
    }

    function play() {
        //重复执行的定时器
        timer = setInterval(function () {
            next.onclick();
        }, 3000)
    }

    function stop() {
        clearInterval(timer);
    }

    function buttonsShow() {
        //将之前的小圆点的样式清除
        for (var i = 0; i < buttons.length; i++) {
            if (buttons[i].className == "on") {
                buttons[i].className = "";
            }
        }
        //数组从0开始，故index需要-1
        buttons[index - 1].className = "on";
    }

    prev.onclick = function () {
        index -= 1;
        if (index < 1) {
            index = 5
        }
        buttonsShow();
        animate(300);
    };

    next.onclick = function () {
        //由于上边定时器的作用，index会一直递增下去，我们只有5个小圆点，所以需要做出判断
        index += 1;
        if (index > 5) {
            index = 1
        }
        animate(-300);
        buttonsShow();
    };

    for (var i = 0; i < buttons.length; i++) {
        (function (i) {
            buttons[i].onclick = function () {
                var clickIndex = parseInt(this.getAttribute('index'));
                var offset = 300 * (index - clickIndex); //这个index是当前图片停留时的index
                animate(offset);
                index = clickIndex; //存放鼠标点击后的位置，用于小圆点的正常显示
                buttonsShow();
            }
        })(i)
    }

    container.onmouseover = stop;
    container.onmouseout = play;
    play();

}

//延时的选择框
function showdiv(){
	var oform=document.getElementById('search-text');
	var odiv=document.getElementById('div4');
	var timer=null;
	
	odiv.onmouseover=oform.onmousedown=function(){
		clearTimeout(timer);
		odiv.style.display='block';
	};
	
	odiv.onmouseout=oform.onmouseout=function(){
		timer=setTimeout(function(){
			odiv.style.display='none';
		},500);
	}
}

//fadeModal();//显示登录框
function fadeModel_log(){ 
var atten = document.getElementById("atten-btn"); 
atten.onclick = function fadeModal() {
 var mask = document.getElementById('mask');
 console.log(mask);
 mask.style.display = "block";
 var loginForm = document.getElementsByClassName('login-form')[0];
 console.log(loginForm);
 loginForm.style.display = "block";
}
//关闭窗口
 var close= document.getElementById("close-login"); 
close.onclick =function fadeOutLogin() {
 var mask = document.getElementById('mask');
 console.log(mask);
 mask.style.display = "none";
 var loginForm = document.getElementsByClassName('login-form')[0];
 console.log(loginForm);
 loginForm.style.display = "none";

}
}


addLoadEvent(showbook);
addLoadEvent(showdiv);
addLoadEvent(showPic);
addLoadEvent(fadeModel_log);






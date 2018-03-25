var ModelUser=require('../model/user');

module.exports.login={
	get:function(req,res,next){
        
		res.render('login',{title:'登录'});
	},
	
	post:function(req,res,next){
		
		var postdata={
			name:req.body.name
		};
		
		ModelUser.findOne(postdata,function(err,data){
			if(err){
				throw err;
			}
			
			if(data){
				
				if(data.password == req.body.password){
					req.session.user=data;
					res.redirect('/user/'+data._id);
				}else{
					res.send('密码错误');
				}
				
			}else{
				res.send('没有此用户');
			}	
		});
//		res.send(postdata);
	}
};
module.exports.reg={
	get:function(req,res,next){
	res.render('reg',{title:'注册'});
	},
	post:function(req,res,next){
		
		var postdate={
			name:req.body.name,
			password:req.body.password
		};
		ModelUser.findOne({name:req.body.name},function(err,data){
			if(err) throw err;
			if(data){
				res.send('用户已被注册');
			}else{
				ModelUser.create(postdate,function(err,data){
			if(err){
				throw err;
			}
			req.session.user=data;
					res.send(data);
		});
			}
		});
		
	  //  res.send('注册成功');	
	}
	
};

module.exports.logout={
	get:function(req,res,next){
		delete req.session.user;
		res.redirect('/');
	}
};

module.exports.user={
	get:function(req,res,next){
		var getdata={
			_id:req.param('_id')
		};
		
		if(getdata._id){
			ModelUser.findById(getdata,function(err,data){
				if(err) throw err;
				
				if(data){
					res.render('user',{
						title:data.name+'的个人资料'	, 
						view:data
				  });	
				}else{
					res.send('查无此人');
			}
		});
	}
}
}

module.exports.loginyes=function(req,res,next){
		var user=req.session.user;
	
		if(!user){
			res.redirect('/login');
		}else{
			next();
		}
	}
module.exports.loginno=function(req,res,next){
	var user=req.session.user;
	
	if(user){
		res.redirect('/user/'+user._id);
	}else{
		next();
	}
}
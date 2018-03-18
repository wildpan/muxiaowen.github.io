var PluginUser=require('../plugin/user');
var PluginBlog=require('../plugin/blog');

module.exports=function(app){
	
	app.use(function(req,res,next){
		var user=req.session.user;
		if(user){
			app.locals.user=user;
		}else{
			app.locals.user=user;
		};
		next();
	}); 
	
	app.get('/', function(req,res,next){
		
		res.render('index',{title:'温小目'});
	});
	
	//登录
   app.get('/login',PluginUser.loginno,PluginUser.login.get);
	app.post('/login',PluginUser.login.post);
	
	//注册
	app.get('/reg',PluginUser.loginno,PluginUser.reg.get);
	app.post('/reg',PluginUser.reg.post);
	
	//退出
	app.get('/logout',PluginUser.loginyes,PluginUser.logout.get);
	app.get('/user/:_id',PluginUser.user.get);
	
	app.get('/add',PluginUser.loginyes,PluginBlog.add.get);
	app.post('/add',PluginBlog.add.post);
	
	app.get('/list',PluginBlog.list.get);
	
	app.get('/view/:_id',PluginBlog.view.get);
}
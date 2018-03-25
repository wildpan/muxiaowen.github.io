var ModelBlog=require('../model/blog');

module.exports.add={
	get:function(req,res,next){
		
		res.render('add',{
			title:'发表'
		});
	},
	post:function(req,res,next){
		
		var postdata={
		author:req.session.user._id,
		title:req.body.title,
		content:req.body.content	
		};
		
	ModelBlog.create(postdata,function(err,data){
		if(err) throw err;
        res.redirect('/view/'+data._id);
	});
	}
};

module.exports.list={
	get:function(req,res,next){
		ModelBlog.find({},null,{
		sort:{_id:-1}}).populate('user').exec(
		function(err,data){
		if(err) throw err;
		res.render('list',{
			title:'微博列表',
			list:data
		  });
		});
	}
};

module.exports.view={
	get:function(req,res,next){
		var getdata={
		_id:req.param('_id')
		};
		
	ModelBlog.findById(getdata,function(err,data){
			if(err) throw err;
            if(data){
				res.render('view',{
					title:data.title,
					view:data
				});
			}else{
				res.send('不存在这个微博');
			}
	});
	}
};
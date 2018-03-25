var mongoose=require('mongoose');
var Schema=mongoose.Schema;
var ObjectId=Schema.Types.ObjectId;

var blogSchema=Schema({
	author:{
		type:ObjectId,
		ref:'user'
	},
	 title:String,
	content:String
});
module.exports=mongoose.model('blog',blogSchema);
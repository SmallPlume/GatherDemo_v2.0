$(function(){
	var uploader = new plupload.Uploader({ //实例化一个plupload上传对象
	browse_button : 'browse',
	url : $root+'/file/upload.do',
	flash_swf_url : $root+'/js/plupload/Moxie.swf',
	silverlight_xap_url : $root+'/js/plupload/Moxie.xap',
	multipart:true,
	filters:{
		mime_types:[ //只允许上传图片和zip文件
				{ title : "Image files", extensions : "jpg,gif,png" }/*,
				{ title : "Zip files", extensions : "zip" }*/
			],
			max_file_size : '400kb', //最大只能上传400kb的文件
			prevent_duplicates : true //不允许选取重复文件
		},
	init:{
		FilesAdded:function(uploader,files){
			/*for(var i = 0, len = files.length; i<len; i++){
				var file_name = files[i].name; //文件名
				var file_size = files[i].size; //文件大小
				//构造html来更新UI
				var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name 
				+'&nbsp;|&nbsp;'+plupload.formatSize(file_size)
				+'&nbsp;|&nbsp;fileId===='+files[i].id+'</p><p class="progress"></p></li>';
				$(html).appendTo('#file-list');
			}*/
			uploader.start(); //开始上传
		},
		UploadProgress:function(uploader,file){
			$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
		},
		FileUploaded:function(uploader,files,res){
			//alert(res.response);
			
			
			var obj = $.parseJSON(res.response);
			var html = '<li id="file-' + obj.data.id +'"><p class="file-name">' + obj.data.name+'</p>'
				/*+'&nbsp;|&nbsp;'+obj.data.length
				+'&nbsp;|&nbsp;fileId===='+obj.data.id+'</p>'*/
				+'<p class="progress"></p>'
				+'<input type="hide" name="icon" value='+obj.data.id+' style="display:none;"/>'
				+'</li>';
				$(html).appendTo('#file-list');
				//返回图片
				previewImage(files,function(imgsrc){
					$('#file-'+obj.data.id).append('<img src="'+ imgsrc +'" style="width:150px; height:150px;" />');
				});
			//alert("obj.data.id===================="+obj.data.id);
		}
	}
});
uploader.init(); //初始化 

//绑定文件添加进队列事件
/* uploader.bind('FilesAdded',function(uploader,files){
	for(var i = 0, len = files.length; i<len; i++){
		var file_name = files[i].name; //文件名
		var file_size = files[i].size; //文件大小
		//构造html来更新UI
		var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name 
		+'&nbsp;|&nbsp;'+plupload.formatSize(file_size)
		+'&nbsp;|&nbsp;'+files[i].id+'</p><p class="progress"></p></li>';
		$(html).appendTo('#file-list');
	}
}); */

//绑定文件上传进度事件
/* uploader.bind('UploadProgress',function(uploader,file){
	$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
}); */

//上传按钮
/* $('#upload-btn').click(function(){
	uploader.start(); //开始上传
}); */

});

//plupload中为我们提供了mOxie对象
	//有关mOxie的介绍和说明请看：https://github.com/moxiecode/moxie/wiki/API
	//如果你不想了解那么多的话，那就照抄本示例的代码来得到预览的图片吧
	function previewImage(file,callback){//file为plupload事件监听函数参数中的file对象,callback为预览图片准备完成的回调函数
		if(!file || !/image\//.test(file.type)) return; //确保文件是图片
		if(file.type=='image/gif'){//gif使用FileReader进行预览,因为mOxie.Image只支持jpg和png
			var fr = new mOxie.FileReader();
			fr.onload = function(){
				callback(fr.result);
				fr.destroy();
				fr = null;
			}
			fr.readAsDataURL(file.getSource());
		}else{
			var preloader = new mOxie.Image();
			preloader.onload = function() {
				preloader.downsize( 300, 300 );//先压缩一下要预览的图片,宽300，高300
				var imgsrc = preloader.type=='image/jpeg' ? preloader.getAsDataURL('image/jpeg',80) : preloader.getAsDataURL(); //得到图片src,实质为一个base64编码的数据
				callback && callback(imgsrc); //callback传入的参数为预览图片的url
				preloader.destroy();
				preloader = null;
			};
			preloader.load( file.getSource() );
		}	
	}


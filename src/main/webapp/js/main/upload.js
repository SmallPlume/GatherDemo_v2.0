/*(function($){
	$.fn.extend({
		"upload":function(options){
			return this.each(function(){
				var $this = $(this);
				var html = '<div class="btn-wraper">'+
							'<input type="button" class="easyui-linkbutton l-btn l-btn-small" value="选择文件..." id="browse"></input>'+
							'<input type="button" class="easyui-linkbutton l-btn l-btn-small" value="开始上传" id="upload-btn"></input>'+
							'</div>'+
							'<ul id="file-list"></ul>';
				$this.html(html);
			});
		}
	});
	
})(window.jQuery);*/

$(function(){
	var uploader = new plupload.Uploader({ //实例化一个plupload上传对象
	browse_button : 'browse',
	url : $root+'/file/upload.do',
	flash_swf_url : $root+'/js/plupload/Moxie.swf',
	silverlight_xap_url : $root+'/js/plupload/Moxie.xap',
	multipart:true,
	init:{
		FilesAdded:function(uploader,files){
			for(var i = 0, len = files.length; i<len; i++){
				var file_name = files[i].name; //文件名
				var file_size = files[i].size; //文件大小
				//构造html来更新UI
				/*var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name 
				+'&nbsp;|&nbsp;'+plupload.formatSize(file_size)
				+'&nbsp;|&nbsp;fileId===='+files[i].id+'</p><p class="progress"></p></li>';
				$(html).appendTo('#file-list');*/
			}
			uploader.start(); //开始上传
		},
		UploadProgress:function(uploader,file){
			$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
		},
		FileUploaded:function(uploader,files,res){
			//alert(res.response);
			var obj = $.parseJSON(res.response);
			var html = '<li id="file-' + obj.data.id +'"><p class="file-name">' + obj.data.name
				+'&nbsp;|&nbsp;'+obj.data.length
				+'&nbsp;|&nbsp;fileId===='+obj.data.id+'</p><p class="progress"></p></li>';
				$(html).appendTo('#file-list');
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


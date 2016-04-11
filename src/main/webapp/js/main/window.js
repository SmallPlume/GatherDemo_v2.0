
/***
 * =================弹出窗口==================
 */
var $window = {
	CHARS:'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split(''),
	webpath : function(uri, win) {
		if (uri.indexOf('/') == 0) return ($g.basepath + uri).replace(/\/\//g, '/');
		if (!win) win = window;
		var parentpath = win.location.pathname;
		var i = parentpath.lastIndexOf('/');
		parentpath = i > 0 ? parentpath.substring(0, i + 1) : '';
		if (uri.indexOf('./') == 0) return (parentpath + uri.substring(2)).replace(/\/\//g, '/');
		if (uri.indexOf('../') == 0) {
			var times = 0;
			while (uri.indexOf('../') == 0) {
				times++;
				uri = uri.substring(3);
			}
			var pn = parentpath.replace(/\/$/, '');
			for ( var i = 0; i < times; i++) {
				pn = pn.replace(/\/[^\/]*$/g, '');
			}
			return (pn + '/' + uri).replace(/\/\//g, '/');
		}
		return (parentpath + uri).replace(/\/\//g, '/');
	},
	wins:{},
	/**
	 * 显示窗口
	 * options
	 *	code	: 窗口代码，默认生成uuid
	 *	uri	:　打开的窗口的ＵＲＬ地址
	 *	title	: 窗口标题
	 *	...		: easyui.window属性options
	 * @param options
	 *  {
	 *  success(result) :	成功关闭后调用
	 *  error(result) :		错误关闭后调用
	 *  close(result) :		关闭后调用
	 *  destroy() :			销毁后调用
	 *  }
	 */
	show: function(options) {
		if(options == null) return;
		if(typeof options == 'string') options = {uri:options};
		else if(typeof options != 'object' || !options.content && !options.uri) return;
		var uuid = '';
		for(var i = 0; i < 32; i++) uuid += $window.CHARS[0|Math.random()*$window.CHARS.length];
		var win = $('<div class="easyui-window" style="overflow:hidden;"></div>');
		$window.wins[uuid] = win;
		if(!options.options) options.options = {};
		win[0].options = options.options;
		win[0].options.uuid = uuid;
		options = $.extend({closable:true,minimizable:false,maximizable:false,modal:true,inline:false,collapsible:false,iconCls:'icon-web'},options);
		if(options.width == null || isNaN(options.width)) options.width = Math.min(document.documentElement.clientWidth - 100, 700);
		else if(options.width > document.documentElement.clientWidth) options.left = 10;
		if(options.height == null || isNaN(options.height)) options.height = Math.max(document.documentElement.clientHeight - 100, 500);
		else if(options.height > document.documentElement.clientHeight) options.top = 10;
		options.onClose = $window.destroy;
		options.onOpen = $window.oninit;
		options.onMove = function(left,top) {
			var ml = 0,mt = 0;
			if(left <= 0) ml = 2;
			else if(document.documentElement.clientWidth > 50 && left >= document.documentElement.clientWidth) ml = document.documentElement.clientWidth - 20;
			else ml = left;
			if(top <= 0) mt = 2; 
			else if(document.documentElement.clientHeight > 50 && top >= document.documentElement.clientHeight) mt = document.documentElement.clientHeight - 20;
			else mt = top;
			if(ml != left || mt != top) win.window('move',{left:ml,top:mt});
		};
		if(options.content) {
			win.window(options);
			win.html('<div id="'+uuid+'" style="width:100%;height:100%;overflow:auto;">'+options.content+'</div>');
			if(typeof options.callback == 'function') options.callback.call(win);
		}
		else {
			var url = options.uri;
			if(options.options.from) url = $window.webpath(url, options.options.from);
			var params = "";
			if(options.params) {
				if(typeof options.params == 'string') params = options.params;
				else if($.isArray(options.params)) {
					var param;
					for(var i = 0; i < options.params.length; i++) {
						param = options.params[i];
						if(param != null) params += "&"+encodeURIComponent(param.name) + "=" + encodeURIComponent(param.value);
					}
				}
				else if(typeof options.params == 'object'){
					for(var name in options.params) {
						if(options.params[name] != null) params += "&"+encodeURIComponent(name) + "=" + encodeURIComponent(options.params[name]);
					}
				}
				if(params.length > 0) {
					if(url.indexOf('?') != -1) url += params;
					else url += "?" + params.substring(1);
				}
			}
			win.window(options);
			if(options.center == null || options.center == true) win.window('center');
			options.options.uuid = uuid;
			win.append('<iframe id="frame_'+uuid+'" src="'+url+'" style="padding: 0;margin: 0;border: 0;width: 100%;height: 100%;" frameborder="no"></iframe>');
		}
	},
	/**
	 * 关闭窗口
	 * @param context 操作上下文，字符串表示窗口ID，否则为窗口对象
	 * @type >0表示成功关闭，=0表示失败关闭，<0表示直接关闭
	 */
	close:function(context, type, result) {
		if(context == null) return;
		var id = (typeof context == 'string') ? context : context.frameElement.id.replace(/frame_/g,'');
		var win = $window.wins[id];
		if(win == null) return $frame.close(context, type, result);
		if(type != null && win[0].options) {
			//当页面初始化完时，调用自定义的初始化方法
			if(type > 0 && typeof win[0].options.success == 'function') win[0].options.success.call(win,result);
			else if(type == 0 && typeof win[0].options.error == 'function') win[0].options.error.call(win,result);
			else if(type < 0 && typeof win[0].options.close == 'function') win[0].options.close.call(win,result);
		}
		win.window("close");
		delete $window.wins[id];
		$window.wins[id] = undefined;
	},
	/**
	 * 获取窗口属性
	 * @param context 操作上下文，字符串表示窗口ID，否则为窗口对象
	 */
	options:function(context) {
		if(context == null) return;
		var id = typeof context == 'string' ? context : context.frameElement.id.replace(/frame_/,'');
		var win = $window.wins[id];
		if(win != null) {
			if(win[0].options) return win[0].options;
			return {};
		}
		return {};
	},
	win:function(context) {
		if(context == null) return null;
		var id = typeof context == 'string' ? context : context.frameElement.id.replace(/frame_/,'');
		return $window.wins[id];
	},
	oninit: function() {
		if(this.options) {
			//当页面初始化完时，调用自定义的初始化方法
			if(typeof this.options.init == 'function') this.options.init.call(this, $("#"+this.options.uuid));
		}
	},
	destroy: function() {
		if(this.options) {
			//当页面销毁时，调用自定义的销毁方法
			if(typeof this.options.destroy == 'function') this.options.destroy.call(this);
		}
		$(this).window('destroy');
	}
};
/**
 * 表单页面通用函数级插件
 * 作者：许德建(xudejian@126.com)
 * 版权：许德建所有，未经作者特许不允许传播
 * js依赖：jquery(1.1.11+)、jquery-easyui(1.3.5+)、frame.js(框架)
 * css样式：easyui(整套)、main(通用)、icon(图标)
 */
//=======================================
/**
 * Jquery扩展函数列表
 */
jQuery.extend({
	/**
	 * 提交表单
	 * options : {
	 * 	success: function(data, status)		//请求成功回调函数，默认的函数自动关闭现打开的窗口
	 *  ok: function(data, status)			//业务处理成功回调函数
	 *  fail: function(data, status)		//业务处理失败回调函数
	 *  error: function(data, status)		//业务处理错误或请求返回错误回调函数
	 *  done: boolean						//未设置或为true，表示自动关闭窗口
	 *  callback: string					//若存在回调函数名，则使用回调方式提交
	 *  before:function()					//请求前回调函数，返回false或null表示不请求
	 *  prepare:function(params)			//页面请求前参数处理函数，仅仅返回false时表示不请求
	 * }
	 * @param form 请求表单
	 * @param options 请求参数选项
	 * @returns {Boolean}
	 */
	submit:function(form, options) {
		if(typeof form == 'string') form = $(form);
		if(form == null || form.length == 0 || !form.is('form')) return false;
		if(!form.form('validate')) return false;
		if(options == null) options = {};
		else if(typeof options == 'function') options = {success: options};
		if(typeof options.success != 'function') {
			options.success = function(data, status) {
				if(data != null && data.code < 0) {
					if(typeof options.fail == 'function') options.fail.call(this, data, status);
					if(typeof options.error == 'function') options.error.call(this, data, status);
					else top.$error(data.msg);
					//若为数据校验错误，提示
					if(data.code == -100 && data.data) ;
					return;
				}
				if(typeof options.ok == 'function') options.ok.call(this,data,status);
				else top.$ok(data.msg);
				if((options.done == null || options.done) && top.$window) top.$window.close(window, 1, data);
			};
		}
		//若为回调，则使用回调提交
		if(typeof options.callback == 'string') {
			var target = $('#responseTarget');
			if(target.length  == 0) $('body').append('<iframe id="responseTarget" name="responseTarget" width="0" height="0" style="width:0px;height:0px;visibility:hidden;"></iframe>');
			form.attr('target','responseTarget');
			var responseInput = form.find('input[name="responseCallback"]');
			if(responseInput.length == 0) responseInput = $('<input type="hidden" name="responseCallback" />').appendTo(form);
			responseInput.val(options.callback);
			form.submit();
			return;
		}

		var params = form.serializeArray();
		var url = options.url ? options.url : form.attr('action');
		var method = options.method ? options.method : form.attr('method');
		if(!method) method = "POST";
		var type = options.type ? options.type : 'json';
		if(typeof options.prepare == 'function') {
			var flag = options.prepare.call(form,params);
			if(flag != null && !flag) return false;
		}
		$.messager.progress({title:'系统提示',text:'数据处理中，请耐心等待...'});
		$.ajax({type:method,dataType:type,url:url,data:params,
			beforeSend:function(xhr) {
				if(typeof options.before == 'function') {
					var flag = options.before.call(xhr);
					if(flag) return true;
					$.messager.progress('close');
					return false;
				}
				return true;
			},
			error:function(xhr, status, error) {
				$.messager.progress('close');
				if(typeof options.error == 'function') options.error.call(this, error, status);
				else top.$error(error);
			},
			success:function(data,status,xhr){
				$.messager.progress('close');
				options.success(data,status);
			}
		});
	}
});

/**
 * Jquery扩展插件：
 * 1. onoff：开关插件
 * 2. radiobox：单选插件
 * 3. checkbox：多选插件
 * 4. combocheck：复选下拉
 * 
 */
(function($) {
	/**
	 * 开关插件，值为：true|false，文本默认：启用|禁用
	 * -------------options-----------
	 * name		表单字段名称
	 * value	默认值
	 * text		显示文本：已逗号分割，指定该值，则'type'值无效。
	 * type		类型：yn-是|否，oc-打开|关闭，vi-有效|无效，ed-启用|禁用，rs-运行|停止
	 * rev		反向：值为true表示"关"置后面
	 * ------------事件-----------------
	 * onChange(newValue, oldValue)
	 * ------------方法-----------------
	 * setValue(boolean)	设置值
	 * getValue:boolean		获取值
	 */
	$.fn.onoff = function(options) {
		/** 初始化 */
		function init(options) {
			var $this = this;
			var opts = this.attr('data-options');
			if(opts) opts = eval('({'+opts+'})'); 
			this.options = $.extend(opts ? opts : {}, options, true);
			var text0 = null, text1 = null;
			if(this.options.text) {
				var text = this.options.text.split(','); text0 = text[0], text1 = text[1];
			}
			if(text0 == null) {
				switch(this.options.type) {
					case 'yn': text0 = '是', text1 = '否'; break;
					case 'oc': text0 = '打开', text1 = '关闭'; break;
					case 'vi': text0 = '有效', text1 = '无效'; break;
					case 'ed': text0 = '启用', text1 = '禁用'; break;
					case 'rs': text0 = '运行', text1 = '停止'; break;
					default: 
						if(this.options.type) {
							var kvs = this.options.type.split(',') ;
							text0 = kvs[0], text1 = kvs[1] ? kvs[1] : kvs[0];
						}
						else text0 = '启用', text1 = '禁用';
				}
			}
			this.input = $('<input type="hidden" name="'+(this.options.name?this.options.name:'')+'" value="false" />').appendTo(this);
			if(this.options.rev) {
				this.view1 = $('<span class="switch-off">'+text1+'</span>').appendTo(this).click(function() {setValue.call($this, false);});
				this.view0 = $('<span class="switch-on">'+text0+'</span>').appendTo(this).click(function() {setValue.call($this, true);});
			}
			else {
				this.view0 = $('<span class="switch-on">'+text0+'</span>').appendTo(this).click(function() {setValue.call($this, true);});
				this.view1 = $('<span class="switch-off">'+text1+'</span>').appendTo(this).click(function() {setValue.call($this, false);});
			}
			if(this.options.value != null) setValue.call(this, this.options.value);
		}
		
		function setValue(val) {
			if(typeof val == 'string') val = (val == 'true' || val == 'yes' || val == 'y');
			else if(typeof val == 'number') val = (val != 0); 
			this.input.val(val ? 'true' : 'false');
			if(val) {
				this.view0.removeClass().addClass('switch-on');
				this.view1.removeClass().addClass('switch-off');
			}
			else {
				this.view0.removeClass().addClass('switch-off');
				this.view1.removeClass().addClass('switch-on');
			}
			if(typeof this.options.onChange == 'function') this.options.onChange.call(this,val, !val);
		}
		
		function getValue() {
			return this.input.val() == 'true';
		}

		//==================
		if(this.length == 0) {
			var o = {s: this.selector, c: this.context };
			if(!$.isReady && o.s) {
				$(function() { $(o.s,o.c).onoff(options); });
			}
			return this;
		}
		if(options == null) options = {};
		for ( var i = 0; i < this.length; i++) {
			var $this = this[i].__onoff;
			if ($this != null) {
				if(typeof options == 'string') {
					if(options == 'setValue') return setValue.call($this, arguments[1]);
					if(options == 'getValue') return getValue.call($this);
				}
				else if(typeof options == 'object') {
					$this.options = $.extend(true, $this.options ? $this.options : {}, options);
				}
			} else {
				$this = this[i].__onoff = $(this[i]);
				var $options = $.extend(true,{},options);
				init.call($this, $options);
			}
		}
		return this;
	};

	/**
	 * 选中插件，值为：true|false
	 * -------------options-----------
	 * name		表单字段名称
	 * value	默认值
	 * ------------事件-----------------
	 * onChange(newValue, oldValue)
	 * ------------方法-----------------
	 * setValue(boolean)	设置值
	 * getValue:boolean		获取值
	 */
	$.fn.check = function(options) {
		/** 初始化 */
		function init(options) {
			var $this = this;
			var opts = this.attr('data-options');
			if(opts) opts = eval('({'+opts+'})'); 
			this.options = $.extend(opts ? opts : {}, options, true);
			var value = this.hasClass('checkbox-on')  ? true : false;
			this.input = $('<input type="hidden" name="'+(this.options.name?this.options.name:'')+'" value="'+value+'" />').appendTo(this);
			this.removeClass('checkbox-on').removeClass('checkbox-off').addClass(value ? 'checkbox-on' : 'checkbox-off');
			this.click(function() {setValue.call($this,  $this.hasClass('checkbox-off'));});
			if(this.options.value != null) setValue.call(this, this.options.value);
		}
		
		function setValue(val) {
			if(typeof val == 'string') val = (val == 'true' || val == 'yes' || val == 'y');
			else if(typeof val == 'number') val = (val != 0); 
			this.input.val(val ? 'true' : 'false');
			if(val) {
				this.removeClass('checkbox-on').removeClass('checkbox-off').addClass('checkbox-on');
			}
			else {
				this.removeClass('checkbox-on').removeClass('checkbox-off').addClass('checkbox-off');
			}
			if(typeof this.options.onChange == 'function') this.options.onChange.call(this,val, !val);
		}
		
		function getValue() {
			return this.input.val() == 'true';
		}

		//==================
		if(this.length == 0) {
			var o = {s: this.selector, c: this.context };
			if(!$.isReady && o.s) {
				$(function() { $(o.s,o.c).onoff(options); });
			}
			return this;
		}
		if(options == null) options = {};
		for ( var i = 0; i < this.length; i++) {
			var $this = this[i].__check;
			if ($this != null) {
				if(typeof options == 'string') {
					if(options == 'setValue') return setValue.call($this, arguments[1]);
					if(options == 'getValue') return getValue.call($this);
				}
				else if(typeof options == 'object') {
					$this.options = $.extend(true, $this.options ? $this.options : {}, options);
				}
			} else {
				$this = this[i].__check = $(this[i]);
				var $options = $.extend(true,{},options);
				init.call($this, $options);
			}
		}
		return this;
	};
	
	/**
	 * 单选框控件
	 * -------------options-----------
	 * name				控件名称
	 * value			默认值
	 * data				数据对象（kv对象、数组），格式如：{'M':'男','F':'女'}、[['M','男'],['F','女']]、[{value:'M',text:'男'},{value:'F',text:'女'}]
	 * url				指定获取数据的url。
	 * ------------事件-----------------
	 * onLoad(data)
	 * onChange(newValue, oldValue)
	 * ------------方法-----------------
	 * setValue(v)		设置值
	 * getValue			获取值
	 */
	$.fn.radiobox = function(options) {
		/**
		 * 初始化
		 */
		function init(options) {
			var $this = this;
			var opts = this.attr('data-options');
			if(opts) opts = eval('({'+opts+'})'); 
			this.options = $.extend(opts ? opts : {}, options, true);
			if(typeof(this.options.data) == 'string') this.options.data = $.parseJSON(this.options.data);
			if($.isArray(this.options.data)) {
				var d = {}, o, t;
				for(var i = 0; i < this.options.data.length; i++) {
					o = this.options.data[i];
					t = typeof(o);
					if($.isArray(o)) d[o[0]] = o[1];
					else if(t == 'object') d[o.value] = o.text;
					else if(t == 'string') d[o] = o;
					else d[''+o] = ''+o;
				}
				this.options.data = d;
			}
			if(typeof(this.options.data) == 'object') return build.call(this,this.options.data);
			if(typeof(this.options.url) != 'string') return;
			$.post(this.options.url, function(r) {
				if($.isArray(r)) {
					var data = {}, o, t;
					for(var i = 0; i < r.length; i++) {
						o = r[i];
						t = typeof(o);
						if($.isArray(o)) data[o[0]] = o[1];
						else if(t == 'object') data[o.value] = o.text;
						else if(t == 'string') data[o] = o;
						else data[''+o] = ''+o;
					}
					return build.call($this, data);
				}
				if(typeof(r) == 'object') {
					if(r.code < 0) return;
					return build.call($this, r);
				}
			},'json');
		}
		
		/** 生成信息 **/
		function build(data) {
			var $this = this;
			var name =  this.options.name;
			var value = this.options.value;
			this.input = $('<input type="hidden" name="'+(name?name:'')+'" value="" />').appendTo(this);
			var html = '';
			for(var k in data) html += '<span value="'+k+'" class="switch-off">'+data[k]+'</span>';
			this.append(html);
			$('span',this).click(function() { setValue.call($this, $(this).attr('value')); });
			if(value != null) setValue.call(this, value);
			if(typeof(this.options.onLoad) == 'function') this.options.onLoad.call(this, data);
		}
		
		function setValue(val) {
			var o = this.find('span[value="'+val+'"]');
			var ov = this.input.val();
			if(o.length == 0) {
				this.find('.switch-on').removeClass('switch-on').addClass('switch-off');
				this.input.val('');
			}
			else {
				this.find('.switch-on').removeClass('switch-on').addClass('switch-off');
				this.input.val(val);
				o.removeClass('switch-off').addClass('switch-on');
			}
			if(typeof this.options.onChange == 'function') this.options.onChange(this.input.val(), ov);
		}
		
		function getValue() {
			return this.input.val();
		}

		//==================
		if(this.length == 0) {
			var o = {s: this.selector, c: this.context };
			if(!$.isReady && o.s) {
				$(function() { $(o.s,o.c).checkSingle(options); });
			}
			return this;
		}
		if(options == null) options = {};
		for ( var i = 0; i < this.length; i++) {
			var $this = this[i].__radiobox;
			if ($this != null) {
				if(typeof options == 'string') {
					if(options == 'setValue') return setValue.call($this, arguments[1]);
					if(options == 'getValue') return getValue.call($this);
				}
				else if(typeof options == 'object') {
					$this.options = $.extend(true, $this.options ? $this.options : {}, options);
				}
			} else {
				$this = this[i].__radiobox = $(this[i]);
				var $options = $.extend(true,{},options);
				init.call($this, $options);
			}
		}
		return this;
	};

	/**
	 * 复选框插件
	 * -------------options-----------
	 * name				控件名称
	 * value			默认值
	 * data				数据对象（kv对象、数组），格式如：{'M':'男','F':'女'}、[['M','男'],['F','女']]、[{value:'M',text:'男'},{value:'F',text:'女'}]
	 * url				指定获取数据的url。
	 * allValue			全选值，若存在该值，则该值的项与其他值互斥
	 * ------------事件-----------------
	 * onLoad(data)
	 * onCheck(value, text, target)
	 * onUncheck(value, text, target)
	 * onChange(newValue, oldValue, tochecked, value, target)
	 * ------------方法-----------------
	 * setValue(v)		设置值
	 * getValue			获取值
	 * getValues		获取值
	 */
	$.fn.checkbox = function(options) {
		/**
		 * 初始化
		 */
		function init(options) {
			var $this = this;
			var opts = this.attr('data-options');
			if(opts) opts = eval('({'+opts+'})'); 
			this.options = $.extend(opts ? opts : {}, options, true);
			var value = this.options.value;
			if($.isArray(value)) {
				var v = ',';
				for(var i = 0; i < value.length; i++) v += value[i] + ',';
				value = v;
			}
			else if(value != null) value = ',' + value + ',';
			this.options.value = value;
			var data = this.options.data;
			if(typeof(data) == 'string') data = $.parseJSON(data);
			if($.isArray(data)) {
				var d = {}, o, t;
				for(var i = 0; i < data.length; i++) {
					o = data[i];
					t = typeof(o);
					if($.isArray(o)) d[o[0]] = o[1];
					else if(t == 'object') d[o.value] = o.text;
					else if(t == 'string') d[o] = o;
					else d[''+o] = ''+o;
				}
				data = d;
			}
			if(typeof(data) == 'object') return build.call(this, data);
			if(typeof(this.options.url) != 'string') return;
			$.post(this.options.url, function(r) {
				if($.isArray(r)) {
					var data = {}, o, t;
					for(var i = 0; i < r.length; i++) {
						o = r[i];
						t = typeof(o);
						if($.isArray(o)) data[o[0]] = o[1];
						else if(t == 'object') data[o.value] = o.text;
						else if(t == 'string') data[o] = o;
						else data[''+o] = ''+o;
					}
					return build.call($this, data);
				}
				if(typeof(r) == 'object') {
					if(r.code < 0) return;
					return build.call($this, r);
				}
			},'json');
		}
		
		function build(data) {
			var $this = this;
			var name = this.options.name;
			var html = '';
			for(var k in data) {
				html += '<span class="checkbox-off" value="'+k+'" data-name="'+(name?name:'')+'"><input type="hidden" />'+data[k]+'</span>';
			}
			this.append(html);
			$('span',this).click(function(){onCheck.call($this, $(this));});
			setValue.call(this, this.options.value);
			if(typeof(this.options.onLoad) == 'function') this.options.onLoad.call(this, data);
		}
		
		function onCheck(obj) {
			var tochecked = obj.is('.checkbox-off'); 
			if(tochecked) {
				obj.removeClass('checkbox-off').addClass('checkbox-on');
				obj.find('input').attr('name',obj.attr('data-name')).val(obj.attr('value'));
			}
			else {
				obj.removeClass('checkbox-on').addClass('checkbox-off');
				obj.find('input').attr('name','').val('');
			}
			if(this.options.allValue != null) {
				if(this.options.allValue == obj.attr('value')) {
					//若为全选，则取消其他选项的选择
					$('span[value!="'+this.options.allValue+'"].checkbox-on', this).removeClass('checkbox-on').addClass('checkbox-off');
				}
				else {
					//若为非全选，则取消全选选项的选择
					$('span[value="'+this.options.allValue+'"].checkbox-on', this).removeClass('checkbox-on').addClass('checkbox-off');
				}
			}
			var vs = $('span.checkbox-on', this);
			var v = ',';
			for(var i = 0; i< vs.length; i++) v += $(vs[i]).attr('value') + ',';
			var oldVal = this.options.value ? this.options.value.replace(/(^,)|(,$)/g,''):'';
			this.options.value = v;
			if(tochecked && typeof(this.options.onCheck) == 'function') this.options.onCheck.call(this, obj.attr('value'), obj.text(), obj[0]);
			else if(!tochecked && typeof(this.options.onUncheck) == 'function') this.options.onUncheck.call(this, obj.attr('value'), obj.text(), obj[0]);
			if(oldVal != v && typeof(this.options.onChange) == 'function') this.options.onChange.call(this, v.replace(/(^,)|(,$)/g,''), oldVal, tochecked, obj.attr('value'), obj[0]);
		}
		
		function setValue(val) {
			if($.isArray(val)) {
				var v = ',';
				for(var i = 0; i < val.length; i++) v += val[i] + ',';
				val = v;
			}
			else if(typeof val == 'string') {
				val = ','+val.replace(/(^,)|(,$)/g,'') + ',';
			}
			if(val != null) {
				var os, o, v, f;
				os = this.find('.checkbox-on');
				for(var i = 0; i < os.length; i++) {
					o = $(os[i]);
					v = o.attr('value');
					f = val.indexOf(','+v+',') != -1;
					if(!f) {
						o.removeClass('checkbox-on').addClass('checkbox-off');
						o.find('input').attr('name','').val('');
					} 
				}
				os = this.find('.checkbox-off');
				for(var i = 0; i < os.length; i++) {
					o = $(os[i]);
					v = o.attr('value');
					f = val.indexOf(','+v+',') != -1;
					if(f) {
						o.removeClass('checkbox-off').addClass('checkbox-on');
						o.find('input').attr('name',o.attr('data-name')).val(v);
					} 
				}
			}
			else {
				var os, o;
				os = this.find('.checkbox-on');
				for(var i = 0; i < os.length; i++) {
					o = $(os[i]);
					o.removeClass('checkbox-on').addClass('checkbox-off');
					o.find('input').attr('name','').val('');
				}
			}
			this.options.value = val;
		}

		function getValue() {
			return this.options.value == null ? '' : this.options.value.replace(/^,|,$/g,'');
		}
		
		function getValues() {
			if(!this.options.value) return [];
			var val = this.options.value.replace(/(^,)|(,$)/g,'');
			if(val.length == 0) return [];
			return val.split(',');
		}

		//==================
		if(this.length == 0) {
			var o = {s: this.selector, c: this.context };
			if(!$.isReady && o.s) {
				$(function() { $(o.s,o.c).checkSingle(options); });
			}
			return this;
		}
		if(options == null) options = {};
		for ( var i = 0; i < this.length; i++) {
			var $this = this[i].__checkbox;
			if ($this != null) {
				if(typeof options == 'string') {
					if(options == 'setValue') return setValue.call($this, arguments[1]);
					if(options == 'getValue') return getValue.call($this);
					if(options == 'getValues') return getValues.call($this);
				}
				else if(typeof options == 'object') {
					$this.options = $.extend(true, $this.options ? $this.options : {}, options);
				}
			} else {
				$this = this[i].__checkbox = $(this[i]);
				var $options = $.extend(true,{},options);
				init.call($this, $options);
			}
		}
		return this;
	};
	
	/**
	 * 下拉复选框
	 * -------------options-----------
	 * data				数据对象（kv对象、数组），格式如：{'M':'男','F':'女'}、[['M','男'],['F','女']]、[{value:'M',text:'男'},{value:'F',text:'女'}]
	 * title			提示标题
	 * showAll			是否显示所有
	 * tooltip			文字提示
	 * ------------事件-----------------
	 * onClickItem：(target, checked, val, text) 点击选框
	 * onCheck：(target, val, text) 选中
	 * onUncheck：(target, val, text) 取消选中
	 * ------------方法-----------------
	 * setValue(v)	设置值
	 * getValue		获取值
	 * setValues	设置多值
	 * getValues	获取多值
	 * clear		清空值
	 * loadData(data)		加载数据
	 * load(url, param)		加载指定url获取数据
	 */
	$.fn.combocheck = function(options) {
		/**
		 * 初始化
		 */
		function init(options) {
			var $this = this;
			var opts = this.attr('data-options');
			if(opts) opts = eval('({'+opts+'})'); 
			this.options = $.extend(opts ? opts : {}, options, true);
			var html = '<div>';
			if(this.options.showAll) html += '<div style="color:#ff9933;background:#ddddff;padding:5px;text-align:center;"><div class="checkboxall checkbox-off">'+ (options.title?options.title:'全部') +'</div></div>';
			else if(this.options.title) html += '<div style="color:#ff9933;background:#ddddff;padding:5px;text-align:center;">'+this.options.title+'</div>';
			html += '<div list="1">';
			if(this.options.data) {
				var tdata = typeof(this.options.data);
				if(tdata == 'string') this.options.data = this.options.data.split(',');
				if($.isArray(this.options.data)) {
					var obj, v, t;
					for(var i = 0; i < this.options.data.length; i++) {
						obj = this.options.data[i];
						v = null;
						t = null;
						if($.isArray(obj)) {
							t = v = obj[0];
							if(obj.length > 1) t = obj[1];  
						}
						else if(typeof obj == 'object') {
							v = obj.value;
							t = obj.text;
						}
						else {
							v = t = obj;
						}
						html += '<div class="checkbox checkbox-off" value="'+v+'">'+ t +'</div>';
						if(this.options.wrap) html += '<br/>';
					}
				}
				else if(tdata == 'object') {
					var text;
					for(var val in this.options.data) {
						text = this.options.data[val];
						if(text == null || text == '') text = val;
						html += '<div class="checkbox checkbox-off" value="'+val+'">'+ text +'</div>';
						if(this.options.wrap) html += '<br/>';
					}
				}
			}
			html += '</div></div>';
			this.options.editable = false;
			this.options.multiple = true;
			
			$(html).appendTo($this.combo(this.options).combo('panel'));
			$this.combo('panel').on('click', '.checkbox', function(){
				if($this.options.showAll) $('.checkboxall', $this.combo('panel')).removeClass('checkbox-on').addClass('checkbox-off');
				var chked = $(this).is('.checkbox-off');
				if(chked) $(this).removeClass('checkbox-off').addClass('checkbox-on');
				else $(this).removeClass('checkbox-on').addClass('checkbox-off');
				var chks = $this.combo('panel').find('div.checkbox.checkbox-on');
				var vs = [], ts = '';
				for(var i = 0; i < chks.length; i++) {
					if(i > 0) ts += ', ';
					vs[i] = $(chks[i]).attr('value');
					ts += $(chks[i]).text();
				}
				$this.combo('setValues', vs).combo('setText', ts ? ts : ($this.options.tooltip ? $this.options.tooltip : ''));
				//onClickItem
				if(typeof $this.options.onClickItem == 'function') {
					$this.options.onClickItem.call($this, this, chked, $(this).attr('value'), $(this).text());
				}
				//onCheck
				if(chked && typeof $this.options.onCheck == 'function') {
					$this.options.onCheck.call($this, this, $(this).attr('value'), $(this).text());
				}
				//onUncheck
				if(chked && typeof $this.options.onUncheck == 'function') {
					$this.options.onUncheck.call($this, this, $(this).attr('value'), $(this).text());
				}
			}).on('click', '.checkboxall', function() {
				var chked = $(this).is('.checkbox-off');
				if(chked) $(this).removeClass('checkbox-off').addClass('checkbox-on');
				else $(this).removeClass('checkbox-on').addClass('checkbox-off');
				var panel = $this.combo('panel');
				if(chked) panel.find('div.checkbox.checkbox-off').removeClass('checkbox-off').addClass('checkbox-on');
				else panel.find('div.checkbox.checkbox-on').removeClass('checkbox-on').addClass('checkbox-off');
				var vs = [], ts = chked ? (options.title?options.title:'全部') : '';
				var chks = $this.combo('panel').find('div.checkbox.checkbox-on');
				for(var i = 0; i < chks.length; i++) {
					vs[i] = $(chks[i]).attr('value');
				}
				$this.combo('setValues', vs).combo('setText', ts ? ts : ($this.options.tooltip ? $this.options.tooltip : ''));
				//onClickItem
				if(typeof $this.options.onClickItem == 'function') {
					$this.options.onClickItem.call($this, this, chked, $(this).attr('value'), $(this).text());
				}
				//onCheck
				if(chked && typeof $this.options.onCheck == 'function') {
					$this.options.onCheck.call($this, this, $(this).attr('value'), $(this).text());
				}
				//onUncheck
				if(chked && typeof $this.options.onUncheck == 'function') {
					$this.options.onUncheck.call($this, this, $(this).attr('value'), $(this).text());
				}
			});
			
			if($this.options.tooltip) {
				var vs = $this.combo('getValues');
				if(vs == null || vs.length == 0) $this.combo('setText',$this.options.tooltip);
			}
			
			if(typeof this.options.url == 'string') {
				load.call(this, this.options.url, this.options.params);
			}
		}
		
		function setValue(val) {
			var panel = this.combo('panel');
			panel.find('div.checkbox.checkbox-on').removeClass('checkbox-on').addClass('checkbox-off');
			var item = panel.find('div[value="'+val+'"]');
			if(item.length == 0) {
				this.combo('setValue', '').combo('setText', '');
			}
			else {
				item.removeClass('checkbox-off').addClass('checkbox-on');
				this.combo('setValue', val).combo('setText', item.text());
			}
		}
		
		function getValue() {
			return this.combo('getValue');
		}

		function setValues(vals) {
			var panel = this.combo('panel');
			panel.find('div.checkbox.checkbox-on').removeClass('checkbox-on').addClass('checkbox-off');
			var item, vs = [], ts = '';
			if(vals != null) {
				for(var i = 0; i < vals.length; i++) {
					item = panel.find('div[value="'+vals[i]+'"]');
					if(item.length > 0) {
						item.removeClass('checkbox-off').addClass('checkbox-on');
						vs[vs.length] = vals[i];
						if(ts.length > 0) ts += ',';
					}
				}
			}
			this.combo('setValues', vs).combo('setText', ts);
		}
		
		function getValues() {
			return this.combo('getValues');
		}
		
		/**
		 * 清空
		 */
		function _clear() {
			this.combo('clear');
			this.combo('panel').find('.checkbox.checkbox-on').removeClass('checkbox-on').addClass('checkbox-off');
		}
		
		/**
		 * 加载数据
		 */
		function loadData(data) {
			var olist = this.combo('panel').find('div[list="1"]').empty();
			var html = '';
			if($.isArray(data)) {
				var obj, v, t;
				for(var i = 0; i < options.data.length; i++) {
					obj = options.data[i];
					v = null;
					t = null;
					if($.isArray(obj)) {
						t = v = obj[0];
						if(obj.length > 1) t = obj[1];  
					}
					else if(typeof obj == 'object') {
						v = obj.value;
						t = obj.text;
					}
					else {
						v = t = obj;
					}
					html += '<div class="checkbox checkbox-off" value="'+v+'">'+ t +'</div>';
					if(this.options.wrap) html += '<br/>';
				}
			}
			else if(tdata == 'object') {
				var text;
				for(var val in options.data) {
					text = options.data[val];
					if(text == null || text == '') text = val;
					html += '<div class="checkbox checkbox-off" value="'+val+'">'+ text +'</div>';
					if(this.options.wrap) html += '<br/>';
				}
			}
			olist.append(html);
		}

		/**
		 * 加载数据
		 */
		function load(url, params) {
			var $this = this;
			var olist = this.combo('panel').find('div[list="1"]').empty();
			$.post(url, params, function(data) {
				if(data == null || data.code != null) return;
				var html = '';
				if($.isArray(data)) {
					var obj, v, t;
					for(var i = 0; i < data.length; i++) {
						obj = data[i];
						v = null;
						t = null;
						if($.isArray(obj)) {
							t = v = obj[0];
							if(obj.length > 1) t = obj[1];  
						}
						else if(typeof obj == 'object') {
							v = obj.value;
							t = obj.text;
						}
						else {
							v = t = obj;
						}
						html += '<div class="checkbox checkbox-off" value="'+v+'">'+ t +'</div>';
						if($this.options.wrap) html += '<br/>';
					}
				}
				else if(tdata == 'object') {
					var text;
					for(var val in data) {
						text = data[val];
						if(text == null || text == '') text = val;
						html += '<div class="checkbox checkbox-off" value="'+val+'">'+ text +'</div>';
						if($this.options.wrap) html += '<br/>';
					}
				}
				olist.append(html);
			},'json');
		}
		//==================
		if(this.length == 0) {
			var o = {s: this.selector, c: this.context };
			if(!$.isReady && o.s) {
				$(function() { $(o.s,o.c).onoff(options); });
			}
			return this;
		}
		if(options == null) options = {};
		for ( var i = 0; i < this.length; i++) {
			var $this = this[i].__combocheck;
			if ($this != null) {
				if(typeof options == 'string') {
					if(options == 'setValue') return setValue.call($this, arguments[1]);
					if(options == 'getValue') return getValue.call($this);
					if(options == 'setValues') return setValues.call($this, arguments[1]);
					if(options == 'getValues') return getValues.call($this);
					if(options == 'clear') return _clear.call($this);
					if(options == 'loadData') return loadData.call($this, arguments[1]);
					if(options == 'load') return load.call($this, arguments[1], arguments[2]);
				}
				else if(typeof options == 'object') {
					$this.options = $.extend(true, $this.options ? $this.options : {}, options);
				}
			} else {
				$this = this[i].__combocheck = $(this[i]);
				var $options = $.extend(true,{},options);
				init.call($this, $options);
			}
		}
		return this;
	};
	
})(jQuery);
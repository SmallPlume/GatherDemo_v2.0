

(function($) {
	/** 工具栏 */
	$.fn.toolbar = function(options) {
		if(options == 'enableAll' || options == 'disableAll') {
			$(this).children('a').each(function(i) {
				$(this).linkbutton(options.replace(/All/,''));
			});
		}
		else if(typeof options == 'string') {
			var names = options.split(',');
			$(this).children('a').each(function(i) {
				var f = false;
				var name = $(this).attr('data-name');
				for(var i = 0; i < names.length; i++) if(f = (name == names[i])) break;
				$(this).linkbutton(f?'enable':'disable');
			});
		}
		else {
			var html = '';
			for(var i = 0; i < options.buttons.length; i++) html += '<a href="javascript:void(0)" data-name="'+options.buttons[i].name+'" style="margin:0 5px;"></a>';
			var $this = $(this).html(html);
			$this.children('a').each(function(i) {
				$(this).linkbutton(options.buttons[i]).bind('click',function() {
					var $this = $(this);
					var opts = $this.linkbutton('options');
					if(opts.disabled) return;
					if(options.handler) options.handler.call(opts);
				});
			});
		}
	}
})(jQuery);

/**
 * 表单页面通用函数级插件
 * 作者：许德建(xudejian@126.com)
 * 版权：许德建所有，未经作者特许不允许传播
 * js依赖：jquery(1.1.11+)、jquery-easyui(1.3.5+)、frame.js(框架)
 * css样式：easyui(整套)、main(通用)、icon(图标)
 */

//全局变量
var $g = {
	basepath : '',
	bv:function(value, row, index) {
		var flag = false;
		if(typeof value == 'boolean') flag = value;
		else if(typeof value == 'string') flag = /y|true|1/g.test(value.toLowerCase());
		else if(!isNaN(value)) flag = parseFloat(value) != 0;
		else flag = value != null;
		return '<div class="t-'+flag+'"/>';
	},
	ymd:function(value, row, index) {
		return value ? value.substring(0,10):'';
	},
	ymdhm:function(value, row, index) {
		return value ? value.substring(0,16):'';
	},
	trim:function(val, options) {
		if(typeof(val) == 'string') {
			if(options == 'dt') return val.replace(/((\s|:)00)+(|.000)$/g, '');
			return val.replace(/^\s+|\s+$/,'');
		}
		if(options > 0 && !isNaN(val)) return parseFloat(val).toFixed(options).replace(/(|\.)0+$/,'');
		else if(options == 0 && !isNaN(val)) return parseFloat(val).toFixed(0);
		return val == null ? '' : val;
	},
	/** 格式化时间或数值，数值可以支持千位逗号和%，格式化如：',2'表示千分号分号并保留两位小数,'%1'表示小数转换成百分比并保留1位小数。 */
	format:function(val,format) {
		if(val == null) return '';
		//格式化数值
		if(!isNaN(val)) {
			val = parseFloat(val);
			if(format == null) return val == parseInt(val) ? parseInt(val) : val;
			var bsp = /,/.test(format), bpe = /%/.test(format), prec = parseInt(format.replace(/,|%/,''));
			if(bpe) val *= 100;
			if(!isNaN(prec)) {
				if(prec < 0) val = parseInt(val);
				else val = parseFloat(val.toFixed(prec));
			}
			if(!bsp) return val;
			var s = ""+val;
			var dot = s.indexOf(".");
			var istr = dot >= 0 ? s.substring(0,dot) : s;
			var fs = dot >= 0 ? s.substring(dot+1) : "";
			var len = istr.length;
			var vs = [];
			for(var i = len; i >= 0; i-=3) {
				vs[vs.length] = istr.substring(i > 3 ? i - 3 : 0, i);
			}
			var v = vs[vs.length - 1];
			for(var i = vs.length - 2; i >= 0; i--) v += "," + vs[i];
			v = v.replace(/^,/,'');
			return v + (fs.length > 0 ? "." + fs : "");
		}
		//格式化时间
		if(/\d{4}-\d{2}-\d{2}/.test(val)) {
			if(format == null) return val.repalce(/\s.*/g,'');
			if(/date/i.test(format)) return val.repalce(/\s.*/g,'');
			return (val + ' 00:00:00').substring(0,format.length);
		}
		return val;
	},
	rmb:rmb
};

//按键过滤
$(document).keydown(function(e) {
	var keynum = e.keyCode || e.which;
	var target = e.srcElement || e.target;
	if (keynum == 17 || keynum == 8) {
		if (target && !(target.type == 'text' || target.type == 'password' || target.type == 'textarea') || target.readOnly || target.readonly) { return false; }
	}
	return true;
});

/**
 * 显示对话框
 * 
 * @param {}
 *            options
 */
function show(options) {
	if (options == null) return;
	if(options.options == null) options.options = {from:window};
	else options.options.from = window;
	top.$window.show(options);
}

/**
 * 关闭弹出窗口
 * @param data {} 返回数据，若没有数据则表示常规关闭
 */
function closeWin(data) {
	top.$window.close(window, data == null || data.type == 'click' ? 0 : 1, data);
}

/**
 * 系统提示
 * 
 * @param msg
 * @param title
 */
function $prompt(msg, title) {
	top.$.messager.show({title:title?title:'系统提示',msg:msg?msg:'操作成功',timeout:5000,showType:'slide'});
}

/**
 * 成功提示
 * 
 * @param msg
 * @param title
 */
function $ok(msg, title) {
	top.$.messager.show({title:title?title:'成功提示',msg:msg?msg:'操作成功',timeout:5000,showType:'slide'});
}

/**
 * 系统提示
 * 
 * @param msg
 */
function $alert(msg) {
	return top.$.messager.alert('系统提示',msg?msg:'操作错误', 'error');
}

/**
 * 警告提示
 * 
 * @param msg
 * @param title
 * @param icon
 * @param func
 */
function $warn(msg, title, icon, func) {
	top.$.messager.alert(title?title:'警告提示',msg?msg:'操作警告',icon?icon:'warning',func);
}

/**
 * 错误提示
 * 
 * @param msg
 * @param title
 * @param icon
 * @param func
 */
function $error(msg, title, icon, func) {
	if(!title) title = '错误提示';
	if(!msg) msg = '操作错误';
	if(typeof msg == 'string') return $.messager.alert('系统提示',msg, 'error');
	if(typeof msg.data == 'object') {
		var text = '请求的表单存在一下错误：<br/><ul>';
		for(var field in msg.data) {
			text += '<li>' + msg.data[field] + '</li>';
		}
		text += '</ul>';
		$.messager.alert(title, text, 'error', func);
		return;
	}
	$.messager.alert(title, msg.msg, icon ? icon : 'error', func);
}

/**
 * 提示选择执行
 * 
 * @param msg
 * @param func
 * @param title
 */
function $confirm(msg, func, title) {
	$.messager.confirm(title ? title : '系统提示', msg, function(r) {if (r && func) func.call(this);});
}

function rmb(num) {
	//转成人民币大写金额形式 
	var str1 = '零壹贰叁肆伍陆柒捌玖';  //0-9所对应的汉字 
	var str2 = '万仟佰拾亿仟佰拾万仟佰拾元角分'; //数字位所对应的汉字 
	var str3;    //从原num值中取出的值 
	var str4;    //数字的字符串形式 
	var str5 = '';  //人民币大写金额形式 
	var i;    //循环变量 
	var j;    //num的值乘以100的字符串长度 
	var ch1 = '';    //数字的汉语读法 
	var ch2 = '';    //数字位的汉字读法 
	var nzero = 0;  //用来计算连续的零值是几个 
	
	num = Math.abs(num).toFixed(2);  //将num取绝对值并四舍五入取2位小数 
	str4 = (num * 100).toFixed(0).toString();  //将num乘100并转换成字符串形式 
	j = str4.length;      //找出最高位 
	if (j > 15){return '溢出';} 
	str2 = str2.substr(15-j);    //取出对应位数的str2的值。如：200.55,j为5所以str2=佰拾元角分 
	
	//循环取出每一位需要转换的值 
	for(i=0;i<j;i++){ 
		str3 = str4.substr(i,1);   //取出需转换的某一位的值 
		if (i != (j-3) && i != (j-7) && i != (j-11) && i != (j-15)){    //当所取位数不为元、万、亿、万亿上的数字时 
			if (str3 == '0'){ 
				ch1 = ''; ch2 = ''; nzero = nzero + 1; 
			} 
			else{ 
				if(str3 != '0' && nzero != 0){ 
					ch1 = '零' + str1.substr(str3*1,1); ch2 = str2.substr(i,1);  nzero = 0; 
				} 
				else{ 
					ch1 = str1.substr(str3*1,1); ch2 = str2.substr(i,1); nzero = 0; 
				} 
			} 
		} 
		else{ //该位是万亿，亿，万，元位等关键位 
			if (str3 != '0' && nzero != 0){ 
				ch1 = "零" + str1.substr(str3*1,1); ch2 = str2.substr(i,1); nzero = 0; 
			} 
			else{ 
				if (str3 != '0' && nzero == 0){ 
					ch1 = str1.substr(str3*1,1); ch2 = str2.substr(i,1); nzero = 0; 
				} 
				else{ 
					if (str3 == '0' && nzero >= 3){ 
						ch1 = ''; ch2 = ''; nzero = nzero + 1; 
					} 
					else{ 
						if (j >= 11){ 
							ch1 = ''; nzero = nzero + 1; 
						} 
						else{ 
							ch1 = ''; ch2 = str2.substr(i,1); nzero = nzero + 1; 
						} 
					} 
				} 
			} 
		} 
		if (i == (j-11) || i == (j-3)){  //如果该位是亿位或元位，则必须写上 
			ch2 = str2.substr(i,1); 
		} 
		str5 = str5 + ch1 + ch2; 
		if (i == j-1 && str3 == '0' ){   //最后一位（分）为0时，加上“零” 
			str5 = str5 + '整'; 
		} 
	} 
	if (num == 0) str5 = '零元整'; 
	return str5; 
}

"use stript";
function hasJqueryObject( $elem ){ return $elem.length > 0;}
var app = app || {};

function bodyControll(){	
	return{
		option : {
			target : "target",
			sectionFix : "sectionFix",
			destination : "destination",
			look : "lock",
			unLook : "unLook",
			topMove : "topMove",
			targetMove : "targetMove",
			scrollMove : "scrollMove",
			init : 0,
			time : 300,
		},
		consoleStyle : [
			"background-color:#0a0a0a",
			"border-radius:10px",
			"color:#ff7061",
			"font-family:'Chakra Petch','NanumBarunGothic',sans-serif",
			"font-size:30px",
			"font-weight:700",
			"padding:10px 10px",
		],
		init : function(){
			var _screenW = screen.width;
			var _screenH = screen.height;
			var _browserW = window.outerWidth;
			var _browserH = window.outerHeight;
			var _header = app.$body.find(".project-header");
			var _content = app.$body.find(".project-content .container");
			var _footer = app.$body.find(".project-footer");
			var _headerVH = parseInt(_header.outerHeight() * 100 / _browserH);
			var _fooerVH = parseInt(_footer.outerHeight() * 100 / _browserH);
			var _browserVH = parseInt(_browserH * 100 / _browserH);
			var _contentVH = parseInt(_browserVH - (_headerVH + _fooerVH));
			var _console = window.console || {log:function(){}};
			var _zoomin = app.$body.find(".zoomin");
			var _zoomout = app.$body.find(".zoomout");
			
			app.$body.find('[data-size="screen"]').text(_screenW + " x " + _screenH);
			app.$body.find('[data-size="browser"]').text(_browserW + " x " + _browserH);
			app.$body.find('.gotop-btn').css("right", parseInt((_browserW % _content.width())/6));
			_content.css("min-height", "calc(" + _contentVH + "vh - 28px)");
			//app.$body.on("click", _zoomin, function(){app.bodyControll.setZoom(1);});
			//app.$body.on("click", _zoomout, function(){app.bodyControll.setZoom(0);});
		},
		setZoom : function(num){
			num = num ? 10 : -10;
			var zoom = document.body.style.zoom;
			var zoomNum = zoom === "" || !zoom ? 100 : parseInt(zoom);
			$("#zoomNum").text(zoomNum + num);
			document.body.style.zoom = (zoomNum + num)+"%";
		},
		movingItem : [],
		moving : function(){
			var _window = $(window);
			var _document = $("html, body");
			var _option = this.option;
			var _target = app.$body.find('[data-moving-type="' + _option.target + '"]'); // 대상자
			var _sectionFix = app.$body.find('[data-moving-type="' + _option.sectionFix + '"]'); //  고정영역
			var _destination = app.$body.find('[data-offset-type="' + _option.destination + '"]'); // 목적지
			var _space = parseInt(_target.data("moving-space")); // [선택 값] 설정값에서 추가 공간 값 설정
			var _spaceFix = _sectionFix.outerHeight(); // 고정영역 좌표값 설정
			var _targetTop = _target.offset().top; // 고정영역 좌표 값
			var _coordinateTop = _destination.offset().top; // 목적지 좌표 값
			var _item = app.bodyControll.movingItem;
			var _action = ""; // action 값
			var _style = ""; // css 설정 값
			
			_target.each(function(e){
				_action = $(this).data("moving-action");
				$(this).addClass(_action);
			});
			/* 01. load */ 
			_target.each(function(e){
				_style = $(this).data("moving-style");
				if(_style !== null && _style !== undefined) app.bodyControll.cssFix($(this), _style, _spaceFix, _space); // 01. 초기 좌표 값 css 설정
			});
			/* 02. click */
			_document.on("click", '.' + _option.look, function(){app.bodyControll.hidden(_target, _option.look);}); // 02. 윈도우 스크롤 컨트롤 (잠금)
			_document.on("click", '.' + _option.unLook, function(){app.bodyControll.auto(_target, _option.look);}); // 03. 윈도우 스크롤 컨트롤 (해제)
			_document.on("click", '.' + _option.topMove, function(){app.bodyControll.topMoving(_document, _option.init);}); // 04. 최상단으로 스크롤 이동
			_document.on("click", '.' + _option.targetMove, function(){app.bodyControll.targetMoving(_document, _coordinateTop, _space);}); // 05. [scrollTop] 지정된 좌표값으로 스크롤 이동
			/* 03. scroll */
			_window.on({
				scroll : function(e){
					var _windowScroll = $(this).scrollTop(); // 현재 스크롤 죄표 값
					app.bodyControll.scrollMoving($('.' + _option.scrollMove), _windowScroll, _spaceFix, _space, _option.time); // 06. [window.scroll] 대상자가 스크롤 이동에 반응
					app.bodyControll.targetFix(_sectionFix, _coordinateTop, _windowScroll); // 07. [window.scroll] 고정영역이 스크롤 이동에 반응 
				}
			});
		},
		cssFix : function(_target, _style, _spaceFix, _space){_target.css(_style, _spaceFix + _space);},
		hidden : function(_target, _look){_target.addClass(_look);},
		auto : function(_target, _look){_target.removeClass(_look);},
		topMoving : function(_document, _init){_document.stop().animate({scrollTop : _init});},	
		targetMoving : function(_document, _coordinateTop, _space){_document.stop().animate({scrollTop : _coordinateTop + _space});},
		scrollMoving : function(_target, _windowScroll, _spaceFix, _space, time){_target.stop().animate({"top": _windowScroll + _spaceFix + _space}, time);},
		targetFix : function(_sectionFix, _coordinateTop, _windowScroll){(_coordinateTop < _windowScroll) ? _sectionFix.addClass("active") : _sectionFix.removeClass("active");},
	}
}

function tabControll(){		
	return{
		option : {
			tab : "tab",
			list : "list",
			cont : "contents",
			passive : "passive",
			active : "active",
			hide : "hide",
			show : "show",
		},
		init : function(){
			var _option = this.option;
			
			var _target = app.$body.find('[data-type="' + _option.tab + '"]');
			var _list = _target.find('[data-' + _option.tab + '-type="' + _option.list + '"]');
			var _cont = _target.find('[data-' + _option.tab + '-type="' + _option.cont + '"]');
		
			this.tab(_option, _target, _list, _cont); // 초기값
			_target.on("click", ".tab-list .list-btn", function(){app.tabControll.click(_option, _list, _cont, $(this));}); // 클릭 액션
		},
		tab : function(_option, _target, _list, _cont){
			_target.each(function(e){
				$(this).attr('data-' + _option.tab + '-index', e);
				_list.each(function(e){$(this).attr('data-' + _option.tab + '-index', e);});
				_cont.each(function(e){$(this).attr('data-' + _option.tab + '-index', e);});	
			});
			
			// 텝 상태 초기값 설정
			_list.attr('data-' + _option.tab + '-action', _option.passive);
			_cont.attr('data-' + _option.tab + '-action', _option.hide);
			_list.eq(0).attr('data-' + _option.tab + '-action', _option.active);
			_cont.eq(0).attr('data-' + _option.tab + '-action', _option.show);
		},
		click : function(_option, _list, _cont, _this){
			var _thisList = _this.parents("li");
			var _index = _thisList.attr('data-' + _option.tab + '-index');
			
			app.pluginControll.wrap();
			//$(window).resize(function(){app.pluginControll.wrap()});
			if(_thisList.attr('data-' + _option.tab + '-action') == _option.passive){
				_list.attr('data-' + _option.tab + '-action', _option.passive);
				_cont.attr('data-' + _option.tab + '-action', _option.hide);
				
				_thisList.attr('data-' + _option.tab + '-action', _option.active);
				_cont.eq(_index).attr('data-' + _option.tab + '-action', _option.show);
			}
		},
	}
}

function toggleControll(){
	return{
		option : {
			toggle : "toggle",
			cont : "contents",
			animate : "animate",
			slide : "slide",
			passive : "passive",
			active : "active",
			slideUp : "slideUp",
			slideDown : "slideDown",
		},
		toggleItem : [],
		init : function(){
			var _option = this.option;
			var _toggle = app.$body.find('[data-type="' + _option.toggle + '"]');
			var _action = "";
			var _thisToggle = "";
			
			_toggle.each(function(){
				_action = $(this).data(_option.toggle + '-action');
				$(this).addClass(_action);
			});
			/* 초기값 */
			//$("." + _option.slide).attr("data-" + _option.slide + "-action", _option.slideUp).find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').hide();
			//$("." + _option.slide).eq(0).attr("data-" + _option.slide + "-action", _option.slideDown).find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').show();
			//$("." + _option.slide).eq(0).find(".fas").removeClass("fa-angle-up").addClass("fa-angle-down");
			/* click */
			$("." + _option.animate).on("click", ".toggle-btn", function(){app.toggleControll.animate($(this), _option, _toggle);});
			$("." + _option.slide).on("click", ".toggle-btn", function(){app.toggleControll.slide($(this), _option, _toggle);});
		
		},
		animate : function(_this, _option, _toggle){
			_thisToggle = _this.parents("." + _option.animate);
			(_thisToggle.attr("data-" + _option.animate + "-action") == _option.active) ? _thisToggle.attr("data-" + _option.animate + "-action", _option.passive) : _thisToggle.attr("data-" + _option.animate + "-action", _option.active);
		},
		slide : function(_this, _option, _toggle){
			_thisToggle = _this.parents("." + _option.slide);
			(_thisToggle.attr("data-" + _option.slide + "-action") == _option.slideUp) ? (_this.find(".fas").removeClass("fa-angle-up").addClass("fa-angle-down"), _thisToggle.attr("data-" + _option.slide + "-action", _option.slideDown), _thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideDown()) : (_this.find(".fas").removeClass("fa-angle-down").addClass("fa-angle-up"), _thisToggle.attr("data-" + _option.slide + "-action", _option.slideUp), _thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideUp());
		},
	}
}

function linkControll(){
	return{
		option : {
			directory : "directory",
			all : "all",
			passive : "passive",
			pathName : "data-path-name",
			host : {
				host00 : window.location.href.split("/")[0],
				host02 : window.location.href.split("/")[2],
				host03 : window.location.href.split("/")[3],
			},
		},
		linkItem : [],
		init : function(){
			var _option = this.option;
			var _directory = app.$body.find('[data-section-type="' + _option.directory + '"]');
			var _page = app.$body.find(".page-section");
			var _pageMenu = _page.find(".page-menu ul");

			if(hasJqueryObject(app.$body.find(_directory))) (this.url(_option, _pageMenu, _directory), _page.on("click", "button.menu-btn", function(){app.linkControll.click($(this), _page, _pageMenu, _directory, _option);}));
			this.menu(_option, _pageMenu);

			//console.log(_option.host, window.location.hostname, window.location.pathname, window.location.protoco, window.location.assign);
		},
		click : function(_this, _page, _pageMenu, _directory, _option){
			var _index = _this.parent().attr("data-menu-index");
			var _action = _this.attr("data-click-action");
			var _target = _directory.eq(_index);
			
			app.bodyControll.topMoving($("html, body"), 0);
			(_action == _option.all) ? (_directory.removeAttr("data-animate-action").show(), _pageMenu.find("li").removeAttr("data-action")) : (_directory.attr("data-animate-action", _option.passive).hide(), _target.removeAttr("data-animate-action").show(), _pageMenu.find("li").removeAttr("data-action"), _this.parent().attr("data-action", "active"));
			_page.attr("data-animate-action", _option.passive);
		},
		menu : function(_option, _pageMenu){
			var _list = _pageMenu.find("li");
			_list.each(function(e){$(this).attr("data-menu-index", e);});
		},
		url : function(_option, _pageMenu, _directory){
			var _item = app.linkControll.linkItem;
			var _tit = "";
			var _str = "";
			var _redirect = "";
			var _host = _option.host.host00 + "//" + _option.host.host02 + "/" + _option.host.host03 + "/";

			_directory.each(function(e){
				var _row = $(this).find("tbody tr");
				var _thead = $(this).find('[data-path-type="head"]');
				
				$(this).attr('data-' + _option.directory + '-index', e);
				_tit = $(this).find(".section-tit").text();
				_str += "<li><button type='button' class='menu-btn'>" + _tit + "</button></li>";
				_pageMenu.html(_str);
				_redirect = _host + $(this).attr("id");
				
				_row.each(function(a){
					var _url = $(this).find('[data-type="url"]');
					var _depth = $(this).find('[data-type="path"]');
					var _colLength = _depth.length;
					var _fileName = _url.text();
					var _maxCol = _thead.length;
					var _init = _maxCol - _colLength;
					var _link = "";
					var _path = "";
					var _rowConunt = "";
					var _position = -1;
					
					if(_colLength < _maxCol || _colLength == _maxCol) _item.splice(_init, _colLength);
					if(a > 0) _position = Math.abs(a - _init);
					
					_depth.each(function(i){
						$(this).attr("data-path-index", i + _init);
						_path = $(this).attr(_option.pathName);

						if(_path !== null && _path !== undefined) _item.push(_path);
						if(!isNaN(_rowConunt)) _rowConunt = parseInt($(this).attr("rowspan")) + parseInt($(this).parent().index() -1);
						_row.eq(_rowConunt).addClass("lastRow" + (_rowConunt));
						
					});
					_item.forEach(function(g) {if(g !== "") _link = _link + "/" + g;});
					($(this).hasClass("del")) ? _url.empty().html("<span>" + _redirect + _link + "/" + _fileName + "</span>") : _url.empty().html("<a href=\"" + _redirect + _link + "/" + _fileName + "\" target=\"_blank\" class=\"link-btn\">" + _redirect + _link + "/" + _fileName + "</a>");
				});
			});
		},
	}
}

function progressControll(){
	return{
		option : {
			progress : "progress",
			day : "date",
		},
		dayItem : [],
		init : function(){
			var _option = this.option;
			var _data = app.$body.find('[data-type="' + _option.day + '"]');
			var _progress = app.$body.find('[data-type="' + _option.progress + '"]');
			
			this.day(_data, _option);
			
			_progress.each(function(){
				var _url = $(this).find('[data-type="url"] a');
				var _date = $(this).find('[data-type="date"] strong');
				var _progressArea = $(this).find(".progress-area");
				var _progressBar = _progressArea.find(".progress-bar .bar");
				var _percentNum = _progressArea.find(".percent .num");
				var _pageTotal = _progressArea.find(".page .total");
				var _pageNum = _progressArea.find(".page .num");
				var _urlLength = _url.length;
				var _dateLength = _date.length;
				var _percent = parseInt((_dateLength/_urlLength)*100);
				
				//console.log($(this).find("tbody tr").length, $(this).find('[data-type="url"] span').length, _urlLength, _dateLength);
				
				_pageTotal.text(_urlLength);
				_pageNum.text(_dateLength);
				_percentNum.text(_percent);
				_progressBar.stop().animate({"width" : _percent + "%"});
			});
		},
		day : function(_data, _option){
			var _now = new Date();
			var _year = _now.getFullYear();
			var _month = _now.getMonth()+1;
			var _date = _now.getDate();
			
			if (_month < 10) _month = "0" + _month;
			if (_date < 10) _date = "0" + _date;
			_data.each(function(e){
				var _complete = $(this).find("span:last-child");
				var _modify = $(this).find("span:not(:last-child)");
				var _today = _complete.text();
				var _yyyymmdd = _today.split("-");
				var _item = app.progressControll.dayItem;

				_str = "";
				if(_today !== "") _str += "<strong>" + _today + "</strong>";
				_item.splice(0, _item.length);
				_complete.each(function(){_str += "<i class='fas fa-laugh-squint' data-" + _option.day + "-text='" + $(this).text() + "'></i>";});
				_modify.each(function(i){_item.push("<i class='far fa-meh-blank' data-" + _option.day + "-text='" + $(this).text() + "'></i>")});
				_str += _item.reverse().join("");

				if(_complete !== "" ) $(this).empty().html(_str);
				if ((_yyyymmdd[0] == _year)&&(_yyyymmdd[1] == _month)&&(_yyyymmdd[2] == _date)) $(this).addClass('today');
			});

			_data.find("i").hover(
				function(){
					$(this).parent().find("strong").text($(this).attr('data-' + _option.day + '-text'));					
				}, function(){
					$(this).parent().find("strong").text($(this).parent().find("i:first-of-type").attr('data-' + _option.day + '-text'));
				}
			);
		},
	}
}


function pluginControll(){
	return{
		codeMirrorItem : [],
		codeMirrorGuide : {
			lineNumbers : true,
			styleActiveLine : true,
			theme : "mdn-like",
			tabSize : 4,
			indentWithTabs : true,
			lineWrapping : true,
			matchBrackets : true,
		},
		SyntaxHighlighterItem : [],
		loadOption : {
			applescript : 'applescript  @shBrushAppleScript.js',
			as3 : 'actionscript3 as3    @shBrushAS3.js',
			bash : 'bash shell          @shBrushBash.js',
			cf : 'coldfusion cf         @shBrushColdFusion.js',
			cpp : 'cpp c                @shBrushCpp.js',
			c : 'c# c-sharp csharp      @shBrushCSharp.js',
			css : 'css                  @shBrushCss.js',
			delphi : 'delphi pascal     @shBrushDelphi.js',
			diff : 'diff patch pas      @shBrushDiff.js',
			erl : 'erl erlang           @shBrushErlang.js',
			groovy : 'groovy            @shBrushGroovy.js',
			java : 'java                @shBrushJava.js',
			jfx : 'jfx javafx           @shBrushJavaFX.js',
			js : 'js jscript javascript @shBrushJScript.js',
			perl : 'perl pl             @shBrushPerl.js',
			php : 'php                  @shBrushPhp.js',
			text : 'text plain          @shBrushPlain.js',
			py : 'py python             @shBrushPython.js',
			ruby : 'ruby rails ror rb   @shBrushRuby.js',
			sass : 'sass scss           @shBrushSass.js',
			scala : 'scala              @shBrushScala.js',
			sql : 'sql                  @shBrushSql.js',
			vb : 'vb vbnet              @shBrushVb.js',
			html : 'xml xhtml xslt html @shBrushXml.js'
		},
		editerOtion5 : {
			toolbar : ['bold', 'italic', 'bulletedList', 'numberedList', 'blockQuote', 'imageUpload', 'insertTable', 'undo', 'redo' ],
			imageToolbar : ['imageTextAlternative','imageStyle:full','imageStyle:side'],
			contentToolbar : ['tableColumn','tableRow','mergeTableCells'],
		},
		SyntaxHighlighter : function(){
			if(hasJqueryObject(app.$body.find('[data-tab-view="code"]')) || hasJqueryObject(app.$body.find('[data-view-type="code"]')) ){
				SyntaxHighlighter.autoloader.apply(null, this.path(this.loadOption.css, this.loadOption.html, this.loadOption.js));
				SyntaxHighlighter.defaults = {
					"class-name" : "code-view",
					"first-line": 1,
					"pad-line-numbers": true,
					highlight: null,
					title: null,
					"smart-tabs": true,
					"tab-size": 4,
					gutter: true,
					toolbar: false,
					"quick-code": true,
					collapse: false,
					"auto-links": true,
					light: false,
					"html-script": false,
				};
				SyntaxHighlighter.all();
				app.pluginControll.whenReady(app.pluginControll.whenReady());

				//console.log(Object.keys(SyntaxHighlighter.defaults)[0]); // key
				//console.log(SyntaxHighlighter.defaults[Object.keys(SyntaxHighlighter.defaults)[0]]); //value

				var _className = SyntaxHighlighter.defaults[Object.keys(SyntaxHighlighter.defaults)[0]];
			}
		},
		codeMirror : function(_setting){
			var _codeMirror = app.$body.find(".codemirrorArea");
			var _target = _codeMirror.find("> textarea");
			var _length = 10;
			_target.each(function(e){
				var _textarea = "textarea" + e;
				$(this).attr({"id" : _textarea, "data-textarea-index" : e});
				
				var editor = CodeMirror.fromTextArea(document.getElementById(_textarea), _setting);
				app.pluginControll.codeMirrorItem.push(editor);
			});
			
			// pre 표현으로 의도치 않은 들여쓰기 삭제
			var _tabSpace = _codeMirror.find(".CodeMirror-line");
			_tabSpace.each(function(index){
				$(this).find(".cm-tab:lt(" + _length + ")").detach();
			});
		},
		editor : function(){
			//var _editerOtion5 = app.pluginControll.editerOtion5;
			var _item = app.pluginControll.editerItem;
			var _editor = app.$body.find('.edit-area');
			var _formBtn = app.$body.find('[data-comment-btn]');
			var _contents = app.$body.find('[data-pop-type="preview"] .comment-area');
			var _targetID = "";

			_editor.each(function(e){
				var _targetID = "edit-area-" + e;

				$(this).attr({"id" : _targetID, "name" : _targetID, "data-terget-index" : e});

				CKEDITOR.replace(_targetID);
				// 에디터에 포커스가 적용되었을 때
				
			});
			$('[data-comment-btn="preview"]').on("click", function(){
				var _targetID = _editor.attr("id");
				var _key = _editor.data("terget-index");
				var _data = CKEDITOR.instances[_targetID].getData();
				_item.splice(_key);
				_item.push(_data);
				_contents.empty().html(_item[_key]);
			});
			
			$('[data-comment-btn="comment"]').on("click", function(){
				var _targetID = _editor.attr("id");
				var _key = _editor.data("terget-index");
				var _data = CKEDITOR.instances[_targetID].getData();
				_item.splice(_key);
				_item.push(_data);
				writeComment(_item[_key]);
			});

			/* ckedit v.5
			ClassicEditor.create(document.querySelector('.edit-area'), {
				toolbar: {items: editerOtion5.toolbar},
				language: 'en',
				image: {toolbar: editerOtion5.imageToolbar},
				table: {contentToolbar: editerOtion5.contentToolbar},
				licenseKey: '',
			}).then( editor => {
				window.editor = editor;
			}).catch( error => {
				console.error( 'Oops, something went wrong!' );
				console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
				console.warn( 'Build id: k2i30chx32nf-8o65j7c6blw0' );
				console.error( error );
			});
			*/
		},
		path : function(){
			var args = arguments,
			result = [];
			
			for(var i = 0; i < args.length; i++)
			  result.push(args[i].replace('@', '/resources/javascripts/syntaxhighlighter/scripts/'));
			return result
		},
		wrap : function(){
			var elems = document.getElementsByClassName('syntaxhighlighter'); 
			for (var j = 0; j < elems.length; ++j) { 
				var sh = elems[j]; 
				var gLines = sh.getElementsByClassName('gutter')[0].getElementsByClassName('line'); 
				var cLines = sh.getElementsByClassName('code')[0].getElementsByClassName('line'); 
				var stand = 15; 
				for (var i = 0; i < gLines.length; ++i) { 
					var h = $(cLines[i]).outerHeight(); 
					if (h != stand) { 
						//console.log(i, h); 
						gLines[i].setAttribute('style', 'height:' + h + 'px !important;'); 
					} 
				} 
			}
		},
		whenReady : function(_whenReady){
			if ($('.syntaxhighlighter').length === 0) { 
				setTimeout(_whenReady, 800); 
			} else { 
				this.wrap(); 
			}
		},
	}
}

function activeCotroll(){
	return{
		activePop : function(_parent){
			_parent.addClass("active");
		},
		activeCookiePop : function(_parent){
			if(app.bodyControll._getCookie("notToday")!="done"){
				_parent.addClass("active");
			}
		},
		show : function(_target){
			_target.show();
		},
	}
}

function closeCotroll(){
	return{
		_closePop : function(_parent){
			var expirehours = _parent.find('input[type=checkbox]').prop('checked');

			if(expirehours == true){
				app.bodyControll._setCookie("notToday", "done", 1);
			}
			
			_parent.removeClass("active");
		},
		hide : function(_target){
			_target.hide();
		},
	}
}

$(function(){
	app.$body = $("body");
	/***********************************************************
		09.tab
	***********************************************************/
		app.tabControll = tabControll();
		if(hasJqueryObject(app.$body.find('[data-type="tab"]'))) app.tabControll.init();
	/***********************************************************
		11. section / contents
	***********************************************************/		
		app.toggleControll = toggleControll();
		if(hasJqueryObject(app.$body.find('[data-type="toggle"]'))) app.toggleControll.init();
	/***********************************************************
		12.layout
	***********************************************************/
		app.linkControll = linkControll();
		app.linkControll.init();
		
		app.progressControll = progressControll();
		if(hasJqueryObject(app.$body.find('[data-type="progress"]'))) app.progressControll.init();
	/***********************************************************
		13. 팝업, 알럿
	***********************************************************/
	
	/***********************************************************
		14. common
	***********************************************************/
		app.bodyControll = bodyControll();
		if(hasJqueryObject(app.$body.find('[data-moving-type]'))) app.bodyControll.moving();
		app.bodyControll.init();
	/***********************************************************
		15. etc
	***********************************************************/
		app.pluginControll = pluginControll();
		
		app.activeCotroll = activeCotroll();
		app.closeCotroll = closeCotroll();
});

$(window).on("load", function(){
	
});

$(window).on("resize", function(){
	app.bodyControll.init();
});
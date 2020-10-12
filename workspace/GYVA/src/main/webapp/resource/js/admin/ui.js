"use stript";
function hasJqueryObject( $elem ){ return $elem.length > 0;}
var app = app || {};

function bodyControll(){	
	return{
		option : {

		},
		consoleStyle : [
		
		],
		init : function(){
			
		},
		movingItem : [],
		moving : function(){
			var _window = $(window);
			var _document = $("html, body");
			var _option = this.option;
			
			/* 01. load */ 

			/* 02. click */
		
			/* 03. scroll */
			_window.on({
				scroll : function(e){
					var _windowScroll = $(this).scrollTop(); // 현재 스크롤 죄표 값
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

function formCotroll(){
	return{
		option : {
			open : "open",
			selected : "selected",	
		},
		formItem : [
			
		],
		init:function(){
			var _option = this.option;
			var _wrap = app.$body.find(".form-wrap");
			var _area = _wrap.find(".form-area");
			var _form = _area.find("input");
			var _password = _wrap.find('[data-type="password"]');
			var _submit = _wrap.find('[type="submit"]');
			var _item = app.formCotroll.formItem;
			
			$('[data-combine-form="datepicker"]').find('[data-mult-form="date"] .input-form').datepicker();

			_area.on("focusout", _form, function(){app.formCotroll.invalid(_form, _area, _submit);});
			_password.on("click", ".form-btn", function(){app.formCotroll.view($(this));});
		},
		invalid : function(_form, _area, _submit){
			var _message = "";
			var _result = true;

			_form.each(function(e){
				_message = $(this).data("invalid");
				if($(this).prop("required")) {
					if($(this).val() == "") {
						_result = false;
						_area.find("p").empty();
						$(this).addClass("invalid").focus().after('<p class="invalid-txt">' + _message + '</span>');
						return false;
					}else{
						$(this).removeClass("invalid").next().empty();
						_result = true;
					}
				}
			});

			(_result == true) ? _submit.removeAttr("disabled") : _submit.attr("disabled", "disabled") ;
		},
		view : function(_this){
			var _parent = _this.parent();
			var _icon = _this.find("i");
			var _form = _parent.find(".form-input");

			if(!_parent.hasClass('active')){
				_parent.addClass("active");
				_icon.attr('class',"fa fa-eye-slash fa-lg");
				_form.attr('type',"text");
			}else{
				_parent.removeClass("active");
				_icon.attr('class',"fa fa-eye fa-lg");
				_form.attr('type','password');
			}
		},
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
			var _action = "";
			var _thisToggle = "";
			var _toggle = app.$body.find('[data-type="' + _option.toggle + '"]');
			var _menu = app.$body.find(".lnb-menu");

			_toggle.each(function(){
				_action = $(this).data(_option.toggle + '-action');
				$(this).addClass(_action);
			});
			/* 초기값 */

			/* click */
			if(hasJqueryObject(app.$body.find('[data-type="toggle"]'))) ($("." + _option.animate).on("click", ".toggle-btn", function(){app.toggleControll.animate($(this), _option, _toggle);}), $("." + _option.slide).on("click", ".toggle-btn", function(){app.toggleControll.slide($(this), _option, _toggle);}));
			_menu.on("click", "button.menu-btn", function(){app.toggleControll.menu($(this),_option, _menu);});
		
		},
		animate : function(_this, _option, _toggle){
			_thisToggle = _this.parents("." + _option.animate);
			(_thisToggle.attr("data-" + _option.animate + "-action") == _option.active) ? _thisToggle.attr("data-" + _option.animate + "-action", _option.passive) : _thisToggle.attr("data-" + _option.animate + "-action", _option.active);
		},
		slide : function(_this, _option, _toggle){
			_thisToggle = _this.parents("." + _option.slide);
			(_thisToggle.attr("data-" + _option.slide + "-action") == _option.slideUp) ? (_this.find(".fas").removeClass("fa-angle-up").addClass("fa-angle-down"), _thisToggle.attr("data-" + _option.slide + "-action", _option.slideDown), _thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideDown()) : (_this.find(".fas").removeClass("fa-angle-down").addClass("fa-angle-up"), _thisToggle.attr("data-" + _option.slide + "-action", _option.slideUp), _thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideUp());
		},
		menu : function(_this, _option, _menu){
			var _depth = _this.parents("ul").data("menu-depth");
			var _list = _menu.find('[data-menu-depth="' + _depth + '"] li');
			var _thisList = _this.parent();
			
			if(!_thisList.hasClass(_option.active)) {
				_list.removeClass(_option.active);
				_thisList.addClass(_option.active);
				_list.find("i").attr("class", "fas fa-angle-right");
				_this.find("i").attr("class", "fas fa-angle-down");
			}else{
				_thisList.removeClass(_option.active);
				_this.find("i").attr("class", "fas fa-angle-right");
			}
		},
	}
}

function activeCotroll(){
	return{
		init:function(){
			var _btn = app.$body.find('[data-btn-style="modal"]');

			_btn.on("click", function(){app.activeCotroll.activePop($(this));});

		},
		activePop : function(_target){
			var _type = _target.data("btn-key");
			var _layerpop = app.$body.find('[data-pop-key="' + _type + '"]');
			console.log(_type);

			_layerpop.parent().attr("data-pop-action", "active");

		},
		show : function(_target){
			_target.show();
		},
	}
}

function closeCotroll(){
	return{
		init: function(){
			var _layerpop = app.$body.find('.layerPop-wrap');
			var _btn = app.$body.find('[data-pop-btn="close"]');

			_btn.on("click", function(){app.closeCotroll._closePop(_layerpop);});
		},
		_closePop : function(_layerpop){
			_layerpop.attr("data-pop-action", "disabled");
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
		app.toggleControll.init();
	/***********************************************************
		12.layout
	***********************************************************/

	/***********************************************************
		13. 팝업, 알럿
	***********************************************************/
	
	/***********************************************************
		14. common
	***********************************************************/
		app.bodyControll = bodyControll();
		app.bodyControll.init();
		
		app.formCotroll = formCotroll();
		app.formCotroll.init();
	/***********************************************************
		15. etc
	***********************************************************/		
		app.activeCotroll = activeCotroll();
		app.activeCotroll.init();
		
		app.closeCotroll = closeCotroll();
		app.closeCotroll.init();

});

$(window).on("load", function(){
	
});

$(window).on("resize", function(){
	app.bodyControll.init();
});
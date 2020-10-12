"use stript";
function hasJqueryObject( $elem ){ return $elem.length > 0;}
var app = app || {};

function bodyControll(){	
	return{
		option : {
			host : {
				host00 : window.location.href.split("/")[0],
				host02 : window.location.href.split("/")[2],
			},
		},
		init : function(){
			var _option = this.option;
			var _scrollArea = app.$body.find('[data-list-type="scroll-list"]');
			var _scrollList = _scrollArea.find(".list");
			var _action = ""; // data-type값-action : animate 값
			var _style = ""; // data-type값-style : css 값 
			
			/* 이미지 에러
			app.$body.find('img').each(function(n){
				$(this).error(function(){
					$(this).attr('src', '대체할 이미지');
				});
			});
			 */
			/* 에러 페이지 색상 적용 */
			if(hasJqueryObject(app.$body.find('#FR130101-15'))) $("body").css("background-color", "#fdfdfd");
			
			/* 모바일, PC 분기 처리 */
			var UserAgent = navigator.userAgent;
			if(UserAgent.match(/iPhone|iPod|iPad|iPad2|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
				app.bodyControll.option = {UserAgent : "M"};
			}else{
				app.bodyControll.option = {UserAgent : "P"};
			}
			app.$body.find(".content-section").attr("data-useragent", app.bodyControll.option.UserAgent); // 모바일 분기 처리
			if(app.bodyControll.option.UserAgent == "M") app.bodyControll.useragent(); // 모바일 분기에 따른 설정
		},
		useragent : function(){
			var _contents = app.$body.find(".content-section");
			var _layerPop = app.$body.find(".layerPop-wrap");
			
			// Contact
			if(hasJqueryObject(app.$body.find('#FR110101-10'))){
				_contents.find(".contact-area").removeAttr("data-offset");
				_contents.find(".form-wrap").removeAttr("data-offset");
			}
			// 썸네일 리스트 공통
			if(hasJqueryObject(app.$body.find('.list-wrap'))){
				_contents.find(".list-wrap").removeAttr("data-list-type");
				_contents.find(".list-wrap").removeAttr("data-combine-list");
				_contents.find(".thumbnail-list").removeAttr("data-list-style");
				_contents.find(".profile .tit").attr("data-text-style", "ellipsis");
				// 레이어 팝업 이 존재 할 때
				if(hasJqueryObject(app.$body.find('[data-btn-key="detail"]'))){
					_contents.find(".caption .tit").attr("data-text-style", "ellipsis");
					_contents.find(".caption .txt").attr("data-text-style", "ellipsis");
					_layerPop.find("layerPop-tit").attr("data-text-style", "ellipsisRow");
					_layerPop.find("layerPop-txt").attr("data-text-style", "ellipsisRow");
				}
				// 이벤트 페이지
				if(hasJqueryObject(app.$body.find('[data-type="swiper"]'))){
					_contents.find('[data-type="swiper"]').attr("data-swiper-option", "fraction");
					_contents.find(".caption .tit").attr("data-text-style", "ellipsisRow");
				}
			}
			// 상세페이지
			if(hasJqueryObject(app.$body.find('.board-wrap'))){
				_contents.find(".board-header").removeAttr("data-board-header");
				_contents.find(".form-area").removeAttr("data-combine-form");
				_contents.find('[data-btn-key="poll"]').removeClass("sub-btn").addClass("main-btn");
			}
		},
		getListData : function(_target, _option){
			var _switch = _target.data("type");
			var _thumbnail = _target.find(".thumbnail-list li");
			var _registration = _target.find("li");
			
			_option.listTit = []; // 1. result.title
			_option.listTxt = []; // 2. result.contents
			_option.listImg = []; // 3. result.thumFilePath
			_option.date = []; // 4. result.createDate.substring(0,10)
			_option.fileSize = []; // 5. result.fileSize/1000000
			_option.fileExtension = []; // 6. result.fileExtension
			_option.fileName = []; // 7. result.fileName (input)
			_option.etc = []; // 8. result.remark (input)
			_option.seq = []; // 9. result.seq (input)
			_option.contentsId = []; // 10. result.contentsId (input)
			_option.filePath = []; // 11. result.filePath (input)
			_option.yourHost = []; // 12. result.lecturer (input)
			_option.place = []; // 13. result.place (input)
			_option.calendar = []; // 14. result.startDate (input)
			_option.webinarUrl = []; // 15. result.contentsUrl (input)

			if(_switch == "swiper"){
				_registration.each(function(e){
					var _caption = $(this).find(".caption");
					
					_option.listTit.push(_caption.find(".tit").text());
					_option.listTxt.push($(this).find('[name="contents"]').val());
					_option.listImg.push($(this).find(".img-area > img").attr("src"));
					_option.fileName.push($(this).find('[name="fileName"]').val());
					_option.etc.push($(this).find('[name="remark"]').val());
					_option.seq.push($(this).find('[name="seq"]').val());
					_option.contentsId.push($(this).find('[name="contentsId"]').val());
					_option.filePath.push($(this).find('[name="uploadFilePath"]').val());
					_option.yourHost.push($(this).find('[name="yourHost"]').val());
					_option.place.push($(this).find('[name="place"]').val());
					_option.calendar.push($(this).find('[name="calendar"]').val());
					_option.webinarUrl.push($(this).find('[name="webinarUrl"]').val());
			
					$(this).attr("data-list-index", e);
				});
			}else{
				_thumbnail.each(function(e){
					var _caption = $(this).find(".caption");
					var _data =$(this).find(".data");

					_option.listTit.push(_caption.find(".tit").text());
					_option.listTxt.push(_caption.find(".txt").text());
					_option.listImg.push($(this).find(".link-btn img, .img-area > img").attr("src"));
					_option.date.push(_data.find(".date").text());
					_option.fileSize.push(_data.find(".volume").text());
					_option.fileExtension.push(_caption.find(".category-txt").text());
					_option.fileName.push($(this).find('[name="fileName"]').val());
					_option.etc.push($(this).find('[name="remark"]').val());
					_option.seq.push($(this).find('[name="seq"]').val());
					_option.contentsId.push($(this).find('[name="contentsId"]').val());
					_option.filePath.push($(this).find('[name="uploadFilePath"]').val());

					$(this).attr("data-list-index", e);
				});
			}
		},
		setListData : function(_this, _layerpop){
			var _switch = _this.parents(".list-wrap").data("type");
			var _form = app.$body.find('[name="detailForm"]');
			
			if(_switch == "swiper"){
				var _registration = _this.parents(".swiper-wrapper li");
				var _index = _registration.data("list-index");

				_layerpop.find(".layerPop-tit").text(app.bodyControll.option.listTit[_index]);
				_layerpop.find(".layerPop-txt").text(app.bodyControll.option.listTxt[_index]);
				_layerpop.find(".img-area img").attr("src", app.bodyControll.option.listImg[_index]); // [2020-09-17] IE에서 로걸경로로 잡힌 이미지에 관련된 오류로 인해 임시 주석처리 
				_layerpop.find('[data-list-key="yourHost"] .txt').text(app.bodyControll.option.yourHost[_index]);
				_layerpop.find('[data-list-key="place"] .txt').text(app.bodyControll.option.place[_index]);
				_layerpop.find('[data-list-key="calendar"] .txt').text(app.bodyControll.option.calendar[_index]);
				_layerpop.find('[data-list-key="etc"] .txt').text(app.bodyControll.option.etc[_index]);
				_layerpop.find('.layerPop-download-btn').attr("href", app.bodyControll.option.webinarUrl[_index]);
				_form.find('[name="seq"]').val(app.bodyControll.option.seq[_index]);
				_form.find('[name="contentsId"]').val(app.bodyControll.option.contentsId[_index]);
				_form.find('[name="fileName"]').val(app.bodyControll.option.fileName[_index]);
				_form.find('[name="uploadFilePath"]').val(app.bodyControll.option.filePath[_index]);
			}else{
				var _thumbnailList = _this.parents(".thumbnail-list li");
				var _index = _thumbnailList.data("list-index");
				
				_layerpop.find(".layerPop-tit").text(app.bodyControll.option.listTit[_index]);
				_layerpop.find(".layerPop-txt").text(app.bodyControll.option.listTxt[_index]);
				_layerpop.find(".img-area img").attr("src", app.bodyControll.option.listImg[_index]); // [2020-09-17] IE에서 로걸경로로 잡힌 이미지에 관련된 오류로 인해 임시 주석처리 
				_layerpop.find('[data-list-key="date"] .txt').text(app.bodyControll.option.date[_index]);
				_layerpop.find('[data-list-key="fileSize"] .txt').text(app.bodyControll.option.fileSize[_index]);
				_layerpop.find('[data-list-key="fileExtension"] .txt').text(app.bodyControll.option.fileExtension[_index]);
				_layerpop.find('[data-list-key="fileName"] .txt').text(app.bodyControll.option.fileName[_index]);
				_layerpop.find('[data-list-key="etc"] .txt').text(app.bodyControll.option.etc[_index]);
				_form.find('[name="seq"]').val(app.bodyControll.option.seq[_index]);
				_form.find('[name="contentsId"]').val(app.bodyControll.option.contentsId[_index]);
				_form.find('[name="fileName"]').val(app.bodyControll.option.fileName[_index]);
				_form.find('[name="uploadFilePath"]').val(app.bodyControll.option.filePath[_index]);
			}
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
		cssFix : function(_target, _style, _size){_target.css(_style, _size);},
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
			close : "close",
			selected : "selected",
			slideUp : "slideUp",
			slideDown : "slideDown",
			password : "password",
			message : {
				userEmail : "Please Enter your email address.",
				userEmailValidate : "Invalid email address",
				userPassword : "Please Enter your Password",
				userPasswordValidate : "Password must be at least 6 characters",
				userConfirmPassword : "Passwords do not match",
				userFirstName : "Please Enter your FirstName",
				userLastName : "Please Enter your LastName",
				userCountry : "Please Enter your Country.",
				userSpecialty : "Please Enter your Specialty.",
				userPhysician : "Register your doctor's license image",
				userphoto : "Register the doctor's face image.",
				userPartnerName : "Please Enter your PartnerName.",
				userClinicName : "Please Enter your ClinicName.", // Clinic Name 항목은 필수값이 아니여서 사용하지 않음
				userClinicAddress : "Please Enter your ClinicAddress.", // Clinic Address 항목은 필수값이 아니여서 사용하지 않음
				userClinicPostcode : "Please Enter your Clinic Postcode.", // Clinic Postcode / Zip 항목은 필수값이 아니여서 사용하지 않음
			},
			validate : {
				userEmail : "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$",
				userPassword : "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z]).{6,20}$",
				//userPassword : "^(?=.*\\d)(?=.*[~`!@#$%\\^&*()-])(?=.*[a-z])(?=.*[A-Z]).{6,20}$",
			},
		},
		init:function(){
			var _option = this.option;
			var _wrap = app.$body.find(".form-wrap");
			var _area = app.$body.find(".form-area");
			var _form = app.$body.find(".form");
			var _required = _form.find("[required]");
			var _password = app.$body.find('[data-mult-form="password"]');
			var _select = app.$body.find('[data-mult-form="select-list"]');
			var _radio = app.$body.find('[data-form="radio"]');
			var _file = app.$body.find('[data-mult-form="file"]');
			var _selectItem = app.formCotroll.selectItem;
			var _optionItem = app.formCotroll.optionItem;
			var _invalidItem = app.formCotroll.invalidItem;
			
			//초기값 설정
			_select.each(function(a){
				var _top =$(this).offset().top;
				var _document = app.$body.find(".content-section");
				var _standardSize = (_document.height()) / 2;
				
				(_top > _standardSize) ? $(this).attr({"data-select-index" : a, "data-select-action" : _option.close, "data-select-offset" : "bottom"}) : $(this).attr({"data-select-index" : a, "data-select-action" : _option.close, "data-select-offset" : "top"})
			});
			
			//라디오 초기값 설정
			var _initKey = _radio.find(".check-form:checked").data("radio-key");
			$('[data-radio-target="position"]').find(".input-form").removeAttr("required");
			$('[data-radio-target="position"]').hide();
			$('[data-position-key="' + _initKey +'"]').show();
			$('tr[data-position-key="' + _initKey +'"]').find(".input-form").attr("required", "required");
			
			// 함수 실행
			_select.on("click", '.select-btn', function(){app.formCotroll.select($(this), _option, _optionItem);}); // 선택박스 타입
			_password.on("click", ".icon-btn", function(){app.formCotroll.view($(this));}); // 패스워드 보기
			if(hasJqueryObject(_required)) _form.on("focusout", _required, function(){app.formCotroll.invalid($(this), _option);}); // value값 체크
			if(_radio.find("[data-radio-key]")) _radio.on("change", ".check-form", function(){app.formCotroll.radioCheck($(this));}); // 라디오 선택 값
			_file.on("change", ".file-form", function(){app.formCotroll.uploadFile($(this));}); // 첨부파일
		},
		invalidItem : [],
		invalid : function(_this, _option){
			var _result = "";
			var _thisInput = _this.find("[required]");
			var _validate = _thisInput.data("validate-key");
			var _message = _option.message[_validate];
			
			if(_thisInput.val() == "") {
				_result = false;
				_thisInput.addClass("invalid");
				_this.find(".invalid-txt").detach();
				_this.append('<p class="invalid-txt">' + _message + '</span>');
				return false;
			}else{
				_thisInput.removeClass("invalid");
				_this.find(".invalid-txt").detach();
				// 정규식 체크 : 이메일, 패스워드
				if(_validate == "userPassword" || _validate == "userEmail") app.formCotroll.validate(_thisInput, _this, _option, _validate);
				// 패스워드 값 비교
				if(_validate == "userPassword" && _this.prev().find("input").val() !== undefined && _this.prev().find("input").val() !== _this.find("input").val()){
					_message = _option.message.userConfirmPassword;
					_this.find(".invalid-txt").detach();
					_this.append('<p class="invalid-txt">' + _message + '</span>');
					return false;
				}
				_result = true;
			}
		},
		validate : function(_input, _form, _option, _validate){
			var val = _input.val();
			
			console
			if (val.match(_option.validate[_validate]) !== null) {
				_input.removeClass("invalid");
				_form.find(".invalid-txt").detach();
				if(_validate == "userEmail") _form.find(".board-sub-btn").removeAttr("disabled");
			}else{
				_input.addClass("invalid");
				_form.find(".invalid-txt").detach();
				_form.append('<p class="invalid-txt">' + _option.message[_validate + "Validate"] + '</span>');
				return false;
			}
		},
		radioCheck : function(_this){
			var _key = _this.data("radio-key");

			$('[data-radio-target="position"]').hide();
			$('[data-radio-target="position"]').find(".input-form, .select-form, .select-btn").removeAttr("required");
			$('[data-position-key="' + _key +'"] [data-mult-form="file"]').find(".file-form").each(function(){$(this).replaceWith($(this).clone(true));}); // 파일첨부값 초기화
			$('[data-position-key="' + _key +'"]').find(".input-form").removeAttr("value"); // 인풋값 초기화
			$('[data-position-key="' + _key +'"]').find(".select-form option:eq(0)").prop("selected", true); // [수정된 선택박스 폼 요소 미 적용] select 폼으로 제외 처리
			if(!app.$body.find(".article-tit + .board-area")) $('[data-position-key="' + _key +'"]').find(".input-form, .select-form, .select-btn").attr("required", "required");
			$('[data-position-key="' + _key +'"]').show();
		},
		uploadFile : function(_this){
			var _parent = _this.parent();
			var _input = _parent.find(".input-form");
			var _filePath = _this.val(); //파일 경로.
			var _filePathSplit = _filePath.split('\\'); //전체경로를 \ 나눔.
			var _filePathLength = _filePathSplit.length; //전체경로를 \로 나눈 길이.
			var _fileNameSplit = _filePathSplit[_filePathLength-1];
			
			_input.attr("value", _fileNameSplit);
			
			/* 임시 숨김처리
			var fileNameSplit = filePathSplit[filePathLength-1].split('.'); //마지막 경로를 .으로 나눔.
			var fileName = fileNameSplit[0]; //파일명 : .으로 나눈 앞부분
			var fileExt = fileNameSplit[1]; //파일 확장자 : .으로 나눈 뒷부분
			var fileSize = file.files[0].size; //파일 크기
			console.log('파일 경로 : ' + filePath);
			console.log('파일명 : ' + fileName);
			console.log('파일 확장자 : ' + fileExt);
			console.log('파일 크기 : ' + fileSize);
			*/
		},
		view : function(_this){
			var _parent = _this.parent();
			var _icon = _this.find("i");
			var _input = _parent.find(".input-form");

			if(!_parent.hasClass('active')){
				_parent.addClass("active");
				_icon.attr('class',"fas fa-eye-slash");
				_input.attr('type',"text");
			}else{
				_parent.removeClass("active");
				_icon.attr('class',"far fa-eye");
				_input.attr('type','password');
			}
		},
		selectItem : [],
		select : function(_this, _option, _optionItem){
			var _wrap = _this.parent();
			var _area = _wrap.find(".option-list");
			var _offset = _wrap.data("select-offset");
			
			if(_wrap.attr("data-select-action") !== _option.selected){
				_wrap.attr("data-select-action", _option.selected);
				(_offset == "bottom") ? _this.find("i").removeClass("fa-angle-up").addClass("fa-angle-down") : _this.find("i").removeClass("fa-angle-down").addClass("fa-angle-up");
				_area.focus().slideDown(); // optionList 열기
				
			}else{
				(_offset == "bottom") ? _this.find("i").removeClass("fa-angle-down").addClass("fa-angle-up") : _this.find("i").removeClass("fa-angle-up").addClass("fa-angle-down");
				_area.slideUp(); // optionList 닫기
				_wrap.focus().attr("data-select-action", _option.close);
			}
			
			// option-list 버튼 클릭
			_area.on("click", '[class*="btn"]', function(event){app.formCotroll.optionList($(this), _this, _area, _wrap, _option, _optionItem, _offset);});
		},
		optionItem : [],
		// optionList : function(옵션 리스트버튼, 선택 버튼, option-list, select-list, _option, app.formCotroll.optionItem, 리스트 위치 값)
		optionList : function(_this, _selectBtn, _area, _wrap, _option, _item, _offset){
			var _data = _this.text(); // 옵션 선택 텍스트

			if(_this.hasClass("option-btn")){
				var _dataValue = _this.attr("value"); // 옵션 코드 값 
				
				_selectBtn.attr("value", _data); // 선택된 값 확인하기
				_selectBtn.removeAttr("data-select-init"); // 플레이스홀더 기본 설정 값 삭제

				if(_selectBtn.data("validate-key") == "userCountry") $('[name="countryCode"]').attr("value", _dataValue); // countryCode 코드 값 매핑
				if(_selectBtn.data("validate-key") == "userSpecialty") $('[name="specialCode"]').attr("value", _dataValue); // specialCode 코드 값 매핑
			}
			
			_selectBtn[0].firstChild.data = _data; // 옵션값 추출적용, w.fn.init[]

			(_offset == "bottom") ? _selectBtn.find("i").removeClass("fa-angle-down").addClass("fa-angle-up") : _selectBtn.find("i").removeClass("fa-angle-up").addClass("fa-angle-down");
			_area.slideUp(); // optionList 닫기
			_wrap.focus().attr("data-select-action", _option.close);
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
			var _tabList = _target.find('.tab-list'); // PC 전용 탭 리스트
			var _list = _tabList.find('[data-' + _option.tab + '-type="' + _option.list + '"]');
			var _cont = _target.find('[data-' + _option.tab + '-type="' + _option.cont + '"]');
		
			if(_target.attr("data-tab-division") == "article") this.tab(_option, _target, _list, _cont); // 초기값
			if(_target.attr("data-tab-division") == "article") _target.on("click", ".tab-list .list-btn", function(){app.tabControll.click(_option, _list, _cont, $(this));}); // 클릭 액션
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
			bookmark : "bookmark",
			menu : "menu",
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

			_toggle.each(function(i){
				_action = $(this).data(_option.toggle + '-action');
				$(this).attr("data-toggle-index", i).addClass(_action);
			});
			/* 1:1 문의 초기값 */
			if(hasJqueryObject(app.$body.find('[data-list-type="question-view"]'))) {
				_toggle.attr("data-" + _option.slide + "-action", _option.slideUp);
				_toggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').hide();
				app.$body.find('[data-list-type="question-view"]').find("li").eq(0).find(_toggle).attr("data-" + _option.slide + "-action", _option.slideDown);
				app.$body.find('[data-list-type="question-view"]').find("li").eq(0).find(_toggle).find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').show();
			}
			/* 공통 메뉴 초기값 */
			if($("." + _option.menu).find(" > ul > li").hasClass("active")) $("." + _option.active).find("button").next().show();
			
			/* click */
			if(hasJqueryObject(app.$body.find(_toggle))) {
				/* 설문결과 토글 액션 */
				$("." + _option.slide).on("click", ".toggle-btn", function(){app.toggleControll.slide($(this), _option, _toggle);});
				/* 북마크 */
				$("." + _option.bookmark).on("click", ".bookmark-btn", function(){app.toggleControll.bookmark($(this));});
				/* 공통 : 메뉴 */
				$("." + _option.menu).on("click", "button.menu-btn", function(){app.toggleControll.menu($(this),_option);});
			}
		},
		slide : function(_this, _option, _toggle){
			_thisToggle = _this.parents("." + _option.slide);
			(_thisToggle.attr("data-" + _option.slide + "-action") == _option.slideUp) ? (
			_this.find(".fas").removeClass("fa-angle-up").addClass("fa-angle-down"), 
			_thisToggle.attr("data-" + _option.slide + "-action", _option.slideDown), 
			_thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideDown()
			) : (
			_this.find(".fas").removeClass("fa-angle-down").addClass("fa-angle-up"), 
			_thisToggle.attr("data-" + _option.slide + "-action", _option.slideUp), 
			_thisToggle.find('[data-' + _option.toggle + '-type="' + _option.cont + '"]').slideUp()
			);
		},
		menu : function(_this, _option){
			var _thisParent = _this.parent();
			var _list = _this.parents("." + _option.menu).find("> ul > li");
			var _thisNext = _this.next();
			var _next = _list.find("button").next();

			if(!_thisParent.hasClass(_option.active)) {
				_list.removeClass(_option.active);
				_thisParent.addClass(_option.active);
				_next.slideUp();
				_thisNext.slideDown();
			}else{
				_thisParent.removeClass(_option.active);
				_thisNext.slideUp();
			}

		},
		bookmark : function(_this){
			(!_this.hasClass("active")) ? _this.addClass("active") : _this.removeClass("active");
		},
	}
}

function swiperControll(){
	return{
		swiperItem : [],
		options : {
			key : true,
			progress : {
				pagination: {
					el: '.swiper-pagination',
					type: 'progressbar',
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			},
			scrollbar : {
				slidesPerView: 4,
				spaceBetween: 40,
				scrollbar: {
					el: '.swiper-scrollbar',
				},
				breakpoints: {
					1280: {
						slidesPerView: 2.7,
						spaceBetween: 40,
					},
					1920: {
						slidesPerView: 4,
						spaceBetween: 40,
					},
				},
			},
			thumbnail: {
				slidesPerView: 3,
				spaceBetween: 15,
				loop: true,
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			},
			navigation : {
				slidesPerView: 1,
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			},
			visual : {
				slidesPerView: 1,
				spaceBetween: 0,
				loop: true,
				//freeMode: true,
				autoplay: {
					delay: 2500,
					disableOnInteraction: false,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
				pagination: {
					el: '.swiper-pagination'
				},
			},
		},
		init : function(){
			var _option = this.options;
			var _target = app.$body.find('[data-type="swiper"]');
						
			app.swiperControll.swiper(_target, _option); // 스와이퍼 실행
			if(hasJqueryObject(app.$body.find('[data-swiper-option="progress"]'))) app.swiperControll.navigation(_target);
			if(hasJqueryObject(app.$body.find('[data-swiper-option="thumbnail"]'))) app.swiperControll.mainThumbnail(app.$body.find('.thumbnail-list')); // 메인 하단 오룬쪽 썸네일 리스트
			_target.on("click", ".autoplay-btn", function(){app.swiperControll.autoplay($(this), _option);}); // autoplay 컨트롤

		},
		swiper : function(_target, _option){
			var _setting = "";
			_target.each(function(i){
				var _data = $(this).data("swiper-option");
				var _key = $(this).attr("data-swiper-index", i);
				var _swiper;
				
				if(_data == "progress") _setting = _option.progress; // 상세페이지
				if(_data == "scrollbar") _setting = _option.scrollbar; // 이벤트 페이지
				// 메인 상단 비주얼
				if(_data == "visual"){
					if($(this).find("li").length == 2){
						_option.visual.loop = false;
						_option.visual.autoplay = "";
						$(this).find(".autoplay-btn").hide();
					}
					_setting = _option.visual;
				}
				if(_data == "navigation") _setting = _option.navigation; // 메인 하단 : Updates
				if(_data == "thumbnail") _setting = _option.thumbnail; // 메인 하단 : Academy
				
				// 스와이프는 2개 이상 일때 실행 
				($(this).find("li").length >= 2) ? _swiper = new Swiper($(this).find(".swiper-container"), _setting) : ($(this).find("ul ~").hide(), $(this).find(".autoplay-btn").hide());
				app.swiperControll.swiperItem.push(_swiper); // 스와이프 담기
			});
		},
		navigation : function(_target){
			var _slideindex = _target.attr("data-swiper-index");
			var _slideItem = app.swiperControll.swiperItem[_slideindex];
			var _area = _target.find(".swiper-navigation");
			
			_area.html('<span class="num">' + (_slideItem.activeIndex + 1) + '</span><span class="total">' + _slideItem.slides.length + '</span>');
			_slideItem.on('slideChange', function () {
				_area.find(".num").text(_slideItem.activeIndex + 1);
			});
		},
		mainThumbnail : function(_target){
			var _slideindex = _target.attr("data-swiper-index");
			var _slideItem = app.swiperControll.swiperItem[_slideindex];
			var _getArea = _target.prev();
			var _getImg = _getArea.find("img");
			var _getTit = _getArea.find(".tit");
			var _getTXt = _getArea.find(".txt");
			
			// 초기값 설정
			_getImg.attr("src", _slideItem.$wrapperEl.children().eq(_slideItem.activeIndex).find("img").attr("src"));
			_getTit.text(_slideItem.$wrapperEl.children().eq(_slideItem.activeIndex).find(".tit").text());
			_getTXt.text(_slideItem.$wrapperEl.children().eq(_slideItem.activeIndex).find(".txt").text());
			_slideItem.slideNext(); // 첫번째 리스트는 로딩 시 슬라이드를 넘김
			
			_slideItem.on('slideChange', function () {
				var _index = _slideItem.activeIndex;
				var _setList = _slideItem.$wrapperEl.children().eq(_index - 1);
				var _setImg = _setList.find("img").attr("src");
				var _setTit = _setList.find(".tit").text();
				var _setTxt = _setList.find(".txt").text();
				
				_getImg.attr("src", _setImg);
				_getTit.text(_setTit);
				_getTXt.text(_setTxt);
				_getArea.css("opacity", 0);
				_getArea.stop().animate({"opacity" : 1});

			});
		},
		autoplay : function(_this, _option){
			var _slideindex = _this.parent().attr("data-swiper-index");
			var _slideItem = app.swiperControll.swiperItem[_slideindex];

			if(_option.key == true){
				_slideItem.autoplay.stop();
				_this.html('<i class="fas fa-play"></i>');
				_option.key = false; // 상태설정 : true == start, false == stop
			}else{
				_slideItem.autoplay.start();
				_this.html('<i class="fas fa-pause"></i>');
				_option.key = true; // 상태설정 : true == start, false == stop
			}
		}
	}
}

function activeCotroll(){
	return{
		option : {
			1 : "column-1-list",
			2 : "column-2-list",
			4 : "column-4-list",
			increase : 0,
		},
		init : function(){
			var _option = this.options;
			var _modalBtn = app.$body.find('[data-btn-style="modal"]');
			var _moreBtn = app.$body.find('[data-btn-style="more"]');
			var _thumbnail = app.$body.find('[data-list-type="thumbnail"]');
			var _length;
			var _count;

			// 공통 : 관리자, 프론트 PC 더보기 초기값 설정
			if(!hasJqueryObject(app.$body.find('[data-type="swiper"]')) && !hasJqueryObject(app.$body.find('#FR010501-05')) && hasJqueryObject(app.$body.find('.list-wrap'))){
				_thumbnail.each(function(e){
					var _thumbnailList = $(this).find("ul li");
					var _combine = $(this).data("combine-list");
					var _btnArea = $(this).find(".button-area");

					if(_thumbnail.find("ul").hasClass("pdf-list")) _count = 10;
					
					switch(_combine) {
					    case "column-1-list" :
					    	_count = 20;
					        break;
					    case "column-2-list" :
					    	_count = 20;
					        break;
					    case "column-3-list" :
					    	_count = 16;
					        break;
					    case "column-4-list" :
					    	_count = 16;
					        break;
					}

					_option = {increase :_count};
					_length = _thumbnailList.length;
					_thumbnailList.hide();
					
					if(_length < _count) _btnArea.hide();
					for(var i=0;i<_count;i++){_thumbnailList.eq(i).show();}
				});
			}

			_modalBtn.on("click", function(){app.activeCotroll.activePop($(this));});
			_moreBtn.on("click", function(){app.activeCotroll.more($(this), _count, _length);});
		},
		activePop : function(_this){
			var _type = _this.data("btn-key");
			var _layerpop = app.$body.find('[data-pop-key="' + _type + '"]');

			if(_type == "detail") app.bodyControll.setListData(_this, _layerpop); // 레이어 팝업 썸네일 리스트 데이터 셋팅
			_layerpop.parent().attr("data-pop-action", "active");
		},
		show : function(_target){
			_target.show();
		},
		more : function(_this, _count, _length){
			var _thumbnail = _this.parents('[data-list-type="thumbnail"]');
			var _thumbnailList = _thumbnail.find("ul li");
			if(app.activeCotroll.option.increase < _count) app.activeCotroll.option = {increase : _count};
			(_length < app.activeCotroll.option.increase) ? _this.parent().hide() : app.activeCotroll.option = {increase : app.activeCotroll.option.increase + _count};
			
			for(var i=0;i<app.activeCotroll.option.increase;i++){_thumbnailList.eq(i).show();}
		},
	}
}

function closeCotroll(){
	return{
		init: function(){
			var _closebtn = app.$body.find('[data-pop-btn="close"]');
			var _deletebtn = app.$body.find('[data-pop-btn="delete"]');

			_closebtn.on("click", function(){app.closeCotroll.closePop($(this));});
			_deletebtn.on("click", function(){app.closeCotroll.deletePop($(this));});
		},
		closePop : function(_this){
			var _layerpop = _this.parents('[data-pop-action]');
			
			_layerpop.attr("data-pop-action", "disabled");
		},
		deletePop : function(_this){
			var _layerpop = _this.parents('.layerPop-wrap');
			var _areaBtn = app.$body.find('.submit-area');
			
			_layerpop.detach();
			_areaBtn.find('.sub-btn').removeAttr("data-btn-style");
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
		// 썸네일 리스트 데이터 확인 : init 함수에서 밖으로 빼옴
		if(hasJqueryObject(app.$body.find('[data-btn-key="detail"]'))) app.bodyControll.getListData(app.$body.find('.list-wrap'), app.bodyControll.option);  // 썸네일 리스트 데이터 구하기
		
		app.formCotroll = formCotroll();
		app.formCotroll.init();
	/***********************************************************
		15. etc
	***********************************************************/		
		app.activeCotroll = activeCotroll();
		app.activeCotroll.init();
		
		app.closeCotroll = closeCotroll();
		app.closeCotroll.init();
		
		app.swiperControll = swiperControll();
		app.swiperControll.init();
});

$(window).on("load", function(){
	app.$body.find('.loading-area').attr("data-pop-action", "disabled"); // 페이지 로딩 시 로딩이미지 띄우기
});

$(window).on("resize", function(){
	app.bodyControll.init();
});
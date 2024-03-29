<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>LG chem : LG aesthetics</title>
<link rel="stylesheet" type="text/css" href="/resource/css/mobile/import.css" />
<script type="text/javascript">var _contextPath = "<c:url value='/'/>";</script>
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resource/js/libs/swiper-5.4.5.min.js"></script>
<script type="text/javascript" src="/resource/js/mobile/ui.js"></script>
<script type="text/javascript">
	//<![CDATA[
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.userInfo.email.value) {
			alert("이메일 형식의 아이디를 입력하세요.");
			return false;
		}
		
		if (document.userInfo.idChk.value == "N") {
			alert("Check if the ID is duplicated.");
			return false;
		}
		
		if (!document.userInfo.password.value) {
			alert("Please enter password.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("Please enter the same password.");
			return false;
		}
		
		if (!document.userInfo.nameFirst.value) {
			alert("nameFirst을 등록하세요.");
			return false;
		}
		
		if (!document.userInfo.nameLast.value) {
			alert("nameLast을 등록하세요.");
			return false;
		}
		
		if (!$("select[name=countryCode]").val()) {
			alert("country를 선택하세요.");
			return false;
		}
		// 전공의 케이스
		if ($("input:radio[id=userTypePyh]").is(":checked") == true) {
			if (!$("select[name=specialCode]").val()) {
				alert("special을 선택하세요.");
				return false;
			} 
			if (!document.userInfo.uploadFile_1.value) {
				alert("의사 면허증 image를 등록하세요.");
				return false;
			}
			if (!document.userInfo.uploadFile_2.value) {
				alert("의사 면허증2 image를 등록하세요.");
				return false;
			}
		}

		// 파트너 케이스
		if ($("input:radio[id=userTypePar]").is(":checked") == true) {		
			if (!document.userInfo.partnerName.value) {
				alert("partner를 등록하세요.");
				return false;
			}
		}

		if ($("input:checkbox[name=consentYn]").is(":checked") == false) {
			alert("동의 하기를 체크 하세요.");
			return false;
		}
		if ($("input:checkbox[name=consent2Yn]").is(":checked") == true) {
			document.userInfo.consent2Yn.value = "Y";
		}
	}

	// 취소 버튼 클릭시 로그인 화면으로 이동
	function goLoginForm() {
		location.href = "/loginForm.do";
	}

	// 파일 저장
	function fnSave() {
		document.userInfo.action = "<c:url value='/common/login/insertFileInfo.do'/>";
		document.userInfo.submit();
	}
	
	// 아이디 중복 체크
 	function fnIdChk() {
 		var emailVal = $("#email").val();
 		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 		
		if (!document.userInfo.email.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		$.ajax({
			url : "/common/user/idChk.do",
			type : "post",
			dataType : "json",
			data : {"email" : $("#email").val()},
			success : function(data) {
				if (emailVal.match(regExp) != null) {
					if (data == 1) {
						$("#idChk").attr("value", "N");
						alert("This email already exists.");
					} else if (data == 0) {
						$("#idChk").attr("value", "Y");
						alert("This email can be used.");
					}
				} else {
					alert("This email address cannot be used.");
				}
			},
		})
	}
	
	function goBack(){
		window.history.back();
	}
	//]]>
</script>
</head>
<body>
	<!-- [S] wrap : ID 값은 화면 ID와 동일하게 적용 -->
	<div id="FR010301-05" class="default-section">
		<!-- [S] contents -->
		<section class="content-section">
			<h2 class="content-tit">New Account</h2>
			<article class="board-wrap" data-board-type="form-write">				
				<form method="post" action="/common/user/insertUser.do" name="userInfo" id="userInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
					<input type="hidden" name="stateCode" id="stateCode" value="01"/>
					<input type="hidden" name="createId" id="createId" value="0"/>
					<input type="hidden" name="updateId" id="updateId" value="0"/>
					<input type="hidden" name="countryCode" id="countryCode" value=""/>
					<input type="hidden" name="specialCode" id="specialCode" value=""/>
					<div class="form-wrap">
						<h3 class="article-tit">Personal Information</h3>
						<p class="article-txt" data-text-style="essential">There are required fields in this form marked</p>
						
						<ul class="form-area">
							<li>
								<strong class="form-tit" data-text-style="essential">Position</strong>
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" id="userTypePyh" name="userType" data-radio-key="doctor" value="DR02" checked />
										<label for="userTypePyh" class="label-form">Physician</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="userTypePar" name="userType" data-radio-key="partner" value="PT01" />
										<label for="userTypePar" class="label-form">Partner, LG Chem employee</label>
									</li>
								</ul>
							</li>
							
							<li>
								<label for="password" class="form-tit" data-text-style="essential">Email address</label>
								<div class="form" data-mult-form="input-btn">
									<input type="email" name="email" id="email" class="input-form" data-validate-key="userEmail" placeholder="Enter your email address" required />
									<button type="button" class="board-sub-btn" name="idChk" id="idChk" value="N" onclick="fnIdChk();" disabled>Check</button>
								</div>
							</li>
							
							<li>
								<label for="password" class="form-tit" data-text-style="essential">password</label>
								<div class="form" data-mult-form="password">
									<input type="password" class="input-form" name="password" id="password" data-validate-key="userPassword" placeholder="Enter Password" required />
									<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
								</div>								
								<div class="form" data-mult-form="password">
									<input type="password" class="input-form" name="passwordCheck" id="passwordCheck" data-validate-key="userPassword" placeholder="Confirm Password" required />
									<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
								</div>
								
								<p class="form-txt">The password must have at least 8 characters, at least 1 special character</p>
							</li>		
											
							<li>
								<label for="name" class="form-tit" data-text-style="essential">Name</label>
								<div class="form"><input type="text" class="input-form" name="nameFirst" id="nameFirst" data-validate-key="userFirstName" placeholder="First name" required /></div>
								<div class="form"><input type="text" class="input-form" name="nameLast" id="nameLast" data-validate-key="userLastName" placeholder="Last name" required /></div>
							</li>
					
							<li>
								<strong class="form-tit" data-text-style="essential">Country</strong>
								<div class="form" data-mult-form="select-list">
									<button type="button" class="select-btn" data-select-init="placeholder" data-validate-key="userCountry" required>-- Select a country --<i class="fas fa-angle-down"></i></button>
									<ul class="option-list">
										<c:forEach var="countryCode" items="${countryCodeList}" varStatus="status">
											<li><button type="button" class="option-btn" value="<c:out value='${countryCode.code}'/>"><c:out value="${countryCode.value}"/></button></li>
										</c:forEach>
									</ul>
								</div>
							</li>
					
							<li data-radio-target="position" data-position-key="doctor">
								<strong class="form-tit" data-text-style="essential">Specialty</strong>
								<div class="form" data-mult-form="select-list">
									<button type="button" class="select-btn" data-select-init="placeholder" data-validate-key="userSpecialty" required>-- Select a country --<i class="fas fa-angle-down"></i></button>
									<ul class="option-list">
										<c:forEach var="specialCode" items="${specialCodeList}" varStatus="status">
											<li><button type="button" class="option-btn" value="<c:out value='${specialCode.code}'/>"><c:out value="${specialCode.value}"/></button></li>
										</c:forEach>
									</ul>
								</div>
							</li>
					
							<li data-radio-target="position" data-position-key="doctor">
								<p class="note-txt">Please provide a scan or photo of your physician ID and your photo that can prove that the ID belongs to you.</p>
								
								<label for="uploadFile_1" class="form-tit" data-text-style="essential">Physician ID</label>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" data-validate-key="userPhysician" required />
									<input type="file" class="file-form" id="uploadFile_1" name="uploadFile_1" />
									<label for="uploadFile_1" class="file-label">찾아보기</label>
								</div>
							
								<span class="img-area"><img src="/resource/images/front/contents/img-physician-example.png" alt="" /></span>
							</li>
					
							<li data-radio-target="position" data-position-key="doctor">
								<label for="uploadFile_2" class="form-tit" data-text-style="essential">Your photo</label>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" data-validate-key="userphoto" required />
									<input type="file" class="file-form" id="uploadFile_2" name="uploadFile_2" />
									<label for="uploadFile_2" class="file-label">찾아보기</label>
								</div>
								
								<span class="img-area"><img src="/resource/images/front/contents/img-photo-example.png" alt="" /></span>
							</li>
					
							<li data-radio-target="position" data-position-key="partner">
								<label for="partner" class="form-tit" data-text-style="essential">Partner name</label>
								<div class="form"><input type="text" class="input-form" name="partnerName" id="partnerName" data-validate-key="userPartnerName" placeholder="Enter Partner name" required /></div>
							</li>
						</ul>
					</div>
		
					<div class="form-wrap" data-radio-target="position" data-position-key="doctor">
						<h3 class="article-tit">Additional Information</h3>			
						<ul class="form-area">
							<li>
								<label for="clinic-name" class="form-tit">Clinic Name</label>
								<div class="form"><input type="text" name="hpName" id="hpName" class="input-form" placeholder="Enter your clinic name" /></div>
							</li>
							
							<li>
								<label for="clinic-address" class="form-tit">Clinic Address</label>
								<div class="form"><input type="text" name="hpAdd" id="hpAdd" class="input-form" placeholder="Enter your clinic address" /></div>
							</li>
							
							<li>
								<label for="clinic-postcode" class="form-tit">Clinic Postcode / Zip</label>
								<div class="form"><div class="form"><input type="text" name="hpZipcode" id="hpZipcode" class="input-form" placeholder="Enter your clinic postcode" /></div></div>
							</li>
						</ul>
					</div>
					<!-- [E] 라디오 [data-radio-key="doctor"] -->
					
					<div class="terms-section">
						<ul class="form-area">
							<li>
								<div class="form" data-form="checkbox" data-text-style="essential">
									<input type="checkbox" class="check-form" id="consentYn" name="consentYn" value="Y" checked>
									<label for="consentYn" class="label-form">I accept the Terms of Use.</label>
								</div>
								<button type="button" class="terms-main-btn" data-btn-style="modal" data-btn-key="terms">Privacy Policy<i class="fas fa-angle-right"></i></button>
							</li>
							<li>
								<div class="form" data-form="checkbox">
									<input type="checkbox" class="check-form" id="consent2Yn" name="consent2Yn" value="N" >
									<label for="consent2Yn" class="label-form">I agree that LG Chem may contact me with offers and promotions available from LG Chem.</label>
								</div>
								<button type="button" class="terms-main-btn" data-btn-style="modal" data-btn-key="marketing">Consent to additional marketing information (optional)<i class="fas fa-angle-right"></i></button>
							</li>
						</ul>					
					</div>
					
					<div class="submit-area">
						<button type="submit" class="main-btn">Join Membership</button>
					</div>
				</form>
			</article>
			<!-- [E] 게시물 등록 -->
		</section>
	</div>
	
	<!-- [S] 레이어 팝업 : Terms of Use -->
	<div class="layerPop-wrap" id="FR010301-06" data-pop-action="disabled">
		<article class="layerPop-area" data-pop-key="terms" data-pop-type="terms">
			<header class="layerPop-header">
				<h3 class="layerPop-tit">Privacy Policy</h3>
				<button type="button" class="layerPop-close-btn" data-pop-btn="close" data-check-key="terms"><span class="icon-close"></span></button>
			</header>
			<article class="layerPop-contents">
				<div class="terms-content">
					<div class="text-area">
						<strong class="tit">General Terms and Conditions for Service Use</strong>
						<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br />Please verify the general terms and conditions before using the services.</p>

						<strong class="tit">Chapter 1. General Provisions</strong>
						<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br /></p>
					</div>
				</div>
			</article>
		</article>
	</div>
	<!-- [E] 레이어 팝업 : Terms of Use -->
	
	<!-- [S] 레이어 팝업 : Consent to additional marketing information (optional) -->
	<div class="layerPop-wrap" id="FR010301-06" data-pop-action="disabled">
		<article class="layerPop-area" data-pop-key="marketing" data-pop-type="terms">
			<header class="layerPop-header">
				<h3 class="layerPop-tit">Consent to additional marketing information (optional)</h3>
				<button type="button" class="layerPop-close-btn" data-pop-btn="close" data-check-key="marketing"><span class="icon-close"></span></button>
			</header>
			<article class="layerPop-contents">
				<div class="terms-content">
					<div class="text-area">
						<strong class="tit">General Terms and Conditions for Service Use</strong>
						<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br />Please verify the general terms and conditions before using the services.</p>

						<strong class="tit">Chapter 1. General Provisions</strong>
						<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br /></p>
					</div>
				</div>
			</article>
		</article>
	</div>
	<!-- [E] 레이어 팝업 : Consent to additional marketing information (optional) -->
	
	<!-- [E] wrap -->
	<div class="loading-area" data-pop-action="active">
		<span class="img-area"><img src="/resource/images/common/contents/m_Loading_200923.gif" alt="" /></span>
	</div>
</body>
</html>

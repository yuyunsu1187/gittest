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
<link rel="stylesheet" type="text/css" href="/resource/css/front/import.css" />
<script type="text/javascript">var _contextPath = "<c:url value='/'/>";</script>
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resource/js/libs/swiper-5.4.5.min.js"></script>
<script type="text/javascript" src="/resource/js/front/ui.js"></script>
<script type="text/javascript">
	//<![CDATA[
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		if (!document.userInfo.email.value) {
			alert("Please enter your ID in email format.");
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
			alert("Please enter First name.");
			return false;
		}
		
		if (!document.userInfo.nameLast.value) {
			alert("Please enter Last name.");
			return false;
		}
		
		if (!$("select[name=countryCode]").val()) {
			alert("Please enter Country");
			return false;
		}
		// 전공의 케이스
		if ($("input:radio[id=userTypePyh]").is(":checked") == true) {
			if (!$("select[name=specialCode]").val()) {
				alert("Please select a Specialty");
				return false;
			} 
			if (!document.userInfo.uploadFile_1.value) {
				alert("Upload your Physician ID.");
				return false;
			}
			if (!document.userInfo.uploadFile_2.value) {
				alert("Upload Your Photo.");
				return false;
			}
		}

		// 파트너 케이스
		if ($("input:radio[id=userTypePar]").is(":checked") == true) {		
			if (!document.userInfo.partnerName.value) {
				alert("Please enter partner.");
				return false;
			}
		}

		if ($("input:checkbox[name=consentYn]").is(":checked") == false) {
			alert("Please agree to the Terms of Use and Privacy Policy.");
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
			alert("Please enter your ID");
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
			<header class="content-header">
				<h2 class="content-tit">New Account</h2>
				<a href="#" class="link-btn" onclick="goBack();"><i class="fas fa-angle-left"></i>Back to sign in</a>
			</header>
			<!-- [S] 게시물 등록 --> 
			<article class="board-wrap" data-board-type="form-write">
				<h3 class="article-tit">Personal Information</h3>
				<p class="article-txt" data-text-style="essential">There are required fields in this form marked</p>
				
				<form method="post" action="/common/user/insertUser.do" name="userInfo" id="userInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
					<input type="hidden" name="stateCode" id="stateCode" value="01"/>
					<input type="hidden" name="createId" id="createId" value="0"/>
					<input type="hidden" name="updateId" id="updateId" value="0"/>
					<div class="board-area">
						<table class="default-table">
							<caption>Personal Information 입력</caption>
							<colgroup>
								<col style="width:193px;" />
								<col style="width:auto;" />
							</colgroup>
							
							<tbody>
								<tr>
									<th scale="col" data-text-style="essential">Position</th>
									<td>
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
									</td>
								</tr>
								
								<tr>
									<th scale="col" data-text-style="essential">Email address</th>
									<td>
										<div class="form-area">
											<div class="form" data-mult-form="input-btn">
												<input type="email" name="email" id="email" class="input-form" data-validate-key="userEmail" placeholder="Enter your email address" required />
												<button type="button" class="board-sub-btn" name="idChk" id="idChk" value="N" onclick="fnIdChk();">Check</button>
											</div>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scale="col" data-text-style="essential">password</th>
									<td>
										<div class="form-area" data-combine-form="column-2-form">
											<div class="form" data-mult-form="password">
												<input type="password" class="input-form" name="password" id="password" data-validate-key="userPassword" placeholder="Enter Password" required />
												<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
											</div>
											
											<div class="form" data-mult-form="password">
												<input type="password" class="input-form" name="passwordCheck" id="passwordCheck" data-validate-key="userPassword" placeholder="Confirm Password" required />
												<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
											</div>
											
											<p class="form-txt">The password must have at least 8 characters, at least 1 special character</p>
										</div>
									</td>
								</tr>
	
								<tr>
									<th scale="col" data-text-style="essential">Name</th>
									<td>
										<div class="form-area" data-combine-form="column-2-form">
											<div class="form"><input type="text" class="input-form" name="nameFirst" id="nameFirst" data-validate-key="userFirstName" placeholder="First name" required /></div>
											<div class="form"><input type="text" class="input-form" name="nameLast" id="nameLast" data-validate-key="userLastName" placeholder="Last name" required /></div>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scale="col" data-text-style="essential">Country</th>
									<td>
										<div class="form" data-form="select">
											<select class="select-form" name="countryCode" id="countryCode" data-validate-key="userCountry" required>
												<option value="" hidden>-- Select a country  --</option>
												<c:forEach var="countryCode" items="${countryCodeList}" varStatus="status">
													<option value="<c:out value='${countryCode.code}'/>"> <c:out value="${countryCode.value}"/> </option>
									     		</c:forEach>
											</select>
											<i class="fas fa-angle-down"></i>
										</div>
									</td>
								</tr>
								
								<tr id="trPhysician_1" data-radio-target="position" data-position-key="doctor">
									<th scale="col" data-text-style="essential">Specialty</th>
									<td>
										<div class="form" data-form="select">
											<select class="select-form" name="specialCode" id="specialCode" data-validate-key="userSpecialty" required>
												<option value="" hidden>-- Select a country  --</option>
												<c:forEach var="specialCode" items="${specialCodeList}" varStatus="status">
													<option value="<c:out value='${specialCode.code}'/>"> <c:out value="${specialCode.value}"/> </option>
									     		</c:forEach>
											</select>
											<i class="fas fa-angle-down"></i>
										</div>
									</td>
								</tr>
								
								<!-- [S] 라디오 [data-radio-key="doctor"] : [data-row-key="doctor"] 연결되는 tr의 data- 값 -->
								<tr id="trPhysician_2" data-radio-target="position" data-position-key="doctor">
									<th scale="col" data-text-style="essential">Physician ID</th>
									<td>
										<p class="note-txt">Please provide a scan or photo of your physician ID and your photo that can prove that the ID belongs to you.</p>
										<div class="form" data-mult-form="file">
											<input type="text" class="input-form" data-validate-key="userPhysician" required readonly />
											<input type="file" class="file-form" name="uploadFile_1" id="uploadFile_1" />
											<label for="uploadFile_1" class="file-label">Select file</label>
										</div>
									
										<span class="img-area"><img src="/resource/images/front/contents/img-physician-example.png" alt="" /></span>
									</td>
								</tr>
								
								<tr id="trPhysician_3" data-radio-target="position" data-position-key="doctor">
									<th scale="col" data-text-style="essential">Your photo</th>
									<td>
										<div class="form-area">
											<div class="form" data-mult-form="file">
												<input type="text" class="input-form" data-validate-key="userphoto" required readonly />
												<input type="file" class="file-form" name="uploadFile_2" id="uploadFile_2" />
												<label for="uploadFile_2" class="file-label">Select file</label>
											</div>
											<p class="form-txt">Please upload your picture.</p>
										</div>
										
										<span class="img-area"><img src="/resource/images/front/contents/img-photo-example.png" alt="" /></span>
									</td>
								</tr>
								<!-- [E] 라디오 [data-radio-key="doctor"] -->
								
								<!-- [S] 라디오 [data-radio-key="partner"] : [data-row-key="partner"] 연결되는 tr의 data- 값 -->
								<tr id="trPartner" data-radio-target="position" data-position-key="partner">
									<th scale="col" data-text-style="essential">Partner name</th>
									<td><div class="form"><input type="text" class="input-form" name="partnerName" id="partnerName" data-validate-key="userPartnerName" placeholder="Enter Partner name" required /></div></td>
								</tr>
								<!-- [E] 라디오 [data-radio-key="partner"] -->
							</tbody>
						</table>
					</div>
					
					<!-- [S] 라디오 [data-radio-key="doctor"] : [data-row-key="doctor"] 연결되는 tr의 data- 값 -->
					<h3 class="article-tit" data-radio-target="position" data-position-key="doctor">Additional Information</h3>
					<div class="board-area" data-radio-target="position" data-position-key="doctor">
						<table class="default-table">
							<caption>Additional Information</caption>
							<colgroup>
								<col style="width:193px;" />
								<col style="width:auto;" />
							</colgroup>
							
							<tbody>
								<tr id="trPhysician_4">
									<th scale="col">Clinic Name</th>
									<td><div class="form"><input type="text" class="input-form" name="hpName" id="hpName" placeholder="Enter your clinic name" /></div></td>
								</tr>
								
								<tr id="trPhysician_5">
									<th scale="col">Clinic Address</th>
									<td><div class="form"><input type="text" class="input-form" name="hpAdd" id="hpAdd" placeholder="Enter your clinic address" /></div></td>
								</tr>
								
								<tr id="trPhysician_6">
									<th scale="col">Clinic Postcode / Zip</th>
									<td><div class="form"><input type="text" class="input-form" name="hpZipcode" id="hpZipcode" maxlength="20" placeholder="Enter your clinic postcode" /></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- [E] 라디오 [data-radio-key="doctor"] -->
					
					<h3 class="article-tit">Legal requirements.</h3>
					<section class="terms-section">
						<h2 class="terms-tit">Terms of Use</h2>
						<div class="terms-content">
							<div class="text-area">
								<strong class="tit">General Terms and Conditions for Service Use</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br />Please verify the general terms and conditions before using the services.</p>
	
								<strong class="tit">Chapter 1. General Provisions</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br /></p>
							</div>
						</div>
	
						<h2 class="terms-tit">Privacy Policy</h2>
						<div class="terms-content">
							<div class="text-area">
								<strong class="tit">General Terms and Conditions for Service Use</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br />Please verify the general terms and conditions before using the services.</p>
	
								<strong class="tit">Chapter 1. General Provisions</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br /></p>
							</div>
						</div>
	
						<h2 class="terms-tit">Consent to additional marketing information (optional)</h2>
						<div class="terms-content">
							<div class="text-area">
								<strong class="tit">General Terms and Conditions for Service Use</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br />Please verify the general terms and conditions before using the services.</p>
	
								<strong class="tit">Chapter 1. General Provisions</strong>
								<p class="txt">The following provisions are to specify the General Terms and Conditions for Service Use of LG ESS Battery Website provided by LG Chem, Ltd..<br /></p>
							</div>
						</div>
					</section>
					
					<section class="terms-section">
						<ul class="form-area">
							<li>
								<strong class="form-tit">Privacy Policy</strong>
								<div class="form" data-form="checkbox" data-text-style="essential">
									<input type="checkbox" class="check-form" id="consentYn" name="consentYn" value="Y" checked>
									<label for="consentYn" class="label-form">I accept the Terms of Use.</label>
								</div>
							</li>
							<li>
								<strong class="form-tit">accept to receive information from LG Chem.</strong>
								<div class="form" data-form="checkbox">
									<input type="checkbox" class="check-form" id="consent2Yn" name="consent2Yn" value="N" >
									<label for="consent2Yn" class="label-form">I agree that LG Chem may contact me with offers and promotions available from LG Chem.</label>
								</div>
							</li>
						</ul>					
					</section>
					
					<div class="submit-area">
					 	<button type="submit" class="sub-btn" onclick="goLoginForm()">Cancel</button>
						<button type="submit" class="main-btn">Join Membership</button>
					</div>
				</form>
			</article>
			<!-- [E] 게시물 등록 -->
		</section>
	</div>
	<!-- [E] wrap -->
	<div class="loading-area" data-pop-action="active">
		<span class="img-area"><img src="/resource/images/common/contents/m_Loading_200923.gif" alt="" /></span>
	</div>
</body>
</html>

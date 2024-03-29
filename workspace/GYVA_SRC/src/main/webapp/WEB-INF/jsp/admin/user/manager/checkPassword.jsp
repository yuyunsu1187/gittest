<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">
	//<![CDATA[
		
	 // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
    function checkValue() {
		if (!document.checkPassword.password.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
    }
	
	$(document).ready(function(){
	 	document.checkPassword.errorMsg.value = "${errorMsg}";
	    
	    if ($("input[name='errorMsg']").val() != "") {
	    	alert($("input[name='errorMsg']").val());
	    	$("input[name='errorMsg']").empty();
	    }
	});
	//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">패스워드 확인</h2>
		<p class="content-txt">개인정보 보호를 위해 비밀번호를 다시 입력 하셔야 합니다.</p>
	</header>
	
	<div class="form-wrap">
		<form method="post" action="/admin/user/manager/certification.do" name="checkPassword" id="checkPassword" onsubmit="return checkValue()">>
		<input type="hidden" name="errorMsg" id="errorMsg" value="" />
		<ul class="form-area" data-combine-form="login-form">
			<li>
				<label for="email" class="form-tit">아이디</label>
				<div class="form">
					<input type="text" class="input-form" name="email" id="email" maxlength="50" value="<c:out value='${email}'/>" readonly />	
				</div>
			</li>
			<li>
				<label for="password" class="form-tit">비밀번호</label>
				<div class="form" data-mult-form="password">
					<input type="password" class="input-form" name="password" id="password" maxlength="50" placeholder="비밀번호를 입력해주세요." />
					<!-- 비밀번호 보기 : <i class="fas fa-eye"></i> -->
					<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
					
					<p class="form-txt">비밀번호는 8자 이상이어야 하고, 특수문자는 1자 이상 있어야합니다.</p>
				</div>
			</li>
		</ul>
		<div class="submit-area">
			<button type="submit" class="main-btn" >확인</button>
		</div>
		</form>
	</div>
	
</section>
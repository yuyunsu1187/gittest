<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
div {
	border: 1px solid black;
}
</style>
<title>Reset Password</title>

<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.email.value){
                alert("이메일 형식의 아이디를 입력하세요.");
                return false;
            }
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="loginForm.do";
        }
         
    </script>

</head>
<body>
	<form method="post" action="/common/login/resetPwdUser.do" name="userInfo"
				onsubmit="return checkValue()">
				<div id="LblockLogin" class="LblockLogin" style="border: 1px solid black">
				<tr>
					<td><p>Enter your email address. You will provide information for changing</br>your password to the connected email address.</p></td>
				</tr>
				
				<tr>
					<td id="title">email <input type="text" name="email" id="email" maxlength="50" placeholder ="Enter Email"> </td>
				</tr>
				</br>
				
				<tr>
					<td>
						<input type="button" value="Back to sign in" onclick="goLoginForm()" />
						<input type="submit" value="Request resend link" />
					</td>
				</tr> 
			</div>
	</form>
</body>
</html>
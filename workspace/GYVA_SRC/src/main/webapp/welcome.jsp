<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
</head>
<body>
<script>
/* 모바일, PC 분기 처리 */
var UserAgent = navigator.userAgent;
if(UserAgent.match(/iPhone|iPod|iPad|iPad2|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || 
   UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
	document.location = "<c:url value="/mobile/loginForm.do"/>";
}else{
	document.location = "<c:url value="/loginForm.do"/>";
}
//document.location = "<c:url value="/main.do"/>";
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
	<title>�α׾ƿ� ó��</title>
</head>
<body>
	<%
		session.invalidate(); // ��缼������ ����
		response.sendRedirect("../view/LoginForm.jsp"); // �α��� ȭ������ �ٽ� ���ư���.
	%>
</body>
</html>
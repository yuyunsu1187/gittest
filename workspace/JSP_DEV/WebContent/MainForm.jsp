<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
	<title>���� ȭ��</title>
	
	<script type="text/javascript">
		
		// �α׾ƿ� ��� JSP�� �̵�
		function logoutPro(){
			location.href="member/pro/LogoutPro.jsp";
		}
	</script>
</head>
<body>
	<b><font size="5" color="skyblue">����ȭ���Դϴ�.</font></b><br><br>
	<%
		if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
		{ 
			// �α��� ȭ������ �̵�
			response.sendRedirect("member/view/LoginForm.jsp");
		}
		else // �α��� ���� ���
		{
	%>
	
	<h2>
		<font color="red"><%=session.getAttribute("sessionID") %></font>
		�� �α��εǾ����ϴ�.
	</h2>
	
	<br><br>
	<input type="button" value="�α׾ƿ�" onclick="logoutPro()" />
	
	<%} %>	
</body>
</html>
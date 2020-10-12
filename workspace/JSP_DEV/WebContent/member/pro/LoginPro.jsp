<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>
<html>
<head>
	<title>�α��� ó�� JSP</title>
</head>
<body>
	<%
		// ���ڵ� ó��
		request.setCharacterEncoding("euc-kr"); 
		
		// �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
		String id= request.getParameter("id");
		String pw = request.getParameter("password");
		
		// DB���� ���̵�, ��й�ȣ Ȯ��
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.loginCheck(id, pw);
		
		// URL �� �α��ΰ��� ���� �޽���
		String msg = "";
		
		if(check == 1)	// �α��� ����
		{ 
			// ���ǿ� ���� ���̵� ����
			session.setAttribute("sessionID", id);
			msg = "../../MainForm.jsp";
		}
		else if(check == 0) // ��й�ȣ�� Ʋ�����
		{
			msg = "../view/LoginForm.jsp?msg=0";
		}
		else	// ���̵� Ʋ�����
		{
			msg = "../view/LoginForm.jsp?msg=-1";
		}
		 
		// sendRedirect(String URL) : �ش� URL�� �̵�
		// URL�ڿ� get��� ó�� �����͸� ���ް���
		response.sendRedirect(msg);
		
		/*
		
		if(check == 1)	// ���̵� ���� ���
		{ 
			// ���ǿ� ���� ���̵� ����
			session.setAttribute("sessionID", id);
			msg = "../../MainForm.jsp";
		}
		else if(check == 0) // ��й�ȣ�� Ʋ�����
		{
			msg = "../view/LoginForm.jsp";
			request.setAttribute("error", "0");
		}
		else	// ���̵� Ʋ�����
		{
			msg = "../view/LoginForm.jsp";
			request.setAttribute("error", "-1");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(msg); 
		dispatcher.forward(request, response);
		*/
		
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>ȸ������ ȭ��</title>
	
	<!-- css ���� �и� -->
	<link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>

	<script type="text/javascript">
	
		// �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
		function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("���̵� �Է��ϼ���.");
				return false;
			}
			
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			
			// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
				return false;
			}
		}
		
		// ��� ��ư Ŭ���� �α��� ȭ������ �̵�
		function goLoginForm() {
			location.href="LoginForm.jsp";
		}
	</script>
	
</head>
<body>
	<!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
	<div id="wrap">
		<br><br>
		<b><font size="6" color="gray">ȸ������</font></b>
		<br><br><br>
		
		
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
		<form method="post" action="../pro/JoinPro.jsp" name="userInfo" 
				onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">���̵�</td>
					<td>
						<input type="text" name="id" maxlength="50">
						<input type="button" value="�ߺ�Ȯ��" >	
					</td>
				</tr>
						
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="password" maxlength="50">
					</td>
				</tr>
				
				<tr>
					<td id="title">��й�ȣ Ȯ��</td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸�</td>
					<td>
						<input type="text" name="name" maxlength="50">
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="radio" name="gender" value="��" checked>��
						<input type="radio" name="gender" value="��" checked>��
					</td>
				</tr>
					
				<tr>
					<td id="title">����</td>
					<td>
						<input type="text" name="birthyy" maxlength="4" placeholder="��(4��)" size="6" >
						<select name="birthmm">
							<option value="">��</option>
							<option value="01" >1</option>
							<option value="02" >2</option>
							<option value="03" >3</option>
							<option value="04" >4</option>
							<option value="05" >5</option>
							<option value="06" >6</option>
							<option value="07" >7</option>
							<option value="08" >8</option>
							<option value="09" >9</option>
							<option value="10" >10</option>
							<option value="11" >11</option>
							<option value="12" >12</option>
						</select>
						<input type="text" name="birthdd" maxlength="2" placeholder="��" size="4" >
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸���</td>
					<td>
						<input type="text" name="mail1" maxlength="50">@
						<select name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">�޴���ȭ</td>
					<td>
						<input type="text" name="phone" />
					</td>
				</tr>
				<tr>
					<td id="title">�ּ�</td>
					<td>
						<input type="text" size="50" name="address"/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="����"/>  
			<input type="button" value="���" onclick="goLoginForm()">
		</form>
	</div>
</body>
</html>
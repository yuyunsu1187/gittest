<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<html>
<head>
<title>ȸ������ ȭ��</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


	// �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
	function checkValue() {

		if (!document.userInfo.email.value) {
			alert("�̸��� ������ ���̵� �Է��ϼ���.");
			return false;
		}
		
		if (document.userInfo.idChk.value == "N") {
			alert("id �ߺ� Ȯ�� �ϼ���.");
			return false;
		}

		if (!document.userInfo.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}

		// ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
		if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}
		
		if (!document.contentsInfo.uploadFile_1.value) {
			alert("�ǻ� ������ image�� ����ϼ���.");
			return false;
		}
		
		if (!document.contentsInfo.uploadFile_2.value) {
			alert("�ǻ� ������2 image�� ����ϼ���.");
			return false;
		}
		if ($("input:checkbox[name=consentYn]").is(":checked") == false) {
			alert("���� �ϱ⸦ üũ �ϼ���.");
			return false;
		} 
	}

	// ��� ��ư Ŭ���� �α��� ȭ������ �̵�
	function goLoginForm() {
		location.href = "/common/login/login.do";
	}

	// ���� ����
	function fnSave() {
		document.userInfo.action = "<c:url value='/common/login/insertFileInfo.do'/>";
		document.userInfo.submit();
	}


	// üũ �ڽ� 1���� ���� �ϰ� �ϱ����� �Լ�
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("userType");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	
	// ��й�ȣ ���� üũ
	function fnPwdChk() {
		if (!document.userInfo.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}
		var asValue = document.userInfo.password.value;
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10�� ����, ���� ����
		if (!regExp.test(asValue)) {
			alert("password�� (8 ~ 10�� ����, ���� ����)���·� �Է��ϼ���.");
			return false; // ���Ŀ� �´� ��� true ����	
		}
	}
	
	// ���̵� �ߺ� üũ
 	function fnIdChk() {
		if (!document.userInfo.email.value) {
			alert("���̵� �Է��ϼ���.");
			return false;
		}
		var asValue = document.userInfo.email.value;
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!regExp.test(asValue)) {
			alert("�̸��� ������ ���̵� �Է��ϼ���.");
			return false; // ���Ŀ� �´� ��� true ����	
		}
		$.ajax({
			url : "/common/user/idChk.do",
			type : "post",
			dataType : "json",
			data : {"email" : $("#email").val()},
			success : function(data) {
				if (data == 1) {
					$("#idChk").attr("value", "N");
					alert("�̹� ���� �ϴ� ���̵� �Դϴ�.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("��밡�� ���̵��Դϴ�.");
				}
			},
		})
	} 


</script>

</head>
<body>

	<!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
	<div id="wrap">
		<br>
		<br> <b><font size="6" color="gray">ȸ������</font></b> <br>
		<br>
		<br>
		<!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
		<form method="post" action="/common/user/insertUser.do" name="userInfo" id="userInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
			<table>
			<input type="hidden" name="stateCode" id="stateCode" value="01" placeholder ="��û ���� �ڵ� : 01"/>
			<input type="hidden" name="createId" id="createId" value="0"/>
			<input type="hidden" name="updateId" id="updateId" value="0"/>
				<tr>
					<td id="title">user_type</td>
					<td>
						<p class="remember">
							<input type="checkbox" id="userType" name="userType" value="DR02" onclick="doOpenCheck(this);" checked="checked" />
							<label for="login_remember">�ǻ� �׷�</label>
							 
							<input type="checkbox" id="userType" name="userType" value="PT01" onclick="doOpenCheck(this);" />
							<label for="login_remember">���� ��ü</label>
							
						</p>
					</td>
				</tr>

				<tr>
					<td id="title">email </td>
					<td>
						<input type="text" name="email" id="email" maxlength="50" placeholder ="Enter Email" onblur="onblur_event();">
						<button type="button" name="idChk" id="idChk" value="N" onclick="fnIdChk()">�ߺ�Ȯ��</button>
					</td>
				</tr>
				
				<tr>
					<td id="title">password </td>
					<td>
						<input type="password" name="password" id="password" maxlength="50" placeholder ="Enter Password" >
						<input type="password" name="passwordCheck" id="passwordCheck" maxlength="50" placeholder ="Confirm Password" onclick="fnPwdChk()">
					</td>
				</tr>

				<tr>
					<td id="title"> Name </td>
					<td><input type="text" name="nameFirst" id="nameFirst" maxlength="50" placeholder ="First name"> 
					    <input type="text" name="nameLast" id="nameLast" maxlength="50" placeholder ="Sur name"></td>
				</tr>

				<tr>
					<td id="title">Country </td>
					<td><select name="countryCode" id="countryCode" placeholder="-- Plasses choose--">
							<option value="">-- Plasses choose--</option>
							<option value="K001">KOR</option>
							<option value="U001">USA</option>
					</select> </td>
				</tr>

				<tr>
					<td id="title">City</td>
					<td><input type="text" name="divisionCode" id="divisionCode" placeholder ="For quicker approval please enter the city." /></td>
				</tr>
								
				<tr>
					<td id="title">Physician ID </td>
					<td>
						<input type="file" id="uploadFile_1" name="uploadFile_1" class="Lbtn"  multiple="multiple">
					</td>
				</tr>
				
				
				<tr>
					<td id="title">Phycician Face </td>
					<td>
						<input type="file" id="uploadFile_2" name="uploadFile_2" class="Lbtn"  multiple="multiple"> 
					 </td>
				</tr>
				
				<tr>
					<td id="title">consent_yn</td>
					<td>
					<label><input type="checkbox" name="consentYn" id="consentYn" value="Y"> ����</label>
					</td>
				</tr>

				<tr>
					<td id="title">Hospital Name </td>
					<td><input type="text" name="hpName" id="hpName" value="" placeholder ="Enter hospital Name"/></td>
				</tr>
				
				<tr>
					<td id="title">Hospital Address</td>
					<td><input type="text" name="hpAdd" id="hpAdd" value="" placeholder ="Enter hospital Address"/></td>
				</tr>
				
				<tr>
					<td id="title">Hospital Zip </td>
					<td><input type="text" name="hpZipcode" id="hpZipcode" value="" placeholder ="Enter hospital Zip"/></td>
				</tr>
			
				<!-- <tr>
					<td id="title">Partner Name </td>
					<td><input type="text" name="hpName" id="hpName" value="02" placeholder ="Enter Partner Name"/></td>
				</tr> -->
			
				
			</table>
			<br> <input type="submit" value="����" /> 
				 <input type="button" value="���" onclick="goLoginForm()">
		</form>
	</div>
</body>
</html>
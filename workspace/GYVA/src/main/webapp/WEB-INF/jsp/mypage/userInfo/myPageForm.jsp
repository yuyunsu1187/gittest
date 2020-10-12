<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>회원정보 수정 화면</title>


<script type="text/javascript">

	function fnRetrieve() {
		var num = document.detailForm.email;
		if (!document.detailForm.email.value) {
			alert("<spring:message code="dev.err.com.noSearchNum"/>");
			return false;
		}
		/* if (!fnValidateRequired(num, "<spring:message code="dev.err.com.noSearchNum"/>"))
			return false; */
		document.detailForm.action = "<c:url value='/common/user/retrieveUser.do'/>";
		document.detailForm.submit();
	}

	function fnUpdateForm() {
		document.detailForm.action = "<c:url value='/pattern/mp11/retrieveEmployeeForm.do'/>";
		document.detailForm.mode.value = "update";
		document.detailForm.submit();
	}
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {

		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

	}

    // 취소 버튼 클릭시 로그인 화면으로 이동
    function goLoginForm() {
        location.href="joinForm.do";
    }
    
    /*--------------------------- 여기부터 download로직 ---------------------------*/
    function fnRetrieveDown() {
		document.searchForm.action = "<c:url value="/function/filedownload/retrieveFileDownloadList.do"/>";
		document.searchForm.submit();
	}

	function fnSelectAll(checkbox) {
		if (checkbox.checked) {
			$(".Lcheckbox").attr("checked", true);
		} else {
			$(".Lcheckbox").removeAttr("checked");
		}
	}

	function fnDownload() {
		document.listForm.action = "<c:url value="/function/filedownload/downloadFileList.do"/>";
		document.listForm.submit();
	}

	function fnDelete() {
		document.listForm.action = "<c:url value="/function/filedownload/deleteFileList.do"/>";
		document.listForm.submit();
	}
    
    
</script>

</head>
<body>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
	<div id="LblockPageHeader">
		<div id="LblockPageTitle">
			<h1>MyPage</h1>
		</div>

		<div id="LblockPageLocation">
			<ul>
				<li class="Llast"><span>Profile</span></li>
			</ul>
		</div>
	</div>

		<div id="LblockTopMenu">
			<ul class="Lclear">
				<li class="Lfirst <c:if test="${MenuInfoInterceptor_mainMenuId =='FR0301'}">Lcurrent</c:if>"><span><a href="<c:url value='/mypage/activity/retrieveContentsList.do?menuId=FR030100'/>">My Activity</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_mainMenuId =='FR0303'}">Lcurrent</c:if>"><span><a href="<c:url value='/common/user/retrieveUser.do?menuId=FR030300'/>">Profile</a></span></li>
				<li class="Lidx1 <c:if test="${MenuInfoInterceptor_mainMenuId =='FR0305'}">Lcurrent</c:if>"><span><a href="<c:url value='/mypage/inquiry/retrieveContentsList.do?menuId=FR030500'/>">1:1 Content</a></span></li>
				<li class="Llast <c:if test="${MenuInfoInterceptor_mainMenuId =='FR0307'}">Lcurrent</c:if>"><span><a href="<c:url value='/mypage/bookmark/retrieveContentsList.do?menuId=FR030700'/>">Bookmark</a></span></li>
			</ul>
		</div>
		<div id="LblockBodyMain">
			<div id="LblockSearch">
				<div>
					<div>
						<div>
							<form commandName="result" name="detailForm" method="post" onsubmit="fnRetrieve();return false;">
<%-- 								<input type="hidden" name="mode" value="${param.mode}" /> 
								<input type="hidden" name="num" value="${result.num}" /> --%>
								<table summary="회원 번호">
									<caption></caption>
									<colgroup>
										<col style="width: 20%;" />
										<col style="width: 70%;" />
										<col style="width: 10%;" />
									</colgroup>
									<tbody>
										<tr>
											<th>ID 검색</th>
											<td>
												<input type="text" class="Ltext" id="email" name="email" value="" />
												<input type="button" value="검색" onclick="fnRetrieve();return false;" />
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" action="/common/user/updateUser.do" name="userInfo" onsubmit="return checkValue()">
			<table>
			<input type="hidden" name="stateCode" id="stateCode" value="01" placeholder="요청 상태 코드 : 01"/>
			<input type="hidden" name="updateId" id="updateId" value="${result.seq}"/>
			<input type="hidden" name="seq" id="seq" value="${result.seq}"/>
			<tr>
			<td id="title">email</td>
			<td>
			<input type="text" name="email" id="email" maxlength="50" value="${result.email}" readonly></td>
			</tr>
			<tr>
			<td id="title">password</td>
			<td>
				<input type="password" name="password" id="password" maxlength="50" placeholder="Enter Password">
					<input type="password" name="passwordCheck" id="passwordCheck" maxlength="50" placeholder="Confirm Password"></td>
				</tr>
				<tr>
					<td id="title">Name</td>
					<td>
						<input type="text" name="nameLast" id="nameLast" maxlength="50" value="${result.nameLast}" readonly>
							<input type="text" name="nameFirst" id="nameFirst" maxlength="50" value="${result.nameFirst}" readonly></td>
						</tr>
						<tr>
							<td id="title">Country</td>
							<td>
								<input type="text" name="countryCode" id="countryCode" value="${result.countryCode}" readonly />
							</td>
						</tr>
						<tr>
							<td id="title">City</td>
							<td>
								<input type="text" name="divisionCode" id="divisionCode" value="${result.divisionCode}" readonly />
							</td>
						</tr>
						<tr>
							<td id="title">Partner name</td>
							<td>
								<input type="text" name="partnerName" id="partnerName" value="${result.hpName}" readonly />
							</td>
						</tr>
						<tr>
							<td id="title">Hospital Name</td>
							<td>
								<input type="text" name="hospitalName" id="hospitalName" value="${result.hpName}" readonly />
							</td>
						</tr>
						<tr>
							<td id="title">Hospital Address</td>
							<td>
								<input type="text" name="hospitalAddress" id="hospitalAddress" value="${result.hpAdd}" readonly />
							</td>
						</tr>
						<tr>
							<td id="title">Hospital Zip</td>
							<td>
								<input type="text" name="hospitalZip" id="hospitalZip" value="${result.hpZipcode}" readonly />
							</td>
						</tr>
					</table>
					<br>
						<input type="submit" value="저장"/>
						<input type="button" value="취소" onclick="goLoginForm()">
						</form>
					</div>
	</body>
</html>																				
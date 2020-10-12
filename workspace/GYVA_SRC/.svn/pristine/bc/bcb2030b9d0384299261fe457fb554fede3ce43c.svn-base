<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/resource/js/jquery/jquery-1.12.4.min.js"></script>
<!--[if gt IE 9]>
	<link href="/resource/css/ie/main-css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if !IE]><!-->
<script type="text/javascript">

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {		
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
			var asValue = document.userInfo.password.value;
			var regExp = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[@$!%*#?&])[0-9a-zA-Z@$!%*#?&]{8,}$/; //  8자 이상 특수문자는 1자 이상 있어야합니다.
			
			if (!regExp.test(asValue)) {
				alert("Password must be at least 8 characters, at least 1 letter and special character, and 1 number.");
				return false; // 형식에 맞는 경우 true 리턴	
			}
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	function fnUpdate() {
		document.userInfo.action = "<c:url value='/admin/user/manager/updateManager.do'/>";
		document.userInfo.submit();
	}
	
    // 취소 버튼 클릭시 상세 화면으로 이동
    function goBack() {
        location.href="/admin/user/managerList.do";
    }
</script>



<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">패스워드 변경</h2>
		<p class="content-txt">Information Registration</p>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<h3 class="article-tit">관리자 정보 입력</h3>
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" name="userInfo">
				<input type="hidden" name="updateId" id="updateId" value="<c:out value='${result.seq}'/>"/>
				<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>"/>
				<input type="hidden" name="userType" id="userType" value="<c:out value='${result.userType}'/>"/>
				<input type="hidden" name="email" id="email" value="<c:out value='${result.email}'/>"/>
				<input type="hidden" name="nameFirst" id="nameFirst" value="<c:out value='${result.nameFirst}'/>"/>
				<input type="hidden" name="nameLast" id="nameLast" value="<c:out value='${result.nameLast}'/>"/>
				<table class="default-table">
					<caption>관리자 정보 입력</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>									
						<tr>
							<th scale="col" data-text-style="essential">아이디</th>
							<td>
								<div class="form">
									<input type="text" class="input-form" name="email" id="email" maxlength="50" value="<c:out value='${result.email}'/>" disabled />
								</div>
							</td>
						</tr>
		
						<tr>
							<th scale="col" data-text-style="essential">비밀번호</th>
							<td>
								<div class="form-area" data-combine-form="column-2-form">
									<div class="form" data-mult-form="password">
										<input type="password" class="input-form" name="password" id="password" maxlength="50" placeholder="비밀번호를 입력해주세요." />
										<!-- 비밀번호 보기 : <i class="fas fa-eye"></i> -->
										<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
									</div>
									
									<div class="form" data-mult-form="password">
										<input type="password" class="input-form" name="passwordCheck" id="passwordCheck" maxlength="50" placeholder="비밀번호를 다시 입력해주세요." />
										<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
									</div>
									
									<p class="form-txt">비밀번호는 8자 이상이어야 하고, 특수문자는 1자 이상 있어야합니다.</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scale="col" data-text-style="essential">이름</th>
							<td>
								<div class="form">
									<input type="text" class="input-form" name="nameFirst" id="nameFirst" maxlength="50" value="<c:out value='${result.nameFirst}'/>" disabled />
									<input type="text" class="input-form" name="nameLast" id="nameLast" maxlength="50" value="<c:out value='${result.nameLast}'/>" disabled />
								</div>
							</td>
						</tr>	
								
						<tr>
							<th scale="col">담당</th>
							<td><div class="form"><input type="text" class="input-form" value="<c:out value='${result.remark }'/>" disabled /></div></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		
		<div class="submit-area">
			<button type="button" class="sub-btn" onclick="goBack()">취소</button>
			<button type="submit" class="main-btn" onclick="fnUpdate();return false;">수정</button>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>													
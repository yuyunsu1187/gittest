<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {
		/* var email = document.userInfo.email.value;
		var originEmail = document.userInfo.originEmail.value;
		console.log(email);
		console.log(originEmail); */
		
		if(!document.userInfo.email.value){
            alert("아이디를 입력하세요.");
            return false;
        }
		
		/* if (document.userInfo.idChk.value == "N") { //true 기능이랑 같다 사실상
			if (email != originEmail) {
				fnIdChk();
				if (document.userInfo.idChk.value == "N") {
					alert("이미 존재 하는 아이디 입니다.");
					return false;
				}
			}
		} */
		
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
			var asValue = document.userInfo.password.value;
			var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
			if (!regExp.test(asValue)) {
				alert("password를 (8 ~ 10자 영문, 숫자 조합)형태로 입력하세요.");
				return false; // 형식에 맞는 경우 true 리턴	
			}
		}

		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if(!document.userInfo.nameFirst.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.nameLast.value){
            alert("성을 입력하세요.");
            return false;
        }
		return true;
	}
	
	function fnUpdate() {
		if(checkValue()) {
			document.userInfo.action = "<c:url value='/admin/user/manager/updateManager.do'/>";
			document.userInfo.submit();
		}
	}
	
    // 취소 버튼 클릭시 상세 화면으로 이동
    function goBack() {
        location.href="/admin/user/manager/retrieveManagerList.do";
    }
    
 	// 아이디 중복 체크
	function fnIdChk() {
		if (!document.userInfo.email.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		$.ajax({
			url : "/admin/user/manager/idChk.do",
			type : "post",
			dataType : "json",
			data : {"email" : $("#email").val()},
			success : function(data) {
				if (data == 1) {
					$("#idChk").attr("value", "N");

				} else if (data == 0) {
					$("#idChk").attr("value", "Y");

				}
			},
		})
	}
</script>



<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">관리자 관리</h2>
		<p class="content-txt">Information Registration</p>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<h3 class="article-tit">관리자 정보 입력</h3>
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form method="post" name="userInfo">
				<input type="hidden" name="stateCode" id="stateCode" value="02" placeholder="요청 상태 코드 : 02"/>
				<input type="hidden" name="confirmId" id="confirmId" value="0"/>
				<input type="hidden" name="updateId" id="updateId" value="${result.seq}"/>
				<input type="hidden" name="seq" id="seq" value="${result.seq}"/>
				<input type="hidden" name="originEmail" id="originEmail" value="${result.email}"/>
				<table class="default-table">
					<caption>관리자 정보 입력</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>					
						<tr>
							<th scale="col" data-text-style="essential">관리자 등급</th>
							<td>
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" id="radio01" name="admin" />
										<label for="radio01" class="label-form"><i class="fa-dot-circle"></i>슈퍼 관리자</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="radio02" name="admin" />
										<label for="radio02" class="label-form"><i class="fa-dot-circle"></i>일반 관리자</label>
									</li>
								</ul>
								<select id="userType" name="userType">
					     		<c:forEach items = "${codeDetailList}" var = "codeDetail">
					     			<option value="<c:out value='${codeDetail.code}'/>" <c:if test="${result.userType == codeDetail.code}">selected="selected"</c:if>> <c:out value="${codeDetail.value}"/> </option>
					     		</c:forEach>
					     		</select>				
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">아이디</th>
							<td>
								<div class="form">
									<input type="text" class="input-form" name="email" id="email" maxlength="50" value="${result.email}" disabled />
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
									<input type="text" class="input-form" name="nameFirst" id="nameFirst" maxlength="50" value="${result.nameFirst}" >
									<input type="text" class="input-form" name="nameLast" id="nameLast" maxlength="50" value="${result.nameLast}" >
								</div>
							</td>
						</tr>	
								
						<tr>
							<th scale="col">담당</th>
							<td><div class="form"><input type="text" class="input-form" value="라이브러리 담당" /></div></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		
		<div class="submit-area">
			<button type="submit" class="sub-btn" onclick="goBack()">취소</button>
			<button type="submit" class="main-btn" onclick="fnUpdate();return false;">수정</button>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>													
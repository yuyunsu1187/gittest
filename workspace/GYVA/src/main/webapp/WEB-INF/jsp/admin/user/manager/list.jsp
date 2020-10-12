<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">

	function fnRetrieve() {
		/* var id = document.searchForm.email.value;
		var nameFirst = document.searchForm.nameFirst;
		var nameLast = document.searchForm.nameLast.value; */
		/*
		if (document.searchForm.email.value) {
			if (!document.searchForm.userType.value) {
				// 아이디는 있는데 유저타입 없는경우
				alert("아이디는 있는데 유저타입 없는경우");
				return false;
			}
		} else {
			if (!document.searchForm.nameFirst.value && !document.searchForm.nameLast.value) {
				// 어떤 값도 검색조건으로 입력 안했을 때
				alert("어떤 값도 검색조건으로 입력 안했을 때");
				return false;
			} else {
				// 일단 성이나 이름에 값이 깄긴 있을 때
				if (!document.searchForm.nameFirst.value || !document.searchForm.nameLast.value) {
					// 이름과 성 둘 중에 하나라도 값을 입력 안받았을 때
					alert("이름과 성 둘 중에 하나라도 값을 입력 안받았을 때");
					return false;
				} else {
					if (!document.searchForm.userType.value) {
						// 성과 이름 모두는 있는데 유저타입 없는경우
						alert("성과 이름 모두는 있는데 유저타입 없는경");
						return false;
					}
				}
			}
		}
		*/

		document.searchForm.action = "<c:url value='/admin/user/manager/retrieveManagerList.do'/>";
		document.searchForm.submit();
	}
	
	function fnDetailForm(email) {
		document.detailForm.email.value = email;
		document.detailForm.action = "<c:url value='/admin/user/manager/updateForm.do'/>";
		document.detailForm.submit();
	}
	/* // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
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
	*/
	
	// 가입 화면으로 이동
	function goInsert() {
	    location.href="/admin/user/manager/joinForm.do";
	} 
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">관리자 관리</h2>
		<a href="#none" class="sub-btn">패스워드 변경</a>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
	
			<form commandName="result" name="searchForm" method="post" onsubmit="fnRetrieve();return false;">
				<div class="form-area" data-combine-form="column-2-form">
					<div class="form" data-form="select">
						<select class="select-form" id="userType" name="userType">
							<option value="">전체</option>
							<c:forEach items = "${codeDetailList}" var = "codeDetail">
								<option value="<c:out value='${codeDetail.code}'/>" <c:if test="${input.userType == codeDetail.code}">selected="selected"</c:if>> <c:out value="${codeDetail.value}"/> </option>
							</c:forEach>
						</select>
						<i class="fas fa-angle-down"></i>
					</div>
					<div class="form" data-mult-form="btn">
						<button type="button" class="sub-btn">변경</button>
						<button type="button" class="sub-btn">삭제</button>
					</div>
				</div>
						
				<div class="form-area" data-combine-form="column-2-form">
					<div class="form" data-form="select">
						<select class="select-form">
							<option value="" selected>All</option>
							<option value="">아이디</option>
							<option value="">이름</option>
						</select>
						<i class="fas fa-angle-down"></i>
					</div>
					<div class="form" data-mult-form="search">
						<input type="text" class="input-form" placeholder="Please enter a search word." id="nameFirst" name="nameFirst" value="<c:if test='${not empty input.nameFirst}'>${input.nameFirst}</c:if>" />
						<button type="button" class="icon-btn" onclick="fnRetrieve();return false;" ><i class="fab fa-sistrix"></i></button>
					</div>
				</div>
			</form>
			
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
		
			<form commandName="resultUpdate" name="detailForm" method="post">
				<input type="hidden" id="email" name="email" />

				<table class="default-table">
					<caption>관리자 관리 리스트</caption>
					<colgroup>
						<col style="width:5%;" />
						<col style="width:auto;" />
						<col style="width:15%;" />
						<col style="width:auto;" />
						<col style="width:15%;" />
						<col style="width:10%;" />
					</colgroup>
						
					<thead>
						<tr>
							<th scope="row">
								<div class="form" data-form-type="checkbox">
									<input type="checkbox" class="check-form" id="allcheck" />
									<label for="allcheck" class="label-form"><i class="fa-check-square"></i></label>
								</div>
							</th>
							<th scope="row">아이디</th>
							<th scope="row">이름</th>
							<th scope="row">담당</th>
							<th scope="row">관리등급</th>
							<th scope="row">가입일자</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${not empty resultList}">
						<c:forEach items = "${resultList}" var = "result">
						   <tr>
								<td>
									<div class="form" data-form-type="checkbox">
										<input type="checkbox" class="check-form" id="checkbox01" />
										<label for="checkbox01" class="label-form"><i class="fa-check-square"></i></label>
									</div>
								</td>
							    <td>
							       <font color="red"><a href="javascript:fnDetailForm('${result.email}')"><c:out value="${result.email}"/></a></font>
							    </td>
							    <td>
							       <c:out value="${result.nameFirst}"/>&nbsp;<c:out value="${result.nameLast}"/>
							    </td>
							    <td>
							       <c:out value="${result.nameFirst}"/>
							    </td>
							    <td>
							       <c:out value="${result.codeName}"/>
							    </td>
							    <td>	
									<c:out value="${result.createDate}"/>			
							    </td>
							</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" data-td-type="board-noData">등록된 관리자가 없습니다.</td>
							</tr>						
						</c:otherwise>
					</c:choose>	
				</table>					
			</form>
		</div>

		<div class="submit-area">
			<button type="submit" class="main-btn" onclick="goInsert()" >등록</button>
		</div>	
	</article>
	<!-- [E] 게시물 리스트 -->
</section>												
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"  %>
<%@ page import="devonframe.gyva.contents.model.Contents" %>
<%@ page import="devonframe.paging.*" %>
<%@ page import="devonframe.paging.ui.*" %>
<%@ page import="devonframe.paging.PagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[

	function fnRetrieveList() {
		document.searchForm.action = "<c:url value='/admin/user/userList.do'/>";
		document.searchForm.submit();
	}
	
	function fnDetail(value) {
	    document.searchForm.seq.value = value;
		document.searchForm.action = "<c:url value='/admin/user/userDetail.do'/>";
		document.searchForm.submit();
	}
	
	// 수정 리스트, userType 세팅 후 요청
	function fnUpdateUserType() {
		if (!document.searchForm.userType.value) {
			alert("userType을 설정하세요");
			return false;
		} 
		if ($("input:checkbox[name=checkbox01]").is(":checked") == false) {
			alert("삭제 리스트를 선택해 주세요 ");
			return false;
		}
		var userCheckArr = [];
		$("input[name=checkbox01]:checked").each(function() {
			userCheckArr.push($(this).val());
		});
		
		document.searchForm.userCheckList.value = userCheckArr;
		document.searchForm.action = "<c:url value='/admin/user/user/updateUserType.do'/>";
		document.searchForm.submit();
	}
	
	// 삭제 리스트 세팅 후  요청
	function fnDeleteUserList() {
		if ($("input:checkbox[name=checkbox01]").is(":checked") == false) {
			alert("삭제 리스트를 선택해 주세요 ");
			return false;
		}
	
		var delConfirm = confirm('정말로 삭제 하시겠습니까?');
		 if (delConfirm) {
		
		var userCheckArr = [];
		$("input[name=checkbox01]:checked").each(function() {
			userCheckArr.push($(this).val());
		});
		
		document.searchForm.userCheckList.value = userCheckArr;
		document.searchForm.action = "<c:url value='/admin/user/user/deleteUserList.do'/>";
		document.searchForm.submit();
		} 
	}
	
	// 전체 선택/해제
	function checkAll() {
		if($("#allcheck").is(':checked')) {
			$("input[name=checkbox01]").prop("checked", true);
		} else {
			$("input[name=checkbox01]").prop("checked", false);
		}
	}
	//]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">사용자 관리</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
	<Tag:paging resultList='${resultList}' >
	<Tag:pagingOut value="showJavaScript" /> 
	
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
		
			<form:form commandName="input" method="post" name="searchForm" id="searchForm" enctype="multipart/form-data" onsubmit="goPage(1);return false;">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="updateId" id="updateId" value="<c:out value='${userId }'/>" />	
				<input type="hidden" name="stateCode" id="stateCode" value="02" />
				<input type="hidden" name="userCheckList[]" id="userCheckList" />
		
				<div class="form-area" data-combine-form="column-2-form">
					<Tag:pagingAddHiddenParam  />
					<div class="form" data-form="select">
						<select class="select-form" id="userType" name="userType">
							<option value="" <c:if test="${input.categoryCode == ''}">selected="selected"</c:if>>All</option>
							<c:forEach items="${userTypeList}" var="userType" >
								<option value="<c:out value='${userType.code}'/>" <c:if test="${input.userType == userType.code}">selected="selected"</c:if>><c:out value='${userType.value}'/></option>
							</c:forEach>
						</select>
						<i class="fas fa-angle-down"></i>
					</div>
					<div class="form" data-mult-form="btn">
						<button type="button" class="sub-btn" onclick="fnRetrieveList()">보기</button>
						<button type="button" class="sub-btn" onclick="fnUpdateUserType()">변경</button>
						<button type="button" class="sub-btn" onclick="fnDeleteUserList()">삭제</button>
					</div>
				</div>
				
				<div class="form-area" data-combine-form="column-2-form">
					<div class="form" data-form="select">
						<select class="select-form" name="searchType" id="searchType" >
							<option value="ALL" <c:if test="${input.searchType == ''}">selected="selected"</c:if>>All</option>
							<option value="searchId" <c:if test="${input.searchType == 'searchId'}">selected="selected"</c:if>>아이디</option>
							<option value="searchName" <c:if test="${input.searchType == 'searchName'}">selected="selected"</c:if>>이름</option>
						</select>
						<i class="fas fa-angle-down"></i>
					</div> 
					<div class="form" data-mult-form="search">
						<input type="text" class="input-form" placeholder="Please enter a search word." name="email" id="email" value="<c:out value='${input.email}'/>" />
						<button type="submit" class="icon-btn"><i class="fab fa-sistrix"></i></button>
					</div>
				</div>
			</form:form>
		</div>

		<!-- [E] 게시물 상단 폼 영역 -->
		
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>사용자 관리 리스트</caption>
				<colgroup>
					<col style="width:5%;" />
					<col style="width:15%;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
				</colgroup>
				
				<thead>
					<tr>
						<th scope="row">
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" id="allcheck" onclick="checkAll()"/>
								<label for="allcheck" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</th>
						<th scope="row">회원등급</th>
						<th scope="row">이름</th>
						<th scope="row">ID(이메일)</th>
						<th scope="row">국가</th>
						<th scope="row">가입일자</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<c:set var="index" value="${status.index}" />
					<tr>
						<td>
							<div class="form" data-form-type="checkbox">
								<input type="checkbox" class="check-form" name="checkbox01" id="checkbox_<c:out value='${index}'/>"  value="<c:out value='${result.seq}'/>"/>
								<label for="checkbox_<c:out value='${index}'/>" class="label-form"><i class="fa-check-square"></i></label>
							</div>
						</td>
						<td><c:out value='${result.userTypeName }'/></td>
						<td data-text-style="ellipsis"><a href="javascript:fnDetail('<c:out value="${result.seq}"/>')" class="link-btn"><c:out value='${result.nameFirst }'/> <c:out value='${result.nameLast }'/></a></td>
						<td data-text-style="ellipsis"><a href="javascript:fnDetail('<c:out value="${result.seq}"/>')" class="link-btn"><c:out value='${result.email }'/></a></td>
						<td><c:out value='${result.countryName }'/></td>
						<td><c:out value='${result.createDate.substring(0,10)}'/></td>
					</tr>
				</c:forEach>
					
				<c:if test="${empty resultList && !empty input}">
					<!-- 검색결과가 값이 없을 때 -->
					<tr>
						<td colspan="6" data-td-type="board-noData">등록된 사용자가 없습니다</td>
					</tr>
				</c:if>
					
				</tbody>
			</table>
		</div>
		
		<!-- [S] paging -->
		<div class="paging-area" <c:if test="${empty resultList}">style="display:none"</c:if>>
		    <Tag:pagingOut value='showMoveFirstPage' />
		    <Tag:pagingOut value='showMoveBeforePage' />
		    <Tag:pagingOut value='showIndex' />
		    <Tag:pagingOut value='showMoveNextPage' />
		    <Tag:pagingOut value='showMoveEndPage' />
		</div>
		<!-- [S] paging -->
		</Tag:paging>
		
	</article>
	<!-- [E] 게시물 리스트 -->
</section>
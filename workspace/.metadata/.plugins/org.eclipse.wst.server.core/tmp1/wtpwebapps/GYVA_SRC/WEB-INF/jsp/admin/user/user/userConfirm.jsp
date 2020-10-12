<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>
<%@ page import="devonframe.gyva.contents.model.Contents" %>
<%@ page import="devonframe.paging.*" %>
<%@ page import="devonframe.paging.ui.*" %>
<%@ page import="devonframe.paging.PagingUtil" %>

<script type="text/javascript" language="javascript">
//<![CDATA[

	function fnRetrieveList() {
		document.searchForm.action = "<c:url value='/admin/user/userConfirmList.do'/>";
		document.searchForm.submit();
	}
	
	// 수정 리스트, userType 세팅 후 요청
	function fnUpdateStateCode() {
		
		if ($("input:checkbox[name=checkbox01]").is(":checked") == false) {
			alert("승인 리스트를 선택해 주세요 ");
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
		<h2 class="content-tit">사용자정보조회/승인</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
	<Tag:paging resultList='${resultList}' >
	<Tag:pagingOut value="showJavaScript" /> 
	<form method="post" name="searchForm" id="searchForm" enctype="multipart/form-data">
	<input type="hidden" name="seq" id="seq" value="" />
	<input type="hidden" name="updateId" id="updateId" value="<c:out value='${userId }'/>" />
	<input type="hidden" name="stateCode" id="stateCode" value="02" />
	<input type="hidden" name="userCheckList[]" id="userCheckList" />
	
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<div class="form" data-mult-form="btn">
				<button type="button" class="sub-btn" onclick="fnUpdateStateCode()">승인</button>
				<button type="button" class="sub-btn" onclick="fnDeleteUserList()">삭제</button>
			</div>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		<Tag:pagingAddHiddenParam  />
		
		<!-- 리스트 노출 개수는 최대 10줄 -->
		<div class="board-area">
			<table class="default-table">
				<caption>사용자정보조회/승인 리스트</caption>
				<colgroup>
					<col style="width:5%;" />
					<col style="width:10%;" />
					<col style="width:auto;" />
					<col style="width:auto;" />
					<col style="width:10%;" />
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
						<th scope="row">가입 포지션</th>
						<th scope="row">이름</th>
						<th scope="row">ID(이메일)</th>
						<th scope="row">의사ID 인증</th>
						<th scope="row">얼굴 인증</th>
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
						<td data-text-style="ellipsis"><c:out value='${result.nameFirst }'/> <c:out value='${result.nameLast }'/></td>
						<td data-text-style="ellipsis"><c:out value='${result.email }'/></td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="doctor"><i class="fas fa-address-card"></i>의사ID</button></td>
						<td><button type="button" class="board-main-btn" data-btn-style="modal" data-btn-key="face"><i class="far fa-grin-beam"></i>얼굴 인증</button></td>
						<td><c:out value='${result.createDate.substring(0,10)}'/></td>
					</tr>
				</c:forEach>
					
				<c:if test="${empty resultList && !empty input}">
					<!-- 검색결과가 값이 없을 때 -->
					<tr>
						<td colspan="7" data-td-type="board-noData">등록된 사용자가 없습니다</td>
					</tr>
				</c:if>
					
				</tbody>
			</table>
		</div>
		</form>
		
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

<!-- [S] 레이어 팝업 : 의사 ID 인증 이미지 보기 -->
<div class="layerPop-wrap" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="doctor" data-pop-type="image">
		<header class="layerPop-header">
			<h3 class="layerPop-tit">의사 ID 인증 이미지</h3>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">&#10006;</button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img_temp-pop.jpg" /></span>
		</article>
		<footer class="layerPop-footer">
			<button type="button" class="sub-btn" data-pop-btn="close">닫기</button>
		</footer>
	</article>
</div>
<!-- [S] 레이어 팝업 : 의사 ID 인증 이미지 보기 -->

<!-- [S] 레이어 팝업 : 얼굴 인증 이미지 보기 -->
<div class="layerPop-wrap" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="face" data-pop-type="image">
		<header class="layerPop-header">
			<h3 class="layerPop-tit">얼굴 인증 이미지</h3>
			<button type="button" class="layerPop-close-btn" data-pop-btn="close">&#10006;</button>
		</header>
		<article class="layerPop-contents">
			<span class="img-area"><img src="/resource/images/temp/@img_temp-pop.jpg" /></span>
		</article>
		<footer class="layerPop-footer">
			<button type="button" class="sub-btn" data-pop-btn="close">닫기</button>
		</footer>
	</article>
</div>
<!-- [S] 레이어 팝업 : 얼굴 인증 이미지 보기 -->

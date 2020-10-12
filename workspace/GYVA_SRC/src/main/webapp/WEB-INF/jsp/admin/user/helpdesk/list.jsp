<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
	//<![CDATA[
	function fnRetrieveList(value) {
		document.searchForm.stateCode.value = value;
		document.searchForm.action = "<c:url value='/admin/user/helpdeskList.do'/>";
		document.searchForm.submit();
	}
	function fnAnswerWrite(seq, answerContents) {
		document.answerForm.seq.value = seq;
		document.answerForm.answerContents.value = answerContents;	
	}
	function fnAnswerSave(seq, type) {
		if(type=='S') {
			document.listForm.seq.value = document.answerForm.seq.value;
			document.listForm.answerContents.value = document.answerForm.answerContents.value;
		} else {
			document.listForm.seq.value = seq;
		}
		document.listForm.type.value = type;
		document.listForm.action = "<c:url value='/mypage/helpdesk/updateQuestionInfo.do'/>";
		document.listForm.submit();	
	}
	//]]>
</script>
			
<section id="AD030501-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">1:1문의</h2>
	</header>
	
	<!-- [S] 게시물 리스트 --> 
	<article class="board-wrap" data-board-type="form-list">
	<Tag:paging resultList='${resultList}' >
	<Tag:pagingOut value="showJavaScript" /> 
	
		<!-- [S] 게시물 상단 폼 영역 -->
		<div class="form-wrap" data-board-type="inquiry">
			<form method="post" name="searchForm" id="searchForm" enctype="multipart/form-data">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="updateId" id="updateId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="stateCode" id="stateCode" value="<c:out value='${param.stateCode}'/>" />
				<ul class="sort-list">
					<li <c:if test="${param.stateCode == 'All' or empty param.stateCode}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('All');">All</button></li>
					<li <c:if test="${param.stateCode == '01'}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('01');">Submitted</button></li>
					<li <c:if test="${param.stateCode == '02'}">class="active"</c:if>><button type="button" class="sort-btn" onclick="fnRetrieveList('02');">Completed</button></li>
				</ul>
				
				<div class="form-area" data-combine-form="column-2-form">
					<Tag:pagingAddHiddenParam  />
					<div class="form" data-form="select">
						<select name="searchType" id="searchType" class="select-form" >
							<option value="ALL" <c:if test="${input.searchType == ''}">selected="selected"</c:if>>All</option>
							<option value="searchId" <c:if test="${input.searchType == 'searchId'}">selected="selected"</c:if>>아이디</option>
							<option value="searchName" <c:if test="${input.searchType == 'searchName'}">selected="selected"</c:if>>메뉴명</option>
						</select>
						<i class="fas fa-angle-down"></i>
					</div>
					<div class="form" data-mult-form="search">
						<input type="text" name="email" id="email" class="input-form" placeholder="Please enter a search word." value="<c:out value='${param.email}'/>" />
						<button type="button" class="icon-btn" onclick="fnRetrieveList('<c:out value="${param.stateCode}"/>');return false;"><i class="fab fa-sistrix"></i></button>
					</div>
				</div>
			</form>
		</div>
		<!-- [E] 게시물 상단 폼 영역 -->
		
		<section class="list-section">
			<header class="section-header">
				<span data-target-info="no">NO</span>
				<span data-target-info="community">Community</span>
				<span data-target-info="title">Title</span>
				<span data-target-info="date">Date of contact</span>
				<span data-target-info="contact">Contact Status</span>
			</header>
			<form:form commandName="resultList" name="listForm" id="listForm" method="post">
				<input type="hidden" name="userId" id="userId" value="<c:out value='${userId}'/>" />
				<input type="hidden" name="menuId" id="menuId" value="<c:out value='${menuId}'/>" />
				<input type="hidden" name="readerUserId" id="readerUserId" value="<c:out value='${result.readerUserId}'/>" />
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" name="type" id="type" value="" />
				<input type="hidden" name="stateCode" id="stateCode" value="" />
				<input type="hidden" name="answerContents" id="answerContents" value="" />
				<input type="hidden" name="answerDate" id="answerDate" value="" />
				<ul class="section-content" data-list-type="question-view">
					<!-- [S] 리스트 영역 -->
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<li>
								<!-- [S] 토글 section -->
								<section class="toggle-section" data-type="toggle" data-toggle-action="slide">
									<header class="toggle-header">										                                             
										<span data-target-info="no"><c:out value="${result.num}" /></span>
										<span data-target-info="community"><c:out value="${result.menuName}" /></span>
										<span data-target-info="title"><button type="button" class="toggle-btn"><c:out value="${result.title}" /></button> <a href="" class="list-sub-btn" target="_blank">See all</a></span>
										<span data-target-info="date"><c:out value="${result.questionDate.substring(0,10)}" /></span>
										<c:if test="${result.stateCode=='01'}"><span data-target-info="contact" data-comment-condition="waiting"></c:if>
										<c:if test="${result.stateCode=='02'}"><span data-target-info="contact" data-comment-condition="completed"></c:if>
											<c:out value="${result.stateName}" />
										</span>										
									</header>
									
									<article class="toggle-content" data-toggle-type="contents">
										<!-- [S] comment -->
										<ul class="comment-list">
											<li>
												<div class="comment-wrap" data-comment-type="certified-instructor">
													<article class="comment-contents">
														<pre class="text-area"><c:out value="${result.questionContents}" /></pre>
													</article>
													<c:if test="${result.stateCode=='02'}">
														<article class="comment-contents" data-comment-condition="reply">
															<pre class="text-area"><c:out value="${result.answerContents}" /></pre>
															<button type="button" class="modify-sub-btn" data-btn-style="modal" data-btn-key="comment" onclick="fnAnswerWrite(<c:out value='${result.seq}'/>, '<c:out value="${result.answerContents}"/>');"></button>
															<button type="button" class="delete-sub-btn" onclick="fnAnswerSave(<c:out value='${result.seq}'/>, 'D');"></button>
														</article>
													</c:if>
												</div>
											</li>
										</ul>
										<!-- [E] comment -->
									</article>
								</section>
								<!-- [E] 토글 section -->
							</li>
						</c:forEach>
					<!-- [E] 리스트 영역 -->
				</ul>
			</form:form>
		</section>
		
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

<!-- [S 2020-09-09] 레이어 팝업 : 댓글작성 팝업 -->
<div class="layerPop-wrap" id="AD030501-20" data-pop-action="disabled">
	<article class="layerPop-area" data-pop-key="comment" data-pop-type="comment">
		<form:form commandName="inquiryAnswer" name="answerForm" id="answerForm" method="post">
			<input type="hidden" name="seq" id="seq" value="" />
			<header class="layerPop-header">
				<h3 class="layerPop-tit">1:1 Inquiry Answer</h3>
				<button type="button" class="layerPop-close-btn" data-pop-btn="close">close<span class="icon-close"></span></button>
			</header>
			<article class="layerPop-contents">
				<div class="form" data-mult-form="comment"><textarea class="input-form" name="answerContents" id="answerContents" placeholder="Please enter your answer."></textarea></div>
			</article>
			<footer class="layerPop-footer">
				<button type="button" class="layerPop-main-btn" onclick="fnAnswerSave('', 'S');">Save</button>
				<!-- [2020-09-09] 팝업 소스 삭제 data-pop-btn="delete" -->
				<button type="button" class="layerPop-sub-btn" data-pop-btn="close">Cancel</button>
			</footer>
		</form:form>
	</article>
</div>
<!-- [E] 레이어 팝업 -->
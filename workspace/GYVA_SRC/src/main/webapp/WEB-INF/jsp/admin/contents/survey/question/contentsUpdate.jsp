<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
/**
 *******************************************************************************
 * LG Chem YVOIRE Academy JSP
 * NAME : contentsList.jsp
 * DESC : 컨텐츠 페이지 목록조회
 * VER  : v1.0
 * Copyright 2020 LG CNS All rights reserved
 *******************************************************************************
 */
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnList() {
    document.inputForm.action = "<c:url value='/admin/contents/questionList.do' />";
	document.inputForm.submit();	
}
function fnSave() {
    var flag = false;    
    if (document.inputForm.title.value == "") {
        alert("제목을 입력해주세요.");
		$("#title").focus();
        return false;    	
    } else if (document.inputForm.question1.value == "") {
        alert("1번 문항을 입력해주세요.");
		$("#question1").focus();
        return false;    	
    } else if (document.inputForm.question2.value == "") {
        alert("2번 문항을 입력해주세요.");
		$("#question2").focus();
        return false;    	
    } else if (document.inputForm.question3.value == "") {
        alert("3번 문항을 입력해주세요.");
		$("#question3").focus();
        return false;    	
    } else if (document.inputForm.question4.value == "") {
        alert("4번 문항을 입력해주세요.");
		$("#question4").focus();
        return false;    	
    } else if (document.inputForm.question5.value == "") {
        alert("5번 문항을 입력해주세요.");
		$("#question5").focus();
        return false;    	
    } else {
        document.inputForm.action = "<c:url value='/admin/survey/question/retrieveQuestionUpdate.do' />";
    	document.inputForm.submit();
    }	
}
//]]>
</script>

<section id="AD050901-15" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">설문관리</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="form-wrap">
			<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
			<form:form commandName="result" name="inputForm" id="inputForm" method="post">			
				<input type="hidden" name="surveyId" id="surveyId" value="<c:out value='${result.surveyId}'/>" />	
				<ol class="form-area" data-combine-form="question-form">
					<li>
						<label for="title" class="form-tit" data-text-style="essential">제목</label>
						<div class="form"><input type="text" class="input-form" name="title" id="title" value="<c:out value='${result.title}'/>" placeholder="제목을 입력해주세요" /></div>
					</li>
					<li>
						<label for="question1" class="form-tit" data-text-style="essential">1번 문항</label>
						<div class="form"><input type="text" class="input-form" name="question1" id="question1" value="<c:out value='${result.question1}'/>" placeholder="문항을 입력해주세요" /></div>
					</li>
					<li>
						<label for="" class="form-tit" data-text-style="essential">1번 문항형식 선택</label>
						<ul class="form" data-form="radio">
							<li>
								<input type="radio" class="check-form" id="radio01" name="itemCode1" value="SA" <c:if test="${result.itemCode1 == 'SA'}">checked</c:if> />
								<label for="radio01" class="label-form">주관식 문항</label>
							</li>
							<li>
								<input type="radio" class="check-form" id="radio02" name="itemCode1" value="MC" <c:if test="${result.itemCode1 == 'MC'}">checked</c:if> />
								<label for="radio02" class="label-form">객관식 문항</label>
							</li>
						</ul>
					</li>
					<li>
						<label for="question2" class="form-tit">2번 문항</label>
						<div class="form"><input type="text" class="input-form" name="question2" id="question2" value="<c:out value='${result.question2}'/>" placeholder="문항을 입력해주세요" /></div>
					</li>
					<li>
						<label for="" class="form-tit" data-text-style="essential">2번 문항형식 선택</label>
						<ul class="form" data-form="radio">
							<li>
								<input type="radio" class="check-form" id="radio03" name="itemCode2" value="SA" <c:if test="${result.itemCode2 == 'SA'}">checked</c:if> />
								<label for="radio03" class="label-form">주관식 문항</label>
							</li>
							<li>
								<input type="radio" class="check-form" id="radio04" name="itemCode2" value="MC" <c:if test="${result.itemCode2 == 'MC'}">checked</c:if> />
								<label for="radio04" class="label-form">객관식 문항</label>
							</li>
						</ul>
					</li>
					<li>
						<label for="question3" class="form-tit">3번 문항</label>
						<div class="form"><input type="text" class="input-form" name="question3" id="question3" value="<c:out value='${result.question3}'/>" placeholder="문항을 입력해주세요" /></div>
					</li>
					<li>
						<label for="" class="form-tit" data-text-style="essential">3번 문항형식 선택</label>
						<ul class="form" data-form="radio">
							<li>
								<input type="radio" class="check-form" id="radio05" name="itemCode3" value="SA" <c:if test="${result.itemCode3 == 'SA'}">checked</c:if> />
								<label for="radio05" class="label-form">주관식 문항</label>
							</li>
							<li>
								<input type="radio" class="check-form" id="radio06" name="itemCode3" value="MC" <c:if test="${result.itemCode3 == 'MC'}">checked</c:if> />
								<label for="radio06" class="label-form">객관식 문항</label>
							</li>
						</ul>
					</li>
					<li>
						<label for="question4" class="form-tit">4번 문항</label>
						<div class="form"><input type="text" class="input-form" name="question4" id="question4" value="<c:out value='${result.question4}'/>" placeholder="문항을 입력해주세요" /></div>
					</li>
					<li>
						<label for="" class="form-tit" data-text-style="essential">4번 문항형식 선택</label>
						<ul class="form" data-form="radio">
							<li>
								<input type="radio" class="check-form" id="radio07" name="itemCode4" value="SA" <c:if test="${result.itemCode4 == 'SA'}">checked</c:if> />
								<label for="radio07" class="label-form">주관식 문항</label>
							</li>
							<li>
								<input type="radio" class="check-form" id="radio08" name="itemCode4" value="MC" <c:if test="${result.itemCode4 == 'MC'}">checked</c:if> />
								<label for="radio08" class="label-form">객관식 문항</label>
							</li>
						</ul>
					</li>
					<li>
						<label for="question5" class="form-tit">5번 문항</label>
						<div class="form"><input type="text" class="input-form" name="question5" id="question5" value="<c:out value='${result.question5}'/>" placeholder="문항을 입력해주세요" /></div>
					</li>
					<li>
						<label for="" class="form-tit" data-text-style="essential">5번 문항형식 선택</label>
						<ul class="form" data-form="radio">
							<li>
								<input type="radio" class="check-form" id="radio09" name="itemCode5" value="SA" <c:if test="${result.itemCode5 == 'SA'}">checked</c:if> />
								<label for="radio09" class="label-form">주관식 문항</label>
							</li>
							<li>
								<input type="radio" class="check-form" id="radio10" name="itemCode5" value="MC" <c:if test="${result.itemCode5 == 'MC'}">checked</c:if> />
								<label for="radio10" class="label-form">객관식 문항</label>
							</li>
						</ul>
					</li>
				</ol>
				<div class="submit-area">
					<button type="button" class="sub-btn" onclick="fnList();">취소</button>
					<button type="button" class="main-btn" onclick="fnSave();">수정</button>
				</div>
			</form:form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>
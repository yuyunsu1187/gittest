<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>

<%---------------------------------------------------------
    파일명 : codeList.jsp
    프로젝트명 : 이브아르 아카데미 프로젝트

    Copyright(c) 2012 LG CNS,  All rights reserved.

    설 명 : 본 화면은 코드 정보를 조회하는 목록 화면입니다.
    작성자 : XXX팀 OOO
-------------------------------------------------------------%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javaScript" language="javascript">
	//<![CDATA[
	function fnList() {
	    document.inputForm.action = "<c:url value='/admin/system/detailCodeList.do' />";
		document.inputForm.submit();	
	}
	function fnSave() {
	    var flag = false;    
	    if (document.inputForm.codeName.value == "") {
	        alert("그룹명을 입력해주세요.");
			$("#codeName").focus();
	        return false;    	
	    } else if (document.inputForm.code.value == "") {
	        alert("그룹 ID를 입력해주세요.");
			$("#code").focus();
	        return false;    	
	    } else if (document.inputForm.groupId.value == "") {
	        alert("그룹 ID를 입력해주세요.");
			$("#groupId").focus();
	        return false;    	
	    } else if (document.inputForm.description.value == "") {
	        alert("코드 설명을 입력해주세요.");
			$("#description").focus();
	        return false;   	 	
	    } else {
	        document.inputForm.action = "<c:url value='/admin/system/detail/retrieveDetailCodeUpdate.do' />";
	    	document.inputForm.submit();
	    }	
	}
	//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">상세코드 관리</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<form:form commandName="result" name="inputForm" id="inputForm" method="post">
				<table class="default-table">
					<caption>상세코드 관리 수정</caption>
					<colgroup>
						<col style="width:30%;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>
						<tr>
							<th scale="col" data-text-style="essential">상세 코드명</th>
							<td><div class="form"><input type="text" class="input-form" name="codeName" id="codeName" placeholder="코드명을 입력해주세요." value="<c:out value='${result.codeName}'/>" /></div></td>
						</tr>

						<tr>
							<th scale="col" data-text-style="essential">그룹 ID</th>
							<td>
								<div class="form" data-form="select">
									<input type="hidden" name="groupId" id="groupId" value="<c:out value='${result.groupId}'/>" />
									<select class="select-form" disabled>
										<c:forEach items="${groupCodeList}" var="groupCode" >
											<option value="${groupCode.code}" <c:if test="${result.groupId == groupCode.code}">selected="selected"</c:if>><c:out value="${groupCode.value}"/></option>									
										</c:forEach>
									</select>
									<i class="fas fa-angle-down"></i>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">상세 ID</th>
							<td>
								<div class="form">
									<input type="hidden" name="code" id="code" value="<c:out value='${result.code}'/>" />
									<input type="text" class="input-form" placeholder="코드 ID을 입력해주세요." value="<c:out value='${result.code}'/>" disabled />
								</div>
							</td>
						</tr>
	
						<tr>
							<th scale="col" data-text-style="essential">코드 설명</th>
							<td>
								<div class="form">
									<textarea class="input-form" name="description" id="description" placeholder="내용을 입력해주세요." rows="12"><c:out value="${result.description}"/></textarea>
								</div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">사용여부</th>
							<td>
								<!-- [2020-09-03] 공통 : 라디오 버튼 수정 (.fa-dot-circle 삭제) -->
								<ul class="form" data-form="radio">
									<li>
										<input type="radio" class="check-form" id="radio01" name="useYn" value="Y" <c:if test="${result.useYn == 'Y'}">checked</c:if> />
										<label for="radio01" class="label-form">사용</label>
									</li>
									<li>
										<input type="radio" class="check-form" id="radio02" name="useYn" value="N" <c:if test="${result.useYn == 'N'}">checked</c:if> />
										<label for="radio02" class="label-form">사용 안함</label>
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			
				<div class="submit-area">
					<!-- <button type="submit" class="sub-btn" data-offset="left">삭제</button> -->
					<button type="button" class="sub-btn" onclick="fnList();">취소</button>
					<button type="submit" class="main-btn" onclick="fnSave();">수정</button>
				</div>
			</form:form>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>
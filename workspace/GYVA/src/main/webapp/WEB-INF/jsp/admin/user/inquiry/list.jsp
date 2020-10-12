

<script type="text/javascript" language="javascript">
//<![CDATA[
function fnRetrieveList() {
	document.searchForm.action = "<c:url value='/admin/contents/branding/retrieveContentsList.do'/>";
	document.searchForm.submit();
}
function fnDetail(num) {
	document.searchForm.num.value = num;
   	document.searchForm.action = "<c:url value='/admin/contents/branding/retrieveContents.do'/>";
   	document.searchForm.submit();
}
//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Branding Material</h2>
	</header>
	
	<article class="board-wrap" data-board-type="form-list">
		<div class="board-area">

			<table summary="Branding Material" style="font:100%/1.5em Gulim;">
				<caption>Branding Material</caption>
				<thead>
					<tr>
						<th class="Lfirst"><spring:message code="gyva.front.user.num" /></th>
						<th><spring:message code="gyva.front.user.name" /></th>
						<th><spring:message code="gyva.front.user.joblevel" /></th>
						<th><spring:message code="gyva.front.user.skill" /></th>
						<th class="Llast"><spring:message code="gyva.front.user.birthdate" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="Lfirst">		
							<td class="Lfirst"><c:out value="${result.fileExtension}" /></td>
							<td><c:out value="${result.title}" /></td>
							<td><c:out value="${result.contents}" /></td>
							<td><c:out value="${result.createDate}" /></td>
							<td class="Llast"><c:out value="${result.fileSize}" /></td>
						</tr>
					</c:forEach>
					<c:if test="${empty resultList && !empty input}">
						<tr id="empty" style="background-color: #FFFFFF">
							<td colspan="5"><spring:message code="dev.inf.com.nodata" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
		</div>
	</article>
	
</section>
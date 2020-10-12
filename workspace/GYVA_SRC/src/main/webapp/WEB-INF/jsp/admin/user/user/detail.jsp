<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

<script type="text/javascript" language="javascript">
//<![CDATA[
	function checkValue(){
        var check_count = document.getElementsByName("Position").length;
        for (var i=0; i<check_count; i++) {
            if (document.getElementsByName("Position")[i].checked == true) {
                document.detailInfo.userType.value = document.getElementsByName("Position")[i].value;
            }
        }
		document.detailInfo.action = "<c:url value='/admin/user/user/updateUser.do'/>";
		document.detailInfo.submit();
	}
	// 취소
	function goBack(){
		location.href="/admin/user/userList.do";
	}

//]]>
</script>

<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">New Account</h2>
		<p class="content-txt">Information Registration</p>
	</header>
	
	<!-- [S] 게시물 수정 --> 
	<article class="board-wrap" data-board-type="form-write">
		<form method="post" action="/admin/user/user/updateUser.do" name="detailInfo" id="detailInfo" onsubmit="return checkValue()" enctype="multipart/form-data">
		<input type="hidden" name="stateCode" id="stateCode" value="02"/>
		<input type="hidden" name="updateId" id="updateId" value="<c:out value='${userId}'/>"/>
		<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>"/>
		<input type="hidden" name="readerUserId" id="readerUserId" value="<c:out value='${result.readerUserId}'/>"/>
		<input type="hidden" name="userType" id="userType" value="<c:out value='${result.userType}'/>"/>
		
		<div class="board-area">
			<h3 class="article-tit">Personal Information</h3>
			<p class="article-txt" data-text-style="essential">There are required fields in this form marked</p>
			<table class="default-table">
				<caption>Personal Information 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scale="col" data-text-style="essential">Position</th>
						<td>
						<ul class="form" data-form="radio">
						<c:forEach items="${userTypeList}" var="userType" varStatus="status">
						<c:set var="index" value="${status.index}" />
							<li>
								<input type="radio" class="check-form" id="radio_<c:out value='${index}'/>" name="Position" data-radio-key="teacher" value="<c:out value='${userType.code}'/>" <c:if test="${result.userType == userType.code}">checked</c:if>/>
								<label for="radio_<c:out value='${index}'/>" class="label-form"><c:out value='${userType.value}'/></label>
							</li>
						</c:forEach>
						</ul>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Email address</th>
						<td><div class="form"><input type="text" class="input-form" name="email" id="email" value="<c:out value='${result.email }'/>" disabled /></div></td>
					</tr>

					<tr>
						<th scale="col" data-text-style="essential">Password</th>
						<td><div class="form" data-mult-form="password"><input type="password" class="input-form" name="password" id="password" value="<c:out value='${result.userPassword }'/>" disabled /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Name</th>
						<td>
							<div class="form-area" data-combine-form="column-2-form">
								<div class="form"><input type="text" class="input-form" name="nameFirst" id="nameFirst" value="<c:out value='${result.nameFirst }'/>" placeholder="이름을 입력해주세요." /></div>
								<div class="form"><input type="text" class="input-form" name="nameLast" id="nameLast" value="<c:out value='${result.nameLast }'/>" placeholder="이름을 입력해주세요." /></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Country</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form" name="countryCode" id="countryCode" >
									<c:forEach var="countryCode" items="${countryCodeList}" varStatus="status">
										<option value="<c:out value='${countryCode.code}'/>" <c:if test="${result.countryCode == countryCode.code}">selected="selected"</c:if>> <c:out value="${countryCode.value}"/> </option>
						     		</c:forEach>
								</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
					</tr>
					<!-- [S] 라디오 [data-radio-key="doctor"] : [data-row-key="doctor"] 연결되는 tr의 data- 값 -->
					<tr data-row-key="doctor">
						<th scale="col" data-text-style="essential">Specialty</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form" name="specialCode" id="specialCode" >
									<c:forEach var="specialCode" items="${specialCodeList}" varStatus="status">
										<option value="<c:out value='${specialCode.code}'/>" <c:if test="${result.specialCode == specialCode.code}">selected="selected"</c:if>> <c:out value="${specialCode.value}"/> </option>
						     		</c:forEach>
								</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
					</tr>
					<!-- [E] 라디오 [data-radio-key="doctor"] -->
					
					<tr>
						<th scale="col" data-text-style="essential">Physician ID</th>
						<td><div class="form"><input type="text" class="input-form" name="stateName" id="stateName" value="<c:out value='${result.stateName }'/>" readonly /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Partner name</th>
						<td><div class="form"><input type="text" class="input-form" name="partnerName" id="partnerName" value="<c:out value='${result.partnerName }'/>" /></div></td>
					</tr>
					
					<!-- [S] 라디오 [data-radio-key="teacher"] : [data-row-key="teacher"] 연결되는 tr의 data- 값 -->
					<tr data-row-key="teacher">
						<th scale="col" data-text-style="essential">강사 이미지</th>
						<td>
							<div class="form" data-mult-form="file">
								<input type="hidden" name="fileName" value="<c:out value='${result.fileName}'/>" />
								<input type="hidden" name="uploadFilePath" value="<c:out value='${result.lecturerImgPath}'/>" />
								<div class="form" data-mult-form="uploade-file">
									<a href="#" class="link-btn" onclick="fnDownload(0);"><c:out value='${result.fileName}'/></a>
								</div>
								<input type="text" class="input-form" readonly />
								<input type="file" class="file-form" name="uploadFile_1" id="uploadFile_1" />
								<label for="uploadFile_1" class="file-label">찾아보기</label>
							</div>
						</td>
					</tr>
					
					<tr data-row-key="teacher">
						<th scale="col" data-text-style="essential">강사 소개</th>
						<td><div class="form"><textarea class="input-form" rows="12" name="career1" id="career1" ><c:out value='${result.career1 }'/></textarea></div></td>
					</tr>
					
					<!-- [E] 라디오 [data-radio-key="teacher"] -->
				</tbody>
			</table>
		</div>
		
		<!-- [S] 라디오 [data-radio-key="doctor"] : [data-row-key="doctor"] 연결되는 tr의 data- 값 -->
		<div class="board-area" data-row-key="doctor">
			<h3 class="article-tit">추가 정보 입력 (선택)</h3>
			<table class="default-table">
				<caption>추가 정보 입력 (선택)</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scale="col">Clinic Name</th>
						<td><div class="form"><input type="text" class="input-form" name="hpName" id="hpName" value="<c:out value='${result.hpName }'/>" /></div></td>
					</tr>
					
					<tr>
						<th scale="col">Clinic Address</th>
						<td><div class="form"><input type="text" class="input-form" name="hpAdd" id="hpAdd" value="<c:out value='${result.hpAdd }'/>" /></div></td>
					</tr>
					
					<tr>
						<th scale="col">Clinic Postcode / Zip</th>
						<td><div class="form"><input type="text" class="input-form" name="hpZipcode" id="hpZipcode" value="<c:out value='${result.hpZipcode }'/>" /></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- [E] 라디오 [data-radio-key="doctor"] -->
		
		<div class="submit-area">
			<button type="button" class="sub-btn" onclick="goBack()">취소</button>
			<button type="submit" class="main-btn"  >수정</button>
		</div>
		</form>
	</article>
	<!-- [E] 게시물 수정 -->
</section>
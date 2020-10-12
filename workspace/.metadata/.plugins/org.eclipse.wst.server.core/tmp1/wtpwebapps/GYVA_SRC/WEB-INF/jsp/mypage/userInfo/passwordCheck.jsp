<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">

	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue() {

		if (!document.userInfo.password.value) {
			alert("Please enter a password.");
			return false;
		}else{
			fnUserPwdCheck();
		}
	}

	$(document).ready(function() {
		if("${errorMsg}"!=""){
			alert("${errorMsg}");
		}
	});
 
	// 글 상세 페이지 화면으로 이동
	function fnUserPwdCheck() {
		document.userInfo.action = "<c:url value='/mypage/userInfo.do'/>";
		document.userInfo.submit();
	}
</script>
			
<section id="FR010503-05" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Profile</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
	<form:form commandName="resultList" name="userInfo" id="userInfo" method="post" >
	
		<ul class="tab-list" data-combine-tab="column-4-tab">
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0301'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0303'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0305'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
			<li data-tab-type="list" <c:if test="${mainMenuId =='FR0307'}">data-tab-action="active"</c:if>><a href="#" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
		</ul>
		
		<article class="board-wrap" data-board-type="form-write">
			<h3 class="article-tit">Check Profile</h3>
			<p class="article-txt">Please enter your password again.</p>
			
			<div class="board-area">
				<table class="default-table">
					<caption>Personal Information 입력</caption>
					<colgroup>
						<col style="width:350px;" />
						<col style="width:auto;" />
					</colgroup>
					
					<tbody>
						<tr>
							<th scale="col">Email address</th>
							<td><div class="form" data-mult-form="input-btn">
								<input type="text" class="input-form" name="email" id="email" value="<c:out value='${email }'/>" readonly /></div>
							</td>
						</tr>
						
						<tr>
							<th scale="col" data-text-style="essential">password</th>
							<td>
								<div class="form-area">
									<div class="form" data-mult-form="password">
										<input type="password" class="input-form" name="password" id="password" placeholder="Enter Password">
										<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="submit-area">
				<button type="button" class="main-btn" onclick="checkValue()">Confirm</button>
			</div>
		</article>
	</form:form>
	</div>
	<!-- [E] tab wrap -->
</section>

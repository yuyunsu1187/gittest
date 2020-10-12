<%@ page language ="java"  pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
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
	
	// 아이디 삭제 처리
	function fnDelete() {
		var delConfirm = confirm('정말로 회원 탈퇴를 하시겠습니까? \n확인버튼 선택 시 회원 정보가 삭제 됩니다.');
		if (delConfirm) {
			alert('삭제되었습니다.');
			userInfo.action = "<c:url value='/common/user/deleteUser.do'/>";
			userInfo.submit();
		} 
	}    
</script>
			
<section id="FR010503-10" class="content-section">
	<header class="content-header">
		<h2 class="content-tit">My page</h2>
	</header>
	
	<div class="breadcrumb">
		<span class="home">home</span><span class="depth">My page</span><span class="page">Profile</span>
	</div>
	
	<!-- [S] tab wrap -->
	<div class="tab-wrap" data-type="tab" data-tab-division="link">
		<!-- [S] 프론트 모바일 탭 리스트 영역 -->
		<div class="form" data-mult-form="select-list" data-tab-area="tab-list">
			<button type="button" class="select-btn">Profile<i class="fas fa-angle-down"></i></button>
			<ul class="option-list">
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030100', 'list');">Recently viewed</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030300', 'list');">Profile</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030500', 'list');">Helpdesk</a></li>
				<li data-tab-type="list"><a href="#none" class="list-btn" onclick="fnTopMenu('FR030700', 'list');">Bookmark</a></li>
			</ul>
		</div>
		<!-- [E] 프론트 모바일 탭 리스트 영역 -->
		
		<article class="board-wrap" data-board-type="form-write">
			<h3 class="article-tit">Profile</h3>
			
			<form method="post" action="/common/user/updateUser.do" name="userInfo" onsubmit="return checkValue()">
				<input type="hidden" name="stateCode" id="stateCode" value="02"/>
				<input type="hidden" name="updateId" id="updateId" value="<c:out value='${result.seq}'/>"/>
				<input type="hidden" name="seq" id="seq" value="<c:out value='${result.seq}'/>"/>
				
				<!-- [S] 프론트 모바일 컨텐츠 영역 -->
				<div class="form-wrap">
					<ul class="form-area">
						<li>
							<label for="email" class="form-tit">Email address</label>
							<div class="form"><input type="text" name="email" id="email" class="input-form" value="<c:out value='${result.email}'/>" disabled /></div>
						</li>
						<li>
							<label for="password" class="form-tit">password</label>
							<div class="form" data-mult-form="password">
								<input type="password" name="password" id="password"  class="input-form" placeholder="Enter Password">
								<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
							</div>
							<div class="form" data-mult-form="password">
								<input type="password" name="passwordCheck" id="passwordCheck" class="input-form" placeholder="Confirm Password">
								<button type="button" class="icon-btn"><i class="far fa-eye"></i></button>
							</div>
							
							<p class="form-txt">The password must have at least 8 characters, at least 1 special character</p>
						</li>
						<li>
							<label for="name" class="form-tit">Name</label>
							<div class="form"><input type="text" name="nameLast" id="nameLast" class="input-form" placeholder="First name" value="<c:out value='${result.nameLast}'/>" disabled /></div>
							<div class="form"><input type="text" name="nameFirst" id="nameFirst" class="input-form" placeholder="Last name" value="<c:out value='${result.nameFirst}'/>" disabled /></div>
						</li>
						<li>
							<label for="country" class="form-tit">Country</label>
							<div class="form"><input  type="text" name="countryCode" id="countryCode" class="input-form" placeholder="Country" value="<c:out value='${result.countryName}'/>" disabled /></div>
						</li>
						<li>
							<label for="specialty" class="form-tit">Specialty</label>
							<div class="form"><input type="text" name="specialCode" id="specialCode" class="input-form" placeholder="Specialty" value="<c:out value='${result.specialName}'/>" disabled /></div>
						</li>
						<li>
							<label for="partner" class="form-tit">Partner name</label>
							<div class="form"><input type="text" name="partnerName" id="partnerName" class="input-form" placeholder="Enter Partner name" value="<c:out value='${result.hpName}'/>" disabled /></div>
						</li>
					</ul>
				</div>
				
				<c:if test="${not empty result.specialCode}">
					<!-- [S] 의사그룹일때만 노출 -->
					<div class="form-wrap">
						<ul class="form-area">
							<li>
								<label for="email" class="form-tit">Clinic Name</label>
								<div class="form"><input type="text" name="hpName" id="hpName" class="input-form" placeholder="Enter your clinic name" value="<c:out value='${result.hpName}'/>" /></div>
							</li>
							<li>
								<label for="email" class="form-tit">Clinic Address</label>
								<div class="form"><input type="text" name="hpAdd" id="hpAdd" class="input-form" placeholder="Enter your clinic address" value="<c:out value='${result.hpAdd}'/>" /></div>
							</li>
							<li>
								<label for="email" class="form-tit">Clinic Postcode / Zip</label>
								<div class="form"><input type="text" name="hpZipcode" id="hpZipcode" class="input-form" placeholder="Enter your clinic postcode" value="<c:out value='${result.hpZipcode}'/>" /></div>
							</li>
						</ul>
					</div>
					<!-- [E] 의사그룹일때만 노출 -->
				</c:if>
				<!-- [E] 프론트 모바일 컨텐츠 영역 -->
			</form>
				
			<div class="submit-area">
				<button type="button" class="sub-btn" data-offset="left" onclick="fnDelete()">Delete Account</button>
				<button type="submit" class="main-btn">Save</button>
			</div>
		</article>
	</div>
	<!-- [E] tab wrap -->
</section>

<script>
	$('#password').focusout(function() {
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		var asValue = document.userInfo.password.value;
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[@$!%*#?&])[0-9a-zA-Z@$!%*#?&]{8,}$/; //  8자 이상 특수문자는 1자 이상 있어야합니다.
		
		if (!regExp.test(asValue)) {
			alert("Password must be at least 8 characters, at least 1 letter and special character, and 1 number.");
			return false; // 형식에 맞는 경우 true 리턴	
		}
	})
	$('#passwordCheck').focusout(function() {
			if (!document.userInfo.passwordCheck.value) {
				alert("비밀번호 확인을 입력하세요.");
				return false;
			}
			if (document.userInfo.password.value != document.userInfo.passwordCheck.value) {
				alert("비밀번호와 비밀번호 확인을 동일하게 입력하세요.");
				return false;
			}
		})
</script>																
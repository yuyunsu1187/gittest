<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="Tag" uri="http://www.dev-on.com/Tag"%>

		
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">New Account</h2>
		<p class="content-txt">Information Registration</p>
	</header>
	
	<!-- [S] 게시물 수정 --> 
	<article class="board-wrap" data-board-type="form-write">
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
								<li>
									<input type="radio" class="check-form" id="radio01" name="Position" data-radio-key="teacher" checked />
									<label for="radio01" class="label-form"><i class="fa-dot-circle"></i>인증 강사</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio02" name="Position" data-radio-id="doctor" />
									<label for="radio02" class="label-form"><i class="fa-dot-circle"></i>일반 의사</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio03" name="Position" data-radio-id="partners" />
									<label for="radio03" class="label-form"><i class="fa-dot-circle"></i>협력업체</label>
								</li>
							</ul>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Email address</th>
						<td><div class="form"><input type="text" class="input-form" value="Lgyvoire_master@lgcns.com" disabled /></div></td>
					</tr>

					<tr>
						<th scale="col" data-text-style="essential">Password</th>
						<td><div class="form" data-mult-form="password"><input type="password" class="input-form" value="123456" disabled /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Name</th>
						<td>
							<div class="form-area" data-combine-form="column-2-form">
								<div class="form"><input type="text" class="input-form" placeholder="이름을 입력해주세요." /></div>
								<div class="form"><input type="text" class="input-form" placeholder="이름을 입력해주세요." /></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Country</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form">
									<option value="" selected>France</option>
									<option value="">USA</option>
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
								<select class="select-form">
									<option value="" selected>Dermatologist</option>
									<option value="">Plastic Surgeon</option>
									<option value="">Aesthetic Physician</option>
									<option value="">Ophthalmologist</option>
									<option value="">General Practitioner</option>
									<option value="">Gynecologist</option>
									<option value="">Others</option>
									<option value="">ENT / Dentist</option>
								</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
					</tr>
					<!-- [E] 라디오 [data-radio-key="doctor"] -->
					
					<tr>
						<th scale="col" data-text-style="essential">Physician ID</th>
						<td><div class="form"><input type="text" class="input-form" value="인증완료" readonly /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Partner name</th>
						<td><div class="form"><input type="text" class="input-form" value="이브아르 제약" /></div></td>
					</tr>
					
					<!-- [S] 라디오 [data-radio-key="teacher"] : [data-row-key="teacher"] 연결되는 tr의 data- 값 -->
					<tr data-row-key="teacher">
						<th scale="col" data-text-style="essential">강사 이미지</th>
						<td>
							<div class="form" data-mult-form="file">
								<input type="text" class="input-form" />
								<input type="file" class="file-form" name="upLoadFile" id="upLoadFile" />
								<label for="upLoadFile" class="file-label">찾아보기</label>
							</div>
						</td>
					</tr>
					
					<tr data-row-key="teacher">
						<th scale="col" data-text-style="essential">강사 소개</th>
						<td><div class="form"><textarea class="input-form" rows="12"></textarea></div></td>
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
						<th scale="col" data-text-style="essential">Clinic Name</th>
						<td><div class="form"><input type="text" class="input-form" value="Hospital Kyriad Paris Bercy" /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Clinic Address</th>
						<td><div class="form"><input type="text" class="input-form" value="17 Rue Baron le Roy, 75012 Paris" /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">Clinic Postcode / Zip</th>
						<td><div class="form"><input type="text" class="input-form" value="+33144677575" /></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- [E] 라디오 [data-radio-key="doctor"] -->
		
		<div class="submit-area">
			<button type="submit" class="sub-btn">취소</button>
			<button type="submit" class="main-btn">수정</button>
		</div>
	</article>
	<!-- [E] 게시물 수정 -->
</section>
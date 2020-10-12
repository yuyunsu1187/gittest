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

//]]>
</script>
			
<section class="content-section">
	<header class="content-header">
		<h2 class="content-tit">Branding Material</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<table class="default-table">
				<caption>Branding Material 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>
					<tr>
						<th scale="col" data-text-style="essential">카테고리</th>
						<td>
							<ul class="form" data-form="radio">
								<li>
									<input type="radio" class="check-form" id="radio01" name="category" checked />
									<label for="radio01" class="label-form"><i class="fa-dot-circle"></i>Logo</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio02" name="category" />
									<label for="radio02" class="label-form"><i class="fa-dot-circle"></i>Product Image</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio03" name="category" />
									<label for="radio03" class="label-form"><i class="fa-dot-circle"></i>Imagery</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio04" name="category" />
									<label for="radio04" class="label-form"><i class="fa-dot-circle"></i>Video</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio05" name="category" />
									<label for="radio05" class="label-form"><i class="fa-dot-circle"></i>Social Media</label>
								</li>
							</ul>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="제목을 입력해주세요." value="ANATOMY AND PHYSIOLOGY OF THE AGEING FACE" /></div></td>
					</tr>

					<tr>
						<th scale="col">안내 문구</th>
						<td><div class="form"><textarea class="input-form" placeholder="문의 내용을 입력해주세요." rows="12">ANATOMY AND PHYSIOLOGY OF THE AGEING FACE Preview Guide PRACTICE SUPPORT Preview Guide</textarea></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">썸네일 이미지</th>
						<td>
							<div class="form-area">
								<div class="form" data-mult-form="uploade-file">
									<a href="#none" target="_blank" titile="새창열기" class="link-btn">Branding logo.jpg</a>
									<button type="button" class="icon-btn"><i class="far fa-trash-alt"></i></button>
								</div>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" />
									<input type="file" class="file-form" name="upLoadFile" id="upLoadFile" />
									<label for="upLoadFile" class="file-label">찾아보기</label>
								</div>
								<p class="form-txt"><span class="point-color">000 X 000</span> 해상도 이미지 파일로 업로드하여 주시기 바랍니다</p>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">등록 자료</th>
						<td>
							<div class="form-area">
								<div class="form" data-mult-form="uploade-file">
									<a href="#none" target="_blank" titile="새창열기" class="link-btn">Branding logo.jpg</a>
									<button type="button" class="icon-btn"><i class="far fa-trash-alt"></i></button>
								</div>
								<div class="form" data-mult-form="file">
									<input type="text" class="input-form" />
									<input type="file" class="file-form" name="upLoadFile" id="upLoadFile" />
									<label for="upLoadFile" class="file-label">찾아보기</label>
								</div>
							</div>
						</td>
						</td>
					</tr>
					
					<tr>
						<th scale="col">비고</th>
						<td><div class="form"><textarea class="input-form" placeholder="비고 내용을 입력해주세요." rows="12">The remarks column is an item that can be written in any text.You can write anything else.</textarea></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="submit-area">
			<button type="submit" class="sub-btn" data-offset="left">삭제</button>
			<button type="submit" class="sub-btn">취소</button>
			<button type="submit" class="main-btn">수정</button>
		</div>
	</article>
	<!-- [E] 게시물 수정/삭제 -->
</section>
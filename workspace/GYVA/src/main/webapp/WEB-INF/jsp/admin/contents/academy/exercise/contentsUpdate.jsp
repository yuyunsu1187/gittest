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
		<h2 class="content-tit">YVOIRE Exercise</h2>
	</header>
	
	<!-- [S] 게시물 수정/삭제 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<table class="default-table">
				<caption>YVOIRE Exercise 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>							
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="제목을 입력해주세요." value="ANATOMY AND PHYSIOLOGY OF THE AGEING FACE" /></div></td>
					</tr>

					<tr>
						<th scale="col">키워드 태그</th>
						<td>
							<div class="form-area" data-combine-form="column-2-form">
								<div class="form"><input type="text" class="input-form" placeholder="키워드 태그1을 입력해주세요." value="Scientific Data1" /></div>
								<div class="form"><input type="text" class="input-form" placeholder="키워드 태그2을 입력해주세요." value="Scientific Data2" /></div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">기간 설정</th>
						<td>
							<div class="form-area" data-combine-form="datepicker">
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" value="2020.08.25" />
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<span class="symbol">-</span>
								
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" value="2020.08.25" />
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<div class="form" data-form-type="checkbox">
									<input type="checkbox" class="check-form" id="allcheck" />
									<label for="allcheck" class="label-form"><i class="fa-check-square"></i> 당일</label>
								</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">강의 내용</th>
						<td>
							<div class="form">
								<textarea class="input-form" placeholder="내용을 입력해주세요." rows="12">
									자료 설명 글이 나오는 영역으로, 해당 설명글은 스크롤이 생기며, 영역이 지정되어 텍스트가 길게 나올수가 있는 영역이다. 자료 설명 글이 나오는 영역으로, 해당 설명글은 스크롤이 생기며, 영역이 지정되어 텍스트가 길게 나올수가 있는 영역이다.
									자료 설명 글이 나오는 영역으로, 해당 설명글은 스크롤이 생기며, 영역이 지정되어 텍스트가 길게 나올수가 있는 영역이다.
									자료 설명 글이 나오는 영역으로, 해당 설명글은 스크롤이 생기며, 영역이 지정되어 텍스트가 길게 나올수가 있는 영역이다.
									자료 설명 글이 나오는 영역으로, 해당 설명글은 스크롤이 생기며, 영역이 지정되어 텍스트가 길게 나올수가
								</textarea>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">썸네일 이미지</th>
						<td>
							<div class="form-area">
								<div class="form" data-mult-form="uploade-file">
									<a href="#none" target="_blank" titile="새창열기" class="link-btn">Branding logo_____.jpg</a>
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
						<th scale="col" data-text-style="essential">강의 영상</th>
						<td>
							<div class="form-area">
								<div class="form" data-mult-form="uploade-file">
									<a href="#none" target="_blank" titile="새창열기" class="link-btn">Branding logo.mp4</a>
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
						<th scale="col" data-text-style="essential">담당 강사</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form">
									<option value="" selected>Dr Daniel Lindemann</option>
									<option value="">Dr Daniel Lindemann1</option>
									<option value="">Dr Daniel Lindemann2</option>
								</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
					</tr>
					
					<tr>
						<th scale="col">설문 조사</th>
						<td>
							<div class="form" data-form="select">
								<select class="select-form">
									<option value="" selected>Anatomy 타입 설문1</option>
									<option value="">Anatomy 타입 설문2</option>
									<option value="">Anatomy 타입 설문3</option>
								</select>
								<i class="fas fa-angle-down"></i>
							</div>
						</td>
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
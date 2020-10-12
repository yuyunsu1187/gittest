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
		<h2 class="content-tit">EVENT</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<table class="default-table">
				<caption>EVENT 입력</caption>
				<colgroup>
					<col style="width:30%;" />
					<col style="width:auto;" />
				</colgroup>
				
				<tbody>							
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="제목을 입력해주세요." /></div></td>
					</tr>

					<tr>
						<th scale="col" data-text-style="essential">기간 설정</th>
						<td>
							<div class="form-area" data-combine-form="datepicker">
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" />
									<button type="button" class="icon-btn"><i class="far fa-calendar-alt"></i></button>
								</div>
								
								<span class="symbol">-</span>
								
								<div class="form" data-mult-form="date">
									<input type="text" class="input-form" />
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
						<th scale="col" data-text-style="essential">링크 URL</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="제목을 입력해주세요." /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">상세 이미지</th>
						<td>
							<div class="form-area">
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
						<th scale="col" data-text-style="essential">썸네일 이미지</th>
						<td>
							<div class="form-area">
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
						<th scale="col" data-text-style="essential">강연자</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="강연자을 입력해주세요." /></div></td>
					</tr>
					
					<tr>
						<th scale="col" data-text-style="essential">장소</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="장소를 입력해주세요." /></div></td>
					</tr>
					
					<tr>
						<th scale="col">비고</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="비고를 입력해주세요." /></div></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="submit-area">
			<button type="submit" class="sub-btn">취소</button>
			<button type="submit" class="main-btn">등록</button>
		</div>
	</article>
	<!-- [E] 게시물 등록 -->
</section>
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
		<h2 class="content-tit">Notice</h2>
	</header>
	
	<!-- [S] 게시물 등록 --> 
	<article class="board-wrap" data-board-type="form-write">
		<div class="board-area">
			<table class="default-table">
				<caption>Notice 입력</caption>
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
									<label for="radio01" class="label-form"><i class="fa-dot-circle"></i>Notice</label>
								</li>
								<li>
									<input type="radio" class="check-form" id="radio02" name="category" />
									<label for="radio02" class="label-form"><i class="fa-dot-circle"></i>Academic data</label>
								</li>
							</ul>
						</td>
					</tr>
				
					<tr>
						<th scale="col" data-text-style="essential">제목</th>
						<td><div class="form"><input type="text" class="input-form" placeholder="제목을 입력해주세요." /></div></td>
					</tr>

					<tr>
						<th scale="col" data-text-style="essential">내용</th>
						<td><div class="form"><textarea class="input-form" placeholder="내용을 입력해주세요." rows="12"></textarea></div></td>
					</tr>
					
					<tr>
						<th scale="col">첨부 파일</th>
						<td>
							<div class="form" data-mult-form="file">
								<input type="text" class="input-form" />
								<input type="file" class="file-form" name="upLoadFile" id="upLoadFile" />
								<label for="upLoadFile" class="file-label">찾아보기</label>
							</div>
						</td>
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
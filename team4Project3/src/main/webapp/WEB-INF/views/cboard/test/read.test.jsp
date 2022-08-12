<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../include/header.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
<%
// 줄바꿈     
pageContext.setAttribute("br", "<br/>");
pageContext.setAttribute("cn", "\n");
%> 

<style>
.margin-space {
	margin-top: 40px;
	margin-left: 15px;
	margin-bottom: 40px; 
}

.text-center {
	text-align: center;
}

.btn-primary {
	color: #fff;
	background-color: #fdc600;
	border-color: #fdc600;
	border-radius: 1px;
	padding: 10px 20px;
	font-weight: 600;
}
</style>


<!-- Content Wrapper. Contains page content -->
<!-- Content Header (Page header) -->

<div class="page-head">
	<div class="container">
		<div class="row">
			<div class="page-head-content">
				<h1 class="page-title">내용 테스트</h1>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<table class="table table-bordered margin-space"
			style="border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" class="text-center">기업 게시글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th width="90" class="text-center">번호</th>
					<td>${cboard.cbno}</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td><c:out value='${cboard.title}' /></td>
				</tr>
				<tr>
					<th class="text-center">시공분야</th>
					<td><c:out value='${cboard.cnstType}' /></td>
				</tr>
				<tr>
					<th class="text-center">주거유형</th>
					<td><c:out value='${cboard.space}' /></td>
				</tr>
				<tr>
					<th class="text-center">평수(면적)</th>
					<td><c:out value='${cboard.area}' /></td>
				</tr>
				<tr>
					<th class="text-center">비용</th>
					<td><c:out value='${cboard.cost}' /></td>
				</tr>
				<tr>
					<th class="text-center">시공기간</th>
					<td><c:out value='${cboard.period}' /></td>
				</tr>
				<tr>
					<th class="text-center">내용</th>
					<%-- 					<td><c:out value='${boardData.board.require}' /></td> --%>
					<td>${fn:replace(cboard.content, cn, br)}</td>

				</tr>
			</tbody>
		</table>


		<div class="margin-space" style="text-align: right">
			<c:set var="pageNo"
				value="${empty param.pageNo ? '1' : param.pageNo}" />
				
			<a href="list?pageNo=${pageNo}" class="btn btn-primary ">목록</a> 
			<a href="modify?cbno=${cboard.cbno}" class="btn btn-primary">수정</a> 
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"	href="delete?cbno=${cboard.cbno}" class="btn btn-primary">삭제</a>
		</div>
		<br>

	</div>
</div>


<%@ include file="../../include/footer.jspf"%>

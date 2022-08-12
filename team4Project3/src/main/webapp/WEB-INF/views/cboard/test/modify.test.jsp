<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../include/header.jspf"%>
<style>
.footer-area {
	width: 100%;
	height: 110px; /* 내용물에 따라 알맞는 값 설정 */
	position: absolute;
}

.expert-calculate__content {
	text-align: center;
}

.text-center padding-b-50 {
	margin-top: 50px;
}

.notice {
	margin: 0 auto;
	width: 60%;
	left: 30%;
	background-color: #f7f8fa;
	padding-left: 1%;
	padding-right: 1%;
	padding-bottom: 1%;
	padding-top: 1%;
	margin-bottom: 50px;
	margin-top: 50px;
}

.form-group {
	margin: 0 auto;
	width: 35%;
	margin-bottom: 50px;
	margin-top: 50px;
}

.area {
	margin: 0 auto;
	width: 30%;
	margin-bottom: 50px;
	margin-top: 50px;
}

.range-slider-input__content {
	position: relative;
	top: 7px;
	left: 12px;
	right: 12px;
	height: 10px;
}

.input-group {
	margin: 0 auto;
	width: 40%;
	margin-bottom: 50px;
	margin-top: 50px;
}

.cancel_btn {
	position: relative;
	width: 150px;
	height: 60px;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 100px;
	margin-left: 50px;
	background-color: #C2C2C2;
}

.submit_btn {
	position: relative;
	width: 150px;
	height: 60px;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 100px;
	background-color: #FDC600;
}

.box-title {
	text-align: center;
}

.box {
	width: 70%;
	margin: auto;
	text-align: center;
}

.form-group {
	text-align-last: center;
	text-align: center;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#space').val('${cboard.space}').prop("selected", true);
		$('#cnstType').val('${cboard.cnstType}').prop("selected", true);
	});
</script>
       
<div class="page-head">
	<div class="container">
		<div class="row">
			<div class="page-head-content">
				<h1 class="page-title">수정테스트</h1>
			</div>
		</div>
	</div>
</div>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<!-- 	<section class="content-header"> -->
	<!-- 		<h2>인테리어 간편 견적신청</h2> -->

	<!-- 	</section> -->
	<!-- Main content -->

	<div class="register-area"
		style="background-color: rgb(249, 249, 249);">
		<!-- <section class="content"> -->

		<!-- Default box -->
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">수정테스트</h3>
			</div>
			<div class="box-body">

				<form role="form" action="modify" method="post" >

					<div class="form-row">

						<!-- 							Title 작성 -->
						<div class="form-group">
							<label for="inputAddress">제목</label> <input type="text"
								class="form-control" name="title" id="title"
								value ="${cboard.title}"/>
						</div>


						<!-- 							주거 타입 작성 -->
						<div class="form-group">
							<label for="exampleFormControlSelect1">공간</label> <select
								class="form-control" name="space" id="space" >
								<option value="" disabled selected>공간</option>
								<option value="아파트">아파트</option>
								<option value="빌라">빌라</option>
								<option value="카페/식당">카페/식당</option>
								<option value="사무/오피스">사무/오피스</option>
								<option value="매장/상업">매장/상업</option>
								<option value="병원/의료">병원/의료</option>
								<option value="기타">기타</option>
							</select>
						</div>

						<div class="form-group">
							<label for="exampleFormControlSelect1">시공 분야</label> <select
								class="form-control" name="cnstType" id="cnstType">
								<option value="" disabled selected>시공 분야</option>
								<option value="종합">종합</option>
								<option value="도배">도배</option>
								<option value="마루">마루</option>
								<option value="욕실">욕실</option>
								<option value="필름">필름</option>
								<option value="타일">타일</option>
								<option value="도어">도어</option>
								<option value="주방">주방</option>
								<option value="기타">기타</option>
							</select>
						</div>

						<!-- 							평수 입력 -->

						<div class="form-group">
							<label>면적</label>
							<div class="input-group"
								style="width: 320px; margin-top: 0px; margin-bottom: 0px;">
								<div class="input-group-addon">평수</div>
								<input type="number" class="form-control" name="area" value ="${cboard.area}"/>
								<div class="input-group-addon">평</div>
							</div>
						</div>


						<div class="form-group">
							<div class="form-row">
								<div>
									<label for="start">시공 비용</label>
								</div>
								<div class="input-group"
									style="width: 320px; margin-top: 0px; margin-bottom: 0px;">
									<input type="number" class="form-control" name="cost" value ="${cboard.cost}"/>
									<div class="input-group-addon">만원</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputAddress">시공 기간</label> <input type="text"
								class="form-control" name="period" id="period" 
								value ="${cboard.period}"/>
						</div>
						

						<div class="form-group">
							<label for="exampleFormControlTextarea1">내용</label>
							<textarea class="form-control" name="content" 
								id="exampleFormControlTextarea1" rows="7">${cboard.content}</textarea>
						</div>

						<div class="form-group">
						<input type="file" name="image" accept="image/gif,image/jpeg,image/png"
						onchange='chk_file_type(this)'>
												</div>
						
				</form>

				<div class="col-md-offset-2"
					style="margin-left: 0px; margin-top: 50px;">
					<input type="button" class="cancel_btn" name="cancel" value="취소"
						onClick="location.href='/cboard/list'"
						style="display: inline-block;"> <input type="submit"
						class="submit_btn" name="submit" value="등록"
						style="display: inline-block;">
				</div>
			</div>

			<!-- /.box-body -->
		</div>
	</div>
</div>


<%@ include file="../../include/footer.jspf"%>
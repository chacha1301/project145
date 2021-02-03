<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type='text'], input[type='date'] {
	padding: 10px;
	margin-bottom: 0px;
}

.label {
	position: relative;
	z-index: 0;
	display: inline-block;
	width: 100%;
	background: #6C9852;
	color: #fff;
	padding: 10px 0;
	text-transform: uppercase;
	font-size: 12px;
}

.uploadPic {
	display: inline-block;
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 50px;
	top: 0;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.div-image {
	position: relative;
	text-align: center;
	width: 120px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

textarea {
	margin-bottom: 0px;
	padding: 10px;
}

td {
	padding: 5px;
}

.submitBtn {
	width: 80px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
	padding: 0px;
}

.submitBtn:hover {
	color: white;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="container my-5">
		<form id="frm" action="" onsubmit="return checkFrm();">
			<div align="center">
				<table class="tbl" style="width: 70%;">
					<tr>
						<th width="100px;">챌린지 제목</th>
						<td><input type="text" name="meetTitle"
							placeholder="제목을 입력하세요" required></td>
					</tr>
					<tr>
						<th>기간</th>
						<td><input type="date" name="meetStart" style="width: 40%"
							min="" required> ~ <input type="date" name="meetEnd"
							style="width: 40%" required></td>
					<tr>
						<th>챌린지 내용</th>
						<td><textarea placeholder="챌린지 내용을 입력하세요" required></textarea></td>
					</tr>
					<tr>
						<th>대표 사진</th>
						<td><div class="row" id="imageRadio">
								<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
									<input type="radio" name="meetPic" class="radio"
										value="sample1.jpg" checked> <img
										src="/images/sample1.jpg">
								</div>
								<div class="col-xl-4 col-lg-4 col-md-6">
									<input type="radio" name="meetPic" class="radio"
										value="sample2.jpg"> <img src="">
								</div>
								<div class="col-xl-4 col-lg-4 col-md-6">
									<input type="radio" name="meetPic" class="radio"
										value="sample2.jpg"> <img src="">
								</div>
								<div class="image-container col-xl-4 col-lg-4 col-md-6">
									<input type="radio" name="meetPic" class="radio imageSelect">
									<div class="myImage">
										<img id="upload-image" width="100%" class="mb-4">
										<div class="div-image">
											<span class="label">사진 업로드</span> <input type="file"
												name="uploadfile" class="uploadPic" accept="image/*"
												onchange="setImage(event);">
										</div>
									</div>
								</div>
							</div></td>
					</tr>

				</table>
			</div>
			<div align="right">
				<button type="submit" class="btn submitBtn">개설</button>
			</div>
		</form>
	</div>

	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("upload-image");
				img.setAttribute("src", event.target.result);

			}
			reader.readAsDataURL(event.target.files[0]);
			$('.div-image').addClass('mb-4');
		}

		$(function() {
			//input date 기본세팅
			var today = new Date();
			today.setDate(today.getDate() + 1);
			today = dateFormat(today);
			$('input[name=meetStart]').attr('min', today);
			$('input[name=meetEnd]').attr('min', today);

			//start와 end가 바뀜에 따라 min, max 조절
			$('input[name=meetStart]').on('change', function() {
				var start = $('input[name=meetStart]').val();
				var end = $('input[name=meetEnd]').val();

				if (start > end) {
					$('input[name=meetEnd]').attr('min', start);
					$('input[name=meetEnd]').val(start);
				}
			});
			
		});

		function dateFormat(today) { //today는 date타입
			var day = today.getDate();
			if (day < 10) {
				day = '0' + day;
			}
			var month = today.getMonth() + 1;
			if (month < 10) {
				month = '0' + month;
			}
			today = today.getFullYear() + '-' + month + '-' + day;
			return today; //리턴은 string
		}
		
		//개설 버튼 눌렀을 때 사진 required
		function checkFrm(){
			if($('.imageSelect').is(':checked')){
				if($('.uploadPic').val() == '' || $('.uploadPic').val() == null){
					alert('사진을 선택해주세요');
					return false;
				} else{
					return true;
				}
			}
		}
	</script>
</body>
</html>
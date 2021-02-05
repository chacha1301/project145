<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/classform.css">
<style>
</style>
<title>클래스 수정</title>
</head>
<body style="padding: 0;">
	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizUpdate.do">

			<br>
			<div class="pagetitle" align="center">
				<h3>클래스 수정</h3>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<h5>대표사진</h5>

				<div class="div-image" style="float: right;">
					<input type="file" name="cImg" class="classPic" accept="image/*"
						onchange="setImage(event);"
						style="background-color: white; border: none; margin-left: 10px; padding: 0; border-radius: 2px;">
				</div>

				<!-- Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/images-empty.png" height="300px"
						width="auto">

				</div>
			</div>
			<br>
			<div class="row">
				<h5>클래스명</h5>
				<div class="input-group input-group-icon">
					<input type="text" placeholder="클래스 이름"
						value="${classVo.getCTitle()}" id="cTitle" name="cTitle" required
						autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>
			<br>

			<h5>베지테리언타입</h5>
			<br>
			<div class="labelf" align="center">
				<div class="demo">
					<table class="tbl">
						<tr>
							<th>채소</th>
							<th>유제품</th>
							<th>달걀</th>
						</tr>
						<tr><th></th><th></th><th></th></tr>
						<tr>
							<td>
								<div class="tbl-data" data-item="🥦" style="">
									<input type="checkbox" id="vegan" class="type" value="비건"
										checked disabled> <label for="vegan">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>
							<td>
								<div class="tbl-data" data-item="🧀">
									<input type="checkbox" class="vtype" id="locto" value="락토">
									<label for="locto">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>
							<td>
								<div class="tbl-data" data-item="🥚 ">
									<input type="checkbox" id="ovo" class="vtype" value="오보">
									<label for="ovo">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>
						</tr>
					</table>
					<input type="text" id="vegi" readonly value="비건" required
						name="vegtype"
						style="text-align: center; display: none; height: 3rem; padding: 10px;">
				</div>
			</div>

			<div class="row">
				<div class="col-half">
					<h5>모집정원(명)</h5>
					<div class="input-group">
						<div class="number-input" style="margin: 10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
							<input class="quantity" min="0" id="cParti" name="cParti"
								value="${classVo.getCParti()}" type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
								class="plus"></button>
						</div>
					</div>
				</div>
				<div class="col-half">
					<h5>가격(5000원 단위)</h5>
					<div class="input-group">
						<div class="number-input" style="margin: 10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown(1000)"></button>
							<input class="quantity" min="1000" id="cPrice" name="cPrice"
								value="${classVo.getCPrice()}" type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp(5000)"
								class="plus"></button>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="input-group">
						<input type="date" value="${classVo.getCStart()}" name="cStart"
							id="cStart">
					</div>
				</div>
				<div class="col-half">
					<h5>종료일</h5>
					<div class="input-group">
						<input type="date" value="${classVo.getCEnd()}" name="cEnd"
							id="cEnd">
					</div>
				</div>
			</div>

			<div class="row">
				<h5>요일 / 시간</h5>
				<div class="input-group input-group-icon">
					<input type="text" value="${classVo.getCTime()}" name="cTime"
						id="cTime" placeholder="매주 ** 요일 오전/오후 ** 시" required
						autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>장소</h5>
				<div class="input-group input-group-icon">
					<input type="text" value="${classVo.getCLoc()}" name="cLoc"
						id="cLoc" placeholder="장소찾기api" required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>


			<!-- 현재 설졍 -->
	
		<!-- 기존 강사 목록에서 선택  -->
			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half" style="padding-left: 10%;">
						<div class="row" style="text-align: center;" align="center">
							<div class="input-group">
								<div class="profile-cover">
									<div class="profile-avatar">
										<img style="border-radius: 50px"
											src="https://dl.dropboxusercontent.com/s/7pcnqq18skh1myk/avatar.jpg"
											alt="Anis M" />
									</div>

									<div class="profile-details" style="font-size: 1.5rem">
										<a href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-id-card-o"></i></a> &nbsp<a
											href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-instagram"></i></a> &nbsp<a
											href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-envelope-o"></i></a>
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="col-half" align="left">
						<div class="row">
							<h5>강사아이디</h5>
							<div class="input-group">
								<h6>${mvo.getMId()}</h6>
							</div>
						</div>

						<div class="row">
							<h5>강사이름</h5>
							<div class="input-group">
								<div style="text-align: center;" align="center">

									<h6>${mvo.getMName()}</h6>
								</div>
							</div>
						</div>
						<div class="row">

							<div class="lecCareer" align="left">
								<h5>강사이력</h5>
								<div class="input-group">
									<h6>${mvo.career}</h6>
								</div>

							</div>
						</div>
					</div>
				</div>


				<br> <br> <br>
			</div>


			<!-- 강사부분 끝 -->

			<!-- 현재 설졍 -->
			


			<div class="row" style="text-align: left">
				<h5>클래스 커리큘럼</h5>

				<textarea rows="5" name="curriCulum" required autocomplete="off">${classVo.getCurriCulum()}</textarea>
			</div>

			<div class="row" style="text-align: left">
				<h5>클래스 설명</h5>

				<textarea rows="5" name="cDesc" required autocomplete="off">${classVo.getCDesc()}</textarea>

			</div>


			<button class="btn btn-primary" type="button" id="insertclass"
				style="margin: 10px; padding: 10px;">수정 정보 저장</button>
			<button class="btn btn-primary" type="button"
				onClick="location.href='/classBizList.do'"
				style="margin: 10px; padding: 10px;">클래스 목록으로</button>

		</form>
	</div>
	<br>

	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("class-image");
				img.setAttribute("src", event.target.result);

			}

			reader.readAsDataURL(event.target.files[0]);
		}

		$(document).ready(function() { //기존 강사 목록에서 선택 || 새로운 강사 추가 

			$("input:radio[name=lectureropt]").click(function() {
				var lecval = $('input:radio[name=lectureropt]:checked').val();

				if (lecval == "leclist") {

					$("#lecadddiv").hide();
					$("#leclistdiv").show();

				} else {
					$("#leclistdiv").hide();
					$("#lecadddiv").show();

				}
			});

			$("#insertclass").click(function() {
				alert("등록");
				$("#cfrm").submit();
			})

		});

		function showSection(lec) { //강사 추가 나를 강사로 추가 || 다른 강사 추가

			if (lec.value == "${sessionScope.mId}") {
				$("#otherlec").hide();
				$("#sendmsg").hide();
				$("#melec").show();

			} else {
				$("#otherlec").show();
				$("#melec").hide();
				$("#sendmsg").show();

			}

		}
		
		//채식타입 선택 폼 
		$(".vtype").click(function() {
			if ($("#vegi").val() != null) {
				var str = "";
				$(".vtype").each(function() {

					if ($(this).is(":checked"))
						str += $(this).val() + '';
				});
				$("#vegi").val(str);
			} else {
				var str = "비건";
				$("#vegi").val(str);
			}
		});
	</script>

</body>
</html>
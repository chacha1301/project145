<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Insert</title>
<style>
input, textarea {
	border: 1px solid #6C9852;
	width: 100%;
}

row.plus {
	margin-left: 20%;
	margin-right: 20%;
}

.addMat, .deleteMat {
	background: transparent;
	border: none;
	font-size: 35px;
	color: #6C9852;
}

.matInput {
	margin: 0px;
}
</style>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>โฌ</h2></a>
		</div>
		<div class="category-list-item">
			<form id="frm" action="/recipeInsertResult.do" method="post"
				onsubmit="return checkForm();">
				<h3>recipe title๐</h3>
				<div class="my-3">
					<select name="rType" id="rType">
						<option value="" selected disabled>๋น๊ฑด ๋ ๋ฒจ</option>
						<option value="๋น๊ฑด">๋น๊ฑด</option>
						<option value="๋ฝํ ">๋ฝํ </option>
						<option value="์ค๋ณด">์ค๋ณด</option>
						<option value="๋ฝํ ์ค๋ณด">๋ฝํ ์ค๋ณด</option>
					</select>
				</div>
				<input type="text" name="rTitle" placeholder="์ ๋ชฉ์ ์๋ ฅํ์ธ์" required>
				<br />
				<p style="color: red">
					<strong>*์๋ก๋ํ ์ฌ์ง ์ค ์ฒซ๋ฒ์งธ ์ฌ์ง์ด ๋ํ์ฌ์ง์ผ๋ก ๋ฑ๋ก๋ฉ๋๋ค. ํ ๊ฐ ์ด์์ ์ฌ์ง์
						๋ฑ๋กํด์ฃผ์ธ์.</strong>
				</p>
				<div>
					<textarea id="ckeditor" required></textarea>
				</div>
				<input type="hidden" name="rContent" id="rContent"> <input
					type="hidden" name="rImage" id="rImage">
				<hr>
				<br />
				<!-- ๊ด๋ จ ์ฌ๋ฃ -->
				<h3>Ingredient๐</h3>
				<br />
				<div class="material">
					Used Ingredient<br /> <br />
					<div class="row mb-3">
						<div class="col-lg-5 col-md-5 col-sm-12">
							<input type="text" class="matInput" name="recipeMatVoList[0].matName" placeholder="์ฌ๋ฃ๋ช (์: ๋๋ถ)">
						</div>
						<div class="col-lg-5 col-md-5 col-sm-12">
							<input type="text" class="matInput" name="recipeMatVoList[0].matVol" placeholder="๋ถ๋ (์: ํ ๋ชจ)">
						</div>
						<div class="col-lg-2 col-md-2 col-sm-12" style="display: flex; align-items: center;">
							<button type="button" class="deleteMat">
								<i class="lni lni-circle-minus"></i>
							</button>
						</div>
					</div>
				</div>
				<button type="button" class="addMat mt-3">
					<i class="lni lni-circle-plus"></i>
				</button>


				<hr />
				<br />
				<!-- ๊ด๋ จ ํด๋์ค -->
				<div class="row">
					<h3>Related Class๐</h3>
					<div>
						<div class="plus">
							<br />

							<div class="col-lg-12" align="center">
								<table align="center">
									<tr>
										<td class="col-md-2" align="center" valign="middle"><select
											id="vegType">
												<option value="" selected disabled>๋น๊ฑด ๋ ๋ฒจ</option>
												<option value="">์ ์ฒด</option>
												<option value="๋น๊ฑด">๋น๊ฑด</option>
												<option value="๋ฝํ ">๋ฝํ </option>
												<option value="์ค๋ณด">์ค๋ณด</option>
												<option value="๋ฝํ ์ค๋ณด">๋ฝํ ์ค๋ณด</option>
										</select></td>

										<td class="col-md-7"><input type="text"
											placeholder="Search Class" size="1000" id="keyword"
											name="keyword"></td>
										<td class="col-md-1"></td>
										<td class="col-md-1"><button class="btn btn-primary"
												id="searchC" name="searchC" type="button">search</button></td>
									</tr>
								</table>
							</div>
							<div id="search-result" align="center">class search result</div>
							<br /> <br />
						</div>

					</div>
				</div>
				<br />
				<p style="text-align: right;">
					*๋ ์ํผ ์์ฑ์ ํตํ ์ ๋ฆฝ์ ํ๋ฃจ 5ํ๋ก ์ ํ๋ฉ๋๋ค.
				</p>
				<div class="mb-5" align="center">
					<button type="button" id="submitBtn" class="btn main-btn btn-hover">์ ์ฅ</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		//ck์๋ํฐ ์ธํ
		var ckeditor_config = {
			resize_enable : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/ckEditorUpload.do",
			uploadUrl : "/ckEditorUpload.do"
		};

		CKEDITOR.replace('ckeditor', ckeditor_config);

		$(function() {
			$("#searchC")
					.click(
							function() {
								/* //alert("๊ฒ์ ๋ฒํผ ํด๋ฆญ!");
								var keyword = $("#searchCd").serialize(); */
								$
										.ajax({
											url : '/recipeLessonSearch.do',
											type : 'POST',
											dataType : "json",
											data : {
												keyword : $("#keyword").val(),
												vegType : $("#vegType").val()
											},
											success : function(data) {
												console.log(data);
												if (data.length > 0) {
													var output = "<table class='table table-borderless table-hover' style='width: 64%'>";
													for ( var i in data) {
														output += "<tr>";
														output += "<td width='100'>"
																+ data[i].lname;
														output += "<td width='300'>"
																+ data[i].ctitle;
														
														output += "<td width='50'>"
																+ "<input type='checkbox' name='cIdArr' value='"+data[i].cid+"' class='class-checked' style='margin:0px; zoom:1.3;'>";
														output += "</tr>"
													}
													output += "</table>";
												} else {
													var output = "<p>์ผ์นํ๋ ๊ฒฐ๊ณผ๊ฐ ์์ต๋๋ค</p>";
												}
												$("#search-result")
														.html(output);
												// success
											},
											error : function() {
												alert("ajaxํต์  ์คํจ!!!");
											}
										});
							});

			$('#submitBtn').on('click', function() {
				$('#frm').submit();
			});
			
			//๋ฉ๋ด์ถ๊ฐ ๋ฒํผ
			var length = 1;
			$('.addMat').on('click', function(){
				var output=`<div class="row mb-3">
								<div class="col-lg-5 col-md-5 col-sm-12">
									<input type="text" class="matInput" name="recipeMatVoList[\${length}].matName" placeholder="์ฌ๋ฃ๋ช (์: ๋๋ถ)">
								</div>
								<div class="col-lg-5 col-md-5 col-sm-12">
									<input type="text" class="matInput" name="recipeMatVoList[\${length}].matVol" placeholder="๋ถ๋ (์: ํ ๋ชจ)">
								</div>
								<div class="col-lg-2 col-md-2 col-sm-12" style="display: flex; align-items: center;">
									<button type="button" class="deleteMat">
										<i class="lni lni-circle-minus"></i>
									</button>
								</div>
							</div>`;
				$('.material').append(output);
				length++;
			});
			
			
			//๋ฉ๋ด์ญ์  ๋ฒํผ
			$('.material').on('click', '.deleteMat', function(){
				$(this).closest('.row').remove();
			});
		});

		function checkForm() {
			var vegType = $('#rType').val();
			var content = CKEDITOR.instances.ckeditor.getData();
			var imgTag = findImgTag(content);
			console.log(imgTag);
			if (vegType == null || vegType == '') {
				alert('๋ ์ํผ์ ์ฑ์์ ํ์ ์ ํํ์ธ์');
				return false;
			} else if (content.length < 1) {
				alert('๋ด์ฉ์ ์๋ ฅํด์ฃผ์ธ์');
				return false;
			} else if (imgTag == undefined) {
				alert('์ฌ์ง์ ํ ๊ฐ ์ด์ ๋ฑ๋กํด์ฃผ์ธ์. ๋ํ์ฌ์ง์ด ํ์ํฉ๋๋ค.');
				return false;
			} else {
				$('#rContent').val(content);
				$('#rImage').val(imgTag);
				return true;
			}

		}

		//์ด๋ฏธ์งํ๊ทธ ์ฐพ๊ธฐ
		function findImgTag(content) {
			var srcIndex = content.indexOf('img src'); //์ฒซ ์ด๋ฏธ์ง ํ๊ทธ์ index
			var subStr = content.substr(srcIndex);
			var splitStr = subStr.split('"');
			var imgTag = splitStr[1];
			return imgTag;
		}
	</script>

</body>
</html>
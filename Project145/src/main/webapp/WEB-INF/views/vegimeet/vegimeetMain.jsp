<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGIMEET - Untact</title>
<style>
.product-bottom {
	padding-bottom: 20px;
}

.name {
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.name:hover {
	color: #6C9852;
	cursor: pointer;
}

.class {
	background: #6C9852;
}

.likeAction {
	border: none;
	background: transparent;
}

.insertBtn {
	width: 130px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
}

.insertBtn:hover {
	color: white;
}

.myCard {
	border: 1px solid rgba(124, 134, 154, 0.25);
	border-radius: 10px;
	transition: all 0.3s ease-out 0s;
	box-shadow: 0px 3px 35px rgb(218 222 228/ 30%);
}

.myCard:hover {
	box-shadow: 0px 12px 35px rgba(218, 222, 228, 0.65);
}

/* .addBtn:hover {
	background: #6C9852;
	border-color: #6C9852;
} */
.div-image {
	position: relative;
	text-align: center;
	width: 120px;
	text-align: center;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
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
.search-area .search-wrapper {
	box-shadow: 0px 0px 0px;
}

.search-area .search-wrapper select, input {
	box-shadow: 0px 3px 25px rgb(203 207 213 / 10%);
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="./selectScript.js"></script> -->
</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<c:if test="${fn:length(myList) != 0}">
				<div class="addPic mb-5 p-2">
					<h5>???? ????????? ????????? ??????</h5>
					<div class="row mb-5 mt-2">
						<c:forEach var="myMeet" items="${myList }" varStatus="status">
							<div class="col-xl-4 col-lg-6 col-md-6 myCard mx-2 p-3 my-2">
								<div class="row mb-2">
									<h5>${myMeet.meetTitle }</h5>
								</div>
								<div class="row">
									<div class="col-xl-6 col-lg-6 col-md-6 ps-1">
										<img src="images/${myMeet.meetPic }" style="width: 300px;">
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6"
										style="align: right; vertical-align: bottom;">
										<c:if test="${myMeet.todayFlag eq 'false' }">
											<form id="frm"
												action="/vegimeetPicInsert.do/${myMeet.meetId}"
												method="post" enctype="multipart/form-data">
												<div class="image-container pe-1">
													<img id="upload-image${status.index }"
														src="/images/images-empty.png" width="95%">
													<div class="div-image mb-2">
														<span class="label">?????? ?????????</span> <input type="file"
															name="uploadfile" class="uploadPic" accept="image/*"
															data-id="upload-image${status.index }">
													</div>
													<div align="center">
														<button type="button"
															class="btn btn-outline-dark submitBtn"
															data-id="${myMeet.meetId }" disabled>??????</button>
													</div>
												</div>
											</form>
										</c:if>
										<c:if test="${myMeet.todayFlag eq 'true' }">
											<div style="text-align: center;">
												<br>
												<h6>????????? ?????????</h6>
												<h6>?????? ??????!</h6>
											</div>
										</c:if>
									</div>
								</div>
								<div class="mt-2 achiv" id="${myMeet.meetId }" align="right"
									style="vertical-align: bottom;">????????? ${myMeet.achiv }%
									(${myMeet.success }/${myMeet.totalDay })</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>

			<div class="row mb-5">
				<div class="mx-auto col-xl-8 col-lg-9 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>????????? ???????????? ??????????????? ????</h1>
						<p>??????????????? ?????? ????????? ????????? ????????? ??????, ???????????? ???????????? ???????????????</p>
					</div>
				</div>
			</div>


			<!-- =================================== -->
			<div class="search-area">
				<div class="search-wrapper">
					<form action="vegimeetList.do" id="form" method="post">
						<div class="row justify-content-center mb-5">
							<div class="col-lg-2 col-sm-4 col-6">
								<div class="search-input">
									<label for="category"> <i
										class="lni lni-grid-alt theme-color"></i>
									</label> <select name="options" id="options">
										<option value="all" selected>??????</option>
										<option value="ongoing">?????????</option>
										<option value="closed">??????</option>
										<option value="finished">??????</option>
									</select>
								</div>
							</div>
							<div class="col-lg-3 col-sm-5 col-6">
								<div class="search-input">
									<label for="keyword"> <a
										href="javascript:form.submit()"> <i
											class="lni lni-search-alt theme-color"></i>
									</a>
									</label> <input type="text" name="keyword" id="keyword">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- =================================== -->




			<!-- <div class="row justify-content-center border-bottom pb-4 mb-5">
				<div class="col-lg-1 col-sm-1"></div>
				<div class="col-lg-7 col-sm-5 col-10">
					<form action="vegimeetList.do">
						<div class="search-input">
							<label for="keyword"><i
								class="lni lni-search-alt theme-color"></i></label> <input type="text"
								name="keyword" id="keyword" placeholder="Product keyword"
								style="width: 95%;">
						</div>
					</form>
				</div>
				<div class="col-lg-3 col-sm-5 col-10">
					<div class="search-btn">
						<button class="main-btn btn-hover searchBtn" style="width: 80%">
							Search <i class="lni lni-search-alt"></i>
						</button>
					</div>
				</div>
				<div class="col-lg-1 col-sm-1"></div>
			</div>



			<h4 class="mb-3 pt-2">????????? ????????????</h4>
			<div class="mb-2" align="right">
				<select name="options" id="options" style="width: 100px;">
					<option value="all" selected>??????</option>
					<option value="ongoing">?????????</option>
					<option value="closed">??????</option>
					<option value="finished">??????</option>
				</select>
			</div> -->

			<c:if test="${mId != null and mId != '' }">
				<div align="left" class="newChallenge mb-4">
					<button class="btn insertBtn"
						onclick="location.href='vegimeetInsertForm.do'">????????? ??????</button>
				</div>
			</c:if>

			<div class="row" id="cards">
				<c:forEach var="vo" items="${list }">
					<div class="col-xl-3 col-lg-6 col-md-6 mb-3">
						<div class="single-product">
							<div class="product-img">
								<a href="/vegimeetSelect.do?meetId=${vo.meetId }"> <img
									src="/images/${vo.meetPic }" style="height: 250px;"
									alt="vegimeet image">
								</a>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h4 class="name" title="${vo.meetTitle }"
										onclick="location.href='/vegimeetSelect.do?meetId=${vo.meetId }'">${vo.meetTitle }</h4>
								</div>
								<ul class="address">
									<li><i class="lni lni-user"></i> ${vo.getMId() }</li>
									<li><i class="lni lni-package"></i> ${vo.meetParticipant }</li>
									<li><i class="lni lni-calendar"></i> ${vo.meetStart }</li>
									<li>~ <i class="lni lni-calendar"></i> ${vo.meetEnd }
									</li>
								</ul>
								<div class="product-bottom border-bottom">
									<h4 class="price">
										<fmt:formatNumber value="${vo.meetFund }" pattern="#,###" />
										???
									</h4>
									<div>
										<button type="button" class="likeAction"
											data-id="${vo.meetId }">
											<c:if test="${vo.likeFlag > 0 }">
												<img class="likeImg" src="/images/filled_like.png"
													style="width: 30px;" alt="filled heart image">
											</c:if>
											<c:if test="${vo.likeFlag == 0 }">
												<img class="likeImg" src="/images/empty_like.png"
													style="width: 30px;" alt="empy heart image">
											</c:if>
										</button>
									</div>
								</div>
								<br>
								<div align="right">
									<c:if test="${vo.dday > 0 }">
										<h4 style="color: #6C9852;">?????? ${vo.dday }??? ???!</h4>
									</c:if>
									<c:if test="${vo.dday <= 0}">
										<h4>??????</h4>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- ????????? -->
			<my:paging paging="${paging }" jsFunc="goList" />
		</div>

	</section>

	<script>
		$(function() {
			//?????? ???????????? ??????
			$('.uploadPic').on(
					'change',
					function(event) {
						var reader = new FileReader();
						var imgNum = $(this).data('id');
						console.log('imgNum : ' + imgNum);
						reader.onload = function(event) {
							var img = document.getElementById(imgNum);
							img.setAttribute("src", event.target.result);
						}

						reader.readAsDataURL(event.target.files[0]);

						$(this).parents('.image-container').find('.submitBtn').prop('disabled', false);
					});

			
			$('#cards')
					.on(
							'click',
							'.likeAction',
							function() {
								if ('${mId}' == null || '${mId}' == '') {
									alert('????????? ??? ?????????????????????.');
								} else {
									var meetId = $(this).data('id');
									if ($(this).children('img').attr('src') == '/images/empty_like.png') {
										$.ajax({
											url : 'vegimeetLike.do/' + meetId,
											type : 'post',
											contentType : "application/json",
											success : function(result) {
											}
										});
										$(this).children('img').attr('src',
												'/images/filled_like.png');
									} else {
										$(this).children('img').attr('src',
												'/images/empty_like.png');
										$
												.ajax({
													url : 'vegimeetUnlike.do/'
															+ meetId,
													type : 'post',
													contentType : "application/json",
													success : function(result) {
													}
												});
										$(this).children('img').attr('src',
												'/images/empty_like.png');
									}
								}
							});

			$('.submitBtn').on(
					'click',
					function() {
						var formData = new FormData($("#frm")[0]);
						var meetId = $(this).data('id');
						var photoArea = $(this).parent().parent().parent();
						photoArea.empty();
						var achivDiv = $('#' + meetId);
						achivDiv.empty();

						$.ajax({
							type : 'post',
							url : 'vegimeetPicInsert.do/' + meetId,
							processData : false,
							contentType : false,
							data : formData,
							success : function(result) {
								//???????????? ???????????? ????????? ????????????
								photoArea.append($('<div>').attr('style',
										'text-align: center;')
										.append($('<br>')).append(
												$('<h6>').text('????????? ?????????'))
										.append($('<h6>').text('?????? ??????!')));

								achivDiv.text('?????????' + result.achiv + '% ('
										+ result.success + '/'
										+ result.totalDay + ')');
								console.log(result);
							}
						});
					});

			//?????? ?????? ?????? ??? ????????? ????????????
			$('#options').on('change', function() {
				var option = $('#options option:selected').val();
				var keyword = $('#keyword').val() || "";
				var formData = new FormData($("#form")[0]);
				$('#cards').empty();
				$.ajax({
					type: 'post',
					url: '/changeSearchOption.do',
					processData : false,
					contentType : false,
					data: formData,
					success: function(result) {
						
						$.each(result, function(idx, vo){
							var startDay = dateFormat(vo.meetStart);
							var endDay = dateFormat(vo.meetEnd);
							
							var html = `<div class="col-xl-3 col-lg-6 col-md-6 mb-3">
								<div class="single-product">
								<div class="product-img">
									<a href="/vegimeetSelect.do?meetId=\${vo.meetId }"> <img
										src="/images/\${vo.meetPic }" style="height: 180px;"
										alt="vegimeet image">
									</a>
								</div>
								<div class="product-content">
									<div class="namediv">
										<h4 class="name"
											onclick="location.href='/vegimeetSelect.do?meetId=\${vo.meetId }'">\${vo.meetTitle }</h4>
									</div>
									<ul class="address">
										<li><i class="lni lni-user"></i> \${vo.mid }</li>
										<li><i class="lni lni-package"></i> \${vo.meetParticipant }</li>
										<li><i class="lni lni-calendar"></i> \${startDay }</li>
										<li>~ <i class="lni lni-calendar"></i> \${endDay }
										</li>
									</ul>
									<div class="product-bottom border-bottom">
										<h4 class="price">
											<fmt:formatNumber value="${vo.meetFund }" pattern="#,###" />
											???
										</h4>
										<div>
											<button type="button" class="likeAction"
												data-id="\${vo.meetId }">
												<c:if test="\${vo.likeFlag > 0 }">
													<img class="likeImg" src="/images/filled_like.png"
														style="width: 30px;" alt="filled heart image">
												</c:if>
												<c:if test="\${vo.likeFlag == 0 }">
													<img class="likeImg" src="/images/empty_like.png"
														style="width: 30px;" alt="empy heart image">
												</c:if>
											</button>
										</div>
									</div>
									<br>
									<div align="right">
										<c:if test="\${vo.dday > 0 }">
											<h4 style="color: #6C9852;">?????? \${vo.dday }??? ???!</h4>
										</c:if>
										<c:if test="\${vo.dday <= 0}">
											<h4>??????</h4>
										</c:if>
									</div>
								</div>
							</div>
						</div>`;
						
						
						$('#cards').append(html);
						$('#options').val(option).prop('selected', true);
						});
						
						//?????????????????? ???????????? ???????????? ????????? ????????? ??????... ?????? ??????..
						
					}
				});
			});
			
			
			var options = "${options}";
			var keyword = "${keyword}";
			if(options == null || options == ''){
				$('#options').val('all').prop('selected', true);
				console.log(options);
			} else {
				$('#options').val(options).prop('selected', true);
				console.log(options);
			}
			if(keyword != null && keyword != ''){
				$('#keyword').val(keyword);
			}
		}); 
		
		function goList(p) {
			var options = $('#options').val();
			var keyword = $('#keyword').val();

			if (options == 'all' || options == '') {
				location.href = "vegimeetList.do?page=" + p
			} else {
				location.href = "vegimeetList.do?page=" + p + "&options="
						+ options + "&keyword=" + keyword;

			}

		}
		
		//????????????
		function dateFormat(calc) { //today??? date??????
			var today = new Date(calc);
			var day = today.getDate();
			if (day < 10) {
				day = '0' + day;
			}
			var month = today.getMonth() + 1;
			if (month < 10) {
				month = '0' + month;
			}
			today = today.getFullYear() + '-' + month + '-' + day;
			return today; //????????? string
		}
	</script>
</body>
</html>
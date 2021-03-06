<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeRecipe.jsp</title>
<style type="text/css">
.card-title {
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">๋๋ง์ RECIPE ๐งก</h1>
		</div>
		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="recipe" items="${recipes }">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img id="img" class="card-img-top" src="${recipe.getRImage() }"
							width="200" height="200"
							onerror="this.src='/images/loveurth2 (4).jpg'" alt="๋ ์ํผ ์ฌ์ง"
							onclick="location.href='recipeDesc.do?rId=${recipe.getRId()}'"
							style="cursor: pointer;">
						<div class="card-body">
							<h5 class="card-title">${recipe.getRTitle() }</h5>
						</div>
						<div class="card-footer">
							<p href="#">์กฐํ์ ${recipe.getRHit() }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<my:paging paging="${paging }" jsFunc="goList" />
		<script>
			function goList(p) {
				location.href = "myRecipe.do?page=" + p;
			}
		</script>
	</div>
</body>
</html>
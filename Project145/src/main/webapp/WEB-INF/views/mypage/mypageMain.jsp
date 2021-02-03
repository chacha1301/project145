<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>mypageMain.jsp</title>
<link href="/resources/my/css/mycss.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div align="center">
		<div class="profile-card" align="center">
			<div class="profile-cover">
				<div class="menu-container">
					<ul class="profile-actions" style="display: none;">
						<li><a href="#">Follow</a></li>
						<li><a href="#">Add as Friend</a></li>
						<li><a href="#">Like</a></li>
					</ul>
				</div>
				<div class="profile-avatar">
					<a href="#"><img src="/images/${member.getProfileImage() }"
						width="150" height="150" /></a>
				</div>
			</div>
			<h2>${mid }</h2>
			<h2>${member.getEmail() }</h2>
			<br> <a href="/myPageEdit.do?mId=${mid }"
				class="btn btn-light btn-icon-split"> <span
				class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
			</span> <span class="text">내 정보 수정</span>
			</a>
		</div>   
	</div>
	<div align="center">
		<div>
			적립금&nbsp; <input readonly="readonly" type="text" value="<fmt:formatNumber value="${member.getWalletPoint() }" pattern="#,###" />원"  >&nbsp;&nbsp; 충전금&nbsp; 
				<input readonly="readonly" type="text" value="<fmt:formatNumber value="${member.getWalletCash() }" pattern="#,###" />원">
		</div>
		<br>
		<div>MyWallet 에서 충전을 해보세요!!</div>
	</div>
	<script src="/resources/my/js/myjs.js"></script>
</body>
</html>
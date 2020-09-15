<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>성적 처리 관리 시스템</title>
</head>
<style>
@font-face {
	font-family: 'NeoDunggeunmo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.3/NeoDunggeunmo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face { 

	font-family: 'Arita-dotum-Medium'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-dotum-Medium.woff') format('woff'); 
	font-weight: normal; font-style: normal; 

}
body {
	font-family: 'NeoDunggeunmo';
	margin:0;
}

* {
	box-sizing: border-box
}

.mySlides {
	display: none
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}

#mySidenav a {
	position: absolute;
	left: -80px;
	transition: 0.3s;
	padding: 15px;
	width: 140px;
	text-decoration: none;
	font-size: 17px;
	color: white;
	border-radius: 0 5px 5px 0;
	font-family: 'Arita-dotum-Medium'; 
}

#mySidenav a:hover {
	left: 0;
}

#about {
	top: 20px;
	background-color: #4CAF50;
}

#blog {
	top: 80px;
	background-color: #2196F3;
}

#projects {
	top: 140px;
	background-color: #f44336;
}

#contact {
	top: 200px;
	background-color: #555
}

#coco {
	top: 260px;
	background-color: #4CAF50;
}
#hehe {
	top:320px;
	background-color: #2196F3;
}
</style>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	
	<div style="margin-left: 200px;">
		<h1>성적 처리 관리 시스템</h1>
		<p>이 웹사이트는 선생님,학생에 따라 용도가 달라지는 성적 처리,관리 시스템입니다.</p>
	</div>
	<br><br><br>
	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="images/school5.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="images/home.jpg" style="width: 100%">
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 3</div>
			<img src="images/school3.jpg" style="width: 100%">
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>
	<%
		if(userID==null) {
	%>
	<div id="mySidenav" class="sidenav">
		<a href="login.jsp" id="about">login</a> <a href="join.jsp" id="blog">sign up</a>
	</div>
	<%
		} else {
	%>	
			<div id="mySidenav" class="sidenav">
				<a href="insert.jsp" id="about">성적 입력</a> <a href="updateScore.jsp" id="blog">성적 수정</a>
				<a href="update.jsp" id="projects">정보 수정</a> <a href="select.jsp" id="contact">성적 조회</a>
				<a href="logoutAction.jsp" id="coco">logout</a><a href="delete.jsp" id="hehe">회원 탈퇴</a>
			</div>
	<% 
		}
	%>	
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
	</script>
</body>
</html>
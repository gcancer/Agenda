<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/header/header.css"
	type="text/css" media="screen"/>
<title>아괜다 회원가입 페이지 입니다.</title>
</head>
<body>
	<header>
		<div class="wrapper">
			<div id="header-bar" onclick="location.href='${pageContext.request.contextPath}/main/main.jsp'">
				<img src="${pageContext.request.contextPath}/header/resources/img/medicine.png">
				<span>AGENDA</span>
			</div>
			<nav>
				<ul class="header-menu">
					<li>
						<a href="${pageContext.request.contextPath}/login/loginForm.jsp">
						<span class="login">
						<button id="로그인">Log in</button>
						</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/regist/registForm.jsp">
						<span class="reg">
						<button id="회원가입">Register</button>
						</span>
						</a>
					</li>
					<li>
						<a href="#">
						<span class="list" onclick="openNav()">&#9776;</span>
						</a></li>
				</ul>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				<p>SERVICE</p>
				<a href="${pageContext.request.contextPath}/MainController?command=mediSearch" 
					onmouseover="this.innerHTML='Medication check'"
					onmouseout="this.innerHTML='의약품조회'">의약품조회</a> 
				<a href="${pageContext.request.contextPath}/MainController?command=findPharm"
					onmouseover="this.innerHTML='Finding Pharmacy'"
					onmouseout="this.innerHTML='약국찾기'"><span>약국찾기</span></a> 
				<a href="${pageContext.request.contextPath}/MediLockerRegistController?command=mediLocker" 
					onmouseover="this.innerHTML='Prescription'"
					onmouseout="this.innerHTML='처방전'"><span>처방전</span></a> <br>
				<br> <br>
				<p>NOTICE</p>
				<a href="${pageContext.request.contextPath}/MainController?command=notice" 
					onmouseover="this.innerHTML='Notice'"
					onmouseout="this.innerHTML='공지사항'">공지사항</a>
				<p>SUPPORT</p>
				<a href="${pageContext.request.contextPath}/MainController?command=qna"
					onmouseover="this.innerHTML='Questions and Answers'"
					onmouseout="this.innerHTML='Q&A'">Q&A</a>
			</div>
			</nav>
		</div>
		<script>
			function openNav() {
				document.getElementById("mySidenav").style.width = "400px";
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
			}

		</script>
	</header>
</body>
</html>
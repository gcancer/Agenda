<!-- @format -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="loginForm.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="387206565373-pirulfq47eamrs5ge97dg64f1r8sv7cq.apps.googleusercontent.com">
<!--카카오 : 카카오 로그인을 위해 import 붙여줌-->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// 카카오톡 Developer에 우선 application을 등록한 후에 API 사이트에서 발급받은 JavaScript Key
						Kakao.init("14450773e72f51b9201cbbec7c53a0a4");
						// 카카오 로그인 버튼을 생성함수 (이 경우 kakaodeveloper에서 제공받아 html에 태그를 넣어주면 동작함.)
						// 이 프로젝트에서는 이미지를 이용함.
						Kakao.Auth
								.createLoginButton({
									container : "#kakao-login-btn",
									success : function(authObj) {
										// console.log( authObj );
										Kakao.API
												.request({
													url : "/v2/user/me",
													success : function(res) {
														
														//받아오는 값들 id,email등은 카카오 developer API에서 검색 후 사용가능함
														//해당 프로젝트에서는 ID와 EMAIL만 받아오기로함.	
														var member_id = res.id;
														var member_email = res.kakao_account.email;
														
														// 제공받은 id와 email을 kakaoLoginController에 보내줌.
														location.href="../LoginController?command=kakaologin&member_id="+member_id+"&member_email="+member_email;
	
														
													},
													fail : function(error) {
														alert(JSON
																.stringify(error));
													}
												});
									},
									fail : function(error) {
										alert(JSON.stringify(error));
									}
								});
					});
</script>
<title>Document</title>
</head>
<body>

<!-- 네이버:
1. 네이버 아이디로 로그인 시작하기전에 naver developer 에서 application신청 
2. access_token을 받아올 call back page url을 기입해야함 
3. 네이버 로그인 버튼을 누르면 clientId에 붙은 값들을 비교
4. 기입한 callbackURI를 통해 token을 받을 수 있다. -->

<!-- 네이버: clientId,redirectURI는 naver developer에 application신청 후 제공받은 것을 쓰면 됨 -->
<!-- redirect URI는 token값을 받을 수 있는 주소로 설정해줌 -->
	<%
	String clientId = "aKYqnvW_wCpjcTsDuFRA";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://127.0.0.1:8787/Agenda/LoginNaver", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	System.out.println("로그인페이지");
	%>

<section class="first">
	<div class="login">

		<div class="login__top">


			<a href="${pageContext.request.contextPath}/main/main.jsp"><img
				class="login__icon" src="imgs/favicon.png" alt="logo" /></a>

                                                                                                                                                                                       

			<div class="login__title">로그인</div>

		</div>

		<div class=login__bottom>

			<form action="../LoginController" method="post">

				<input type="hidden" name="command" value="login" />

			<div class="login__submit">
					<div class="login__submit__id">

						<input type="text" placeholder="아이디" name="member_id" required />
					</div>

					<div class="login__submit__pwd">

						<input type="password" placeholder="비밀번호" name="member_pw"
							required />
					</div>


				<div class="login__submit__remember">
					<span class="forgotid">
					<a href="${pageContext.request.contextPath}/login/loginForgotId.jsp">아이디</a></span>
					<span class="forgotpw">
					<a href="${pageContext.request.contextPath}/login/loginForgotPw.jsp">비밀번호</a>를 잊으셨습니까?</span>
				</div>

				<div>
					<button class="login__submit__button" type="submit" value="loginbtn">로그인</button>
				</div>
					
							
				<div >
					<button class="registbtn" onclick="location.href='${pageContext.request.contextPath}/regist/registForm.jsp'">회원가입</button>
				</div>

			</div>



			</form>

		</div>


		<div class="login__submit__api">
<!--카카오: 카카오 아이디로 로그인 버튼 .해당 프로젝트에서는 임시로 이미지 사용   -->
			<div class="login__submit__kakao">

				<a href="#"><img id="kakao-login-btn" src="imgs/카카오버튼.png" /></a>
	
			</div>
<!--네이버 : 네이버 아이디로 로그인 버튼 생성-->	
			<div class="login__submit__naver">
				<a href="<%=apiURL%>"><img id=naver__btn src="imgs/네아로버튼.png" /></a>
			</div>


		</div>

	</div>
	</section>
	<jsp:include page="../footer/mainFooter.jsp" />
</body>
</html>
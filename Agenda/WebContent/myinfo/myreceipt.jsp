<%@page import="java.util.Date"%>
<%@page import="com.agenda.donation.dnDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인후원내역조회</title>
<style type="text/css">

	#allreceipt {
		width: 100vw;
		height: 100vh;
		background-color: white;
	}
	
	#back {
		background-color: black;
		color: white;
		cursor: pointer;
	}
	
	#myreceipt{
		background-color: whitesmoke;
		width : 100%;
		height : 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	table{
		border-collapse: collapse;
		margin-top : 100px;
		margin-bottom: 50px;
	}
	
	tr,td{
		padding : 5px;
	}
	
</style>

</head>
<body>
	<c:choose>
    	<c:when test="${empty logindto }">
    		<jsp:include page="../header/header.jsp" />
    	</c:when>
    	<c:otherwise>
    		<jsp:include page="../header/loginMain.jsp" />
    	</c:otherwise>
	</c:choose>


<div id="myreceipt">
	<h1>개인후원내역</h1>
	<table border="1">
		<thead>
			<tr>
				<td>후원 번호</td>
				<td>후원 아이디</td>
				<td>금액</td>	
				<td>후원 날짜</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="donation" items="${donationList}">
			<tr>
				<td>${donation.dona_no }</td>
				<td>${donation.member_id }</td>
				<td>${donation.dona_bill }</td>
				<td>${donation.dona_date }</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="10"><input id="back" type="button" onclick="location.href='${pageContext.request.contextPath}/MyinfoController?command=myinfo&member_id=${logindto.member_id }'" value="돌아가기"></td>
			</tr>
		</tfoot>
	</table>
</div>

<jsp:include page="../footer/mainFooter.jsp"></jsp:include>

</body>

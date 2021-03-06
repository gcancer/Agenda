<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/qna/qna_list.css">
<title>Insert title here</title>
<script>
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(curPage) {
		location.href = "${pageContext.request.contextPath}/qnaController.do?command=list&curPage="
			+ curPage
			+ "&searchOption=${map.searchOption}"
			+ "&keyword=${map.keyword}";
	}
	
	// 로그인 알림 후 로그인 페이지로 이동
	function loginAlert(){
		alert('로그인해주세요');
		location.href="${pageContext.request.contextPath}/login/loginForm.jsp";
	}
</script>
</head>

<body>
	<!-- 헤더 -->
    <c:choose>
    	<c:when test="${empty logindto }"> <%--로그인 안했을 때 --%>
    		<jsp:include page="../header/header.jsp" />
    	</c:when>
    	<c:otherwise> <%--로그인 했을 때 --%>
    		<jsp:include page="../header/loginMain.jsp" />
    	</c:otherwise>
	</c:choose>
    
    <!-- 섹션 -->
	<section>
		<h1><a href="${pageContext.request.contextPath}/qna/index.jsp">Q & A</a></h1>
		
		<form action="${pageContext.request.contextPath}/qnaController.do" method="post">
			<input type="hidden" name="command" value="list">
			<input type="hidden" name="curPage" value="1">
			<p>총 ${map.count}개의 게시물이 있습니다.</p>
			<table>
				<!-- 테이블메뉴 -->
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회</th>
				</tr>
				
				<!-- 테이블내용 -->
				<c:forEach var="row" items="${map.list}">
				<c:choose>
					<%-- 삭제하지 않은 글 --%>
					<c:when test="${row.qna_delflag == 'N' }">
					<tr>
						<td>${row.qna_no} </td>
						<td><a
							href="${pageContext.request.contextPath}/qnaController.do?command=detail&qna_no=${row.qna_no}">${row.qna_title} [${row.qna_recnt}]
							</a></td>
						<td>${row.member_id }</td>
						<td><fmt:formatDate value="${row.qna_regdate}" pattern="yyyy-MM-dd"/></td>
						<td>${row.qna_hit }</td>
					</tr>
					</c:when>
					<%-- 삭제한 글 --%>
					<c:otherwise>
					<tr>
						<td>${row.qna_no}</td>
						<td><span>삭제된 글 입니다</span></td>
						<td>${row.member_id }</td>
						<td><fmt:formatDate value="${row.qna_regdate}" pattern="yyyy-MM-dd"/></td>
						<td>${row.qna_hit }</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 검색 -->
				<tr>
					<td colspan="5">
					<select name="searchOption">
						<option value="all" <c:out value="${map.searchOption == 'all' ? 'selectd':'' }"/>>제목+이름+내용</option>
						<option value="member_id" <c:out value="${map.searchOption =='user_name'?'selectd': ''}"/>>이름</option>
						<option value="qna_content" <c:out value="${map.searchOption == 'content'?'selectd':'' }"/>>내용</option>
						<option value="qna_title" <c:out value="${map.searchOption == 'title'?'selectd':'' }"/>>제목</option>
					</select>
						<input type="text" name="keyword" value="${map.keyword}" placeholder="검색어를 입력하세요">
						<input type="submit" value="조회">
							
				<!-- 글쓰기 버튼 -->
						<c:choose>
							<c:when test="${logindto ne null }"> <%-- 로그인 했을 떄 --%>
							<input type="button" value="글쓰기" id="insertBtn"
								onclick="location.href='${pageContext.request.contextPath}/qnaController.do?command=write'">
							</c:when>
							<c:otherwise> <%-- 로그인 안 했을 떄--%>
								<input type="button" value="글쓰기" id="insertBtn" onclick="loginAlert()">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				
				<!-- 페이징 -->
				<tr>
					<td colspan="5">
						<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음]하이퍼링크를 화면에 출력-->
						<c:if test="${map.boardPager.curBlock > 1}">
							<a href="javascript:list('1')">[처음]</a>
						</c:if>
						
						<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
						<c:if test="${map.boardPager.curBlock > 1}">
							<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
						</c:if>
						
						<!-- 하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
						<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
							<%-- 현재페이지이면 하이퍼링크 제거 --%>
							<c:choose>
								<c:when test="${num == map.boardPager.curPage}"> <%-- 현재 페이지 --%>
									<span style="color: red">${num}</span>&nbsp;
								</c:when>
								<c:otherwise> <%-- 다른 페이지--%>
									<a href="javascript:list('${num}')">${num}</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
						<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
							<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
						</c:if>
						
						<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
						<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
							<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<!-- 풋터 -->
	<jsp:include page="../footer/mainFooter.jsp" />
</body>
</html>
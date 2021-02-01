<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<h2>${view.title}</h2>
	<hr />

	<div class="writer">
		<span>작성자 : </span> ${view.writer}
	</div>

	<hr />

	<div class="content">${view.content}</div>

	<div>
		<a href="/board/modify?bno=${view.bno}">게시물 수정</a> <a
			href="/board/delete?bno=${view.bno}">게시물 삭제</a>
	</div>

	<!-- 댓글 시작 -->
	<hr />

	<ul>
		<c:forEach items="${reply}" var="reply">
			<li>
				<div>
					<form method="post" action="/reply/delete">
						<p>${reply.writer}/<fmt:formatDate value="${reply.regDate}"
								pattern="yyyy-MM-dd hh:mm" />
						</p>
						<p>${reply.content}</p>
						
						<input type="hidden" name="bno" value="${view.bno}"> 
						<input type="hidden" name="rno" value="${reply.rno}">
						<button type="button" id="goUpdate">댓글 수정</button>
						<button type="submit">댓글 삭제</button>
					</form>
				</div>
			</li>
		</c:forEach>
	</ul>

	<div>

		<form method="post" action="/reply/write">

			<p>
				<label>댓글 작성자</label> <input type="text" name="writer">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
			</p>
			<p>
				<input type="hidden" name="bno" value="${view.bno}">
				<button type="submit">댓글 작성</button>
			</p>
		</form>

	</div>
	<!-- 댓글 끝 -->
</body>
<script>
	document.getElementById("goUpdate").onclick = function() {

		document.getElementsByName("writer") = ;
		let keyword = document.getElementsByName("keyword")[0].value;

		location.href = "/board/listPageSearch?num=1" + "&searchType="
				+ searchType + "&keyword=" + keyword;
	};
</script>
</html>
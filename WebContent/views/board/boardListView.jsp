<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view/board/boardListView</title>
<style type="text/css">
.outer {
	width: 800px;
	height: 500px;
	background: rgba(255, 255, 255, 0.4);
	border: 5px solid white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#listArea {
	text-align: center;
}

.tableArea {
	width: 650px;
	height: 350px;
	margin-left: auto;
	margin-right: auto;
}

th {
	border-bottom: 1px solid grey;
}

.pagingArea button {
	border-radius: 15px;
	background: #D5D5D5;
}

.searchArea {
	margin-right: 50px;
}

.searchArea button {
	background: #D1B2FF;
	border-radius: 5px;
	color: white;
	width: 80px;
	heigth: 25px;
	text-align: center;
}

button:hover {
	cursor: pointer;
}

#numBtn {
	background: #B2CCFF;
}

#choosen {
	background: #FFD8D8;
}

#listArea {
	margin: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="outer">
		<br>
		<h2 align="center">게시판</h2>
		<div class="tableArea">
			<table id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<tr>
					<%
						if (list.isEmpty()) {
					%>
					<td colspan="6">조회된 리스트가 없습니다.</td>
					<%
						} else {
					%>
					<%
						for (Board b : list) {
					%>
				</tr>
				<tr>
					<td><%=b.getbId()%><input type="hidden"
						value="<%=b.getbId()%>"></td>
					<td><%=b.getCategory()%></td>
					<td><%=b.getbTitle()%></td>
					<td><%=b.getbWriter()%></td>
					<td><%=b.getbCount()%></td>
					<td><%=b.getModifyDate()%></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>

			</table>
		</div>

		<!-- 페이징 -->
		<div class="pagingArea" align="center">
			<%
				if (!list.isEmpty()) {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=1'">&lt;&lt;</button>
			<!--  맨 처음으로 -->
			<button id="beforeBtn"
				onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=currentPage - 1%>'">&lt;</button>
			<script>
				if (<%=currentPage%> <= 1) {
					$('#beforeBtn').attr("disabled", "true");
				}
			</script>
			<!--  이전 페이지로-->
			<!--  10개 페이지 목록-->
			<%
				for (int p = startPage; p <= endPage; p++) {
			%>
			<%
				if (p == currentPage) {
			%>
			<button id="choosen" disabled><%=p%></button>
			<%
				} else {
			%>
			<button id="numBtn"
				onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
			%>
			<%
				}
			%>
			<!-- 다음 페이지로 -->
			<button id="afterBtn"
				onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=currentPage + 1%>'">&gt;</button>
			<script type="text/javascript">
				if(<%=currentPage%> >= <%=maxPage%>){
					$('#afterBtn').attr('disabled','true');
				}
			</script>
			<!-- 맨 끝으로 -->
			<button
				onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=maxPage%>'">&gt;&gt;</button>

			<%
				}
			%>
			<div class="searchArea" align="right">
				<%
					if (loginUser != null) {
				%>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<script>
      $(function(){
         $('#listArea td').mouseenter(function(){
            $(this).parent().css({'background':'pink', 'cursor': 'pointer'});
         }).mouseout(function(){
            $(this).parent().css('background','none');
         }).click(function(){
            var bid = $(this).parent().children().children('input').val();
            <%if (loginUser != null) {%>
            location.href= "<%=request.getContextPath()%>/detail.bo?bid=" + bid;
	<%} else {%>
		alert("회원만 이용할 수 있는 서비스 입니다.");
	<%}%>
		});
		})
	</script>
</body>
</html>
<%@page import="himedia.dao.EmailVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%
//	Servlet으로부터 전달한 list 객체 얻어오기
List<EmailVo> list = null;
if (request.getAttribute("list") instanceof List){	//	전달받은 'list'가 List인지 확인
	list = (List<EmailVo>)request.getAttribute("list");	//	다운캐스팅
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일링 리스트:메인</title>
<script>
	function confirmDel(no){
		if(confirm('정말 삭제하시겠습니까?')){
			window.location.href = "/el?a=delete?no="+no;
		} else{
			
		}
	}
</script>
</head>
<body>
	<h1>메일링 리스트</h1>
	<h3>모델2 방식</h3>
	
	<%for (EmailVo vo : list) {
	%>
	<!-- 리스트 -->
	<!-- vo 객체의 getter를 이용, 리스트를 표시 -->
	<table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<th>성</th>
			<td><%=vo.getLastName() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=vo.getFirstName() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=vo.getEmail() %></td>
		</tr>
		
	</table>
	
	<form method = "post">
	<a href= 'edit.jsp?no='><button id= sss>수정</button></a>
	<button onclick="confirmDel(<%=vo.getNo() %>)" id = del>삭제</button>
	</form>
	
	<br />
	<%
	}
	%>
<!-- /end -->

	<p>
	<!-- ContextPath 받아와서 form.jsp에 링크 -->
		<a href="<%= request.getContextPath()%>/el?a=form">추가 이메일 등록</a>
	</p>

</body>
</html>
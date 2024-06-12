<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmailVo"%>
<%@page import="java.util.List"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>

<%
//	db 접속 정보를 위해 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일링 리스트:메인</title>
<script>
	function confirmDel(no){
		if(confirm('정말 삭제하시겠습니까?')){
			window.location.href = "delete.jsp?no="+no;
		} else{
			
		}
	}
</script>
</head>
<body>
	<h1>메일링 리스트</h1>
	<h3>모델1 방식</h3>
	
<%
/*
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";

try {
	//	드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//	데이터 베이스 연결
	Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
	//	Statement 생성
	Statement stmt = conn.createStatement();
	//SQL 실행
	String sql = "SELECT * from emaillist order by created_at desc";
	ResultSet rs = stmt.executeQuery(sql);
	
	while (rs.next()){
		String no= rs.getString("no");
	*/
	EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);
	List<EmailVo> list = dao.getList();
	
	for(EmailVo vo : list){
		
%>

	<!-- 리스트 -->
	<!-- vo 객체의 getter를 이용, 리스트를 표시 -->
	<table border="1" cellpadding="5" cellspacing="2">
		<tr>
			<th>성</th>
			<td><%--= rs.getString("last_name") --%><%=vo.getLastName() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%--= rs.getString("first_name") --%><%=vo.getFirstName() %></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%--= rs.getString("email") --%><%= vo.getEmail() %></td>
		</tr>
		
	</table>
	<p>
	<a href= 'edit.jsp?no=<%--=no--%><%=vo.getNo()%>'><button id= sss>수정</button></a>
	<button onclick="confirmDel(<%--=no --%><%=vo.getNo()%>)" id = del>삭제</button>
	</p>
	<br />
<!-- /end -->
<%
	}
/*
	}
	
	rs.close();
	stmt.close();
	conn.close();
} catch (ClassNotFoundException e){
	throw new ClassNotFoundException("드라이버를 찾을 수 없습니다.");
}catch (Exception e) {
	throw e;
}
*/
%>
	<p>
	<!-- ContextPath 받아와서 form.jsp에 링크 -->
		<a href="<%= request.getContextPath()%>/emaillist//form.jsp">추가 이메일 등록</a>
	</p>

</body>
</html>
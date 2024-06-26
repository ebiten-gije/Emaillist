<%@page import="himedia.dao.EmailVo"%>
<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");

String no = request.getParameter("no");
Long num = Long.parseLong(no);

EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);
EmailVo vo = dao.searchNo(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하는 페이지</title>
</head>
<body>
	<h1>수정하는 페이지</h1>
	<table>
		<tr>
			<th>성</th>
			<td><%=vo.getLastName() %></td>
			<td><button>여기를 수정?</button></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=vo.getFirstName() %></td>
			<td><button>여기를 수정?</button></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%= vo.getEmail() %></td>
			<td><button>여기를 수정?</button></td>
		</tr>
	</table>
</body>
</html>
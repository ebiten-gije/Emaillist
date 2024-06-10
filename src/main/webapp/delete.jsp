<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
ServletContext cont = getServletContext();

String dbuser = cont.getInitParameter("dbuser");
String dbpass = cont.getInitParameter("dbpass");

//	폼 입력 데이터
String no = request.getParameter("no");
Long num = Long.parseLong(no);

EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);

boolean success = dao.delete(num);

if (success){
	response.sendRedirect(request.getContextPath());
} else {

/*
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	//	드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//	커넥션 얻기
	Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
	
	//	sql 실행 계획
	String sql = "delete from emaillist where no = ?";
	
	//	PreparedStatement
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//	데이터 바인딩
	pstmt.setString(1, no);

	
	int deletedCount = pstmt.executeUpdate();	//	영향 받은 레코드 카운트
	
	if(deletedCount == 1){	//	insert 성공
		//	다른 페이지로 리다이렉트: 3xx
		response.sendRedirect(request.getContextPath());
	} else {*/
		%>
		<h1>Error</h1>
		<p>뭔가 오류가 있나봐</p>
		<%
		
	}
		/*
	}
	
	//	자원 정리
	pstmt.close();
	conn.close();
	
} catch(Exception e){
	throw e;
}*/
%>
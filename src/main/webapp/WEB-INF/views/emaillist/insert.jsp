<%@page import="himedia.dao.EmaillistDaoOracleImpl"%>
<%@page import="himedia.dao.EmaillistDao"%>
<%@page import="himedia.dao.EmailVo"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//	데이터 베이스 접속 정보 확인
ServletContext cont = getServletContext();

String dbuser = cont.getInitParameter("dbuser");
String dbpass = cont.getInitParameter("dbpass");

//	폼 입력 데이터
String firstName = request.getParameter("fn");
String lastName = request.getParameter("ln");
String email = request.getParameter("email");

EmailVo vo = new EmailVo(lastName, firstName, email);
EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);

boolean success = dao.insert(vo);

if(success){
	response.sendRedirect(request.getContextPath() + "/emaillist");
} else {
	


/*
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	//	드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//	커넥션 얻기
	Connection conn = DriverManager.getConnection(dburl, dbuser, dbpass);
	
	//	sql 실행 계획
	String sql = "insert into emaillist (no, last_name, first_name, email) values(seq_emaillist_pk.nextval, ?, ?, ?)";
	
	//	PreparedStatement
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//	데이터 바인딩
	pstmt.setString(1, lastName);
	pstmt.setString(2, firstName);
	pstmt.setString(3, email);
	
	int insertedCount = pstmt.executeUpdate();	//	영향 받은 레코드 카운트
	
	if(insertedCount == 1){	//	insert 성공
		//	다른 페이지로 리다이렉트: 3xx
		response.sendRedirect(request.getContextPath());
	} else {
		*/%>
		<h1>Error</h1>
		<p>뭔가 오류가 있나봐</p>
		<%/*
	}
	
	//	자원 정리
	pstmt.close();
	conn.close();
	
} catch(Exception e){
	throw e;
}
*/
}
%>

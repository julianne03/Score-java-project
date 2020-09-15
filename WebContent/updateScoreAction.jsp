<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="Student.StudentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>
<jsp:useBean id="student" class="Student.Student" scope="page"/>
<jsp:setProperty name="student" property="hakbun"/>
<jsp:setProperty name="student" property="userPassword"/>
<jsp:setProperty name="student" property="userName"/>
<jsp:setProperty name="student" property="korean"/>
<jsp:setProperty name="student" property="math"/>
<jsp:setProperty name="student" property="social"/>
<jsp:setProperty name="student" property="science"/>
<jsp:setProperty name="student" property="english"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%  
		
		if(student.getHakbun()==0 || student.getUserPassword()==null || student.getUserName()==null || 
			student.getKorean()==0 || student.getMath()==0 || student.getSocial()==0 ||
			student.getScience()==0 || student.getEnglish()==0) {
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다. ')");
			script.println("history.back()"); //전 페이지로 돌려보내기
			script.println("</script>");
		} else {
			StudentDAO studentDAO=new StudentDAO();
			int result = studentDAO.update(student);
			
			if(result == -1) { //아이디 중복했을 때
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생했습니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			}
			else{ 
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('성적이 수정 되었습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
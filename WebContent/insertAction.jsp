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
		String userID=null;
		if(session.getAttribute("userID")!=null) {
			userID=(String) session.getAttribute("userID");
		}
		
		if(student.getHakbun()==0 || student.getUserName()==null || student.getUserPassword()==null ||
			student.getKorean()==0 || student.getMath()==0 || student.getSocial()==0 || 
			student.getScience()==0 || student.getEnglish()==0) {
			
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 항목이 존재합니다.')");
				script.println("history.back()"); 
				script.println("</script>");
		} else {
			
			StudentDAO studentDAO=new StudentDAO();
			int result = studentDAO.insert(student);

			
			if(result == -1) { //학번 중복되었을 때
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('이 학번의 학생의 성적은 이미 입력되어 있습니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			}
			else{ 
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('성적이 입력되었습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
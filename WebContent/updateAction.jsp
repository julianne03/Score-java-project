<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");  %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userSt"/>
<jsp:setProperty name="user" property="userAge"/>
<jsp:setProperty name="user" property="hakbun"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%  
		String userID=null;
		if(session.getAttribute("userID")!=null) {
			userID=(String) session.getAttribute("userID");
		}
		if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null || 
			user.getUserSt()==null || user.getUserAge()==0 || user.getHakbun()==0) {
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다. ')");
			script.println("history.back()"); //전 페이지로 돌려보내기
			script.println("</script>");
		} else {
			UserDAO userDAO=new UserDAO();
			int result= userDAO.update(user);
			
			if(result == -1) { //아이디 중복했을 때
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			}
			else{ 
				session.setAttribute("userID",user.getUserID());
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원 정보가 수정 되었습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
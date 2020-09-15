<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import="user.UserDAO" %>
   <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("userID")==null) {
			response.sendRedirect("main.jsp");
		} else {
			String userID=request.getParameter("userID");
			String userPassword=request.getParameter("userPassword");
			
			UserDAO userDAO=new UserDAO();
			int result=userDAO.delete(userID, userPassword);
			
			if(result==-1) {
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('ID 또는 비밀번호가 맞지 않습니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			} else {
				session.invalidate();
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원 탈퇴 되셨습니다.')");
				script.println("location.href='main.jsp'"); 
				script.println("</script>");
				
			}
		}
	
	%>
</body>
</html>
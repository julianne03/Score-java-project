<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="Student.StudentDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="student" class="Student.Student" scope="page" />
<jsp:setProperty name="student" property="hakbun" />
<jsp:setProperty name="student" property="userPassword" />
<jsp:setProperty name="student" property="korean" />
<jsp:setProperty name="student" property="math" />
<jsp:setProperty name="student" property="social" />
<jsp:setProperty name="student" property="science" />
<jsp:setProperty name="student" property="english" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:{background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>

</head>
<body>
	<%
		StudentDAO studentDAO=new StudentDAO();
		int result =studentDAO.select(student.getHakbun(),student.getUserPassword());
		student=studentDAO.myScore(student.getHakbun());
		if (result == 1) { //로그인 성공한 경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성적표 페이지로 넘어갑니다. ')");
			script.println("</script>");
			
	%>
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>국어</th>
				<th>수학</th>
				<th>사회</th>
				<th>과학</th>
				<th>영어</th>
				<th>합계</th>
				<th>평균</th>
			</tr>
			<tr>
				<td><%=student.getHakbun() %></td>
				<td><%=student.getUserName() %></td>
				<td><%=student.getKorean() %></td>
				<td><%=student.getMath() %></td>
				<td><%=student.getSocial() %></td>
				<td><%=student.getScience() %></td>
				<td><%=student.getEnglish() %></td>
				<td><%=student.getKorean()+student.getMath()+student.getSocial()+student.getScience()+student.getEnglish() %></td>
				<td><%=(student.getKorean()+student.getMath()+student.getSocial()+student.getScience()+student.getEnglish())/5 %></td>
			
			</tr>
		</table>
	
	
	<% 
			
			
		} else if (result == 0) { //비밀번호가 틀린경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다. ')");
			script.println("history.back()"); //전 페이지로 돌려보내기
			script.println("</script>");
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 학번입니다. ')");
			script.println("history.back()"); //전 페이지로 돌려보내기
			script.println("</script>");
		} else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다. ')");
			script.println("history.back()"); //전 페이지로 돌려보내기
			script.println("</script>");
		}
	%>
</body>
</html>
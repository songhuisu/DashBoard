<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="project.Bbs"%>
<%@ page import="project.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>진도관리 프로그램</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("bbsID"));
	
		//dao 연결 후 
		BbsDAO dao = new BbsDAO();
		
		int r = dao.delete(id);
		
		//r의 조건
		
		if(r == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제 성공')");
			script.println("location.href ='project.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>
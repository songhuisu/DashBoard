<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="project.Bbs"%>
<%@ page import="project.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resource/css/bootstrap.min.css">
<link rel="stylesheet" href="./Resource/css/mdb.min.css">
<title>진도관리 프로그램</title>
</head>
<body>
	
	<%
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsStartDate = request.getParameter("bbsStartDate");
		String bbsLastDate = request.getParameter("bbsLastDate");
		String bbsContent = request.getParameter("bbsContent");
		int bbsPercent = Integer.parseInt(request.getParameter("bbsPercent"));
				
		BbsDAO dao = new BbsDAO();
		
		int r = dao.update(bbsID, bbsTitle, bbsContent, 
				bbsPercent, bbsStartDate, bbsLastDate);
		
		System.out.println("결과" + r);
		if(r == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정 성공')");
			script.println("location.href = 'project.jsp'");
			script.println("</script>");
					
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>

</body>
</html>
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
<title>�������� ���α׷�</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("bbsID"));
	
		//dao ���� �� 
		BbsDAO dao = new BbsDAO();
		
		int r = dao.delete(id);
		
		//r�� ����
		
		if(r == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�� ���� ����')");
			script.println("location.href ='project.jsp'");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�� ������ �����߽��ϴ�')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>
<%@page import="user.UserDAO"%>
<%@page import="user.User"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.Bbs"%>
<%@ page import="project.BbsDAO"%>
<%!String jid;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./Resource/css/bootstrap.min.css">
<link rel="stylesheet" href="./Resource/css/mdb.min.css">

<title>진도관리 프로그램</title>



<style>
.form-group1 {
	width: 700px;
	clear: both;
}
/* input{
    width: 50px;
    float: left;
} */
#progressBar {
	width: 400px;
	float: left;
	height: 23px;
}
</style>
</head>
<body>


	<%
		String jid = null;

		if (session.getAttribute("inId") != null) {

			jid = (String) session.getAttribute("inId");

		}

		if (jid == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('로그인을 하세요.')");

			script.println("location.href = login.jsp'");

			script.println("</script>");

		}

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글입니다..')");

			script.println("location.href = bbs.jsp'");

			script.println("</script>");

		}
		System.out.println("게시판 번호 : " + bbsID);
		Bbs bbs = new BbsDAO().getSelectedData(bbsID);
		User user = new User();
	%>
	<!-- header -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.jsp"> <img
				src="Resource/image/logo.png" width="120" height="50"
				class="d-inline-block align-top" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="fullcalendar.jsp">일정 추가</a></li>
					<li class="nav-item"><a class="nav-link" href="project.jsp">프로젝트
							추가</a></li>
				</ul>
				<ul class="navbar-nav ml-auto nav-flex-icons">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="Resource/image/user.png">
					</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-default"
							aria-labelledby="navbarDropdownMenuLink-333">
							<a class="dropdown-item" href="login.jsp">login</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</header>
	<br />
	<br />


	<div class="container">
		<form method="post" action="changeAction.jsp">


			<div class="form-group"
				style="background-color: #eeeeee; text-align: center; height: 50px; line-height: 50px">
				프로젝트 수정</div>
			<div class="form-group row">
				<label for="inputtitle" class="col-sm-2 col-form-label">프로젝트
					제목</label>
				<div class="col-sm-10">
					<input type="hidden" name="bbsID" value=<%=bbsID%>> <input
						type="title" class="form-control" id="inputtitle" name="bbsTitle"
						value="<%=bbs.getBbsTitle()%>">
				</div>
			</div>
			<div class="form-group row">
				<div class="md-form col-sm-6">
					<input type="date" name="bbsStartDate" id="inputMDEx"
						class="form-control" value="<%=bbs.getBbsStartDate()%>"> <label
						for="inputMDEx">시작일</label>
				</div>
				<div class="md-form col-sm-6">
					<input type="date" name="bbsLastDate" id="inputMDEx"
						class="form-control" value="<%=bbs.getBbsLastDate()%>"> <label
						for="inputMDEx">마감일</label>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">프로젝트 내용</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					name="bbsContent" rows="3"><%=bbs.getBbsContent()%>
               </textarea>
			</div>

			<label for="inputprogress" class="col-form-label">진행률</label>
			
			<div class="form-group1">
				<progress id="progressBar" value="0.1" max="1"></progress>
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="bbsPercent"
					id="myvalue" value="<%=bbs.getBbsPercent()%>" />
			</div>
			<br> 
			
			<input type="submit" class="btn btn-primary pull-right"
				value="수정"> 
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="deleteAction.jsp?bbsID=<%=bbsID%>"
				class="btn btn-primary pull-right">삭제</a>
		</form>
	</div>

	<!-- Footer -->
	<footer class="bg-light py-3 fixed-bottom">
		<div class="container">
			<div class="small text-center text-muted">Copyright &copy; 2019
				- PlanB</div>
		</div>
	</footer>


	<script type="text/javascript">
		document.getElementById('progressBar')
		.addEventListener(
						'click',
						function(e) {
							var x = e.pageX - this.offsetLeft;
							var startPos = document
									.getElementById('progressBar').position;
							var xconvert = x / 400;
							var finalx = (xconvert).toFixed(2);
							document.getElementById('progressBar').value = finalx;

							document.getElementById('myvalue').value = finalx * 100;
						});
	</script>



	<script type="text/javascript" src="Resource/js/jquery-3.4.0.min.js"></script>
	<script type="text/javascript" src="Resource/js/bootstrap.js"></script>
	<script type="text/javascript" src="Resource/js/mdb.min.js"></script>
	<script type="text/javascript"
		src="/scripts/bootstrap-datetimepicker.*js"></script>

</body>
</html>
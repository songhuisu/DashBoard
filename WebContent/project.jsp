<%@page import="project.Bbs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!String jid;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="Resource/css/bootstrap.min.css">
<link rel="stylesheet" href="Resource/css/mdb.min.css">
<link rel="stylesheet" href="Resource/css/bootstrap-datetimepicker.min">
<title>진도관리 프로그램</title>
</head>
<body>
	<!-- header -->
	<header>
		<header>
		<%
			jid = (String) session.getAttribute("inId");
		%>
		<%
			if (jid != null) {
		%>

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
						href="calendar.jsp">일정 추가</a></li>
					<li class="nav-item"><a class="nav-link" href="project.jsp">프로젝트
							추가</a></li>
				</ul>

				<ul class="navbar-nav ml-auto nav-flex-icons">
					<a class="nav-link"><%=jid%>님 안녕하세요</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="Resource/image/user11.png">
					</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-default"
							aria-labelledby="navbarDropdownMenuLink-333">
							
							<a class="dropdown-item" href="logout.jsp">logout</a>
						</div></li>
				</ul>
			</div>
			<%
				} else {
			%>
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
					<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정
								추가</a></li>
						<li class="nav-item"><a class="nav-link" href="project.jsp">프로젝트
								추가</a></li>
					</ul>

					<ul class="navbar-nav ml-auto nav-flex-icons">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="Resource/image/user11.png">
						</a>
							<div class="dropdown-menu dropdown-menu-right dropdown-default"
								aria-labelledby="navbarDropdownMenuLink-333">
								
								<a class="dropdown-item" href="login.jsp">login</a>
							</div></li>
					</ul>
					<%
						}
					%>
				
			</nav>
	</header>

	<br />
	<br />

	<div class="container">
		<table class="table table-hover">
			<form>
				<thead>
					<tr>
						<!-- <th scope="col">
							<div>
								<input type="checkbox" id="th_checkAll" name="checkAll"
									onclick="checkAll();" />
							</div>
						</th> -->
						<th scope="col">번호</th>
						<th scope="col">프로젝트명</th>
						<th scope="col">내용</th>
						<th scope="col">진행률</th>
						<th scope="col">시작일</th>
						<th scope="col">마감일</th>
						
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO uploadBbs = new BbsDAO();

						ArrayList<Bbs> upload = uploadBbs.upload();

						for (int i = 0; i < upload.size(); i++) {
							Bbs up = upload.get(i);

							System.out.println(up);
					%>
					<tr>
						<td><%=up.getBbsID()%></td>
						<td><%=up.getBbsTitle()%></td>
						<td><a href="change.jsp?bbsID=<%=up.getBbsID()%>"><%=up.getBbsContent()%></a></td>
						<td><%=up.getBbsPercent()%></td>
						<td><%=up.getBbsStartDate()%></td>
						<td><%=up.getBbsLastDate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</form>
		</table>

		<a href="write.jsp" class="btn btn-primary btn-sm pull-right">프로젝트
			추가</a>

	</div>

	<hr>

	<!-- Footer -->
	<footer class="bg-light py-3 fixed-bottom">
		<div class="container">
			<div class="small text-center text-muted">Copyright &copy; 2019
				- PlanB</div>
		</div>
	</footer>


	<script type="text/javascript" src="Resource/js/jquery-3.4.0.min.js"></script>
	<script type="text/javascript" src="Resource/js/bootstrap.js"></script>
	<script type="text/javascript" src="Resource/js/mdb.min.js"></script>
	<script type="text/javascript"
		src="Resource/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="Resource/js/bootstrap-datetimepicker.ko.js"></script>

</body>
</html>
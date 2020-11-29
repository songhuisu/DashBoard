<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%!String jid;%>
<%@ page import="project.BbsDAO"%>
<%@ page import="project.Bbs"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>

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
		<%
			jid = (String) session.getAttribute("inId");

			BbsDAO dao2 = new BbsDAO();
			Bbs bbs2 = new Bbs();
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
					<li class="nav-item"><a class="nav-link" href="calendar.jsp">일정
							추가</a></li>
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
				<%
					Bbs bbs = new Bbs();

						BbsDAO dao = new BbsDAO();

						ArrayList<Bbs> arr = new ArrayList<Bbs>();

						arr = dao.Chart_data(jid);

						String str = "<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>";
						str += "<script type='text/javascript'>";
						str += "google.charts.load('current', {packages:['corechart']});";
						str += "google.charts.setOnLoadCallback(drawChart);";
						str += "function drawChart() {";
						str += "var data = google.visualization.arrayToDataTable([";
						str += "['Task', 'Hours per Day'],";

						for (int i = 0; i < arr.size(); i++) {
							str += "['" + arr.get(i).getBbsTitle() + "'," + arr.get(i).getBbsPercent() + "],";
						}

						str += "]);";

						str += "var options = {";
						str += "title: 'My Daily Activities',";
						str += "is3D: true,";
						str += "};";

						str += "var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));";
						str += "chart.draw(data, options);";
						str += "}";
						str += "</script>";

						PrintWriter p = response.getWriter();
						p.write(str);
				%>

				<%
					Bbs bbss = new Bbs();

						BbsDAO daoo = new BbsDAO();

						ArrayList<Bbs> data3 = new ArrayList<Bbs>();

						data3 = dao2.Chart_data(jid);

						String str2 = "<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>";
						str2 += "<script type='text/javascript'>";
						str2 += "google.charts.load('current', {packages: ['corechart', 'bar']});";
						str2 += "google.charts.setOnLoadCallback(drawBasic);";
						str2 += "function drawBasic() {";
						str2 += "var data = google.visualization.arrayToDataTable([";
						str2 += "['work', 'progress'],";

						for (int i = 0; i < data3.size(); i++) {
							str2 += "['" + data3.get(i).getBbsTitle() + "'," + data3.get(i).getBbsPercent() + "],";
						}

						str2 += "]);";

						str2 += "var options = {";
						str2 += "title: 'My Daily Activities',";
						str2 += "chartArea: {width: '50%'},";
						str2 += "hAxis: { ";
						str2 += " title: 'Total Population',";
						str2 += " minValue: 0";
						str2 += "},";
						str2 += "vAxis: { ";
						str2 += "title: '' ";
						str2 += "}";
						str2 += "};";

						str2 += " var chart = new google.visualization.BarChart(document.getElementById('chart_div'));";
						str2 += "chart.draw(data, options);";
						str2 += "}";
						str2 += "</script>";

						PrintWriter p1 = response.getWriter();
						p1.write(str2);
				%>
			</div>
		</nav>
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
		<div class="row">
			<div class="col-sm">
				<div id="piechart_3d"></div>
			</div>
			<div class="col-sm">
				<div id="chart_div"></div>
			</div>
		</div>

	</div>

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
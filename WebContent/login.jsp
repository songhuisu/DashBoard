<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<title>�α��� ȭ��</title>
</head>
<body>

	<form action="UserLogin" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<h5 class="card-title text-center">�α���</h5>

							<div class="form-label-group">
								<input type="text" name="inId" class="form-control"
									placeholder="���̵� �Է��� �ּ���." required autofocus> <br>
							</div>

							<div class="form-label-group">
								<input type="password" name="inPass" class="form-control"
									placeholder="��й�ȣ�� �Է��� �ּ���." required> <br>
							</div>

							<input class="btn btn-lg btn-dark btn-block text-uppercase"
								type="submit" value="�α���">

							<hr class="my-4">


							<div class="card-title text-center">
								<h6>
									<a href="#">���̵�/��й�ȣ ã��</a>
								</h6>
							</div>
							<div class="card-title text-center">
								<h6>
									<a href="join.jsp">ȸ������</a>
								</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>


</body>
</html>
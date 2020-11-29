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
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<title>ȸ������ ȭ��</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">ȸ������</h5>
						<form action="Userjoin" method="post">
							<!-- form class="form-label-group"-->
							<div class="form-label-group">
								<input type="text" name="inId" class="form-control"
									placeholder="���̵� �Է�" required autofocus> <br />
							</div>

							<div class="form-label-group">
								<input type="password" name="inPass" class="form-control"
									placeholder="��й�ȣ�� �Է�" required>
							</div>

							<br>
							<div class="form-label-group">
								<input type="password" name="inRePass" class="form-control"
									placeholder="��й�ȣ ���Է�" required>
							</div>

							<br>
							<div class="form-label-group">
								<input type="text" name="inName" class="form-control"
									placeholder="�̸��� �Է�" required>
							</div>
		
							<br>
							<div class="form-label-group">
								<label for="inputEmail">�̸���</label> <input type="text"
									name="inEmail" class="form-control" placeholder="�̸��� �Է�"
									required autofocus>
							</div>
							<hr class="my-4">

							<div>
								<input class="btn btn-lg btn-dark btn-block text-uppercase"
									type="submit" value="�����ϱ�" onclick="join_click();">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function join_click() {
			alert("ȸ�������� �Ϸ�Ǿ����ϴ�!");

		}
	</script>

</body>

</html>
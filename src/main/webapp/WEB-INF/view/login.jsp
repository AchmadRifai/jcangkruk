<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
	<head>
		<title>Login Karyawan</title>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<style>body{padding-top: 60px;background-color: black;}</style>
		<link href="<c:url value="css/bootstrap.css"/>" rel="stylesheet" />
		<link href="<c:url value="css/login-register.css"/>" rel="stylesheet" />
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
		<script src="<c:url value="js/jquery-1.10.2.js"/>" type="text/javascript"></script>
		<script src="<c:url value="js/bootstrap.js"/>" type="text/javascript"></script>
		<script src="<c:url value="js/login-register.js"/>" type="text/javascript"></script>
	</head>
	<body>
		<div class="container bg-dark">
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal()">MASUK</a>
				</div>
				<div class="col-sm-4"></div>
			</div>
			<div class="modal fade login" id="loginModal">
				<div class="modal-dialog login animated">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
							<h4 class="modal-title">Login With</h4>
						</div>
						<div class="modal-body">
							<div class="box">
								<div class="content">
									<div class="form loginBox">
										<form method="POST" action="login" accept-charset="UTF-8">
											<input id="user" class="form-control" type="text" placeholder="User" name="user">
											<input id="pass" class="form-control" type="password" placeholder="Password" name="pass">
											<input class="btn btn-default btn-login" type="submit" value="Login">
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="alert alert-${kode}" role="alert">${pesan}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				openLoginModal()
			})
		</script>
	</body>
</html>

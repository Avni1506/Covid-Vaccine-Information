<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h1 style="color: black; text-align: center;">Covid / Vaccine Information</h1>
	<img align="left" src="images/adminlogin.png" height="300px"
		width="400px">
	<div class="login">
		<form action="adminLogin" method="post">
			<div>
				<table>
					<tr>
						<td>Username</td>
						<td><input type="text" size="20" name="uname"></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td>Password</td>
						<td><input type="password" size="20" name="pass"></td>
					</tr>
				</table>
			</div>
			<div style="text-align: left">
				<input type="submit" value="Login">
			</div>
		</form>
	</div>
</body>
</html>
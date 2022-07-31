<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NOTE</title>
<%@include file="js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>This is an Add note page!</h1>

		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Title</label> <input
                                    name="title"
					required type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea
                                    name="content"
                                    required id="content" placeholder="Enter your content"
					class="form-control" style="min-height: 300px">
</textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn blue " style="width: 15rem">Add</button>
			</div>
		</form>
	</div>
</body>
</html>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Search Response</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>	
	<div class="jumbotron text-center">
		<h2>Search response</h2>
	</div>
	<div class="row justify-content-center">
		<div class="col-sm-4">
			<table class="table table-hover table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col" class="text-center">Repository Name</th>
						<th scope="col" class="text-center">File Name</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="entry" items="${output}">
					<tr>
						<td><c:out value="${entry.key}" /></td>
						<td><ul><c:forEach items="${entry.value}" var="fileDetails">
							<li><a href='${fileDetails.url}'>${fileDetails.fileName}</a></li>
						</c:forEach></ul></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>
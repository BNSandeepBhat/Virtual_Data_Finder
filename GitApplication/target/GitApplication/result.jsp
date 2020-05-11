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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

<style>
table, th, td {
	border: 1px solid black;
}

body {
	margin-bottom: 50px;
}

.footer {
	position: fixed;
	flex: 0 0 50px;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #0d94d2;
	color: black;
	text-align: center;
	margin-top: 50px;
}

.center {
	position: relative;
	width: 50%;
	right: 110px;
	margin: auto;
	top: 25px;
}

.para {
	position: relative;
	width: 50%;
	right: 90px;
	margin: auto;
}

#Nav a {
	color: #f2f2f2;
	text-decoration: none;
}

#Nav a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
</head>

<script>
var repoName = "<%=request.getAttribute("repositoryName")%>";
var keyword = "<%=request.getAttribute("keyValue")%>";
	var str = 'Search results for '
	if (repoName != null && repoName != "") {
		str = str + "Repository Name: " + repoName + " and ";
	}
	str = str + " Keyword: " + keyword;

	window.onload = function() {
		document.getElementById("p1").innerHTML = str;
	};
	
	// Basic example
	$(document).ready(function() {
		$('#resultTable').DataTable({
			"pagingType" : "simple" // "simple" option for 'Previous' and 'Next' buttons only
		});
		$('.dataTables_length').addClass('bs-select');
	});
</script>
<body>
	<div class="jumbotron text-center"
		style="background: #0d94d2; height: 130px;">
		<img src="images/Cerner.png" height="100" width="200"
			class="rounded float-left" alt="..."
			style="position: relative; left: 10px; bottom: 55px;" />
		<h1 style="position: relative; right: 80px; bottom: 30px">Test Data Finder (TDF)</h1>

		<nav id="Nav" style="position: relative; right: 490px; bottom: 20px;">
		<ul>
			<li><a href="home.jsp"><b>Test Data Finder (TDF)</b></a>
				&emsp;&emsp;|&emsp;&emsp;<a href="scriptHome.jsp"><b>Preference
						Finder</b></a>
		</ul>
		</nav>
	</div>
	<p id="p1" style="font-size: 20px;" class="para"></p>
	<div class="center">
		<div class="col-sm-4">
			<table id="resultTable"
				class="table table-hover table-striped table-sm"
				style="width: 1000px;">
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
							<td><ul>
									<c:forEach items="${entry.value}" var="fileDetails">
										<li><a href='${fileDetails.url}'>${fileDetails.fileName}</a></li>
									</c:forEach>
								</ul></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div></div>
	<div class="footer">
		<h6>Copyright © 2020 Cerner Corporation. All rights reserved.</h6>
	</div>
</body>
</html>
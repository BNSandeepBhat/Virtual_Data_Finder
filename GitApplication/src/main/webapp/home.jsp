<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
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
</head>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #0d94d2;
	color: black;
	text-align: center;
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
	<div class="row justify-content-center">
		<div class="col-sm-4" style="position: relative; right: 70px;">
			<form action="JsonSearchServlet" method="POST"
				onsubmit="return myFunction()">
				<div class="form-group">
					<label for="repoNamelabel"><b>Repository Name</b></label> <input
						type="text" class="form-control" name="repoName" id="repoName"
						aria-describedby="repoNameHelp"
						placeholder="Enter a valid Repository Name"
						style="padding: 15px 20px; border-width: 1px; border-color: black;">
				</div>
				<div class="form-group">
					<label for="keywordlabel"><b>Keyword</b></label> <input type="text"
						class="form-control" name="keyword" id="keyword"
						placeholder="Enter a valid String to search"
						style="padding: 15px 20px; border-width: 1px; border-color: black;">
				</div>


				<button type="submit" class="btn btn-primary"
					style="background: #0d94d2">Search</button>
			</form>
		</div>
	</div>
	<script>
		function myFunction() {
			var keyword = document.getElementById("keyword").value;
			if (keyword === '') {
				alert("Please enter a keyword to search.");
				return false;
			}
			return true;
		}
	</script>
	<div class="footer">
		<h6>Copyright © 2020 Cerner Corporation. All rights reserved.</h6>
	</div>
</body>
</html>
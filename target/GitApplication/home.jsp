<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>


<div class="jumbotron text-center">
  <h1>Virtual Data Finder</h1>
</div>
    <div class="row justify-content-center">
      <div class="col-sm-4">
        <form action="JsonSearchServlet" method="POST" onsubmit="return myFunction()">
          <div class="form-group">
            <label for="repoNamelabel">Repo Name</label>
            <input type="text" class="form-control" name="repoName" id="repoName" aria-describedby="repoNameHelp" placeholder="Enter a valid Repository Name">
          </div>
          <div class="form-group">
            <label for="keywordlabel">Keyword</label>
            <input type="text" class="form-control" name="keyword" id="keyword" placeholder="Enter a valid String to search">
          </div>


          <button type="submit" class="btn btn-primary">Search</button>
        </form>
      </div>  
    </div>    
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
</body>
</html>
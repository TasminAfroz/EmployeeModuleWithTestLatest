<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" name="viewport"
	content="text/html, charset=ISO-8859-1, width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Employees</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"
	integrity="sha384-bsGkvB1NLsaPUZL6GG0N5H9GOW9DK6KiHrrDvO57EJXoD9H3gzlohtuPENw9/24L"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
</head>
<body>
	<nav id="main-menu" class="navbar navbar-expand-lg navbar-light">
	<!-- <a class="navbar-brand" href="#">Navbar</a> --> <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> --> <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link" href="#">Employees</a>
		</li>
	</ul>
	<!-- </div> --> </nav>

	<main>
	<div class="container-fluid">
		<div class="row">
			<aside class="col bg-1 border-right"> <a href="#"
				class="logo"> <img src="/img/logo.png" alt="Logo">
			</a>

			<ul class="nav flex-column sub-menu">
				<li class="nav-item"><a class="nav-link active" href="#">Employees</a>
				</li>
			</ul>
			</aside>
			<div class="col-md-10 p-0 bg-1">
				<header class="py-2 px-3 section-header">
				<h1>Employees</h1>
				</header>
				<div class="px-3">
					<div class="row justify-content-between">
						<div class="col-4">
							<a href="/employee/create" type="button" class="btn btn-sm btn-purple">Create</a>
						</div>
						<div class="col-2 align-items-center text-center">
							<span id="paginate_info"></span>
							<div class="btn-group btn-group-sm" role="group"
								aria-label="Basic example">
								<button id="paginate_left" type="button" class="btn btn-sm btn-offwhite border">
									<img src="/img/arrow_left.svg" alt="Previous">
								</button>
								<button id="paginate_right" type="button" class="btn btn-sm btn-offwhite border">
									<img src="/img/arrow_right.svg" alt="Next">
								</button>
							</div>
						</div>
					</div>
				</div>

				<table id="employee-table"
					class="border-top table table-striped table-hover" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Name</th>
							<th>Work Phone</th>
							<th>Work Email</th>
							<th>Department</th>
							<th>Job Title</th>
							<th>Manager</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	</main>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"
		integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"
		integrity="sha384-Z9D45cp3elqajO+xEyjRTIK1Gr3eYsXiyCPIKNog1sIQzpo2fqFDqFdADGiJjzOv"
		crossorigin="anonymous"></script>
    <script type="text/javascript" src="/js/jquery.spring-friendly.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1, width=device-width, initial-scale=1, shrink-to-fit=no">
<title>New Employee</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
</head>
<!-- <form action=""  modelAttribute="employee">   -->
<body>

	<nav id="main-menu" class="navbar navbar-expand-lg navbar-light">
	<!-- <a class="navbar-brand" href="#">Navbar</a> --> <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> --> <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link" href="/employee/list">Employee</a>
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
				<li class="nav-item"><a class="nav-link active" href="/employee/list">Employees</a>
				</li>
			</ul>
			</aside>
			<div class="col-md-10 p-0">
				<header class="bg-1 py-2 px-3 mb-3 border-bottom section-header">
				<h1>
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/employee/list">Employees</a></li>
						<li class="breadcrumb-item active" aria-current="page">
							<c:choose>
								<c:when test="${ employee.name != null }">${ employee.name }</c:when>
								<c:otherwise>New</c:otherwise>
							</c:choose>
						</li>
					</ol>
					</nav>
				</h1>

				<section> 
					<c:choose>
						<c:when test="${ employee.name != null }">
							<a href="#" type="button" id="submit-form" class="btn btn-sm btn-purple">Edit</a> 
							<a href="/employee/create" type="button" id="discard-form" class="btn btn-sm btn-light">Create</a>
						</c:when>
						<c:otherwise>
							<a href="#" type="button" id="submit-form" class="btn btn-sm btn-purple">Save</a> 
							<a href="/employee/list" type="button" id="discard-form" class="btn btn-sm btn-light">Discard</a>
						</c:otherwise>
					</c:choose>
					 
				</section> 
				</header>

				<div class="row justify-content-md-center">
					<div class="col-md-10">
						<div class="card mb-3">
							<form action="" id="form-new-employee" class="card-body">
								<div class="row justify-content-between mb-3">
									<div class="col-auto">
										<div class="row justify-content-start">
											<div class="col-auto">
												<img class="img-responsive"
													src="http://via.placeholder.com/100x100" alt="">
											</div>

											<div class="col-auto">
												<h6 for="name">Name</h6>
												<div class="form-group">
													<input type="text" class="form-control form-control-lg"
														id="name" placeholder="Employee's Name" required>
												</div>
												<select class="form-control" name="work_time" id="work_time" required>
													<option value="part_time">Part Time</option>
													<option value="full_time">Full Time</option>
												</select>
											</div>
										</div>
									</div>

									<!-- <div class="col-auto">
										<a href="#" class="btn btn-sm btn-purple">Active</a>
									</div>  -->
								</div>

								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="public-info-tab" data-toggle="tab" href="#public-info"
										role="tab" aria-controls="public-info" aria-selected="true">Public
											Information</a></li>
									<li class="nav-item"><a class="nav-link"
										id="personal-info-tab" data-toggle="tab" href="#personal-info"
										role="tab" aria-controls="personal-info" aria-selected="false">Personal
											Information</a></li>
								</ul>

								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="public-info"
										role="tabpanel" aria-labelledby="public-info-tab">
										<div class="row">
											<div class="col">
												<h5 class="color-1">Contact Information</h5>
												<div class="form-group row">
													<label for="address" class="col-sm-4 col-form-label">Working
														Address</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															id="working_address" required>
															<option value="company_1">Company 1</option>
															<option value="company_2">Company 2</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="mobile" class="col-sm-4 col-form-label">Work
														Mobile</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
															id="mobile" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="location" class="col-sm-4 col-form-label">Work
														Location</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="location" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="email" class="col-sm-4 col-form-label">Work
														Email</label>
													<div class="col-sm-8">
														<input type="email" class="form-control form-control-sm"
															id="email" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="phone" class="col-sm-4 col-form-label">Work
														Phone</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
															id="work_phone">
													</div>
												</div>
											</div>

											<div class="col">
												<h5 class="color-1">Position</h5>
												<div class="form-group row">
													<label for="department" class="col-sm-4 col-form-label">Department</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='department' id="department" required>
															<c:forEach var="department" items="${departmentList}">
																<option value="${department.id}">${department.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="job-title" class="col-sm-4 col-form-label">Job
														Title</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='jobTitle' id="jobTitle" required>
															<c:forEach var="jobTitle" items="${jobTitleList}">
																<option value="${jobTitle.id}">${jobTitle.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="manager" class="col-sm-4 col-form-label">Manager</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='employee_for_manager' id="employee_for_manager">
															<option value="">Select a manager</option>
															<c:forEach var="employee" items="${employeeList}">
																<option value="${employee.employeeId}">${employee.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="coach" class="col-sm-4 col-form-label">Coach</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='employee_for_coach' id="employee_for_coach">
															<option value="">Select a coach</option>
															<c:forEach var="employee" items="${employeeList}">
																<option value="${employee.employeeId}">${employee.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<textarea class="form-control" id="other" rows="3"
												placeholder="Other Information"></textarea>
										</div>
									</div>
									<div class="tab-pane fade" id="personal-info" role="tabpanel"
										aria-labelledby="personal-info-tab">
										<div class="row">
											<div class="col">
												<h5 class="color-1">Citizenship &amp; Other Information</h5>

												<div class="form-group row">
													<label for="country" class="col-sm-4 col-form-label">Country</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='country' id="country" required>
															<c:forEach var="country" items="${countryList}">
																<option value="${country.id}">${country.countryName}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="id-no" class="col-sm-4 col-form-label">Identification
														No</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="id-no" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="passport-no" class="col-sm-4 col-form-label">Passport
														No</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="passport-no">
													</div>
												</div>

												<div class="form-group row">
													<label for="bank-acc-no" class="col-sm-4 col-form-label">Bank
														Account <br>Nnumber
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="bank-acc-no">
													</div>
												</div>

												<h5 class="color-1">Status</h5>

												<div class="form-group row">
													<label for="gender" class="col-sm-4 col-form-label">Gender</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm" id="gender" required>
															<option value="male">Male</option>
															<option value="female">Female</option>
															<option value="other">Other</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="maritial-status"
														class="col-sm-4 col-form-label">Maritial Status</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															id="maritial-status">
															<option value="single">Single</option>
															<option value="married">Married</option>
															<option value="other">Other</option>
														</select>
													</div>
												</div>
											</div>

											<div class="col">
												<h5 class="color-1">Contact Information</h5>
												<div class="form-group row">
													<label for="home-address" class="col-sm-4 col-form-label">Home
														Address</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="home-address" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="dob" class="col-sm-4 col-form-label">Date
														of Birth</label>
													<div class="col-sm-8">
														<input type="date" class="form-control form-control-sm"
															id="dob" required>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<input id="hidden-submit-form" type="submit" hidden />
							</form>
						</div>
					</div>
				</div>
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
	<script src="/js/createEmployee.js"></script>



</body>
<!-- </form> -->
</html>








<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" http-equiv="Content-Type"
	content="text/html, charset=ISO-8859-1, width=device-width, initial-scale=1, shrink-to-fit=no">

<c:if test="${ employee.name != null }"><title>Update Employee</title></c:if>
<c:if test="${ employee.name == null }"><title>New Employee</title></c:if>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
</head>
<!-- <form action=""  modelAttribute="employee">   -->
<body  oncontextmenu="return false">

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
							<form action="" id="form-new-employee" class="card-body" enctype="multipart/form-data">
							<c:if test="${ employee.name != null }">
							<input type="text" id="emp_id" name="employeeId" value="${ employee.employeeId }" hidden>
							</c:if>
							
								<div class="row justify-content-between mb-3">
									<div class="col-auto">
										<div class="row justify-content-start">
											<div class="col-auto">
											<div class="row">
												<input type='file' id="up_img" name="_photo"  accept="image/*"/>
											</div>
											<div class="row">
											<input type="text" id="is_new_img" value="0" name="is_new_img" hidden>
											<c:choose>
											<c:when test="${ employee.photo == null }">
												<img class="img-responsive"
													src="http://via.placeholder.com/100x100" alt="" id="profile_img">
											</c:when>
											<c:otherwise>
												<img class="img-responsive"
													src="/api/employee/image/${ employee.employeeId }" alt="" id="profile_img">
											</c:otherwise>
											</c:choose>
											</div>
											</div>

											<div class="col-auto">
												<h6 for="name">Name</h6>
												<div class="form-group">
													<input type="text" class="form-control form-control-lg" name="name"
														id="name" placeholder="Employee's Name" value="${ employee.name }" required>
												</div>
												<select class="form-control" name="workTime" id="work_time" required>
													<option value="part_time" <c:if test="${ employee.workTime == 'part_time' }">selected</c:if>>Part Time</option>
													<option value="full_time" <c:if test="${ employee.workTime == 'full_time' }">selected</c:if>>Full Time</option>
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
															id="working_address" name="workingAddress" required>
															<option value="company_1" <c:if test="${ employee.workingAddress == 'company_1' }">selected</c:if>>Company 1</option>
															<option value="company_2" <c:if test="${ employee.workingAddress == 'company_2' }">selected</c:if>>Company 2</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="mobile" class="col-sm-4 col-form-label">Work
														Mobile</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm" name="workMobile"
														placeholder="11-13 digits' number"	id="mobile" value="${ employee.workMobile }"  min="1000000000" max="9999999999999"   required>
													</div>
												</div>

												<div class="form-group row">
													<label for="location" class="col-sm-4 col-form-label">Work
														Location</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="location" name="workLocation" value="${ employee.workLocation }" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="email" class="col-sm-4 col-form-label">Work
														Email</label>
													<div class="col-sm-8">
														<input type="email" class="form-control form-control-sm" name="workEmail"
															id="email" value="${ employee.workEmail }" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="phone" class="col-sm-4 col-form-label">Work
														Phone</label>
													<div class="col-sm-8">
														<input type="number" class="form-control form-control-sm"
														placeholder="5-15 digits' number"	name="workPhone" id="work_phone" value="${ employee.workPhone }" min="10000" max="999999999999999" required>
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
																<option value="${department.id}" <c:if test="${ employee.department.id == department.id }">selected</c:if>>${department.name}</option>
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
																<option value="${jobTitle.id}" <c:if test="${ employee.jobTitle.id == jobTitle.id }">selected</c:if>>${jobTitle.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="manager" class="col-sm-4 col-form-label">Manager</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='manager' id="employee_for_manager">
															<option value="">Select a manager</option>
															<c:forEach var="_employee" items="${employeeList}">
																<c:if test="${_employee.employeeId != employee.employeeId }">
																	<option value="${_employee.employeeId}" <c:if test="${ _employee.employeeId == employee.manager.employeeId }">selected</c:if>>${_employee.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="coach" class="col-sm-4 col-form-label">Coach</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															name='coach' id="employee_for_coach">
															<option value="" selected>Select a coach</option>
															<c:forEach var="_employee" items="${employeeList}">
																<c:if test="${_employee.employeeId != employee.employeeId }">
																	<option value="${_employee.employeeId}" <c:if test="${ _employee.employeeId == employee.coach.employeeId }">selected</c:if>>${ _employee.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="form-group">
											<textarea class="form-control" id="other" rows="3" name="otherInfo"
												placeholder="Other Information">${ employee.otherInfo }</textarea>
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
															name='nationality' id="country" required>
															<c:forEach var="country" items="${countryList}">
																<option value="${country.id}" <c:if test="${ country.id == employee.nationality.id }">selected</c:if>>${country.countryName}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="id-no" class="col-sm-4 col-form-label">Identification
														No</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm" name="idNo"
															id="id-no" value="${ employee.idNo == null? '': employee.idNo}" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="passport-no" class="col-sm-4 col-form-label">Passport
														No</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm" name="passportNo"
															id="passport-no" value="${ employee.passportNo }">
													</div>
												</div>

												<div class="form-group row">
													<label for="bank-acc-no" class="col-sm-4 col-form-label">Bank
														Account <br>Nnumber
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control form-control-sm"
															id="bank-acc-no" name="accountNo" value="${ employee.accountNo }">
													</div>
												</div>

												<h5 class="color-1">Status</h5>

												<div class="form-group row">
													<label for="gender" class="col-sm-4 col-form-label">Gender</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm" id="gender" name="gender" required>
															<option value="male" <c:if test="${ emplpyee.gender == 'male' }">selected</c:if>>Male</option>
															<option value="female" <c:if test="${ emplpyee.gender == 'female' }">selected</c:if>>Female</option>
															<option value="other" <c:if test="${ emplpyee.gender == 'other' }">selected</c:if>>Other</option>
														</select>
													</div>
												</div>

												<div class="form-group row">
													<label for="maritial-status"
														class="col-sm-4 col-form-label">Maritial Status</label>
													<div class="col-sm-8">
														<select class="form-control form-control-sm"
															id="maritial-status" name="maritalStatus">
															<option value="single" <c:if test="${ employee.maritalStatus == 'single' }">selected</c:if>>Single</option>
															<option value="married" <c:if test="${ employee.maritalStatus == 'married' }">selected</c:if>>Married</option>
															<option value="other" <c:if test="${ employee.maritalStatus == 'other' }">selected</c:if>>Other</option>
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
														<input type="text" class="form-control form-control-sm" name="homeAddress"
															id="home-address" value="${ employee.homeAddress }" required>
													</div>
												</div>

												<div class="form-group row">
													<label for="dob" class="col-sm-4 col-form-label">Date
														of Birth</label>
													<div class="col-sm-8">
														<input type="date" class="form-control form-control-sm" name="dateOfBirth"
															id="dob" value="${ employee.dateOfBirth.toString().split(' ')[0] }" required>
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
		
	<script>
	$(document).ready(
			function() {
				//alert("${employee.name}");
				if("${employee.name}"){
					var form = document.getElementById("form-new-employee");
					var elements = form.elements;
					for (var i = 0, len = elements.length; i < len; ++i) {
					    elements[i].disabled = true;
					}
				}
				
				$('#up_img').on('change', function(event){
					// alert('hi');
					var input = this;
					if (input.files && input.files[0]) {
		                var reader = new FileReader();
		                reader.onload = function (e) {
		                	$('#is_new_img').val("1");
		                    $('#profile_img').prop('src', e.target.result);
		                };
		                reader.readAsDataURL(input.files[0]);
		            }
				});
			})
	</script>
	
	


</body>
<!-- </form> -->
</html>
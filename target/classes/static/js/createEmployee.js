/*$(document).ready(
				function() {
					// SUBMIT FORM
					$("#submit-form").click(function(event) {
						// Prevent the form from submitting via the browser.
						event.preventDefault();
						if($(this).text()=='Edit'){
							enable_form();
							$('#submit-form').text('Save');
							$('#discard-form').text('Discard');
							$('#discard-form').prop('href', '/employee/list');
						}else{
							$("#hidden-submit-form").trigger( "click" );
						}
					});
					
//					$("#discard-form").click(function(event) {
//						// Prevent the form from submitting via the browser.
//						event.preventDefault();
//						resetData();
//					});
					
					$("#form-new-employee").submit(function(event) {
						// Prevent the form from submitting via the browser.
						event.preventDefault();
						ajaxPost();
					});				

					function ajaxPost() {
						var dob = $("#dob").val();
//						dob = dob.split("-")[2] + "/" + dob.split("-")[1] + "/" + dob.split("-")[0] 
						// PREPARE FORM DATA
						
//						var formData = {
//							name : $("#name").val(),
//							workingAddress : $("#working_address").val(),
//							workLocation : $("#location").val(),
//							workMobile : $("#mobile").val(),
//							workEmail : $("#email").val(),
//							workPhone : $("#work_phone").val(),
//							otherInfo : $("#other").val(),
//							department : $("#department").val(),
//							jobTitle : $("#jobTitle").val(),
//							manager : $("#employee_for_manager").val(),
//							coach : $("#employee_for_coach").val(),
//							nationality : $("#country").val(),
//							idNo : $("#id-no").val(),
//							passportNo : $("#passport-no").val(),
//							accountNo : $("#bank-acc-no").val(),
//							gender : $("#gender").val(),
//							maritalStatus : $("#maritial-status").val(),
//							dateOfBirth : dob,
//							homeAddress : $("#home-address").val(),
//							workTime : $("#work_time").val(),
//							photo : $('#up_img').val()
//						}
						
						var objFormData = new FormData();
						objFormData.append('name' , $("#name").val());
						objFormData.append('workingAddress', $("#working_address").val());
						objFormData.append('workLocation', $("#location").val());
						objFormData.append('workMobile', $("#mobile").val());
						objFormData.append('workEmail' ,$("#email").val());
						objFormData.append('workPhone', $("#work_phone").val());
						objFormData.append('otherInfo', $("#other").val());
						objFormData.append('department', $("#department").val());
						objFormData.append('jobTitle', $("#jobTitle").val());
						objFormData.append('manager', $("#employee_for_manager").val());
						objFormData.append('coach', $("#employee_for_coach").val());
						objFormData.append('nationality', $("#country").val());
						objFormData.append('idNo', $("#id-no").val());
						objFormData.append('passportNo', $("#passport-no").val());
						objFormData.append('accountNo', $("#bank-acc-no").val());
						objFormData.append('gender', $("#gender").val());
						objFormData.append('maritalStatus', $("#maritial-status").val());
						objFormData.append('dateOfBirth', dob);
						objFormData.append('homeAddress', $("#home-address").val());
						objFormData.append('workTime', $("#work_time").val());
						
						var options = {								
								cache: false,
							    contentType: false,
							    processData: false,
//								dataType : 'json',
								success : function(result) {
									console.log(result);
									console.log("/employee/details/"+result);
									alert("Success");
									window.location = "/employee/details/"+result;
									disable_form();
									$('#submit-form').text('Edit');
									$('#discard-form').text('Create');
									$('#discard-form').prop('href', '/employee/create');
								},
								error : function(e) {
									alert("Error!")
									console.log("Error!")
									console.log(e);
								}
							}
						
						
//						var method = "POST";
						var method = "PUT";
						var api_url = "/api/employee/save";
						if($("#emp_id") && $("#emp_id").val()){
							objFormData.append('employeeId', $("#emp_id").val());
							method = "PUT";
							api_url = "/api/employee/update"
						}
						var objFile = null;
						if ($('#up_img')[0].files && $('#up_img')[0].files[0]) {
						    // GET FILE OBJECT 
						    objFile = $('#up_img')[0].files[0];						    
						}
						// APPEND FILE TO POST DATA
					    objFormData.append('photo', objFile);

//						console.log(objFile);

						// DO POST
					    options.type = method;
					    options.url = api_url;
					    options.data = objFormData;
					    console.log(options)
						$.ajax(options);
//					    $.post("/api/employee/save", objFormData, function(result){console.log(result)})

						// Reset FormData after Posting
//						$("#form-new-employee").get(0).reset();

					}
					
					
					
					
					
					
					function enable_form(){
						var form = document.getElementById("form-new-employee");
						var elements = form.elements;
						for (var i = 0, len = elements.length; i < len; ++i) {
						    elements[i].disabled = false;
						}	
					}
					
					function disable_form(){
						var form = document.getElementById("form-new-employee");
						var elements = form.elements;
						for (var i = 0, len = elements.length; i < len; ++i) {
						    elements[i].disabled = true;
						}	
					}
				})
				
	*/


'use strict';
$(document).ready(
				function() {
					// SUBMIT FORM
					$("#submit-form").click(function(event) {
						// Prevent the form from submitting via the browser.
						event.preventDefault();
						if($(this).text()=='Edit'){
							enable_form();
							$('#submit-form').text('Save');
							$('#discard-form').text('Discard');
							$('#discard-form').prop('href', '/employee/list');
						}else{
							$("#hidden-submit-form").trigger( "click" );
						}
					});
										
					$("#form-new-employee").submit(function(event) {
						// Prevent the form from submitting via the browser.
						event.preventDefault();
						ajaxPost();
					});				

					function ajaxPost() {
						var dob = $("#dob").val();
//						dob = dob.split("-")[2] + "/" + dob.split("-")[1] + "/" + dob.split("-")[0] 
						// PREPARE FORM DATA
						
						 $("#submit-form").prop("disabled", true);
						var options = {								
								cache: false,
							    contentType: false,
							    processData: false,
								enctype: "multipart/form-data",
								timeout: 600000,
								success : function(result) {
									$("#submit-form").prop("disabled", false);
									console.log("/employee/details/"+result);
									alert("Success");
									window.location = "/employee/details/"+result;
									disable_form();
									$('#submit-form').text('Edit');
									$('#discard-form').text('Create');
									$('#discard-form').prop('href', '/employee/create');
								},
								error : function(e) {
									$("#submit-form").prop("disabled", false);
									alert("Error!")
									console.log("Error: ", e);
								}
							}
						var method = "POST";
//						var method = "PUT";
						var api_url = "/api/employee/save";
						if($("#emp_id") && $("#emp_id").val()){
							method = "PUT";
							api_url = "/api/employee/update"
						}
						
						var form = $('#form-new-employee')[0];

					    var objFormData = new FormData(form);

						// DO POST
					    options.type = method;
					    options.url = api_url;
					    options.data = objFormData;
						$.ajax(options);

					}
					
					function enable_form(){
						var form = document.getElementById("form-new-employee");
						var elements = form.elements;
						for (var i = 0, len = elements.length; i < len; ++i) {
						    elements[i].disabled = false;
						}	
					}
					
					function disable_form(){
						var form = document.getElementById("form-new-employee");
						var elements = form.elements;
						for (var i = 0, len = elements.length; i < len; ++i) {
						    elements[i].disabled = true;
						}	
					}
				})
				
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
<meta  name="viewport" http-equiv="Content-Type" content="text/html; charset=ISO-8859-1;width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Employee Profile</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/main.css">
    </head>
    <body>
        <nav id="main-menu" class="navbar navbar-expand-lg navbar-light">
            <!-- <a class="navbar-brand" href="#">Navbar</a> -->
            <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> -->
                
            <!-- <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Employee</a>
                    </li>
                </ul>
            <!-- </div> -->
        </nav>

        <main>
            <div class="container-fluid">
                <div class="row">
                    <aside class="col bg-1 border-right">
                        <a href="#" class="logo">
                            <img src="/img/logo.png" alt="Logo">
                        </a>

                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Employees</a>
                            </li>
                        </ul>
                    </aside>
                    <div class="col-md-10 p-0">
                        <header class="bg-1 py-2 px-3 mb-3 border-bottom section-header">
                            <h1>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Employees</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                    </ol>
                                </nav>
                            </h1>

                            <section>
                                <a href="" type="button" class="btn btn-sm btn-purple">Edit</a>
                                <a href="/addnewemployee" type="button" class="btn btn-sm btn-light">Create</a>
                            </section>
                        </header>

                        <div class="row justify-content-md-center">
                            <div class="col-md-10">
                                <div class="card mb-3">
                                    <div id="form-new-employee" class="card-body employee-profile">
                                        <div class="row justify-content-between mb-3">
                                            <div class="col-auto">
                                                <div class="row justify-content-start">
                                                    <div class="col-auto">
                                                        <img class="img-responsive" src="http://via.placeholder.com/100x100" alt="">
                                                    </div>

                                                    <div class="col-auto">
                                                        <h6 for="name">Name</h6>
                                                        <h3>Jean-Pierre Carnaud</h3>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-auto">
                                                <a href="#" class="btn btn-sm btn-purple">Active</a>
                                            </div>
                                        </div>

                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="public-info-tab" data-toggle="tab" href="#public-info" role="tab" aria-controls="public-info" aria-selected="true">Public Information</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="personal-info-tab" data-toggle="tab" href="#personal-info" role="tab" aria-controls="personal-info" aria-selected="false">Personal Information</a>
                                            </li>
                                        </ul>

                                        <div class="tab-content" id="myTabContent">
                                            <div class="tab-pane fade show active" id="public-info" role="tabpanel" aria-labelledby="public-info-tab">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="color-1">Contact Information</h5>
                                                        <div class="form-group row">
                                                            <label for="address" class="col-sm-4 col-form-label">Working Address</label>
                                                            <div class="col-sm-6">
                                                                <p>Baridhara</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="mobile" class="col-sm-4 col-form-label">Work Mobile</label>
                                                            <div class="col-sm-8">
                                                                <p>+9989739</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="location" class="col-sm-4 col-form-label">Work Location</label>
                                                            <div class="col-sm-8">
                                                                <p>House No</p>
                                                            </div>    
                                                        </div>
                                                        
                                                        <div class="form-group row">
                                                            <label for="email" class="col-sm-4 col-form-label">Work Email</label>
                                                            <div class="col-sm-8">
                                                                <p>test@gmail.com</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="phone" class="col-sm-4 col-form-label">Work Phone</label>
                                                            <div class="col-sm-8">
                                                                <p>+98928u98</p>
                                                            </div>    
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <h5 class="color-1">Position</h5>
                                                        <div class="form-group row">
                                                            <label for="department" class="col-sm-4 col-form-label">Department</label>
                                                            <div class="col-sm-8">
                                                                <p>Management</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="job-title" class="col-sm-4 col-form-label">Job Title</label>
                                                            <div class="col-sm-8">
                                                                <p>Consultant</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="manager" class="col-sm-4 col-form-label">Manager</label>
                                                            <div class="col-sm-8">
                                                                <p></p>
                                                            </div>
                                                        </div>   

                                                        <div class="form-group row">
                                                            <label for="coach" class="col-sm-4 col-form-label">Coach</label>
                                                            <div class="col-sm-8">
                                                                <p></p>
                                                            </div>    
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="personal-info" role="tabpanel" aria-labelledby="personal-info-tab">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="color-1">Citizenship &amp; Other Information</h5>
                                                        <div class="form-group row">
                                                            <label for="nationality" class="col-sm-4 col-form-label">Nationality (Country)</label>
                                                            <div class="col-sm-8">
                                                                <p>Bangladesh</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="id-no" class="col-sm-4 col-form-label">Identification No</label>
                                                            <div class="col-sm-8">
                                                                <p>8212838203</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="passport-no" class="col-sm-4 col-form-label">Passport No</label>
                                                            <div class="col-sm-8">
                                                                <p>8279198023802380</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="bank-acc-no" class="col-sm-4 col-form-label">Bank Account <br>Nnumber</label>
                                                            <div class="col-sm-8">
                                                                <p>78912792132</p>
                                                            </div>    
                                                        </div>

                                                        <h5 class="color-1">Status</h5>

                                                        <div class="form-group row">
                                                            <label for="gender" class="col-sm-4 col-form-label">Gender</label>
                                                            <div class="col-sm-8">
                                                                <p>Male</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                                <label for="maritial-status" class="col-sm-4 col-form-label">Maritial Status</label>
                                                                <div class="col-sm-8">
                                                                    <p>Single</p>
                                                                </div>    
                                                            </div>
                                                    </div>

                                                    <div class="col">
                                                        <h5 class="color-1">Contact Information</h5>
                                                        <div class="form-group row">
                                                            <label for="home-address" class="col-sm-4 col-form-label">Home Address</label>
                                                            <div class="col-sm-8">
                                                                <p>Ban kasjsdj</p>
                                                            </div>    
                                                        </div>

                                                        <div class="form-group row">
                                                            <label for="dob" class="col-sm-4 col-form-label">Date of Birth</label>
                                                            <div class="col-sm-8">
                                                                <p>2018-02-20</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="/js/main.js"></script>
 
    </body>
</html>   


package com.bjit.controller.api;

import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bjit.model.Employee;
import com.bjit.repository.EmployeeRepository;
import com.bjit.service.EmployeeService;

@RestController
@RequestMapping("/api/employee")
public class RestEmployeeController {
	@Autowired
	EmployeeService employeeService;
	
//	@Autowired
	EmployeeRepository employeeRepository;
	
//	public RestEmployeeController() {
//    }
	
	public RestEmployeeController(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }
	
//	@JsonView(DataTablesOutput.View.class)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public DataTablesOutput<Employee> getUsers(@Valid DataTablesInput input) {
		System.out.println(employeeRepository.findAll(input));
		return employeeRepository.findAll(input);
	}
	
//	@RequestMapping(value = {"/save"}, method = RequestMethod.PUT)
//	public int create(@RequestParam(value = "photo", required = false) MultipartFile photo, @Valid Employee employee) throws IOException {
//		System.out.println("in");
////		employeeService.saveEmployee(employee);
//		if(photo != null && !photo.isEmpty()) 
//			employee.setPhoto(photo.getBytes());
//
//		employeeService.saveEmployee(employee);
//		// Create Response Object
////		Response response = new Response("Done", employee);
//		return employee.getEmployeeId();
//	}
	
	
	
	@RequestMapping(value = {"/save"}, method = RequestMethod.POST)
	public int create(@RequestParam(value = "_photo", required = false) MultipartFile photo, @Valid Employee employee) throws IOException {
		System.out.println("in");
//		employeeService.saveEmployee(employee);
		if(photo != null && !photo.isEmpty()) 
			employee.setPhoto(photo.getBytes());

		employeeService.saveEmployee(employee);
		// Create Response Object
//		Response response = new Response("Done", employee);
		return employee.getEmployeeId();
	}
	
	
//	
//	@RequestMapping(value = {"/update"}, method = RequestMethod.PUT)
//	public int update(@RequestParam(value = "photo", required = false) MultipartFile photo, @Valid Employee employee) throws IOException {
//		if(photo != null && !photo.isEmpty())
//            employee.setPhoto(photo.getBytes());
//
//		employeeService.saveEmployee(employee);
//		// Create Response Object
////		Response response = new Response("Done", employee);
//		return employee.getEmployeeId();
//	}
//	
	
	
	
	@RequestMapping(value = {"/update"}, method = RequestMethod.PUT)
	public int update(@RequestParam(value = "_photo", required = false) MultipartFile photo, 
			@Valid Employee employee, @RequestParam(value = "is_new_img", required = false) String isNewImg) throws IOException {
		System.out.println("isNewImg: "+isNewImg);
		if(isNewImg.equalsIgnoreCase("1") && photo != null && !photo.isEmpty())
            employee.setPhoto(photo.getBytes());
		else
			employee.setPhoto(employeeService.findById(employee.getEmployeeId()).getPhoto());

		employeeService.saveEmployee(employee);
		// Create Response Object
//		Response response = new Response("Done", employee);
		return employee.getEmployeeId();
	}
	
	
	
	@RequestMapping(value = {"/details/{id}"}, method = RequestMethod.GET)
	public Employee details(@PathVariable("id")int id) {
		
		// Create Response Object
//		Response response = new Response("Done", employee);
		return employeeService.findById(id);
	}
	
	@RequestMapping(value = "/image/{id}", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity<byte[]> getImage(@PathVariable("id") int id) throws IOException {

        Employee employee = employeeService.findById(id);
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);


        System.out.println("image returned");
        return new ResponseEntity<byte[]>(employee.getPhoto(), headers, HttpStatus.OK);
    }

	
}
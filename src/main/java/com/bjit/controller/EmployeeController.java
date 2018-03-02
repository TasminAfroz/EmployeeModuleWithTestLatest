package com.bjit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjit.model.Country;
import com.bjit.model.Department;
import com.bjit.model.Employee;
import com.bjit.model.JobTitle;
import com.bjit.repository.CountryRepository;
import com.bjit.repository.DepartmentRepository;
import com.bjit.repository.EmployeeRepository;
import com.bjit.repository.JobRepository;
import com.bjit.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	CountryRepository countryRepository;

	@Autowired
	DepartmentRepository departmentRepository;

	@Autowired
	JobRepository jobRepository;

	@Autowired
	EmployeeRepository employeeRepository;

	public EmployeeController(EmployeeService accountServiceMock) {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 * @param employee
	 * @param country
	 * @param model
	 * @return
	 */
//	@RequestMapping("/hi")
//	public String newPage(@ModelAttribute Employee employee, @ModelAttribute Country country, Model model) {
//		//
//		List<Country> countryList = (List<Country>) countryRepository.findAll();
//		for (int i = 0; i < 6; i++) {
//			System.out.println(countryList.get(i).getCountryName());
//		}
//		model.addAttribute("employee", new Employee());
//		model.addAttribute("countryList", countryList);
//		//
//
//		return "employeeForm";
//		// return "hi";
//	}

	@RequestMapping("/list")
	public String homePage() {
		return "homePage";
	}

	/**
	 * Show create form to create new employee
	 * 
	 * @param employee
	 * @param country
	 * @param model
	 * @return
	 */
	@RequestMapping("/create")
	public String employeeForm(@ModelAttribute Employee employee, Model model) {
		List<Country> countryList = (List<Country>) countryRepository.findAll();
		List<Employee> employeeList = (List<Employee>) employeeRepository.findAll();
		// List<Employee> managerList= coachList;
		List<Department> departmentList = (List<Department>) departmentRepository.findAll();
		List<JobTitle> jobTitleList = (List<JobTitle>) jobRepository.findAll();
		model.addAttribute("employee", new Employee());
		model.addAttribute("countryList", countryList);
		model.addAttribute("employeeList", employeeList);
		// model.addAttribute("managerList", employeeList);

		model.addAttribute("departmentList", departmentList);
		model.addAttribute("jobTitleList", jobTitleList);
		return "employeeForm";
	}

	@RequestMapping("/details/{id}")
	public String employeeDetails(@PathVariable("id") int id, Model model) {
		Employee employee = employeeRepository.findOne(id);
		if (employee == null) {
			return "redirect:/employee/create";
		}
		List<Country> countryList = (List<Country>) countryRepository.findAll();
		List<Employee> employeeList = (List<Employee>) employeeRepository.findAll();
		// List<Employee> managerList= coachList;
		List<Department> departmentList = (List<Department>) departmentRepository.findAll();
		List<JobTitle> jobTitleList = (List<JobTitle>) jobRepository.findAll();
		model.addAttribute("employee", employee);
		model.addAttribute("countryList", countryList);
		model.addAttribute("employeeList", employeeList);
		// model.addAttribute("managerList", employeeList);

		model.addAttribute("departmentList", departmentList);
		model.addAttribute("jobTitleList", jobTitleList);

		return "employeeForm";
	}

	// @RequestMapping("/hi")
	// public String newPage() {
	// return "employeeForm";
	// }
	//
	// @RequestMapping("/hi")
	// public String newPage() {
	// return "employeeForm";
	// }
}
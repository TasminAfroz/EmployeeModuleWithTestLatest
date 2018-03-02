package com.example;

import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bjit.controller.EmployeeController;
import com.bjit.model.Country;
import com.bjit.model.Department;
import com.bjit.model.Employee;
import com.bjit.model.JobTitle;
import com.bjit.repository.EmployeeRepository;
import com.bjit.service.EmployeeService;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasSize;
import static org.junit.Assert.assertNotNull;


@RunWith(SpringRunner.class)
public class StudentControllerTest {
	@Mock
	EmployeeService employeeService;

	@Mock
	Page limitPage;
	@Mock
	DataTablesInput dbInput;

	@Mock
	Employee employee;
	@Mock
	Country country;
	@Mock
	Department department;
	@Mock
	JobTitle job;

	@Mock
	ModelAttribute modelAttribute;

	@Mock
	Model model;

	MockMvc mockMvc;
	PageRequest limit;
	@InjectMocks
	EmployeeController employeeController;

	@Mock
	EmployeeRepository employeeRepository;

	private String showList = "http://localhost:8080/employee/list";

	private String saveEmployee = "http://localhost:8080/api/employee/save";

	private String updateEmployee = "http://localhost:8080/api/employee/update";

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.standaloneSetup(new EmployeeController(employeeService)).build();
	}

	@Test
	public void test_get_all_success() throws Exception {
		List<Employee> users = Arrays.asList(new Employee(1, "Daenerys Targaryen"), new Employee(2, "John Snow"));

		// Page<Employee> user =

		// when(employeeService.findAll(limit)).thenReturn((Page<Employee>) users);

		when(employeeRepository.findAll()).thenReturn((List<Employee>) users);

		mockMvc.perform(get("api/employee/list")).andExpect(status().isOk())
				.andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
				.andExpect(jsonPath("$", hasSize(2))).andExpect(jsonPath("$[0].employeeId", is(1)))
				.andExpect(jsonPath("$[0].name", is("Daenerys Targaryen")))
				.andExpect(jsonPath("$[1].employeeId", is(2))).andExpect(jsonPath("$[1].name", is("John Snow")));

		verify(employeeService, times(1)).findAll(limit);
		verifyNoMoreInteractions(employeeService);
	}

	@Test
	public void test_get_by_id_success() throws Exception {
		Employee user = new Employee(1, "Daenerys Targaryen");
		when(employeeService.findById(1)).thenReturn(user);
		
		mockMvc.perform(get("/api/employee/details/1")).andDo(MockMvcResultHandlers.print());
//		mockMvc.perform(get("http://localhost:8080/api/employee/details/{id}", 1)).andExpect(status().isOk())
//				.andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
//				.andExpect(jsonPath("$.employeeId", is(1))).andExpect(jsonPath("$.name", is("Daenerys Targaryen")));
//		verify(employeeService, times(1)).findById(1);
//		verifyNoMoreInteractions(employeeService);
	}
	
	
	
	

	// Checking the negative response for findById of resController
	@Test
	public void test_get_by_id_fail_404_not_found() throws Exception {
		when(employeeService.findById(1)).thenReturn(null);
		mockMvc.perform(get("/api/employee/details/{id}", 1)).andExpect(status().isNotFound());
		verify(employeeService, never()).findById(1);
		verifyNoMoreInteractions(employeeService);
	}

	// test employee creation
	@Test
	public void testSaveEmployee() {
		doNothing().when(employeeService).saveEmployee(employee);

	}

	@Test
	public void testFindAll() {
		doNothing().when(employeeService).findAll(limit);

	}

	// does "/employee/list" URL gets hitted
	@Test
	public void testHomePage() throws IOException {

		assertNotNull(employeeController.homePage());

	}

	// url to show list requestmapping get
	@Test
	public void testIfGet() throws Exception {
		// assertNotNull(mainController.InvoiceList(modelMock));
		mockMvc.perform(get(showList)).andExpect(status().isOk());
		// mockMvc.perform(post(saveEmployee)).andExpect(status().isOk());

	}

	// url t0 save epmloyee is requestmapping post
	@Test
	public void testIfPost() throws Exception {
		// assertNotNull(mainController.InvoiceList(modelMock));
		// mockMvc.perform(get(showList)).andExpect(status().isOk());
		mockMvc.perform(post(saveEmployee)).andExpect(status().isOk());

	}

	// url t0 update epmloyee is requestmapping put
	@Test
	public void testIfPut() throws Exception {
		// assertNotNull(mainController.InvoiceList(modelMock));
		// mockMvc.perform(get(showList)).andExpect(status().isOk());
		mockMvc.perform(put(updateEmployee)).andExpect(status().isOk());

	}

	@Test
	public void testEmployeeForm() throws IOException {
		model.addAttribute(country);
		model.addAttribute(department);
		model.addAttribute(job);
		model.addAttribute(employee);
		assertNotNull(employeeController.employeeForm(employee, model));

	}

	@Test
	public void TestEmployeeDetails() throws IOException {

		assertNotNull(employeeController.employeeDetails(2, model));

	}

	// @BeforeClass
	// public static void beforeLeaveRepositoryTest() {
	// leave = new Leave();
	//// invoice.getCustomer().setName("Test Customer");
	//// invoice.setStatus("Open");
	// leave.setCommentByManager("asdas");
	// leave.setLeaveId(1);
	// leave.setDescription("asd");
	// leave.setLeaveType("asd");
	// leave.setLeaveEndDate(new Date(333333));
	// leave.setLeaveStatus("abc");
	// leave.setLeaveStartDate(new Date(22222));
	// Employee emp = new Employee();
	// emp.setEmployeeId(1);
	// emp.setEmployeeName("Masud");
	// Department dept = new Department();
	// dept.setDepartment("Ict");
	// emp.setDepartment(dept);
	// leave.setEmployee(emp);
	//
	//
	// }
	//
	// @AfterClass
	// public static void afterLeaveRepositoryTest() {
	//
	// }

	@Test
	public void shouldGetEmployeeById() throws Exception {

		Employee user = new Employee(1, "Daenerys Targaryen");
		when(employeeService.findById(1)).thenReturn(user);
		// when(employeeService.findById((1)).thenReturn(user);
		//
		// Integer id = 1;
		// Leave leave1 = leaveRepo.findOne(id);
		// System.out.println(leave1);
		// System.out.println(leave);
		// assertEquals(leave, leave1);
	}

	@SuppressWarnings("unchecked")
	@Test
	public void shouldGetAllEmployee() throws Exception {
		
		
		  List<Employee> expected = new ArrayList<Employee>();
	        Page foundPage = new PageImpl<Employee>(expected);
		
	        
	        
	        when(employeeService.findAll(limit)).thenReturn(foundPage);

//	        List<Employee> actual = repository.findPersonsForPage(SEARCH_TERM, PAGE_INDEX);

		
//
//		Employee user = new Employee(1, "Daenerys Targaryen");
//
//		Employee user2 = new Employee(2, "Daeneryssss Targaryen");
		
		
		List<Employee> users = Arrays.asList(new Employee(1, "Daenerys Targaryen"), new Employee(2, "John Snow"));

//		when(employeeRepository.findAll()).thenReturn(users);
		
		
		when(employeeService.findAll(limit)).thenReturn((Page<Employee>) users);
		}
}


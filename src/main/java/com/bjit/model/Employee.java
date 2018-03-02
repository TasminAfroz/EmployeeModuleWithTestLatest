package com.bjit.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;

@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Entity
@Table(name = "employees")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "e_id")
	private int employeeId;
	
	@Lob
    @Column(name="photo", nullable = true)
    private byte[] photo;

	@JsonView(DataTablesOutput.View.class)
	@Column(name = "name")
	@NotEmpty(message = "Please provide employee's name")
	@Size(min=1, max=255) 
	private String name;

	@Column(name = "working_address")
	@NotEmpty(message = "Please provide employee's working address")
	private String workingAddress;

	@Column(name = "working_mobile")
//	@NotEmpty (message = "Please provide employee's working mobile number")
	@Pattern(regexp="(^$|[0-9]{11,13})")
	private String workMobile;

	@Column(name = "work_location")
//	@NotEmpty(message = "Please provide employee's working location")
	private String workLocation;
	
	@JsonView(DataTablesOutput.View.class)
	@Column(name = "work_email")
//	@NotEmpty  (message = "Please provide employee's email")
	@Email
	private String workEmail;

	@JsonView(DataTablesOutput.View.class)
	@Column(name = "work_phone")
//	@NotEmpty (message = "Please provide employee's working mobile number")
	@Pattern(regexp="(^$|[0-9]{5,15})", message="Please give number only")
	private String workPhone;
	
	
	@Column(name = "other_info")
	private String otherInfo;
	
	@JsonView(DataTablesOutput.View.class)
	@ManyToOne()
    @JoinColumn(name = "department_id", nullable = false)
//	@NotNull (message= "Please choose employee's department")
	private Department department;
	
	@JsonView(DataTablesOutput.View.class)
	@ManyToOne()
    @JoinColumn(name = "job_title_id", nullable = false)
//	@NotNull (message= "Please choose employee's job title")
	private JobTitle jobTitle;
	
//	@Column(name = "")
	@JsonView(DataTablesOutput.View.class)
	@ManyToOne()
    @JoinColumn(name = "manager_e_id", nullable = true)
	private Employee manager;

	@ManyToOne()
    @JoinColumn(name = "coach_e_id", nullable = true)
	private Employee coach;

	@ManyToOne()
    @JoinColumn(name = "country_id", nullable = false)
//	@NotNull (message= "Please choose employee's country")
	private Country nationality;

	@Column(name = "id_number")
//	@NotNull(message= "Please provide employee's ID number")
	private Integer idNo;
	
	@Column(name = "passport_no")
	private String passportNo;
	

	@Column(name = "account_no")
	private String accountNo;
	
	
//	@NotEmpty(message = "Please provide your gender")
	@Column(name = "gender")
	private String gender;

	@Column(name = "marrital_status")
	private String maritalStatus;

	@Column(name = "date_of_birth")
	@DateTimeFormat(pattern="yyyy-MM-dd")
//    @Past @NotNull(message= "Please provide employee's date of birth")
	private Date dateOfBirth;
	
	
//	@NotEmpty(message = "Please provide employee's home address")
	@Column(name = "home_address")
	private String homeAddress;
	
	@Column(name = "work_time")

//	@NotEmpty(message = "Please provide employee's work time")
	private String workTime;
//	
//	@Column(name = "other_info")
//	private Date otherInfo;

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public int getEmployeeId() {	
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWorkingAddress() {
		return workingAddress;
	}

	public void setWorkingAddress(String workingAddress) {
		this.workingAddress = workingAddress;
	}

	public String getWorkMobile() {
		return workMobile;
	}

	public void setWorkMobile(String workMobile) {
		this.workMobile = workMobile;
	}

	public String getWorkLocation() {
		return workLocation;
	}

	public void setWorkLocation(String workLocation) {
		this.workLocation = workLocation;
	}

	public String getWorkEmail() {
		return workEmail;
	}

	public void setWorkEmail(String workEmail) {
		this.workEmail = workEmail;
	}

	public String getWorkPhone() {
		return workPhone;
	}

	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}

	public String getOtherInfo() {
		return otherInfo;
	}

	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public JobTitle getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(JobTitle jobTitle) {
		this.jobTitle = jobTitle;
	}

	public Employee getManager() {
		return manager;
	}

	public void setManager(Employee manager) {
		this.manager = manager;
	}

	public Employee getCoach() {
		return coach;
	}

	public void setCoach(Employee coach) {
		this.coach = coach;
	}

	public Country getNationality() {
		return nationality;
	}

	public void setNationality(Country nationality) {
		this.nationality = nationality;
	}

	public Integer getIdNo() {
//		if(idNo == null) {
//			return 0;
//		}
		return idNo;
	}

	public void setIdNo(Integer idNo) {
		this.idNo = idNo;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	public Employee() {

	}


	public Employee(int employeeId, String name) {
		super();
		this.employeeId = employeeId;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", name=" + name + ", workingAddress=" + workingAddress
				+ ", workMobile=" + workMobile + ", workLocation=" + workLocation + ", workEmail=" + workEmail
				+ ", workPhone=" + workPhone + ", otherInfo=" + otherInfo + ", department=" + department
				+ ", jobTitle=" + jobTitle + ", manager=" + manager + ", coach=" + coach + ", nationality="
				+ nationality + ", idNo=" + idNo + ", passportNo=" + passportNo + ", accountNo=" + accountNo
				+ ", gender=" + gender + ", maritalStatus=" + maritalStatus + ", dateOfBirth=" + dateOfBirth
				+ ", homeAddress=" + homeAddress + "]";
	}

}

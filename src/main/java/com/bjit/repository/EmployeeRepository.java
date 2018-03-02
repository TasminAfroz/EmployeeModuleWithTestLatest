package com.bjit.repository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;

import com.bjit.model.Employee;

@Repository("employeeRepository")
public interface EmployeeRepository extends DataTablesRepository<Employee, Integer>  {

    Employee findByName(String name);
}

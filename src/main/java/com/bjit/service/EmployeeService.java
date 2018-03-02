package com.bjit.service;

import java.awt.print.Pageable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.bjit.model.Employee;

public interface EmployeeService {
    void saveEmployee(Employee employee);

    void updateUser(Employee employee);

    Page<Employee> findAll(PageRequest limit);

    Employee findById(int id);

    Employee findByName(String name);

    Page<Employee> findAll(Pageable limit);
}

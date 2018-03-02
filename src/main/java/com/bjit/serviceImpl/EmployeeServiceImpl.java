package com.bjit.serviceImpl;


import java.awt.print.Pageable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.bjit.model.Employee;
import com.bjit.repository.EmployeeRepository;
import com.bjit.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

    @Qualifier("employeeRepository")
    @Autowired
    EmployeeRepository employeeRepository;


    @Override
    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    @Override
    public void updateUser(Employee employee) {
        employeeRepository.save(employee);

    }

    @Override
    public Page<Employee> findAll(PageRequest limit) {
        return employeeRepository.findAll(limit);
    }

//    @Override
//    public List<Employee> findAll() {
//        return employeeRepository.findAll();
//    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findOne(id);
    }

    @Override
    public Employee findByName(String name) {
        return  employeeRepository.findByName(name);

    }

    @Override
    public Page<Employee> findAll(Pageable limit) {
        return employeeRepository.findAll((org.springframework.data.domain.Pageable) limit);
    }


}

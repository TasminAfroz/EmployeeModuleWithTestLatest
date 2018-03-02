package com.bjit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bjit.model.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer>{

}

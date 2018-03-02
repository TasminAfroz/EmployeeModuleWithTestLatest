package com.bjit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bjit.model.JobTitle;

public interface JobRepository extends JpaRepository<JobTitle, Integer> {

}

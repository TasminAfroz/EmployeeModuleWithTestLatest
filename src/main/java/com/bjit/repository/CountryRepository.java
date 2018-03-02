package com.bjit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bjit.model.Country;

public interface CountryRepository extends JpaRepository<Country, Integer> {

}

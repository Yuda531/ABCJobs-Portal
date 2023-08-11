package com.abc.service;

import javax.transaction.Transactional;

import com.abc.model.Education;
import com.abc.repository.EducationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@Transactional
public class EducationService {

	@Autowired
	EducationRepository repo;
	
	
	public Education addEducations(Education ed) {
		return repo.save(ed);
	}

	public List<Education> getEducationByUserDetailsId(String udID) {
		return repo.getEducationByUserDetailsId(udID);
	}
	
}

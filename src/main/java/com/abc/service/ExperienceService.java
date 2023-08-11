package com.abc.service;

import javax.transaction.Transactional;

import com.abc.model.Experience;
import com.abc.repository.ExperienceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@Transactional
public class ExperienceService {

	@Autowired
	ExperienceRepository repo;
	
	
	public Experience addExperience(Experience ex) {
		return repo.save(ex);
	}

	public List<Experience> getExperienceByUserDetailsId(String udID) {
		return repo.getExperienceByUserDetailsId(udID);
	}
	
}

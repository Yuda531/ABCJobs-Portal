package com.abc.service;

import java.util.List;


import javax.transaction.Transactional;

import com.abc.model.UserDetails;
import com.abc.repository.UserDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class UserDetailsService {
	@Autowired
	UserDetailsRepository repo;
	
	public UserDetails register(UserDetails userDetails) {
		return repo.save(userDetails);
	}
	
	public String getDetailsById(String userId) {
		return repo.getDetailsById(userId);
	}

	public UserDetails findById(Long userId) {
		return repo.findById(userId).get();
	}


	public UserDetails editprofile(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		// update
		userDetails.setCity(ud.getCity());
		userDetails.setFirstName(ud.getFirstName());
		userDetails.setLastName(ud.getLastName());
		userDetails.setPhoneNumber(ud.getPhoneNumber());;
		
		// save
 		return repo.save(userDetails);
	}
	
	public List<UserDetails> searchByKey(String key) {
		return repo.searchByKey(key);
	}
	
	public List<UserDetails> getAllUserDetails() {
		return repo.findAll();
	}
	
	public UserDetails getDetailsById(Long id) {
		return repo.findById(id).get();
	}






}

package com.abc.repository;

import java.util.List;


import com.abc.model.Education;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface EducationRepository  extends JpaRepository<Education, Long> {
	
	@Query(value = "SELECT * FROM education WHERE user_details_id = :udID", nativeQuery = true)
	public List<Education> getEducationByUserDetailsId(@Param("udID") String udID);

}

package com.abc.repository;

import java.util.List;

import com.abc.model.Experience;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface ExperienceRepository extends JpaRepository<Experience, Long> {
	
	@Query(value = "SELECT * FROM experience WHERE user_details_id = :udID", nativeQuery = true)
	public List<Experience> getExperienceByUserDetailsId(@Param("udID") String udID);

}

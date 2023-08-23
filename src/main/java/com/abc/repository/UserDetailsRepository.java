package com.abc.repository;


import java.util.List;


import com.abc.model.UserDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetails, Long> {
	@Query(value = "SELECT user_details_id, first_name, last_name, city, phone_number FROM user_details"
			+ " JOIN users ON user_details.user_id = users.user_id"
			+ " WHERE users.user_id = :userId", nativeQuery = true)
	public String getDetailsById(@Param("userId") String userId);
	
	@Query(value = "SELECT * FROM user_details"
	 		+ " WHERE first_name LIKE %:key%"
	 		+ " OR last_name LIKE %:key%"
	 		+ " OR city LIKE %:key%", nativeQuery = true)
	public List<UserDetails> searchByKey(@Param("key") String key);
}

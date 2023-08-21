package com.abc.repository;




import com.abc.model.Jobs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobsRepository extends JpaRepository<Jobs, Long> {

    @Query(value = "SELECT * FROM jobs WHERE user_details_id = :udID", nativeQuery = true)
    public List<Jobs> getJobsByUserDetailsId(@Param("udID") String udID);

}

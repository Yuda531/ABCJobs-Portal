package com.abc.repository;

import com.abc.model.ApplyJob;
import com.abc.model.ForumThreads;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplyJobRepository extends JpaRepository<ApplyJob, Long> {

    @Query(value = "SELECT * FROM apply_job WHERE user_details_id = :udID", nativeQuery = true)
    public List<ApplyJob> getApplyJobByUserDetailsId(@Param("udID") String udID);

}

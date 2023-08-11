package com.abc.repository;

import com.abc.model.Education;
import com.abc.model.ForumThreads;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ForumThreadsRepository extends JpaRepository<ForumThreads, Long> {
    @Query(value = "SELECT * FROM forum_threads WHERE user_details_id = :udID", nativeQuery = true)
    public List<ForumThreads> getThreadsByUserDetailsId(@Param("udID") String udID);

}

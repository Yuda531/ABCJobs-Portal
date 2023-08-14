package com.abc.repository;

import com.abc.model.CommentThreads;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentThreadsRepository extends JpaRepository <CommentThreads, Long> {

    @Query(value = "SELECT * FROM comment_threads WHERE user_details_id = :udID", nativeQuery = true)
    public List<CommentThreads> getCommentThreadsByUserDetailsId(@Param("udID") String udID);

}

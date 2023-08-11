package com.abc.repository;

import com.abc.model.BulkEmail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface BulkEmailRepository extends JpaRepository<BulkEmail, Long> {

}

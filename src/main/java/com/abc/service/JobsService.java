package com.abc.service;


import com.abc.model.Jobs;
import com.abc.repository.JobsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class JobsService {

    @Autowired
    private JobsRepository jobsRepository;

    public void addJobs(Jobs jobs){
        jobs.setCreatedAt(LocalDateTime.now());
        jobsRepository.save(jobs);
    }

    public List<Jobs> getAllJobs(){
        return jobsRepository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"));
    }

    public Jobs getJobsById(Long jobsId){
        Optional<Jobs> jobsOptional = jobsRepository.findById(jobsId);
        return jobsOptional.orElse(null); // Return null if not found
    }

}

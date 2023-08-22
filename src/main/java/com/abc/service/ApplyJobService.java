package com.abc.service;


import com.abc.model.ApplyJob;
import com.abc.repository.ApplyJobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ApplyJobService {

    @Autowired
    private ApplyJobRepository applyJobRepository;

    public ApplyJob saveApplyJob(ApplyJob applyJob) {
        return applyJobRepository.save(applyJob);
    }

    public List<ApplyJob> getAllApplyJobs() {
        return applyJobRepository.findAll();
    }

    public ApplyJob getApplyJobById(Long apply_job_id){
        Optional<ApplyJob> applyJobOptional = applyJobRepository.findById(apply_job_id);
        return  applyJobOptional.orElse(null);
    }

    public void deleteApplyJob(Long applyJobId) {
        applyJobRepository.deleteById(applyJobId);
    }

}

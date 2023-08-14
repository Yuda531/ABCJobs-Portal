package com.abc.service;


import com.abc.model.CommentThreads;
import com.abc.repository.CommentThreadsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class CommentThreadsService {

    @Autowired
    private CommentThreadsRepository commentRepository;

    public void createComment(CommentThreads commentThreads){
        commentThreads.setDateComment(LocalDateTime.now());
        commentRepository.save(commentThreads);
    }

    public List<CommentThreads> getAllComment(){
        return commentRepository.findAll(Sort.by(Sort.Direction.DESC, "dateComment"));
    }


}

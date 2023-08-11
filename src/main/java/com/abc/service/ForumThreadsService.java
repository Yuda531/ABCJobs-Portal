package com.abc.service;

import com.abc.model.Education;
import com.abc.model.ForumThreads;
import com.abc.repository.ForumThreadsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class ForumThreadsService {
    @Autowired
    private ForumThreadsRepository threadRepository;

    public void createThread(ForumThreads forumThread) {
        forumThread.setCreatedAt(LocalDateTime.now());
        threadRepository.save(forumThread);
    }

    public List<ForumThreads> getAllPosts() {
        return threadRepository.findAll();
    }

}

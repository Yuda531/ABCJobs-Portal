package com.abc.service;

import com.abc.model.Education;
import com.abc.model.ForumThreads;
import com.abc.repository.ForumThreadsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

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
        return threadRepository.findAll(Sort.by(Sort.Direction.DESC, "createdAt"));
    }

    public ForumThreads getForumThreadById(Long threadId) {
        Optional<ForumThreads> forumThreadOptional = threadRepository.findById(threadId);
        return forumThreadOptional.orElse(null); // Return null if not found
    }

}

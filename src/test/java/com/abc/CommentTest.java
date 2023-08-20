package com.abc;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.time.LocalDateTime;

import com.abc.controller.DashboardController;
import com.abc.model.CommentThreads;
import com.abc.model.ForumThreads;
import com.abc.model.UserDetails;
import com.abc.repository.CommentThreadsRepository;
import com.abc.service.CommentThreadsService;
import com.abc.service.ForumThreadsService;
import com.abc.service.UserDetailsService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

class DashboardControllerTest {

    @Mock
    private CommentThreadsService commentThreadsService;

    @Mock
    private ForumThreadsService forumThreadsService;

    @Mock
    private UserDetailsService userDetailsService;

    @InjectMocks
    private DashboardController dashboardController;


    @Mock
    private CommentThreadsRepository commentThreadsRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    void testAddComment() {
        // Create mock data
        UserDetails userDetails = new UserDetails();
        userDetails.setUserDetailsId(12L);

        ForumThreads forumThread = new ForumThreads();
        forumThread.setThreadId(1L);

        CommentThreads comment = new CommentThreads();
        comment.setUserDetails(userDetails);
        comment.setParentForumThread(forumThread);
        comment.setDateComment(LocalDateTime.now());
        comment.setComment("Test comment");

        when(userDetailsService.getDetailsById(12L)).thenReturn(userDetails);
        when(forumThreadsService.getForumThreadById(1L)).thenReturn(forumThread);
        when(commentThreadsService.createComment(any())).thenReturn(comment);

        CommentThreads commentThreads = commentThreadsService.createComment(comment);

    }
}

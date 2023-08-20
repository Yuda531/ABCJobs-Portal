package com.abc;



import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.io.IOException;
import java.time.LocalDateTime;

import com.abc.repository.ForumThreadsRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.web.multipart.MultipartFile;

import com.abc.model.ForumThreads;
import com.abc.model.UserDetails;
import com.abc.service.ForumThreadsService;
import com.abc.service.UserDetailsService;

class ForumThreadsServiceTest {

    @Mock
    private ForumThreadsRepository threadRepository;

    @Mock
    private UserDetailsService userDetailsService;

    @InjectMocks
    private ForumThreadsService forumThreadsService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    void testCreateThread() throws IOException {
        // Create mock data
        UserDetails userDetails = new UserDetails();
        userDetails.setUserDetailsId(12L);

        ForumThreads forumThread = new ForumThreads();
        forumThread.setUserDetails(userDetails);
        forumThread.setBody("Test body");
        forumThread.setCreatedAt(LocalDateTime.now());

        MultipartFile imageFile = mock(MultipartFile.class);
        byte[] imageBytes = "test_image".getBytes();
        when(imageFile.isEmpty()).thenReturn(false);
        when(imageFile.getBytes()).thenReturn(imageBytes);

        // Mock behavior of dependencies
        when(userDetailsService.getDetailsById(12L)).thenReturn(userDetails);
        when(threadRepository.save(any())).thenReturn(forumThread);

        // Call the method being tested
        forumThreadsService.createThread(forumThread);

        // Verify that the repository method was called with the correct argument
        verify(threadRepository).save(forumThread);
    }
}

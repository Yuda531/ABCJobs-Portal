package com.abc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "forum_threads")
public class ForumThreads {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "thread_id")
    private Long threadId;

    @ManyToOne
    @JoinColumn(name = "user_details_id") // Menggunakan kolom user_details_id sebagai foreign key
    private UserDetails userDetails;

    @Column(name = "title")
    private String title;

    @Column(name = "body")
    private String body;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}

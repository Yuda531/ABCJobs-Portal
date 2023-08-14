package com.abc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.abc.utils.Base64Util;


import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

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


    @Column(name = "body")
    private String body;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "parentForumThread", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CommentThreads> commentThreads;



    public String getPostImageDataBase64() {
        return Base64Util.encodeBase64(this.image);
    }
}

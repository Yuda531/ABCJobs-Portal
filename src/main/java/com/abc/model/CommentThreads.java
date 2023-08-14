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
@Table(name = "comment_threads")
public class CommentThreads {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "comment_id")
    private Long commentId;

    @ManyToOne
    @JoinColumn(name = "user_details_id") // Menggunakan kolom user_details_id sebagai foreign key
    private UserDetails userDetails;

    @ManyToOne
    @JoinColumn(name = "thread_id") // Menggunakan kolom thread_id sebagai foreign key
    private ForumThreads parentForumThread; // Menambahkan relasi dengan ForumThreads


    @Column(name = "comment")
    private String comment;

    @Column(name = "date_comment")
    private LocalDateTime dateComment;


}

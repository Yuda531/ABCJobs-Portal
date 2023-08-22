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
@Table(name = "apply_job")
public class ApplyJob {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "apply_job_id")
    private Long applyJobId;

    @ManyToOne
    @JoinColumn(name = "user_details_id") // Menggunakan kolom user_details_id sebagai foreign key
    private UserDetails userDetails;

    @ManyToOne
    @JoinColumn(name = "jobs_id") // Menggunakan kolom jobs_id sebagai foreign key
    private Jobs jobs;

    // Tambahan atribut sesuai kebutuhan, seperti status apply, tanggal apply, dll.

    @Column(name = "created_at")
    private LocalDateTime createdAt;

}

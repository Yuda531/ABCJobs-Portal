package com.abc.model;


import com.abc.utils.Base64Util;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "jobs")
public class Jobs {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "jobs_id")
    private Long jobsId;

    @ManyToOne
    @JoinColumn(name = "user_details_id") // Menggunakan kolom user_details_id sebagai foreign key
    private UserDetails userDetails;


    private String companyName;
    private String jobsRole;
    private String jobsLocation;
    private String details;

    @Lob
    @Column(name = "image_company")
    private byte[] imageCompany;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public String getPostImageDataBase64() {
        return Base64Util.encodeBase64(this.imageCompany);
    }


}

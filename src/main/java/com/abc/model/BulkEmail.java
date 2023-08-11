package com.abc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "bulk_email")
public class BulkEmail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bulk_id")
	private Long bulkId;
	
	@Column(name = "send_by")
	private String sendBy;
	
	@Column(name = "email_subject")
	private String emailSubject;
	
	@Column(name = "email_body")
	private String emailBody;
	
	@Column(name = "created_at")
	private String createdAt;
	

}

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
@Table(name = "experience")
public class Experience {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "experience_id")
	private Long experienceId;
	
	
	@Column(name = "user_details_id")
	private String userDetailsId;
	
	
	@Column(name = "title")
	private String title;
	
	
	@Column(name = "company_name")
	private String companyName;


	@Column(name = "ex_start_date")
	private String ex_start_date;
	
	
	@Column(name = "ex_end_date")
	private String ex_end_date;
	


}

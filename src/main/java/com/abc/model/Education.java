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
@Table(name = "education")
public class Education {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "education_id")
	private Long educationId;
	
	
	@Column(name = "user_details_id")
	private String userDetailsId;
	
	
	@Column(name = "university")
	private String university;
	
	
	@Column(name = "majored")
	private String majored;


	@Column(name = "ed_start_date")
	private String ed_start_date;
	
	
	@Column(name = "ed_end_date")
	private String ed_end_date;
	

	

}

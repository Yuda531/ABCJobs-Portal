package com.abc.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user_details")
public class UserDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_details_id")
	private Long userDetailsId;
	
	@Column(name = "user_id")
	private String userId;
	
	@OneToOne(optional=false)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id", insertable=false, updatable=false)
	private Users user;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "phoneNumber")
	private String phoneNumber;
	

}

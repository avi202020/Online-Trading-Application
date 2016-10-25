package com.project.trading.pojo;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table; 


@Entity
@Table(name="User")
@Inheritance(strategy= InheritanceType.JOINED)
public class User {
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="userId",unique=true,nullable=false)
	private long userId;
	
	//@NotNull
	@Column(name="firstName")
	private String fName;
	
	@Column(name="Role")
	private String role;

	//@NotNull
	@Column(name="lastName")
	private String lName;
	
	//@NotNull
	@Column(name="emailId")
	private String eMailID;
	
	//@NotNull
	@Column(name="contact")
	private String contact;
	
	//@NotNull
	@Column(name="address")
	private String address;
	
	//@NotNull
	@Column(name="userName")
	private String userName;
	
	//@NotNull
	//@Size(min = 5)
	@Column(name="passWord")
	private String password;
	
	@Column(name="date")
	private Date date;
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date=date;
	}

	public User()
	{
		
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String geteMailID() {
		return eMailID;
	}

	public void seteMailID(String eMailID) {
		this.eMailID = eMailID;
	}



	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}

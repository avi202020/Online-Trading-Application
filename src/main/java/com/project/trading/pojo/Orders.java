package com.project.trading.pojo;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")

public class Orders {


	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="orderId",unique=true,nullable=false)
	private int orderId;
	
	@Column(name="orderType")
	private String orderType;
	
	@Column(name="userId")
	private long userId;
	
	@Column(name="firstNameUser")
	private String firstNameUser;
	
	@Column(name="date")
	private Date orderTimestamp;
	
	@Column(name="fullNameUser")
	private String fullNameUser;
	
	public Date getOrderTimestamp() {
		return orderTimestamp;
	}

	public void setOrderTimestamp(Date orderTimestamp) {
		this.orderTimestamp = orderTimestamp;
	}

	public String getFullNameUser() {
		return fullNameUser;
	}

	public void setFullNameUser(String fullNameUser) {
		this.fullNameUser = fullNameUser;
	}

	public String getFullNameBroker() {
		return fullNameBroker;
	}

	public void setFullNameBroker(String fullNameBroker) {
		this.fullNameBroker = fullNameBroker;
	}

	@Column(name="fullNameBroker")
	private String fullNameBroker;
	
	@Column(name="lastNameUser")
	private String lastNameUSer;
	
	public String getFirstNameUser() {
		return firstNameUser;
	}

	public void setFirstNameUser(String firstNameUser) {
		this.firstNameUser = firstNameUser;
	}

	public String getLastNameUSer() {
		return lastNameUSer;
	}

	public void setLastNameUSer(String lastNameUSer) {
		this.lastNameUSer = lastNameUSer;
	}

	public String getFirstNameBroker() {
		return firstNameBroker;
	}

	public void setFirstNameBroker(String firstNameBroker) {
		this.firstNameBroker = firstNameBroker;
	}

	public String getLastNameBroker() {
		return lastNameBroker;
	}

	public void setLastNameBroker(String lastNameBroker) {
		this.lastNameBroker = lastNameBroker;
	}

	@Column(name="brokerId")
	private long brokerId;
	
	@Column(name="firstNameBroker")
	private String firstNameBroker;
	
	@Column(name="lastNameBroker")
	private String lastNameBroker;
	
	@Column(name="SecSymbol")
	private String secSymbol;
	
	@Column(name="secName")
	private String secName;
	
	@Column(name="currPrice")
	private float currPrice;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="totalAmount")
	private float totalAmount;
	
	@Column(name="bidPrice")
	private float bidPrice;
	
	@Column(name="validityDate")
	private String validityDate;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}


	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

    

	public long getBrokerId() {
		return brokerId;
	}

	public void setBrokerId(long brokerId) {
		this.brokerId = brokerId;
	}



	public String getSecSymbol() {
		return secSymbol;
	}

	public void setSecSymbol(String secSymbol) {
		this.secSymbol = secSymbol;
	}

	public String getSecName() {
		return secName;
	}

	public void setSecName(String secName) {
		this.secName = secName;
	}

	public float getCurrPrice() {
		return currPrice;
	}

	public void setCurrPrice(float currPrice) {
		this.currPrice = currPrice;
	}



	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(float bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getValidityDate() {
		return validityDate;
	}

	public void setValidityDate(String validityDate) {
		this.validityDate = validityDate;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	
	
}

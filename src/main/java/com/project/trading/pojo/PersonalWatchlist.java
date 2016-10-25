package com.project.trading.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PersonalWatchlist")
public class PersonalWatchlist {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="persnlSecurityId",unique=true,nullable=false)
	private int persnlSecurityId;

	@Column(name="SecurityId")
	private int SecurityId;
	
	@Column(name="secSymbol")
	private String secSymbol;
	
	@Column(name="userId")
	private long userAssoc;

	@Column(name="secName")
	private String secName;
	
	@Column(name="high")
	private String high;
	
	@Column(name="low")
	private String low;
	
	@Column(name="lastClose")
	private String lastClose;
	
	@Column(name="currentPrice")
	private String currentPrice;

	public int getSecurityId() {
		return SecurityId;
	}


	
	public long getUserAssoc() {
		return userAssoc;
	}



	public void setUserAssoc(long userAssoc) {
		this.userAssoc = userAssoc;
	}



	public void setSecurityId(int securityId) {
		SecurityId = securityId;
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

	public String getHigh() {
		return high;
	}

	public void setHigh(String high) {
		this.high = high;
	}

	public String getLow() {
		return low;
	}

	public void setLow(String low) {
		this.low = low;
	}

	public String getLastClose() {
		return lastClose;
	}

	public void setLastClose(String lastClose) {
		this.lastClose = lastClose;
	}

	public String getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(String currentPrice) {
		this.currentPrice = currentPrice;
	}


	
	
}

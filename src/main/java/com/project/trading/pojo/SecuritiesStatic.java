package com.project.trading.pojo;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SecuritiesDetails")
public class SecuritiesStatic {

	@Id
	@Column(name="SecurityId")
	private int SecurityId;
	
	@Column(name="secSymbol")
	private String secSymbol;
	
	@Column(name="secName")
	private String secName;
	
	@Column(name="faceValue")
	private float faceValue;
	
	@Column(name="listingDate")
	private String listingDate;
	
	public SecuritiesStatic()
	{
		
	}

	public int getSecId() {
		return SecurityId;
	}

	public void setSecId(int secId) {
		this.SecurityId = secId;
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



	public float getFaceValue() {
		return faceValue;
	}

	public void setFaceValue(float faceValue) {
		this.faceValue = faceValue;
	}

	public int getSecurityId() {
		return SecurityId;
	}

	public void setSecurityId(int securityId) {
		SecurityId = securityId;
	}

	public String getListingDate() {
		return listingDate;
	}

	public void setListingDate(String listingDate) {
		this.listingDate = listingDate;
	}

	
	
}

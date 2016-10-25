package com.project.trading.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="SecuritiesDataDaily")
public class SecuritiesDynamic {
	
	@Id
	@Column(name="secdynamicId")
	private int secdynamicId;
	
	@Column(name="high")
	private float high;
	
	@Column(name="low")
	private float low;
	
	@Column(name="lastClose")
	private float lastClose;
	
	@Column(name="currentPrice")
	private float currentPrice;
	
	@ManyToOne
    @JoinColumn(name="SecurityId")
	private SecuritiesStatic securitiesStatic;
	
	public SecuritiesDynamic()
	{
		
	}

	public float getHigh() {
		return high;
	}

	public void setHigh(float high) {
		this.high = high;
	}

	public float getLow() {
		return low;
	}

	public void setLow(float low) {
		this.low = low;
	}

	public float getLastClose() {
		return lastClose;
	}

	public void setLastClose(float lastClose) {
		this.lastClose = lastClose;
	}

	public float getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(float currentPrice) {
		this.currentPrice = currentPrice;
	}

	public SecuritiesStatic getSecuritiesStatic() {
		return securitiesStatic;
	}

	public void setSecuritiesStatic(SecuritiesStatic securitiesStatic) {
		this.securitiesStatic = securitiesStatic;
	}

	
}

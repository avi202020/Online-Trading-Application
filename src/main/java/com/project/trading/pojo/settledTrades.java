package com.project.trading.pojo;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="settledTrades")
public class settledTrades {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="settlementId",unique=true,nullable=false)
	private int settlementId;
	
	@Column(name="clientName")
	private String clientName;
	
	@Column(name="orderTimestamp")
	private String orderTimestamp;
	
	@Column(name="brokerName")
	private String brokerName;
	
	@Column(name="secSymbol")
	private String secSymbol;
	
	@Column(name="secName")
	private String secName;
	
	@Column(name="orderType")
	private String orderType;
	
	@Column(name="noOfShares")
	private int noOfShares;
	
	@Column(name="amntSettled")
	private float amntSettled;
	
	@Column(name="settlementType")
	private String settlementType;
	
	public String getSettlementType() {
		return settlementType;
	}

	public void setSettlementType(String settlementType) {
		this.settlementType = settlementType;
	}

	public String getOrderTimestamp() {
		return orderTimestamp;
	}

	public void setOrderTimestamp(String orderTimestamp) {
		this.orderTimestamp = orderTimestamp;
	}

	@Column(name="tradeTime")
	private String tradeTime;

	public String getCounter() {
		return counter;
	}

	public void setCounter(String counter) {
		this.counter = counter;
	}

	@Column(name="counterparty")
	private String counter;
	public int getSettlementId() {
		return settlementId;
	}

	public void setSettlementId(int settlementId) {
		this.settlementId = settlementId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getBrokerName() {
		return brokerName;
	}

	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
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

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public int getNoOfShares() {
		return noOfShares;
	}

	public void setNoOfShares(int noOfShares) {
		this.noOfShares = noOfShares;
	}

	public float getAmntSettled() {
		return amntSettled;
	}

	public void setAmntSettled(float amntSettled) {
		this.amntSettled = amntSettled;
	}

	public String getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(String tradeTime) {
		this.tradeTime = tradeTime;
	}


	
}

package com.project.trading.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Trade")
public class Trade {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	@Column(name="tradeId",unique=true,nullable=false)
	private int tradeId;
	
	@Column(name="clientName")
	private String clientName;

	@Column(name="brokerName")
	private String brokerName;
	
	public String getBrokerName() {
		return brokerName;
	}

	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}

	@Column(name="secSymbol")
	private String secSymbol;

	@Column(name="securityName")
	private String securityName;

	@Column(name="bidPrice")
	private float bidPrice;
	
	@Column(name="currentPrice")
	private float currentPrice;
	
	@Column(name="orderType")
	private String orderType;
	
	@Column(name="tradeQuantity")
	private int tradeQuantity;
	
	@Column(name="totalAmount")
	private float totalAmount;
	
	@Column(name="orderTimestamp")
	private Date orderTimestamp;
	
	@Column(name="orderValidity")
	private String orderValidity;
	
	@Column(name="counterParty")
	private String counterParty;
	
	@Column(name="tradeTime")
	private Date tradeTime;
	
	@Column(name="quantitymatched")
	private int quantitymatched;
	
	@Column(name="amountSettled")
	private float amountSettled;
	
	@Column(name="stocksSettled")
	private float stocksSettled;

	public int getTradeId() {
		return tradeId;
	}

	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getSecSymbol() {
		return secSymbol;
	}

	public void setSecSymbol(String secSymbol) {
		this.secSymbol = secSymbol;
	}

	public String getSecurityName() {
		return securityName;
	}

	public void setSecurityName(String securityName) {
		this.securityName = securityName;
	}

	public float getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(float bidPrice) {
		this.bidPrice = bidPrice;
	}

	public float getCurrentPrice() {
		return currentPrice;
	}

	public void setCurrentPrice(float currentPrice) {
		this.currentPrice = currentPrice;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public int getTradeQuantity() {
		return tradeQuantity;
	}

	public void setTradeQuantity(int tradeQuantity) {
		this.tradeQuantity = tradeQuantity;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getOrderTimestamp() {
		return orderTimestamp;
	}

	public void setOrderTimestamp(Date orderTimestamp) {
		this.orderTimestamp = orderTimestamp;
	}

	public String getOrderValidity() {
		return orderValidity;
	}

	public void setOrderValidity(String orderValidity) {
		this.orderValidity = orderValidity;
	}

	public String getCounterParty() {
		return counterParty;
	}

	public void setCounterParty(String counterParty) {
		this.counterParty = counterParty;
	}

	public Date getTradeTime() {
		return tradeTime;
	}

	public void setTradeTime(Date tradeTime) {
		this.tradeTime = tradeTime;
	}

	public int getQuantitymatched() {
		return quantitymatched;
	}

	public void setQuantitymatched(int quantitymatched) {
		this.quantitymatched = quantitymatched;
	}

	public float getAmountSettled() {
		return amountSettled;
	}

	public void setAmountSettled(float amountSettled) {
		this.amountSettled = amountSettled;
	}

	public float getStocksSettled() {
		return stocksSettled;
	}

	public void setStocksSettled(float stocksSettled) {
		this.stocksSettled = stocksSettled;
	}
	
	
	
	
	
	
	
}

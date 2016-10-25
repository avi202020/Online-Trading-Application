package com.project.trading.DAO;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.Orders;
import com.project.trading.pojo.PersonalWatchlist;
import com.project.trading.pojo.Trade;
import com.project.trading.pojo.User;
import com.project.trading.pojo.settledTrades;

public class TradeDAO extends DAO{

	
	public Trade addToBord(String clientName,String securitySymbol,String securityName,float bidPrice,float currentPrice,String orderType,
			int tradeQuantity,float totalAmount,Date ordert,String OrderValidity,String brokerName)throws AdException
	{
		try {
			   begin();
			   Trade trade=new Trade();
			   trade.setBrokerName(brokerName);
			   trade.setClientName(clientName);
			   trade.setSecSymbol(securitySymbol);
			   trade.setSecurityName(securityName);
			   trade.setBidPrice(bidPrice);
			   trade.setCurrentPrice(currentPrice);
			   trade.setOrderType(orderType);
			   trade.setTradeQuantity(tradeQuantity);
			   trade.setTotalAmount(totalAmount);
			   trade.setOrderTimestamp(ordert);
			   trade.setOrderValidity(OrderValidity);
			   getSession().save(trade);
	           commit();
	           return trade;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not add to watchlist " + e);
		}
	}
	
	public settledTrades settleTrde(String cn,String bn,String ss,String sn,float bp,String ot,int quan,float amnt,String tt,String counter,String OrderTimestamp)throws AdException
	{
		try {
			   begin();
			   settledTrades st=new settledTrades();
			   Query qchk = getSession().createQuery("from settledTrades where clientName= :name and secSymbol = :symbol");
			   qchk.setString("name", cn);
			   qchk.setString("symbol",ss);
			   settledTrades sst=(settledTrades) qchk.uniqueResult();
			   if(sst!=null)
			   {
				  if(ot.equals("buy"))
				  {
					  int totShares=sst.getNoOfShares()+quan;
					  Query updq=getSession().createQuery("update settledTrades set noOfShares = :tot where clientName= :name and secSymbol = :symbol");
					  updq.setInteger("tot", totShares);
					  updq.setString("name", cn);
					  updq.setString("symbol",ss);
					  updq.executeUpdate();
					  commit();
					  return sst;
				  }
				  else
				  {	  
					  String[] splited = cn.split("\\s+");
					  Query user=getSession().createQuery("from User where fName = :fn");
					  user.setString("fn",splited[0]);
					  User u=(User) user.uniqueResult();
					  String id=String.valueOf(u.getUserId());
					  Query investor=getSession().createQuery("from Investor where userId = :id");
					  investor.setString("id",id);
					  Investor i=(Investor) investor.uniqueResult();
					  float totamntset=i.getAmountInAccount()+amnt;
					  Query updi=getSession().createQuery("update Investor set amountInAccount = :totamntset where userId = :id");
					  updi.setFloat("totamntset", totamntset);
					  updi.setString("id",id);
					  updi.executeUpdate();
					  commit();
					  return sst;
				  }
			   }
			   else
			   {
				   st.setClientName(cn);
				   st.setBrokerName(bn);
				   st.setSecSymbol(ss);
				   st.setSecName(sn);
				   st.setOrderType(ot);
				   st.setNoOfShares(quan);
				   st.setAmntSettled(amnt);
				   st.setTradeTime(tt);
				   st.setOrderTimestamp(OrderTimestamp);
				   st.setCounter(counter); 
				   st.setSettlementType("settled");
				   getSession().save(st);
				   commit();
				   return st;
			   }
	           
	          
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not add to watchlist " + e);
		}
	}
	
	
	public String chkOrder(String name,String time)
	{
			String chk;
			begin();
			Query q4 = getSession().createQuery("from Trade where clientName= :name and orderTimestamp = :timeOrder");
			q4.setString("name", name);
			q4.setString("timeOrder",time);
			Trade trade=(Trade) q4.uniqueResult();
			commit();
			if(trade==null)
			{
				return "true";
			}
			else
			{
				return "false";
			}
			
	}
	public ArrayList<Trade> getAllTradeOrders() throws AdException
	{
		try{
			begin();
			Criteria crit=getSession().createCriteria(Trade.class);
			ArrayList<Trade> results=(ArrayList<Trade>) crit.list();
			commit();
			return results;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all trade orders " + e);
		}
	}
	
	public ArrayList<Trade> matchOrders() throws AdException
	{
		try{
			begin();
			String buyit="buy";
			String sellit="sell";
			ArrayList<Trade> matchList=new ArrayList<Trade>();
			Query qb = getSession().createQuery("from Trade where orderType=:type1");
			qb.setString("type1","buy");
			ArrayList<Trade> buyList= (ArrayList<Trade>) qb.list();
			commit();
			begin();
			Query qs = getSession().createQuery("from Trade where orderType=:type2");
			qs.setString("type2","sell");
			ArrayList<Trade> sellList= (ArrayList<Trade>) qs.list();
			for(Trade buy:buyList)
			{
				for(Trade sell:sellList)
				{
					if(buy.getSecSymbol().equalsIgnoreCase(sell.getSecSymbol()))
					{
						if(buy.getBidPrice()==sell.getBidPrice())
						{
							if(buy.getTradeQuantity()==sell.getTradeQuantity())
							{
								int buyTradeid=buy.getTradeId();
								int sellTradeid=sell.getTradeId();
								Query qbc=getSession().createQuery("update Trade set counterParty = :cpOfBuy, quantitymatched = :match,amountSettled= :amnt, tradeTime = :datetime where tradeId = :id");
								qbc.setString("cpOfBuy",sell.getClientName());
								qbc.setInteger("match",buy.getTradeQuantity());
								qbc.setFloat("amnt",buy.getTotalAmount());
								qbc.setTimestamp("datetime", new Date());
								qbc.setInteger("id",buyTradeid);
								qbc.executeUpdate();
								Query qsc=getSession().createQuery("update Trade set counterParty = :cpOfSell, quantitymatched = :match,amountSettled= :amnt, tradeTime = :datetime where tradeId = :id");
								qsc.setString("cpOfSell",buy.getClientName());
								qsc.setInteger("match",buy.getTradeQuantity());
								qsc.setFloat("amnt",buy.getTotalAmount());
								qsc.setTimestamp("datetime", new Date());
								qsc.setInteger("id",sellTradeid);
								qsc.executeUpdate();
								Query qbfinal = getSession().createQuery("from Trade where tradeId = :id");
								qbfinal.setInteger("id",buyTradeid);
								Trade trade=(Trade) qbfinal.uniqueResult();
								matchList.add(trade);
								Query qsfinal = getSession().createQuery("from Trade where tradeId = :id");
								qsfinal.setInteger("id",sellTradeid);
								Trade trades=(Trade) qsfinal.uniqueResult();
								matchList.add(trades);
							}
						}
					}
				}
			}
			commit();
			return matchList;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all trade orders " + e);
		}
	}
	
	public String chkWatchList(String name,long id) throws AdException
	{
		try{
			begin();
			Query q4 = getSession().createQuery("from PersonalWatchlist where secSymbol = :ss and userAssoc = :id");
			q4.setString("ss", name);
			q4.setLong("id",id );
			PersonalWatchlist pw=(PersonalWatchlist) q4.uniqueResult();
			commit();
			if(pw==null)
			{
				return "true";
			}
			else if(pw!=null)
			{
				return "false";
			}
			else
				return "false";
		}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all trade orders " + e);
		}
			
	}
	
	public String chkSettles(String cn,String ss,String tt,String c) throws AdException
	{
		try{
			begin();
			Query q4 = getSession().createQuery("from settledTrades where clientName = :cn and counter = :c and  orderTimestamp= :tt  and  settlementType = :st  and secSymbol = :ss");
		    q4.setString("st", "settled");
			q4.setString("cn", cn);
			q4.setString("ss", ss);
		 	q4.setString("tt", tt);
			q4.setString("c", c);
			settledTrades settT=(settledTrades) q4.uniqueResult();
			System.out.println(settT);
			commit();
			if(settT==null)
			{
				return "true";
			}
			else if(settT!=null)
			{
				return "false";
			}
			else
				return "false";
		}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all trade orders " + e);
		}
			
	}
	
	
}

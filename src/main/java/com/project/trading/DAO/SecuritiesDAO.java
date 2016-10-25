package com.project.trading.DAO;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.Orders;
import com.project.trading.pojo.PersonalWatchlist;
import com.project.trading.pojo.SecuritiesDynamic;
import com.project.trading.pojo.SecuritiesStatic;
import com.project.trading.pojo.User;
import com.project.trading.pojo.settledTrades;

public class SecuritiesDAO extends DAO{

	public SecuritiesDAO()
	{
		
	}
	
	
	public ArrayList<SecuritiesDynamic> getAllSecPagi(String pagecount)throws AdException
	{
		try{
			int pc=Integer.parseInt(pagecount);
			ArrayList<SecuritiesDynamic> allSec = new ArrayList<SecuritiesDynamic>();
			begin();
			int start=(13*pc);
			int end=13;
			Query q1 = getSession().createQuery("from SecuritiesStatic");
			q1.setFirstResult(start);
			q1.setMaxResults(end);
			ArrayList<SecuritiesStatic> secList= (ArrayList<SecuritiesStatic>) q1.list();
			for(SecuritiesStatic ss:secList)
			{
				String idsSec=String.valueOf(ss.getSecId());
				Query q2 = getSession().createQuery("from SecuritiesDynamic where SecurityId = :secId");
				q2.setString("secId",idsSec);
				SecuritiesDynamic securitiesDynamic=(SecuritiesDynamic) q2.uniqueResult();
				allSec.add(securitiesDynamic);
			}
			commit();
			return allSec;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not get the securities " + e);
		}
	}
	
	
	public ArrayList<SecuritiesDynamic> getAllSec()throws AdException
	{
		try{
			ArrayList<SecuritiesDynamic> allSec = new ArrayList<SecuritiesDynamic>();
			begin();
			Query q1 = getSession().createQuery("from SecuritiesStatic");
			ArrayList<SecuritiesStatic> secList= (ArrayList<SecuritiesStatic>) q1.list();
			for(SecuritiesStatic ss:secList)
			{
				String idsSec=String.valueOf(ss.getSecId());
				Query q2 = getSession().createQuery("from SecuritiesDynamic where SecurityId = :secId");
				q2.setString("secId",idsSec);
				SecuritiesDynamic securitiesDynamic=(SecuritiesDynamic) q2.uniqueResult();
				allSec.add(securitiesDynamic);
			}
			commit();
			return allSec;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not get the securities " + e);
		}
	}
	public PersonalWatchlist addToPersnlWatch(String secSymb,String nameSec,String highP,String lowP,String closP,String curr,long idUser)throws AdException
	{
		try {
			   begin();
			   PersonalWatchlist pWatch=new PersonalWatchlist();
			   Query q3= getSession().createQuery("from SecuritiesStatic where secSymbol = :sym");
			   q3.setString("sym", secSymb);
			   SecuritiesStatic ss=(SecuritiesStatic) q3.uniqueResult();
			   int idOfSec=ss.getSecId();
			   pWatch.setUserAssoc(idUser);
			   pWatch.setSecurityId(idOfSec);
			   pWatch.setSecSymbol(secSymb);
			   pWatch.setSecName(nameSec);
			   pWatch.setHigh(highP);
			   pWatch.setLow(lowP);
			   pWatch.setLastClose(closP);
			   pWatch.setCurrentPrice(curr);
			   getSession().save(pWatch);
	           commit();
	           return pWatch;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not add to watchlist " + e);
		}
	}
	
	public ArrayList<PersonalWatchlist> getMydata(long idsOfUser)throws AdException
	{
		try{
			String idU=String.valueOf(idsOfUser);
			begin();
			Query q4 = getSession().createQuery("from PersonalWatchlist where userAssoc= :idsession");
			q4.setString("idsession", idU);
			ArrayList<PersonalWatchlist> watchList= (ArrayList<PersonalWatchlist>) q4.list();
			commit();
			return watchList;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display personal watchlist " + e);
		}
	}
	
	public ArrayList<settledTrades> getSettledTrades(String fn)throws AdException
	{
		try{
			begin();
			Query q4 = getSession().createQuery("from settledTrades where clientName= :cn");
			q4.setString("cn", fn);
			ArrayList<settledTrades> st= (ArrayList<settledTrades>) q4.list();
			commit();
			return st;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display personal watchlist " + e);
		}
	}

	
	
	public Investor getDetails(long idsOfUser)throws AdException
	{
		try{
			String idU=String.valueOf(idsOfUser);
			begin();
			Query q22 = getSession().createQuery("from Investor where userId= :idsession");
			q22.setString("idsession", idU);
			Investor investor=(Investor) q22.uniqueResult();
			commit();
			return investor;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display personal watchlist " + e);
		}
	}
	
	public User getDetailsUser(long idsOfUser)throws AdException
	{
		try{
			String idU=String.valueOf(idsOfUser);
			begin();
			Query q24 = getSession().createQuery("from User where userId= :idsession");
			q24.setString("idsession", idU);
			User uu=(User) q24.uniqueResult();
			commit();
			return uu;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not get Users details " + e);
		}
	}
	
	
	public int updateIt(long idsOfUser,String email,String password,String contact,String ssn, String accntNo,String address)throws AdException
	{
		try{
			String idU=String.valueOf(idsOfUser);
			begin();
			Query q23 = getSession().createQuery("update Investor set eMailID = :em, password = :pw, contact = :c, panCardNum = :ssn, accountNum = :an, address = :add where userId= :idsession");
			q23.setString("idsession", idU);
			q23.setString("pw",password);
			q23.setString("em",email);
			q23.setString("c",contact);
			q23.setString("ssn",ssn);
			q23.setString("an",accntNo);
			q23.setString("add",address);
			int result=q23.executeUpdate();
			commit();
			return result;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not dupdate users information " + e);
		}
	}
	
	public int updateUser(long idsOfUser,String email,String password,String contact, String address)throws AdException
	{
		try{
			String idU=String.valueOf(idsOfUser);
			begin();
			Query q25 = getSession().createQuery("update User set eMailID = :em, password = :pw, contact = :c, address = :add where userId= :idsession");
			q25.setString("idsession", idU);
			q25.setString("pw",password);
			q25.setString("em",email);
			q25.setString("c",contact);
			q25.setString("add",address);
			int result=q25.executeUpdate();
			commit();
			return result;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not update users information " + e);
		}
	}
	
	
	
	
	public Orders addOrderSell(String s,String sn,String qsl,String bp,String vd, long uId, String bName)
	{
			begin();
            Orders order=new Orders();
            
            Query q10=getSession().createQuery("from User where userId=:idUser");
            q10.setString("idUser", String.valueOf(uId));
            User u=(User) q10.uniqueResult();
            
            
            Query q5=getSession().createQuery("from User where fName=:fN");
            q5.setString("fN", bName);
            User user=(User) q5.uniqueResult();
            
//            Query q6 = getSession().createQuery("from SecuritiesStatic where secSymbol = :symbol");
//			q6.setString("symbol", s);
//			SecuritiesStatic securitiesStatic=(SecuritiesStatic) q6.uniqueResult();
			Query q7 = getSession().createQuery("from SecuritiesDynamic where securitiesStatic.secSymbol = :symbol");
			q7.setString("symbol", s);
			SecuritiesDynamic securitiesDynamic=(SecuritiesDynamic) q7.uniqueResult();
			order.setBidPrice(Float.parseFloat(bp));
			order.setCurrPrice(securitiesDynamic.getCurrentPrice());
			order.setFirstNameBroker(user.getfName());
			order.setFirstNameUser(u.getfName());
			order.setFullNameBroker(user.getfName()+" "+user.getlName());
			order.setLastNameUSer(u.getlName());
	        order.setFullNameUser(u.getfName()+" "+u.getlName());
	        order.setLastNameBroker(user.getlName());
	        order.setOrderTimestamp(new Date());
	        order.setOrderType("sell");
	        order.setQuantity(Integer.parseInt(qsl));
            order.setSecSymbol(s);
            order.setSecName(sn);
            order.setValidityDate(vd);
            order.setUserId(uId);
            order.setTotalAmount(Integer.parseInt(qsl)*Float.parseFloat(bp)*10);
            long broId=user.getUserId();
            order.setBrokerId(broId);
            getSession().save(order);
            commit();
            return order;
        
	}
	
	
	public Orders addOrder(String s,String sn,String cp,String q,String bp,String vd, long uId, String bName,float amntInAccount,float valueComputed)
	{
			begin();
            Orders order=new Orders();
            order.setSecSymbol(s);
            order.setSecName(sn);
            order.setCurrPrice(Float.parseFloat(cp));
            order.setQuantity(Integer.parseInt(q));
            order.setBidPrice(Float.parseFloat(bp));
            order.setValidityDate(vd);
            Query q10=getSession().createQuery("from User where userId=:idUser");
            q10.setString("idUser", String.valueOf(uId));
            User u=(User) q10.uniqueResult();
            order.setFirstNameUser(u.getfName());
            order.setLastNameUSer(u.getlName());
            order.setFullNameUser(u.getfName()+" "+u.getlName());
            order.setUserId(uId);
            order.setOrderTimestamp(new Date());
            order.setTotalAmount(Integer.parseInt(q)*Float.parseFloat(bp)*10);
            Query q5=getSession().createQuery("from User where fName=:fN");
            q5.setString("fN", bName);
            User user=(User) q5.uniqueResult();
            order.setFirstNameBroker(user.getfName());
            order.setLastNameBroker(user.getlName());
            order.setFullNameBroker(user.getfName()+" "+user.getlName());;
            long broId=user.getUserId();
            order.setBrokerId(broId);
            order.setOrderType("buy");
            if(valueComputed<amntInAccount)
            {
            	float remainingamnt=amntInAccount-valueComputed;
            	Query qu=getSession().createQuery("update Investor set amountInAccount = :remains where userId = :ids");
            	qu.setFloat("remains", remainingamnt);
            	qu.setString("ids", String.valueOf(uId));
            	qu.executeUpdate();
            }
            getSession().save(order);
            commit();
            return order;
        
	}
	
	public ArrayList<Orders> getAllOrders(long id)throws AdException
	{
		try{
			String idU=String.valueOf(id);
			begin();
			Query q6 = getSession().createQuery("from Orders where userId = :idsession");
			q6.setString("idsession", idU);
			ArrayList<Orders> orders= (ArrayList<Orders>) q6.list();
			commit();
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all orders " + e);
		}
	}
	
	

	public ArrayList<Orders> getUsersList(long id)throws AdException
	{
		try{
			//ArrayList<String> users=new ArrayList<String>();
			String idU=String.valueOf(id);
			begin();
			Query q6 = getSession().createSQLQuery("Select distinct(o.fullNameUser) from Orders as o where brokerId = :idsession");
			q6.setString("idsession", idU);
			ArrayList<Orders> orders= (ArrayList<Orders>) q6.list();
			
			System.out.println("The orders are" + orders);
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all orders " + e);
		}
	}
	
	public ArrayList<Orders> getPopOrders(long id)throws AdException
	{
		try{
			String idU=String.valueOf(id);
			begin();
			Query q6 = getSession().createQuery("from Orders where brokerId = :idsession");
			q6.setString("idsession", idU);
			ArrayList<Orders> orders= (ArrayList<Orders>) q6.list();
			commit();
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all orders " + e);
		}
	}
	
	public ArrayList<Orders> getUserPopOrders(long id,String name)throws AdException
	{
		try{
			String idU=String.valueOf(id);
			begin();
			Query q6 = getSession().createQuery("from Orders where brokerId = :idsession and fullNameUser = :namedUser");
			q6.setString("idsession", idU);
			q6.setString("namedUser", name);
			ArrayList<Orders> orders= (ArrayList<Orders>) q6.list();
			commit();
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display all orders " + e);
		}
	}
	
	
	
	public ArrayList<Orders> getAllBuyOrders(long id)throws AdException
	{
		try{
			String idU=String.valueOf(id);
			begin();
			Query q7 = getSession().createQuery("from Orders where userId = :idsession and orderType = :type");
			q7.setString("idsession", idU);
			q7.setString("type", "buy");
			ArrayList<Orders> orders= (ArrayList<Orders>) q7.list();
			commit();
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display buy orders " + e);
		}
	}
	public ArrayList<Orders> getAllSellOrders(long id)throws AdException
	{
		try{
			String idU=String.valueOf(id);
			begin();
			Query q8 = getSession().createQuery("from Orders where userId = :idsession and orderType = :type");
			q8.setString("idsession", idU);
			q8.setString("type", "sell");
			ArrayList<Orders> orders= (ArrayList<Orders>) q8.list();
			commit();
			return orders;
			}
		catch(HibernateException e)
		{
			rollback();
			throw new AdException("Could not display sell orders " + e);
		}
	}
}

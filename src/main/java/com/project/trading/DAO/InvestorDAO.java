package com.project.trading.DAO;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.SecuritiesStatic;
import com.project.trading.pojo.User;

public class InvestorDAO extends DAO{
	
	public InvestorDAO()
	{
		
	}
	
	public Investor createInvestor(String fName,String lName,String eMailID,String userName,String password,String contact, String panCardNum, String accountNum, String address,String bro)
	{
		    int randomNum = 10000 + (int)(Math.random() * 20000);
		    float amnt=(float) randomNum;
			Date d = new Date();
			begin();
            Investor investor=new Investor();
            investor.setfName(fName);
            investor.setlName(lName);
            investor.seteMailID(eMailID);
            investor.setUserName(userName);
            investor.setPassword(password);
            investor.setContact(contact);
            investor.setPanCardNum(panCardNum);
            investor.setAccountNum(accountNum);
            investor.setAddress(address);
            investor.setDate(d);
            investor.setBroker(bro);
            investor.setRole("investor");
            investor.setAmount("$"+randomNum+".00");
            investor.setAmountInAccount(amnt);	
            getSession().save(investor);
            commit();
            return investor;
        
	}
	
	public User createUser(String fName,String lName,String eMailID,String userName,String password,String contact,String address)
	{
			Date d = new Date();
			begin();
            User u=new User();
            u.setfName(fName);
            u.setlName(lName);
            u.seteMailID(eMailID);
            u.setUserName(userName);
            u.setPassword(password);
            u.setContact(contact);
            u.setAddress(address);
            u.setDate(d);
            u.setRole("tradingMember");
            getSession().save(u);
            commit();
            return u;
        
	}
	
	public User createUserBroker(String fName,String lName,String eMailID,String userName,String password,String contact,String address)
	{
			Date d = new Date();
			begin();
            User u=new User();
            u.setfName(fName);
            u.setlName(lName);
            u.seteMailID(eMailID);
            u.setUserName(userName);
            u.setPassword(password);
            u.setContact(contact);
            u.setAddress(address);
            u.setDate(d);
            u.setRole("broker");
            getSession().save(u);
            commit();
            return u;
        
	}
	public Investor findInvestor(User user) throws AdException
	{
		try{
			begin();
			String ids=String.valueOf(user.getUserId());
            System.out.println("the ids is "+ids);
            begin();
            Query query = getSession().createQuery("from Investor where userId = :uId");
            query.setString("uId",ids);
            Investor investor=(Investor) query.uniqueResult();
            System.out.println("the investor is "+investor);
            commit();
			if(investor!=null)
				return investor;
			else
				{
				System.out.println("the investor is null");
				return null;
				}
			
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get user " +  e);
		  }
		
	}
	
	public User findUser(String username,String pw) throws AdException
	{
		try{
			begin();
			Query q = getSession().createQuery("from User u where userName = :username and password = :pass");
			q.setString("username",username);
			q.setString("pass", pw);
			User user=(User) q.uniqueResult();
			//List results=q.list();
			commit();
			if(user!=null)
				return user;
			else
				{
				System.out.println("the user is null");
				return null;
				}
			
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get user " + username, e);
		  }
		
	}
	
	
	
	public ArrayList<User> getInvestors() throws AdException
	{
		try{
			begin();
			Query q=getSession().createQuery("from User u where u.role = :uID");
			q.setString("uID","investor");
			ArrayList<User> iList= (ArrayList<User>)q.list();
			for(User uu:iList)
			{
				System.out.println(uu.getfName());
			}
			return iList;
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get all the investors " + e);
		  }
	}
	
	public ArrayList<User> getTM() throws AdException
	{
		try{
			ArrayList<User> tmList = null;
			begin();
			Query q=getSession().createQuery("from User u where u.role = :uID");
			q.setString("uID","tradingMember");
			 tmList= (ArrayList<User>)q.list();
			commit();
			close();
			
			for(User uu:tmList)
			{
				System.out.println(uu.getfName());
			}
			
			return tmList;
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get all the tms " + e);
		  }
	}
	
	public ArrayList<User> getBro() throws AdException
	{
		try{
			begin();
			Query q=getSession().createQuery("from User u where u.role = :uID");
			q.setString("uID","broker");
			ArrayList<User> brolist= (ArrayList<User>)q.list();
			for(User uu:brolist)
			{
				System.out.println(uu.getfName());
			}
			return brolist;
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get all the brokers " + e);
		  }
	}
	public int deleteFromWatch(String ss) throws AdException
	{
		try{
			begin();
			Query dq=getSession().createQuery("delete PersonalWatchlist where secSymbol = :symbol");
			dq.setString("symbol",ss);
			int result = dq.executeUpdate();
			commit();
			return result;
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not get all the brokers " + e);
		  }
	}
	
	public int deleteFromDatabase(String ss) throws AdException
	{
		try{
			begin();
			Query dq=getSession().createQuery("delete User where fName = :symbol");
			dq.setString("symbol",ss);
			int result = dq.executeUpdate();
			commit();
			return result;
		  }
		catch(HibernateException e)
		  {
			rollback();
			throw new AdException("Could not delete User " + e);
		  }
	}
	

}

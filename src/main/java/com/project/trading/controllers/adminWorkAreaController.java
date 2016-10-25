package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.project.trading.DAO.InvestorDAO;
import com.project.trading.DAO.SecuritiesDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.User;
import com.project.trading.utility.SendEmail;

@Controller

public class adminWorkAreaController {
	
	@Autowired
	@Qualifier("sendEmail")
	SendEmail sendEmail;
	
	@RequestMapping(value="/popInvestors.htm", method=RequestMethod.POST)
	public void populateInvestors(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		try
		{
		InvestorDAO investorDAO=new InvestorDAO();
		System.out.println("going to DAO");
		ArrayList<User> iList=investorDAO.getInvestors();
		System.out.println("returned from DAO");
		JSONObject obj=null;
		JSONObject mainobj=new JSONObject();
		JSONArray arr = new JSONArray();
		for(User uu:iList)
		{
			obj=new JSONObject();
			String fName=uu.getfName();
			obj.put("fName", fName);
			System.out.println("The list is" + uu.getlName());
			obj.put("lName", uu.getlName());
			System.out.println("The list is" + uu.getfName());
			obj.put("eMailID", uu.geteMailID());
			obj.put("date", uu.getDate());
			arr.put(obj);
			System.out.println(arr);
		}
		mainobj.put("iList", arr);
		System.out.println(mainobj);
		PrintWriter out= response.getWriter();
		out.print(mainobj);
		}
		catch(AdException e)
		{
				System.out.println("Exception: " + e.getMessage());
		}
	}
	
	
	@RequestMapping(value="/popBro.htm", method=RequestMethod.POST)
	public void populateBroker(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		try
		{
			
		System.out.println("Inside the popBro method");
		InvestorDAO investorDAO=new InvestorDAO();
		ArrayList<User> bList=investorDAO.getBro();
		System.out.println("returned from DAO");
		JSONObject obj=null;
		JSONObject mainobj=new JSONObject();
		JSONArray arr = new JSONArray();
		for(User uu:bList)
		{
			obj=new JSONObject();
			String fName=uu.getfName();
			obj.put("fName", fName);
			System.out.println("The list is" + uu.getlName());
			obj.put("lName", uu.getlName());
			System.out.println("The list is" + uu.getfName());
			obj.put("eMailID", uu.geteMailID());
			obj.put("date", uu.getDate());
			arr.put(obj);
			System.out.println(arr);
		}
		mainobj.put("bList", arr);
		System.out.println(mainobj);
		PrintWriter out= response.getWriter();
		out.print(mainobj);
		}
		catch(AdException e)
		{
				System.out.println("Exception: " + e.getMessage());
		}
	}
	
	@RequestMapping(value="/popBroker.htm", method=RequestMethod.POST)
	public void populateBrokers(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		try
		{
		InvestorDAO investorDAO=new InvestorDAO();
		ArrayList<User> bList=investorDAO.getBro();
	
		}
		catch(AdException e)
		{
				System.out.println("Exception: " + e.getMessage());
		}
	}
	
	@RequestMapping(value="/addTM.htm", method=RequestMethod.POST)
	public void investorDetailsAdd(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		InvestorDAO investorDAO=new InvestorDAO();
		String fn=request.getParameter("Firstname");
		String ln=request.getParameter("lastname");
		String con=request.getParameter("contact");
		String em=request.getParameter("email");
		String ad=request.getParameter("add");
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		sendEmail.sendAMail(em,fn,ln,con,ad,un,pw);
		PrintWriter out= response.getWriter();
		User u=investorDAO.createUser(fn, ln, em, un, pw, con, ad);
		if(u!=null)
			{
			out.println("true");
			}
		else
			{
			out.println("false");
			}
	}
	
	@RequestMapping(value="/addBroker.htm", method=RequestMethod.POST)
	public void brokerDetailsAdd(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		InvestorDAO investorDAO=new InvestorDAO();
		String fn=request.getParameter("Firstname");
		String ln=request.getParameter("lastname");
		String con=request.getParameter("contact");
		String em=request.getParameter("email");
		String ad=request.getParameter("add");
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		PrintWriter out= response.getWriter();
		User u=investorDAO.createUserBroker(fn, ln, em, un, pw, con, ad);
		sendEmail.sendAMail(em,fn,ln,con,ad,un,pw);
		if(u!=null)
			{
			out.println("true");
			}
		else
			{
			out.println("false");
			}
	}
	
	@RequestMapping(value="/popTM.htm", method=RequestMethod.POST)
	public void populateTM(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		try{
		InvestorDAO investorDAO=new InvestorDAO();
		ArrayList<User> tmList=investorDAO.getTM();
		System.out.println("returned from DAO");
		JSONObject obj=null;
		JSONObject mainobj=new JSONObject();
		JSONArray arr = new JSONArray();
		for(User uu:tmList)
		{
			obj=new JSONObject();
			String fName=uu.getfName();
			obj.put("fName", fName);
			System.out.println("The list is" + uu.getlName());
			obj.put("lName", uu.getlName());
			System.out.println("The list is" + uu.getfName());
			obj.put("eMailID", uu.geteMailID());
			obj.put("date", uu.getDate());
			arr.put(obj);
			System.out.println(arr);
		}
		mainobj.put("tmLists", arr);
		System.out.println(mainobj);
		PrintWriter out= response.getWriter();
		out.print(mainobj);
		}
		catch(AdException e)
		{
				System.out.println("Exception: " + e.getMessage());
		}
	}
	
	@RequestMapping(value="/brokerIsHere.htm", method=RequestMethod.GET)
	public String BrokerWorkArea(HttpServletRequest request,HttpServletResponse response) throws AdException
	{

		User u=(User) request.getSession().getAttribute("brokerObject");
		if(u==null)
		{
			return "home";	
		}
		if(u.getRole().equalsIgnoreCase("broker"))
			return "broker";
		else
			return "home";
	}
	

	
	@RequestMapping(value="/updateDetailsUserBroker.htm", method=RequestMethod.POST)
	public void updateDetailsUserBroker(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			try{
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("brokerObject");
			long id=u.getUserId();
			User iv=securitiesDAO.getDetailsUser(id);
			JSONObject obj=new JSONObject();
			JSONObject mainObj=new JSONObject();
			String fName=iv.getfName();
			obj.put("fName", fName);
			obj.put("lName", iv.getlName());
			obj.put("email", iv.geteMailID());
			obj.put("username", iv.getUserName());
			obj.put("pass", iv.getPassword());
			obj.put("contact", iv.getContact());
			obj.put("address", iv.getAddress());
			mainObj.put("details",obj);
			PrintWriter out=response.getWriter();
			out.print(mainObj);
			
			System.out.println(mainObj);
			}
			catch(AdException e)
			{
					System.out.println("Exception: " + e.getMessage());
			}

	}
	
	
	@RequestMapping(value="/updateDetailsUser.htm", method=RequestMethod.POST)
	public void updateDetailsUser(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			try{
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("adminObject");
			long id=u.getUserId();
			User iv=securitiesDAO.getDetailsUser(id);
			JSONObject obj=new JSONObject();
			JSONObject mainObj=new JSONObject();
			String fName=iv.getfName();
			obj.put("fName", fName);
			obj.put("lName", iv.getlName());
			obj.put("email", iv.geteMailID());
			obj.put("username", iv.getUserName());
			obj.put("pass", iv.getPassword());
			obj.put("contact", iv.getContact());
			obj.put("address", iv.getAddress());
			mainObj.put("details",obj);
			PrintWriter out=response.getWriter();
			out.print(mainObj);
			
			System.out.println(mainObj);
			}
			catch(AdException e)
			{
					System.out.println("Exception: " + e.getMessage());
			}

	}
	
	
	@RequestMapping(value="/updatingUserTM.htm", method=RequestMethod.POST)
	public void updatingUserTM(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			String email=request.getParameter("eMailID");
			String password=request.getParameter("password");
			String contact=request.getParameter("contact");
			String address=request.getParameter("address");
			PrintWriter out= response.getWriter();
			User u=(User) request.getSession().getAttribute("tmObject");
			long id=u.getUserId();
			int result=securitiesDAO.updateUser(id,email,password,contact,address);
			if(result>0)
				out.println("true");
			else
				out.println("false");

	}
	
	
	@RequestMapping(value="/updatingUser.htm", method=RequestMethod.POST)
	public void updatingUser(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			String email=request.getParameter("eMailID");
			String password=request.getParameter("password");
			String contact=request.getParameter("contact");
			String address=request.getParameter("address");
			PrintWriter out= response.getWriter();
			User u=(User) request.getSession().getAttribute("adminObject");
			long id=u.getUserId();
			int result=securitiesDAO.updateUser(id,email,password,contact,address);
			if(result>0)
				out.println("true");
			else
				out.println("false");

	}
	

	@RequestMapping(value="/updatingUserBrokers.htm", method=RequestMethod.POST)
	public void updatingUserBroker(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			String email=request.getParameter("eMailID");
			String password=request.getParameter("password");
			String contact=request.getParameter("contact");
			String address=request.getParameter("address");
			PrintWriter out= response.getWriter();
			User u=(User) request.getSession().getAttribute("brokerObject");
			long id=u.getUserId();
			int result=securitiesDAO.updateUser(id,email,password,contact,address);
			if(result>0)
				out.println("true");
			else
				out.println("false");

	}
	
	
	@RequestMapping(value="/deleteFromDatabase.htm", method=RequestMethod.POST)
	public void deleteFromWatch(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		try
		{
		String ss=request.getParameter("symbol");
		InvestorDAO investorDAO=new InvestorDAO();
		PrintWriter out= response.getWriter();
		int val=investorDAO.deleteFromDatabase(ss);
		if(val>0)
			out.println("true");
		else
			out.println("false");
		}catch(AdException e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
		
	}
	
	@RequestMapping(value="/updateDetailsUserTM.htm", method=RequestMethod.POST)
	public void updateDetailsUserTM(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			try{
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("tmObject");
			long id=u.getUserId();
			User iv=securitiesDAO.getDetailsUser(id);
			JSONObject obj=new JSONObject();
			JSONObject mainObj=new JSONObject();
			String fName=iv.getfName();
			obj.put("fName", fName);
			obj.put("lName", iv.getlName());
			obj.put("email", iv.geteMailID());
			obj.put("username", iv.getUserName());
			obj.put("pass", iv.getPassword());
			obj.put("contact", iv.getContact());
			obj.put("address", iv.getAddress());
			mainObj.put("details",obj);
			PrintWriter out=response.getWriter();
			out.print(mainObj);
			
			System.out.println(mainObj);
			}
			catch(AdException e)
			{
					System.out.println("Exception: " + e.getMessage());
			}

	}
}

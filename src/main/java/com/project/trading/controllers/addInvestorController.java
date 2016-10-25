package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trading.DAO.InvestorDAO;
import com.project.trading.DAO.SecuritiesDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.Orders;
import com.project.trading.pojo.SecuritiesDynamic;
import com.project.trading.pojo.User;
import com.project.trading.validator.UserValidator;

@Controller

public class addInvestorController {
	
	@Autowired
	@Qualifier("userValidator")
	UserValidator userValidator;
	
	
	@RequestMapping(value="/addinvestor.htm" , method=RequestMethod.GET)
	public ModelAndView initializeform(@ModelAttribute("investor") Investor investor, BindingResult result){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(value="/addinvestor.htm", method=RequestMethod.POST)
	public ModelAndView investorDetailsAdd(@ModelAttribute("investor") Investor investor, BindingResult result,HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		InvestorDAO investorDAO=new InvestorDAO();
		userValidator.validate(investor, result);
		if(result.hasErrors()){
			mv.setViewName("home");
			return mv;
		}
		String param=request.getParameter("item");
		String fname=investor.getfName();
		String lName=investor.getlName();
		String userName=investor.getUserName();
		String emailId=investor.geteMailID();
		String password=investor.getPassword();
		String pan=investor.getPanCardNum();
		String contact=investor.getContact();
		String acntnum=investor.getAccountNum();
		String add=investor.getAddress();
		
		fname=fname.replaceAll("[^\\dA-Za-z]","").replaceAll("[\\s\\s+]","").trim();
		lName=lName.replaceAll("[^\\dA-Za-z]","").replaceAll("[\\s\\s+]","").trim();
		userName=userName.replaceAll("[^\\dA-Za-z_]","").replaceAll("[\\s\\s+]","").trim();
		emailId=emailId.replaceAll("[^\\dA-Za-z@.]","").replaceAll("[\\s\\s+]","").trim();
		password=password.replaceAll("[^\\dA-Za-z_]","").replaceAll("[\\s\\s+]","").trim();
		contact=contact.replaceAll("[^\\d]","").replaceAll("[\\s\\s+]","").trim();
		pan=pan.replaceAll("[^\\dA-Za-z]","").replaceAll("[\\s\\s+]","").trim();
		acntnum=acntnum.replaceAll("[^\\dA-Za-z]","").replaceAll("[\\s\\s+]","").trim();
		add=add.replaceAll("[^\\dA-Za-z,-]","").replaceAll("[\\s\\s+]","").trim();
		Investor i=investorDAO.createInvestor(fname, lName, emailId, userName, password , contact,pan, acntnum,add,param);
		System.out.println("the  parameter is"+ param);
		request.getSession().setAttribute("InvestorObject", i);
		mv.setViewName("success");
		return mv;
	}
	
	
	@RequestMapping(value="/updateDetails.htm", method=RequestMethod.POST)
	public void updateDetails(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			long id=i.getUserId();
			Investor iv=securitiesDAO.getDetails(id);
			JSONObject obj=new JSONObject();
			JSONObject mainObj=new JSONObject();
			String fName=iv.getfName();
			obj.put("fName", fName);
			obj.put("lName", iv.getlName());
			obj.put("email", iv.geteMailID());
			obj.put("username", iv.getUserName());
			obj.put("pass", iv.getPassword());
			obj.put("contact", iv.getContact());
			obj.put("pan", iv.getPanCardNum());
			obj.put("account", iv.getAccountNum());
			obj.put("address", iv.getAddress());
			mainObj.put("details",obj);
			PrintWriter out=response.getWriter();
			out.print(mainObj);
			
			System.out.println(mainObj);

	}
	
	
	@RequestMapping(value="/updating.htm", method=RequestMethod.POST)
	public void updating(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			String email=request.getParameter("eMailID");
			String password=request.getParameter("password");
			String contact=request.getParameter("contact");
			String ssn=request.getParameter("panCardNum");
			String accntNo=request.getParameter("accountNum");
			String address=request.getParameter("address");
			PrintWriter out= response.getWriter();
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			long id=i.getUserId();
			int result=securitiesDAO.updateIt(id,email,password,contact,ssn,accntNo,address);
			if(result>0)
				out.println("true");
			else
				out.println("false");

	}
	
	@RequestMapping(value="/searchinvestor.htm",method=RequestMethod.POST)
	public void searchInvestor(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException{
		try{
		InvestorDAO investorDAO=new InvestorDAO();
		String uname=request.getParameter("Username");
		String pword=request.getParameter("password");
		String chk=request.getParameter("remeberMeOpt");
		User u=investorDAO.findUser(uname,pword);
		PrintWriter out= response.getWriter();
		if(chk.equals("true"))
		{
			Cookie uName = new Cookie("userid", uname);
			Cookie pw = new Cookie("pwrd", pword);
			pw.setMaxAge(24*60*60);
			uName.setMaxAge(24*60*60);
		    response.addCookie(uName); 
		    response.addCookie(pw); 
		}
			if(u!=null && u.getRole().equalsIgnoreCase("investor"))
			{
				System.out.println("in condition");
				Investor i=investorDAO.findInvestor(u);
			
				if(i!=null)
				{
					request.getSession().setAttribute("InvestorObject", i);
					out.println("true");
				}
				else if(i==null)
				{
					out.println("false");
				}
			}
			else if(u!=null && u.getRole().equalsIgnoreCase("admin"))
				{
				request.getSession().setAttribute("adminObject", u);
				out.println("adminIsHere");
				
				}
			else if(u!=null && u.getRole().equalsIgnoreCase("tradingMember"))
			{
			request.getSession().setAttribute("tmObject", u);
			out.println("tmIsHere");
			
			}
			else if(u!=null && u.getRole().equalsIgnoreCase("broker"))
			{
			request.getSession().setAttribute("brokerObject", u);
			out.println("brokerIsHere");
			
			}
			else if(u==null)
				out.println("false");
		
		
		
		}
	catch(AdException e)
	{
			System.out.println("Exception: " + e.getMessage());
	}
	}
	
	@RequestMapping(value="/searchinvestor.htm" , method=RequestMethod.GET)
	public ModelAndView initialize(@ModelAttribute("user") User user, BindingResult result)throws AdException{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(value="/logout.htm" , method=RequestMethod.GET)
	public ModelAndView logoutUser(HttpServletRequest request,HttpServletResponse response)throws AdException{
		
		ModelAndView mv=new ModelAndView();
		request.getSession().invalidate();
		mv.setViewName("home");
		mv.addObject("investor", new Investor());
		return mv;
	}
	
	@RequestMapping(value="/populateMyOrders.htm", method=RequestMethod.POST)
	public void popmyOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			long id=i.getUserId();
			ArrayList<Orders> orderLists=securitiesDAO.getAllOrders(id);
			JSONObject obj=new JSONObject();
			obj.put("myOrders", orderLists);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	@RequestMapping(value="/popPendingOrders.htm", method=RequestMethod.POST)
	public void popPendOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("brokerObject");
			long id=u.getUserId();
			System.out.println("the id of broker is" + id);
			ArrayList<Orders> orderLists=securitiesDAO.getPopOrders(id);
			System.out.println(orderLists);
			JSONObject obj=new JSONObject();
			obj.put("myOrders", orderLists);
			System.out.println(obj);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	@RequestMapping(value="/popUsersPendingOrders.htm", method=RequestMethod.POST)
	public void popUsersPendOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			String name=request.getParameter("userName");
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("brokerObject");
			long id=u.getUserId();
			System.out.println("the id of broker is" + id);
			ArrayList<Orders> orderLists=securitiesDAO.getUserPopOrders(id,name);
			System.out.println(orderLists);
			JSONObject obj=new JSONObject();
			obj.put("myUsersOrders", orderLists);
			System.out.println(obj);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	@RequestMapping(value="/popDropDown.htm", method=RequestMethod.POST)
	public void popDropDownOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			User u=(User) request.getSession().getAttribute("brokerObject");
			long id=u.getUserId();
			JSONObject obj=new JSONObject();
			ArrayList<Orders> userList=securitiesDAO.getUsersList(id);
			obj.put("users", userList);
			System.out.println(obj);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	@RequestMapping(value="/populateBuyOrders.htm", method=RequestMethod.POST)
	public void popBuyOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			long id=i.getUserId();
			ArrayList<Orders> orderLists=securitiesDAO.getAllBuyOrders(id);
			JSONObject obj=new JSONObject();
			obj.put("mybuyOrders", orderLists);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	
	@RequestMapping(value="/populateSellOrders.htm", method=RequestMethod.POST)
	public void popSellOrders(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			long id=i.getUserId();
			ArrayList<Orders> orderLists=securitiesDAO.getAllSellOrders(id);
			JSONObject obj=new JSONObject();
			obj.put("mysellOrders", orderLists);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
}

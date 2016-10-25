package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trading.DAO.SecuritiesDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.Orders;
import com.project.trading.pojo.PersonalWatchlist;
import com.project.trading.pojo.SecuritiesDynamic;
import com.project.trading.pojo.User;


@Controller
public class investorWorkAreaController {

	@RequestMapping(value="/addSecData.htm", method=RequestMethod.POST)
	public void investorWorkarea(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			String pc=request.getParameter("pagecount");
			System.out.println("the pagecount is" +pc);
			ArrayList<SecuritiesDynamic> sec=securitiesDAO.getAllSecPagi(pc);
			JSONObject obj=new JSONObject();
			obj.put("SecurityList", sec);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	
	@RequestMapping(value="/getSettledTrades.htm", method=RequestMethod.POST)
	public void settledTrades(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
			Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
			String fn=i.getfName()+" "+i.getlName();
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			ArrayList<com.project.trading.pojo.settledTrades> st=securitiesDAO.getSettledTrades(fn);
			JSONObject obj=new JSONObject();
			obj.put("settledList", st);
			PrintWriter out=response.getWriter();
			out.print(obj);

	}
	
	
	@RequestMapping(value="/investorWorkspace.htm", method=RequestMethod.GET)
	public String investorWorkareasds(HttpServletRequest request,HttpServletResponse response) throws AdException
	{
		Investor i=(Investor) request.getSession().getAttribute("InvestorObject");
		if(i==null)
		{
			return "home";	
		}
		if(i.getRole().equalsIgnoreCase("investor"))
		return "success";
		else
			return "home";	
	
	}
	
	@RequestMapping(value="/addToOrder.htm" , method=RequestMethod.GET)
	public ModelAndView OrderData(HttpServletRequest request,HttpServletResponse response)throws AdException{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("success");
		return mv;
	}
	
	@RequestMapping(value="/addToOrder.htm", method=RequestMethod.POST)
	public void addingOrderData(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
		try{
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			PrintWriter out= response.getWriter();
			String s=request.getParameter("symbol").trim();
			String sn=request.getParameter("securityName").trim();
			String cp=request.getParameter("currentPrice").trim();
			String q=request.getParameter("quantity").trim();
			String vd=request.getParameter("validityDate").trim();
			String bp=request.getParameter("bidPrice");
			float valueComputed=Integer.parseInt(q)*Float.parseFloat(bp)*10;
			Investor investor= (Investor) request.getSession().getAttribute("InvestorObject");
			float amntInAccount=investor.getAmountInAccount();
			if(valueComputed>amntInAccount)
			{
				out.println("Notsufficient");
			}
			else
			{
				long uId=investor.getUserId();
				String bName=investor.getBroker();
				Orders o=securitiesDAO.addOrder(s,sn,cp,q,bp,vd,uId,bName,amntInAccount,valueComputed);
				
				if(o!=null)
				{
					out.println("true");
				}
				else if(o==null)
				{
					out.println("false");
				}
			}
		
		}catch(Exception e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
	}
	@RequestMapping(value="/adminIsHere.htm", method=RequestMethod.GET)
	public String adminsWorkArea(HttpServletRequest request,HttpServletResponse response) throws AdException
	{
		User u=(User) request.getSession().getAttribute("adminObject");
		if(u==null)
		{
			return "home";	
		}
		if(u.getRole().equalsIgnoreCase("admin"))
			return "admin";
		else
			return "home";	
	}
	
	
	
	@RequestMapping(value="/addToOrderSell.htm", method=RequestMethod.POST)
	public void addingOrderDatasell(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException
	{
		try{
			SecuritiesDAO securitiesDAO=new SecuritiesDAO();
			PrintWriter out= response.getWriter();
			String s=request.getParameter("symbol").trim();
			String sn=request.getParameter("securityName").trim();
			String qsl=request.getParameter("noOfShares").trim();
			String vd=request.getParameter("validityDate").trim();
			String bp=request.getParameter("bidPrice").trim();
			Investor investor= (Investor) request.getSession().getAttribute("InvestorObject");
				long uId=investor.getUserId();
				String bName=investor.getBroker();
				Orders o=securitiesDAO.addOrderSell(s,sn,qsl,bp,vd,uId,bName);
				
				if(o!=null)
				{
					out.println("true");
				}
				else if(o==null)
				{
					out.println("false");
				}
			
		
		}catch(Exception e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
	}

	
}

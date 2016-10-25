package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trading.DAO.InvestorDAO;
import com.project.trading.DAO.SecuritiesDAO;
import com.project.trading.DAO.TradeDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.PersonalWatchlist;
import com.project.trading.pojo.SecuritiesDynamic;

@Controller
public class addToPersnlWatchController {

	@RequestMapping(value="/addToWatch.htm", method=RequestMethod.POST)
	public void addToWatch(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		try
		{
		Investor ii=(Investor) request.getSession().getAttribute("InvestorObject");
		long id=ii.getUserId();
		SecuritiesDAO secDAO=new SecuritiesDAO();
		String symb=request.getParameter("symbol");
		String sn=request.getParameter("securityname");
		String hp=request.getParameter("highprice");
		String lp=request.getParameter("lowprice");
		String cp=request.getParameter("closingprice");
		String curp=request.getParameter("currentprice");
		PersonalWatchlist pw=secDAO.addToPersnlWatch(symb,sn,hp,lp,cp,curp,id);
		PrintWriter out= response.getWriter();
		if(pw!=null)
		{
			out.println("true");
		}
		else if(pw==null)
		{
			out.println("false");
		}
		}catch(AdException e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
		
	}
	
	@RequestMapping(value="/addToWatch.htm" , method=RequestMethod.GET)
	public ModelAndView initial()throws AdException{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("success");
		return mv;
	}
	@RequestMapping(value="/chkPersnl.htm", method=RequestMethod.POST)
	public void chkWatch(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		TradeDAO tradeDAO=new TradeDAO();
		Investor ii=(Investor) request.getSession().getAttribute("InvestorObject");
		long id=ii.getUserId();
		String secSymb=request.getParameter("secSymbol");
		String bool=tradeDAO.chkWatchList(secSymb,id);
		System.out.println("The resultant is" + bool);
		PrintWriter out= response.getWriter();
		if(bool=="true")
		{
				out.println("true");
		}
		else if(bool=="false")
		{
				out.println("false");
		}
		
	}
	
	@RequestMapping(value="/deleteFromPW.htm", method=RequestMethod.POST)
	public void deleteFromDatabase(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		try
		{
		String ss=request.getParameter("symbol");
		InvestorDAO investorDAO=new InvestorDAO();
		PrintWriter out= response.getWriter();
		int val=investorDAO.deleteFromWatch(ss);
		if(val>0)
			out.println("true");
		else
			out.println("false");
		}catch(AdException e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
		
	}
	
}

package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.trading.DAO.InvestorDAO;
import com.project.trading.DAO.TradeDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Trade;
import com.project.trading.pojo.User;
import com.project.trading.pojo.settledTrades;

@Controller
public class ExchangeWorkAreaController {

	@RequestMapping(value="/addToExchange.htm", method=RequestMethod.POST)
	public void addToExchange(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		try
		{
		User broker=(User) request.getSession().getAttribute("brokerObject");
		String brokerfName=broker.getfName();
		String brokerlName=broker.getlName();
		String brokerName=brokerfName+" "+brokerlName;
		TradeDAO tradeDAO=new TradeDAO();
		String ClientName=request.getParameter("ClientName");
		String securitySymbol=request.getParameter("securitySymbol");
		String securityName=request.getParameter("securityName");
		float bidPrice=Float.parseFloat(request.getParameter("bidPrice"));
		float currentPrice=Float.parseFloat(request.getParameter("currentPrice"));
		String OrderType=request.getParameter("OrderType");
		int tradedQuantity=Integer.parseInt(request.getParameter("tradedQuantity"));
		float totalAmount=Float.parseFloat(request.getParameter("totalAmount"));
		String OrderTimestamp=request.getParameter("OrderTimestamp");
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0", Locale.ENGLISH);
		Date ordert = format1.parse(OrderTimestamp);
		String OrderValidity=request.getParameter("OrderValidity");
		Trade trade=tradeDAO.addToBord(ClientName,securitySymbol,securityName,bidPrice,currentPrice,OrderType,tradedQuantity,totalAmount,ordert,OrderValidity,brokerName);
		PrintWriter out= response.getWriter();
		if(trade!=null)
		{
				out.println("true");
		}
		else
		{
				out.println("false");
		}
		}
		catch(AdException e)
		{
				System.out.println("Exception: " + e.getMessage());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/tmIsHere.htm", method=RequestMethod.GET)
	public String exchangeWorkArea(HttpServletRequest request,HttpServletResponse response) throws AdException
	{
		User u=(User) request.getSession().getAttribute("tmObject");
		if(u==null)
		{
			return "home";	
		}
		if(u.getRole().equalsIgnoreCase("tradingMember"))
			return "exchange";
		else
			return "home";
	}
	
	@RequestMapping(value="/chkOnExchange.htm", method=RequestMethod.POST)
	public void chkOnExchange(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		TradeDAO tradeDAO=new TradeDAO();
		String ClientName=request.getParameter("ClientName");
		String OrderTime=request.getParameter("ordertimeStamp");
		String bool=tradeDAO.chkOrder(ClientName,OrderTime);
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
	
	@RequestMapping(value="/popTradeOrders.htm", method=RequestMethod.POST)
	public void OrdersOnExchange(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		TradeDAO tradeDAO=new TradeDAO();
		ArrayList<Trade> tradeOrdersList=tradeDAO.getAllTradeOrders();
		PrintWriter out= response.getWriter();
		JSONObject obj=new JSONObject();
		System.out.println(obj);
		obj.put("myOrders", tradeOrdersList);
		out.print(obj);
	
	}
	
	@RequestMapping(value="/matchOrders.htm", method=RequestMethod.POST)
	public void MatchOrders(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		TradeDAO tradeDAO=new TradeDAO();
		ArrayList<Trade> tradeOrdersList=tradeDAO.matchOrders();
		System.out.println("The matched Orders list " + tradeOrdersList);
		System.out.println(tradeOrdersList.size());
		PrintWriter out= response.getWriter();
		JSONObject obj=new JSONObject();
		System.out.println(obj);
		obj.put("tradeOrdersList", tradeOrdersList);
		out.print(obj);
	}
	
	@RequestMapping(value="/addToSettlement.htm", method=RequestMethod.POST)
	public void settleTrades(HttpServletRequest request,HttpServletResponse response)throws AdException, IOException
	{
		String cn=request.getParameter("ClientName");
		String bn=request.getParameter("brokerName");
		String ss=request.getParameter("secsymbol");
		String sn=request.getParameter("secname");
		String ordert=request.getParameter("orderTimestamp");
		float bp=Float.parseFloat(request.getParameter("bidPrice"));
		String ot=request.getParameter("orderType");
		int quan=Integer.parseInt(request.getParameter("NumOfShares"));
		float amnt=Float.parseFloat(request.getParameter("amountS"));
		String tt=request.getParameter("tradetime");
		String counter=request.getParameter("counter");
		TradeDAO tradeDAO=new TradeDAO();
		settledTrades st=tradeDAO.settleTrde(cn,bn,ss,sn,bp,ot,quan,amnt,tt,counter,ordert);
		PrintWriter out= response.getWriter();
		if(st==null)
		out.print("false");
		else
		out.print("true");
	}
	
	@RequestMapping(value="/chkSett.htm", method=RequestMethod.POST)
	public void chkSettlement(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		TradeDAO tradeDAO=new TradeDAO();
		String cn=request.getParameter("clientName");
		String ss=request.getParameter("secSymbol");
		String tt=request.getParameter("Tradetimestamp");
		String orderTime=request.getParameter("orderTimestamp");
		String c=request.getParameter("counters");
		System.out.println("The tradetimestamp is" +tt);
		String bool=tradeDAO.chkSettles(cn,ss,tt,c);
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
}

package com.project.trading.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.trading.DAO.SecuritiesDAO;
import com.project.trading.exception.AdException;
import com.project.trading.pojo.Investor;
import com.project.trading.pojo.PersonalWatchlist;
@Controller
public class persnlWatchcontroller {

	@RequestMapping(value="/populateMyList.htm", method=RequestMethod.POST)
	public void addToMyWatch(HttpServletRequest request,HttpServletResponse response) throws AdException, IOException 
	{
		try
		{
			SecuritiesDAO ssd=new SecuritiesDAO();
			Investor idv=(Investor) request.getSession().getAttribute("InvestorObject");
			long vid=idv.getUserId();
			ArrayList<PersonalWatchlist> myWatchlist = ssd.getMydata(vid);
			JSONObject obj=new JSONObject();
			obj.put("myDataWatch", myWatchlist);
			PrintWriter out=response.getWriter();
			out.print(obj);
			
		}catch(AdException e)
		{
			System.out.println("Exception: " + e.getMessage());
		}
		
	}
	@RequestMapping(value="/populateMyList.htm" , method=RequestMethod.GET)
	public ModelAndView initialPage()throws AdException{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("success");
		return mv;
	}
}

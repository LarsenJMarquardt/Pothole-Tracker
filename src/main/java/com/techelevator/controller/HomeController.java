package com.techelevator.controller;

import com.techelevator.model.PotholeDAO;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @Autowired
    PotholeDAO potholeDAO;


    @RequestMapping("/")
    public String displayHome() {
        return "home";
    }
    
    
    @RequestMapping(value="/errors", method=RequestMethod.GET) //do we need this?
    public String renderErrorPage(HttpServletRequest request, ModelMap map) {
    		
    		String errorMsg = "";
    		int httpErrorCode = (int) request.getAttribute("javax.servlet.error.status_code");
    	
    		switch (httpErrorCode) {
	    		case 404: 
	    			errorMsg = "404 Page Not Found";
	    			break;
	    		default:
	    			errorMsg = "Oops! Something went wrong.";
	    			break;
	    	}
    		
    		map.addAttribute("errorMsg", errorMsg);
    		
    		
        return "ErrorPage";
    }
}

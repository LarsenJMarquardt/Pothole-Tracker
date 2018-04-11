package com.techelevator.controller;

import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PotHoleController {

    @Autowired
    PotholeDAO potholeDAO;

    @RequestMapping(path = "/potholes/allPotholes", method = RequestMethod.GET)
    public String showAllPotholes(Model model, @RequestAttribute(required=false) String orderBy)  {
    		
    		if (orderBy == null) {
    			model.addAttribute("allPotholes", potholeDAO.getListOfPotholes("report_date"));
    		} else {
	        model.addAttribute("allPotholes", potholeDAO.getListOfPotholes(orderBy));
	    	}

        return "/potholes/allPotholes";
    }

    @RequestMapping(path = "/potholes/report", method = RequestMethod.GET)
    public String showReport(Model model) {

        return "/potholes/report";
    }

}

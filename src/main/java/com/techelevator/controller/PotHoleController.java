package com.techelevator.controller;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class PotHoleController {

    @Autowired
    PotholeDAO potholeDAO;

    @RequestMapping(path = "/potholes/allPotholes", method = RequestMethod.GET)
    public String showAllPotholes(Model model, @RequestParam(required = false) String orderBy) {
        if (orderBy == null) {
            orderBy = "report_date";
        }

        model.addAttribute("allPotholes", potholeDAO.getListOfPotholes(orderBy));

        return "/potholes/allPotholes";
    }

    @RequestMapping(path = "/potholes/report", method = RequestMethod.GET)
    public String showReport(Model model) {

        return "/potholes/report";
    }
    //new
    @RequestMapping(path = "/potholes/report", method = RequestMethod.POST)
    public String reportPothole(@ModelAttribute("newPothole") Pothole newPothole, Model model) {
    		
    		potholeDAO.reportPothole(newPothole);
    		
        return "redirect:/potholes/allPotholes";
    }

}

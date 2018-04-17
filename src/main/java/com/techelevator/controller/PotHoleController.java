package com.techelevator.controller;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes({"currentUser", "isEmployee"})
public class PotHoleController {

    @Autowired
    PotholeDAO potholeDAO;

    @RequestMapping(path = "/potholes/allPotholes", method = RequestMethod.GET)
    public String showAllPotholes(Model model, @RequestParam(required = false) String orderBy, HttpSession session) {
    
	    	if (session.getAttribute("isEmployee") != null) {
		    	if ((boolean)session.getAttribute("isEmployee")) {
		    		return "redirect:/potholes/employeePotholeList";
		    	}
	    	}
	    	
	    	if (orderBy == null) {
	            orderBy = "report_date";
        }

        model.addAttribute("allPotholes", potholeDAO.getListOfPotholes(orderBy));

        return "/potholes/allPotholes";
    }
    
    @RequestMapping(path = "/potholes/employeePotholeList", method = RequestMethod.GET)
    public String getEmployeePotholeList(Model model, HttpSession session, @RequestParam(required = false) String orderBy) {
    	
	    	if ((boolean)session.getAttribute("isEmployee") == false || (session.getAttribute("isEmployee") == null)) {
	    		return "redirect:/potholes/allPotholes";
	    	}
	    	
	    	if (orderBy == null) {
	            orderBy = "report_date";
	    }

	    model.addAttribute("allPotholes", potholeDAO.getListOfPotholes(orderBy));
	    	
    	
    		return "/potholes/employeePotholeList";
    }
    
    
    
    @RequestMapping(path = "/potholes/employeePotholeUpdate", method = RequestMethod.GET)
    public String employeeModifyPotholeGet(Model model, @RequestParam long potholeId) {
        
    		model.addAttribute("pothole", potholeDAO.getPotholeById(potholeId));
    	
        return "/potholes/employeePotholeUpdate";
    }
    
    @RequestMapping(path = "/potholes/employeePotholeUpdate", method = RequestMethod.POST)
    public String employeeModifyPotholePost(@RequestParam long potholeId, @RequestParam int severity, @RequestParam String statusCode, @RequestParam("statusDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date statusDate) {
    		
    	
		LocalDate localDate = statusDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    		
    		potholeDAO.updatePotholeById(statusCode, localDate, severity, potholeId);
    	
        return "redirect:/potholes/employeePotholeList";
    }
    
    @RequestMapping(path = "/potholes/deletePothole", method = RequestMethod.POST)
    public String employeeDeletePothole(@RequestParam long potholeId) {
    		
    		potholeDAO.deletePotholeById(potholeId);
    	
        return "redirect:/potholes/employeePotholeList";
    }
    
    
    @RequestMapping(path = "/potholes/report", method = RequestMethod.GET)
    public String showReport(Model model, HttpSession session, RedirectAttributes attr) {
    		
    		String currentUser =  (String)session.getAttribute("currentUser");
    		
    		if (currentUser != null) {
    			return "/potholes/report";
    		} else {
    			return "redirect:/user/login";
    		}
    }

    @RequestMapping(path = "/potholes/report", method = RequestMethod.POST)
    public String reportPothole(@RequestParam String streetName, @RequestParam double latitude, 
    									@RequestParam double longitude, Model model) {
    		
    		Pothole newPothole = new Pothole();
    		
    		newPothole.setStreetName(streetName);
    		newPothole.setLatitude(latitude);
    		newPothole.setLongitude(longitude);
    		
    		potholeDAO.reportPothole(newPothole);
    		
        return "redirect:/potholes/allPotholes";
    }

}

package com.techelevator.controller;

import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class PotHoleController {

    @Autowired
    PotholeDAO potholeDAO;

    @RequestMapping(path = "/allPotholes", method = RequestMethod.GET)
    public String showAllPotholes(Model model) {
        model.addAttribute("allPotholes", potholeDAO.getListOfPotholes());


        return "allPotholes";
    }

}

package com.techelevator.controller;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PotholeRestController {

    @Autowired
    private PotholeDAO potholeDAO;

    @RequestMapping(path="/api/setCoordinates", method = RequestMethod.POST)
    public int setCoordinates(Pothole pothole) {
    potholeDAO.reportPothole(pothole);
    return 0;
    }

    @RequestMapping(path="/api/getCoordinates", method = RequestMethod.GET)
    public List<Pothole> getCoordinates() {
        String orderBy = "report_date";
        List<Pothole> potholes = potholeDAO.getListOfPotholes(orderBy);
        return potholes;
    }

}

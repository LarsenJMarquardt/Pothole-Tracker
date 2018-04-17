package com.techelevator.controller;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;

import javax.servlet.http.HttpServletRequest;

@RestController
public class PotholeRestController {

    @Autowired
    private PotholeDAO potholeDAO;
    private Pothole pothole;

    @RequestMapping(path="/api/setCoordinates", method = RequestMethod.GET)
    public int setCoordinates(HttpServletRequest request, @RequestParam String address, @RequestParam double lat, @RequestParam double lng) {
        pothole.setLatitude(lat);
        pothole.setLongitude(lng);
        pothole.setStreetName(address);
    potholeDAO.reportPothole(pothole);
    }

//    @RequestMapping(path="/api/getCoordinates", method = RequestMethod.GET)
//    public (Pothole) getCoordinates(@RequestParam double lat, @RequestParam double lng, @RequestParam String address) {
//
//    }
}

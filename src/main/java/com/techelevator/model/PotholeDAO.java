package com.techelevator.model;

import java.util.List;

public interface PotholeDAO {

    List<Pothole> getListOfPotholesOrderByDate();
    
    List<Pothole> getListOfPotholesOrderBySeverity();
    
    List<Pothole> getListOfPotholesOrderByStreetName();
    
    List<Pothole> getListOfPotholesOrderByStatusCode();

}

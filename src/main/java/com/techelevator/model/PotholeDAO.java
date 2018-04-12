package com.techelevator.model;

import java.util.List;

public interface PotholeDAO {

    public List<Pothole> getListOfPotholes(String orderBy);
    
    public void reportPothole(Pothole newPothole);

}

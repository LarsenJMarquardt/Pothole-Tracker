package com.techelevator.model;

import java.time.LocalDate;
import java.util.List;

public interface PotholeDAO {

    public List<Pothole> getListOfPotholes(String orderBy);
    
    public void reportPothole(Pothole newPothole);
    
    public Pothole getPotholeById(long id);
    
    public void updatePotholeById(String statusCode, LocalDate statusDate, int severity, long id);

    public void deletePotholeById(long id);
}

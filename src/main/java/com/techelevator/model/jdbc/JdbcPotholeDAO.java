package com.techelevator.model.jdbc;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

@Component
public class JdbcPotholeDAO implements PotholeDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcPotholeDAO(DataSource dataSource) {
    		this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Pothole> getListOfPotholes(String orderBy) {
    		List<Pothole> potholeList = new ArrayList<Pothole>();
    		//avoid sql injection attack
    		String sqlGetAllPotHoles = "";
    		if (orderBy.equals("severity") || orderBy.equals("report_date") || orderBy.equals("status_code")) {
			sqlGetAllPotHoles = "SELECT * FROM pothole ORDER BY " + orderBy + " DESC";
    		} else if (orderBy.equals("street_name")) {
    			sqlGetAllPotHoles = "SELECT * FROM pothole ORDER BY " + orderBy;
    		}
    		
		Pothole thePothole;
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllPotHoles);
		while (results.next()) {
			thePothole = mapRowToPothole(results);
			potholeList.add(thePothole);
		}
        return potholeList;
    }
    
   
    
    private Pothole mapRowToPothole(SqlRowSet results) {
        Pothole thePothole = new Pothole();
        thePothole.setId(results.getLong("pothole_id"));
        thePothole.setStreetName(results.getString("street_name"));
        thePothole.setStatusCode(results.getString("status_code"));
        thePothole.setStatusDate(results.getDate("status_date").toLocalDate());
        thePothole.setSeverity(results.getInt("severity"));
        thePothole.setLongitude(results.getDouble("longitude"));
        thePothole.setLatitude(results.getDouble("latitude"));
        thePothole.setReportDate(results.getDate("report_date").toLocalDate());
        return thePothole;
    }

	
}

package com.techelevator.model.jdbc;

import com.techelevator.model.Pothole;
import com.techelevator.model.PotholeDAO;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class JdbcPotholeDAO implements PotholeDAO {

    private JdbcTemplate jdbcTemplate;


    @Override
    public List<Pothole> getListOfPotholes() {


        return null;
    }


    private Pothole mapRowToPothole(SqlRowSet results) {
        Pothole thePothole = new Pothole();
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

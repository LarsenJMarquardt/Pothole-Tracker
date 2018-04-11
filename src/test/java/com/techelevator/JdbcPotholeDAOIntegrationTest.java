package com.techelevator;

import java.time.LocalDate;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Pothole;
import com.techelevator.model.jdbc.JdbcPotholeDAO;

import org.junit.Assert;

public class JdbcPotholeDAOIntegrationTest extends DAOIntegrationTest {
	
	private JdbcPotholeDAO dao;
	private String severity;
	private String reportDate;
	private String statusCode;
	private String streetName;
	
	@Before
	public void setup() {
		this.dao = new JdbcPotholeDAO(getDataSource());
		String sqlInsertTest1 = "INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) "
				+ "VALUES (?,?,?,?,?,?,?)";
		String sqlInsertTest2 = "INSERT INTO pothole (street_name, status_code, status_date, severity, longitude, latitude, report_date) "
				+ "VALUES (?,?,?,?,?,?,?)";
		
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		jdbcTemplate.update(sqlInsertTest1, "AAABrian Road", "repaired", LocalDate.of(2008, 02, 04), 4, 123.1235891345, 534.9999999999999, LocalDate.of(2013, 02, 15));
		jdbcTemplate.update(sqlInsertTest2, "Katie Drive", "reported", LocalDate.of(2008, 02, 03), 3, 123.1235891345, 534.9999999999999, LocalDate.of(2013, 02, 14));
		
		
		severity = "severity";
		reportDate = "report_date";
		statusCode = "status_code";
		streetName = "street_name";
		
	}
	
	@Test
	public void test_order_by_report_date() {
		
		List<Pothole> testList = dao.getListOfPotholes(reportDate);
		
		Assert.assertEquals(7, testList.size());
		Assert.assertEquals("Katie Drive", testList.get(0).getStreetName());
	}
	
	@Test
	public void test_order_by_severity() {
		
		List<Pothole> testList = dao.getListOfPotholes(severity);
		Assert.assertEquals("Katie Drive", testList.get(0).getStreetName());
	}
	
	@Test
	public void test_order_by_status_code() {
		
		List<Pothole> testList = dao.getListOfPotholes(statusCode);
		Assert.assertEquals("AAABrian Road", testList.get(0).getStreetName());
	}
	
	@Test
	public void test_order_by_street_name() {
		
		List<Pothole> testList = dao.getListOfPotholes(streetName);
		Assert.assertEquals("AAABrian Road", testList.get(0).getStreetName());
	}
	
	

}

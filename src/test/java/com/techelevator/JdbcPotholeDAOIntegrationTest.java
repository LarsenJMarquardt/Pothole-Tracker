package com.techelevator;

import org.junit.Before;
import org.junit.Test;

import com.techelevator.model.jdbc.JdbcPotholeDAO;

public class JdbcPotholeDAOIntegrationTest extends DAOIntegrationTest {
	
	private JdbcPotholeDAO dao;
	
	@Before
	public void setup() {
		this.dao = new JdbcPotholeDAO(getDataSource());
		
	}
	
	@Test
	public void test_order_by_report_date() {
		
	}

}

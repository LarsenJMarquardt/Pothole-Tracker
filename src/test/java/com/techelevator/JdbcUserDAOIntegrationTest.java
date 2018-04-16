package com.techelevator;

import java.time.LocalDate;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.jdbc.JdbcUserDAO;

import org.junit.Assert;

public class JdbcUserDAOIntegrationTest extends DAOIntegrationTest {
	
	private JdbcUserDAO dao;
	
	@Before
	public void setup() {
		this.dao = new JdbcUserDAO(getDataSource());
	}
	
	@Test
	public void get_true_value_for_is_employee() {
		
		boolean test = dao.seeIfUserIsEmployee("Not_Sally");
		
		System.out.println(test);
		
		Assert.assertTrue("TRUE!!!", test);
		
	}
	

}

package com.techelevator.model.jdbc;

import javax.sql.DataSource;
import java.security.*;
import com.techelevator.model.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcUserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveUser(String userName, String password) {
		String sqlUpdate = "INSERT INTO app_user(user_name, password) VALUES (?, ?)";
		jdbcTemplate.update(sqlUpdate, userName, password);
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
				"FROM app_user "+
				"WHERE UPPER(user_name) = ? "+
				"AND password = ?";

		return jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase(), password).next();
	}
	
	public boolean seeIfUserIsEmployee(String userName) {
		String sqlIsEmployee = "SELECT is_employee FROM app_user WHERE user_name = ?";
		
		String result = (String) jdbcTemplate.queryForObject(sqlIsEmployee, new Object[] {userName}, String.class);
		
		if (result.equals("true")) {
			return true;
		}
		
		return false;
	}

	@Override
	public void updatePassword(String userName, String password) {
		String sqlUpdate = "UPDATE app_user SET password = ? WHERE user_name = ?";
		jdbcTemplate.update(sqlUpdate, password, userName);
	}

}

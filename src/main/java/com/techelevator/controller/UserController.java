package com.techelevator.controller;


import com.techelevator.model.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;


@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/user/new", method= RequestMethod.GET)
	public String displayNewUserForm() {
		return "user/newUser";
	}
	
	@RequestMapping(path="/user", method= RequestMethod.POST)
	public String createUser(@RequestParam String userName, @RequestParam String password) {
		userDAO.saveUser(userName, password);
		return "redirect:/user/login"; 
	}

	@RequestMapping(path="/user/{userName}", method=RequestMethod.GET)
	public String displayDashboard(Map<String, Object> model, @PathVariable String userName) {
		return "home";
	}

	
//	@RequestMapping(path="/user/{userName}/changePassword", method= RequestMethod.GET)
//	public String displayChangePasswordForm(Map<String, Object> model, @PathVariable String userName) {
//		model.put("userName", userName);
//		return "changePassword";
//	}
//
//	@RequestMapping(path="/user/{userName}/changePassword", method= RequestMethod.POST)
//	public String changePassword(@PathVariable String userName, @RequestParam String password) {
//		userDAO.updatePassword(userName, password);
//		return "userDashboard";
//	}
}

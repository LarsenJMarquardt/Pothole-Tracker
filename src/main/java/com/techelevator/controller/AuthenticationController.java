package com.techelevator.controller;

import com.techelevator.model.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {

	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/user/login", method= RequestMethod.GET)
	public String displayLoginForm() {
		return "/user/login";
	}
	
	@RequestMapping(path="/user/login", method= RequestMethod.POST)
	public String login(@RequestParam String userName,
                        @RequestParam String password,
                        ModelMap model, HttpSession session) {
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			model.put("currentUser", userName);
			return "redirect:/";
		} else {
			return "redirect:/user/login";
		}

	}

	@RequestMapping(path="/user/logout", method= RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
}

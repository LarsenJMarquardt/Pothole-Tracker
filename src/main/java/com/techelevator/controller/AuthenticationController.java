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
@SessionAttributes({"currentUser", "isEmployee"})
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
			session.setAttribute("currentUser", userName);
			session.setAttribute("isEmployee", userDAO.seeIfUserIsEmployee(userName));
			return "redirect:/";
		} else {
			return "redirect:/user/login";
		}

	}

	@RequestMapping(path="/user/newUser", method= RequestMethod.GET)
	public String displayNewUserForm() {
		return "/user/newUser";
	}

	@RequestMapping(path="/user/logout", method= RequestMethod.GET)
	public String logout(ModelMap map, HttpSession session) {
		map.remove("currentUser");
		map.clear();
		session.invalidate();
		return "redirect:/";
	}
}

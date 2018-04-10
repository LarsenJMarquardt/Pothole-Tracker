package com.techelevator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String displayHome() {
        return "home";
    }

    @RequestMapping("/allPotholes")
    public String displayAllPotholes() {
        return "allPotholes";
    }

}

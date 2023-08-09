package com.eculant.libmgmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {

	@GetMapping("/")
	public String showHome() {
		
		return "home";
	}
	
	//add request mapping for /leaders
	@GetMapping("/leader")
	public String showLeaders() {
		
		return "leader";
	}
	
}

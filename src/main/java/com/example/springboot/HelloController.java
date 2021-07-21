package com.example.springboot;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
	String StartupCommand = System.getenv("STARTUP"); 
	@RequestMapping("/")
	public String index() {
		return "Hello startup command: " + StartupCommand;
	}

}

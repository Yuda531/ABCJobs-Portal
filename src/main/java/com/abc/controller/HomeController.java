package com.abc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/homepage")
	public String home(HttpServletResponse res, HttpServletRequest req,
					   @CookieValue(value = "email", defaultValue = "") String email,
					   @CookieValue(value = "userId", defaultValue = "") String userId,
					   HttpSession session) {

		if (!email.equals("")) {
			// add session
			session.setAttribute("email", email);
			session.setAttribute("userId", userId);
			session.setAttribute("isLogin", true);
		}
		return "index";
	}

	@GetMapping("/thankyou")
	public String thankyou(HttpServletResponse res) {
		return "thankyou";
	}

	@GetMapping("/verified")
	public String verified() {
		return "verified";
	}
}

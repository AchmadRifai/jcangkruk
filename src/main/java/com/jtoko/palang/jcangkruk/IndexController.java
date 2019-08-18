package com.jtoko.palang.jcangkruk;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) {
		String moro = "index";
		if (null != req.getSession().getAttribute("kar")) {
			//
		} else {
			moro = "login";
			if (!model.containsKey("kode")) model.put("kode", "warning");
			if (!model.containsKey("pesan")) model.put("pesan", "Harap login dahulu");
		} return moro;
	}

	@RequestMapping("/next")
	public String next(Map<String, Object> model) {
		model.put("message", "You are in new page !!");
		return "next";
	}

        @RequestMapping(value = "/login", method = RequestMethod.POST)
        public String login(HttpServletRequest req, HttpServletResponse res, Map<String, Object> model) {
        	String moro = "index";
        	model.put("message", req.getParameter("user"));
        	return moro;
        }
}

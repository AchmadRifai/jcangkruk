package com.jtoko.palang.jcangkruk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class JcangkrukApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(JcangkrukApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		// TODO Auto-generated method stub
		return builder.sources(JcangkrukApplication.class);
	}

}

package com.eculant.libmgmt.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(securityDataSource);
	/*
	 * //add users for in memory authentication UserBuilder users =
	 * User.withDefaultPasswordEncoder(); auth.inMemoryAuthentication()
	 * .withUser(users.username("Kavya").password("root").roles("Founder"))
	 * .withUser(users.username("Devendra Rao").password("root").roles("Co-Founder")
	 * ) .withUser(users.username("Ata B").password("root").roles("Co-Founder"))
	 * .withUser(users.username("Khushi").password("root").roles("Mistress"));
	 */
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
				/* .anyRequest().authenticated() */
				
				.antMatchers("/leader/**").hasRole("Founder")
			.and()
			.formLogin()
				.loginPage("/showLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.permitAll()
			.and()
			.logout().permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}
	
}

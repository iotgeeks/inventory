package org.iotgeeks.config;

import java.util.Arrays;

import org.iotgeeks.entity.IotGeekAdmin;
import org.iotgeeks.service.IotGeekAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyAppUserDetailsService implements UserDetailsService {
	@Autowired
	private IotGeekAdminService iotGeekAdminService;
	
	public UserDetails loadUserByUsername(String userName)
			throws UsernameNotFoundException {
		IotGeekAdmin activeUserInfo = iotGeekAdminService.getIotGeekAdminByEmail(userName);
		GrantedAuthority authority = new SimpleGrantedAuthority(activeUserInfo.getRole());
		UserDetails userDetails = (UserDetails)new User(activeUserInfo.getUserName(),
				activeUserInfo.getPassword(), Arrays.asList(authority));
		return userDetails;
	}
}


package com.searchmytraining.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.impl.SMTUserDetailsDao;

@Service("userDetailsService")
public class SMTUserDetailsService implements UserDetailsService {
	
	@Autowired
	@Qualifier("smtUserDetailsDao")
	private SMTUserDetailsDao smtUserDetailsDao;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		return smtUserDetailsDao.loadUserByUsername(username);
		
		
		
	}

}
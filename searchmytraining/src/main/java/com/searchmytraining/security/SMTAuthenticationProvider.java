package com.searchmytraining.security;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.searchmytraining.dao.IUserAttemptsDAO;

@Component("authenticationProvider")
public class SMTAuthenticationProvider extends DaoAuthenticationProvider {

	@Autowired
	@Qualifier("userAttemptsDao")
	private IUserAttemptsDAO userAttemptsDao;

	public IUserAttemptsDAO getUserAttemptsDao() {
		return userAttemptsDao;
	}

	public void setUserAttemptsDao(IUserAttemptsDAO userAttemptsDao) {
		this.userAttemptsDao = userAttemptsDao;
	}

	@Autowired
	@Qualifier("userDetailsService")
	@Override
	public void setUserDetailsService(UserDetailsService userDetailsService) {
		super.setUserDetailsService(userDetailsService);
	}

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {

		Authentication auth = null;

		try {
			auth = super.authenticate(authentication);

			// if reach here, means login success, else an exception will be
			// thrown
			// reset the user_attempts
			userAttemptsDao.resetFailAttempts(((SMTUser) auth.getPrincipal())
					.getUserId());

			
		} catch (AuthenticationException e) {

			if (e instanceof BadCredentialsException) {
				System.out.println("inside BadCredentialsException ");
				// invalid login, update to user_attempts
				userAttemptsDao.updateFailAttempts(authentication.getName());
				throw new BadCredentialsException("You seems to have entered wrong email id or passsword");
			} else if (e instanceof UsernameNotFoundException) {
				System.out.println("inside UsernameNotFoundException ");
				throw e;
			} else if (e instanceof LockedException) {

				// this user is locked!
				String error = "";
				UserAttempts userAttempts = userAttemptsDao
						.getUserAttempts(authentication.getName());

				if (userAttempts != null) {
					Date lastAttempts = userAttempts.getLastModified();
					error = "User account is locked!";
				} else {
					error = e.getMessage();
				}

				throw new LockedException(error);
			}

		}
		return auth;
	}

	// @Override
	// protected Authentication createSuccessAuthentication(Object principal,
	// Authentication authentication,
	// UserDetails user) {
	// SMTAuthenticationToken result = new
	// SMTAuthenticationToken(((SMTUser)user).getUserId(),principal,
	// authentication.getCredentials(), new
	// SimpleAuthorityMapper().mapAuthorities(user.getAuthorities()));
	// result.setDetails(authentication.getDetails());
	//
	// return result;
	// }

}
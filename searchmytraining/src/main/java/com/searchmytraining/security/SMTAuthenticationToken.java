package com.searchmytraining.security;

import java.util.Collection;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

public class SMTAuthenticationToken extends AbstractAuthenticationToken {

	private static final long serialVersionUID = -6432752932318015135L;

	private final Long id;
	private final Object principal;
	private Object credentials;
	private boolean authenticated;

	public SMTAuthenticationToken(Long id, Object principal, Object credentials) {
		super(null);
		this.id = id;
		this.principal = principal;
		this.credentials = credentials;
		setAuthenticated(false);
	}

	public SMTAuthenticationToken(Long id,Object principal, Object credentials,
			Collection<? extends GrantedAuthority> authorities) {
		super(authorities);
		this.id = id;
		this.principal = principal;
		this.credentials = credentials;
		this.authenticated = true;
	}

	public Long getId() {
		return id;
	}
	
	@Override
	public Object getCredentials() {
		return principal;
	}

	@Override
	public Object getPrincipal() {
		return credentials;
	}

	public void setAuthenticated(boolean isAuthenticated)
			throws IllegalArgumentException {
		if (isAuthenticated) {
			throw new IllegalArgumentException(
					"Once created you cannot set this token to authenticated. Create a new instance using the constructor which takes a GrantedAuthority list will mark this as authenticated.");
		}

		super.setAuthenticated(false);
	}

	@Override
	public void eraseCredentials() {
		super.eraseCredentials();
		credentials = null;
	}

}

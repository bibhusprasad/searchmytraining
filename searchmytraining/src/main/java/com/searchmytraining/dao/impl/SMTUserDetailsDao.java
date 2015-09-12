package com.searchmytraining.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.searchmytraining.controller.PasswordController;
import com.searchmytraining.security.SMTUser;

@Repository("smtUserDetailsDao")
public class SMTUserDetailsDao {
	static Logger logger = Logger.getLogger(SMTUserDetailsDao.class.getName());
	private boolean enableAuthorities = true;
	private static String rolePrefix = "ROLE_";

	public static final String USERS_BY_USERNAME_QUERY = "select userid,username,password,enabled,accountNonLocked "
			+ "from users " + "where username = ?";

	public static final String ROLES_BY_USERNAME_QUERY = "select userid,role from user_roles "
			+ "where userid = ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	public SMTUser loadUserByUsername(final String username) {
		SMTUser smtUser = null;
		try {
			smtUser = jdbcTemplate.queryForObject(USERS_BY_USERNAME_QUERY,
					new Object[] { username }, new RowMapper<SMTUser>() {
						public SMTUser mapRow(ResultSet rs, int rowNum)
								throws SQLException {

							long userId = rs.getInt(1);
							String userName = rs.getString(2);
							String password = rs.getString(3);
							boolean enabled = rs.getBoolean(4);
							boolean accountNonLocked = rs.getBoolean(5);
							List<GrantedAuthority> roles = AuthorityUtils.NO_AUTHORITIES;
							if (enableAuthorities) {
								roles = loadUserRoles(userId);
							}
							return new SMTUser(userId, userName, password,
									enabled, accountNonLocked, true, true,
									roles);

						}
					});
		} catch (EmptyResultDataAccessException e) {
			logger.error(e.getMessage(), e);

		}
		if (null == smtUser) {
			throw new UsernameNotFoundException("The user name or password entered is not correct", username);
		}

		return smtUser;

	}

	/**
	 * Loads authorities by executing the SQL from
	 * <tt>authoritiesByUsernameQuery</tt>.
	 *
	 * @return a list of GrantedAuthority objects for the user
	 */
	protected List<GrantedAuthority> loadUserRoles(Long userId) {
		return jdbcTemplate.query(ROLES_BY_USERNAME_QUERY,
				new Long[] { userId }, new RowMapper<GrantedAuthority>() {
					public GrantedAuthority mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						String roleName = rolePrefix + rs.getString(2);

						return new SimpleGrantedAuthority(roleName);
					}
				});
	}

}

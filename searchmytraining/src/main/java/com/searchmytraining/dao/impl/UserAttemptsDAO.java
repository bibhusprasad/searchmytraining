package com.searchmytraining.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.authentication.LockedException;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.IUserAttemptsDAO;
import com.searchmytraining.security.UserAttempts;

@Repository("userAttemptsDao")
public class UserAttemptsDAO extends JdbcDaoSupport implements IUserAttemptsDAO {

	private static final String SQL_USERS_UPDATE_LOCKED = "UPDATE USERS SET accountNonLocked = ? WHERE username = ?";
	private static final String SQL_USER_ATTEMPTS_GET = "SELECT U.USERID,UT.ATTEMPTS FROM USERS U LEFT JOIN USER_ATTEMPTS UT ON U.USERID = UT.USERID  WHERE U.USERNAME=?";
	private static final String SQL_USER_ATTEMPTS_UPSERT = "INSERT INTO USER_ATTEMPTS (USERID, ATTEMPTS, LASTMODIFIED) VALUES (?,?,NOW()) ON DUPLICATE KEY UPDATE  ATTEMPTS=ATTEMPTS+1,LASTMODIFIED=NOW()";
	private static final String SQL_USER_ATTEMPTS_RESET_ATTEMPTS = "UPDATE USER_ATTEMPTS SET attempts = 0, lastmodified = ? WHERE userid = ?";

	private static final int MAX_ATTEMPTS = 3;

	@Autowired
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}

	@Override
	public void updateFailAttempts(String username) {
		UserAttempts userAttempts = getUserAttempts(username);
		if (userAttempts != null && userAttempts.getUserId() > 0) {
			// if no record, insert a new
			getJdbcTemplate().update(SQL_USER_ATTEMPTS_UPSERT,
					new Object[] { userAttempts.getUserId(), 1 });
			if (userAttempts.getAttempts() + 1 >= MAX_ATTEMPTS) {
				// locked user
				getJdbcTemplate().update(SQL_USERS_UPDATE_LOCKED,
						new Object[] { false, username });
				// throw exception
				throw new LockedException("User Account is locked!");
			}
		}
	}

	@Override
	public UserAttempts getUserAttempts(String username) {
		try {
			UserAttempts userAttempts = getJdbcTemplate().queryForObject(
					SQL_USER_ATTEMPTS_GET, new Object[] { username },
					new RowMapper<UserAttempts>() {
						public UserAttempts mapRow(ResultSet rs, int rowNum)
								throws SQLException {
							UserAttempts userAttempts = new UserAttempts();
							userAttempts.setUserId(rs.getLong("userid"));
							userAttempts.setAttempts(rs.getInt("attempts"));
							return userAttempts;
						}
					});
			return userAttempts;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public void resetFailAttempts(Long userId) {
		getJdbcTemplate().update(SQL_USER_ATTEMPTS_RESET_ATTEMPTS,
				new Object[] { new Date(), userId });
	}

}

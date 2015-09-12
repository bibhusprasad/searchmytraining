package com.searchmytraining.dao.impl;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao extends JdbcDaoSupport {
	
	@Autowired
	private DataSource dataSource;
	
	@PostConstruct 
	public void init() {
		setDataSource(dataSource);
	}

	public int retrieveStudentCount() {
        String query = "select count(*) from student";
       return getJdbcTemplate().queryForObject(query,Integer.class);
                                    
	}

	

}

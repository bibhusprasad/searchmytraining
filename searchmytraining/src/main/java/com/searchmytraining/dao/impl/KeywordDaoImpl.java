package com.searchmytraining.dao.impl;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.KeywordDAO;
import com.searchmytraining.entity.KeywordEntity;

@Repository
public class KeywordDaoImpl extends AbstractJpaDAO<KeywordEntity> implements
		KeywordDAO {
	public void addKeyWords(KeywordEntity keywordEntity) {
		create(keywordEntity);
	}

}

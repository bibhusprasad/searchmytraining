package com.searchmytraining.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.searchmytraining.dao.KeywordDAO;
import com.searchmytraining.entity.KeywordEntity;
import com.searchmytraining.service.IKeywordService;

@Service
public class KeywordService implements IKeywordService {
	@Autowired
	KeywordDAO keyDao;

	@Override
	@Transactional
	public void addKeyWords(KeywordEntity keywordEntity) {
		keyDao.addKeyWords(keywordEntity);
	}

}

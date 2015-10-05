package com.searchmytraining.dao.impl;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.util.SearchUtil;

@Repository
public class CalenderDaoImpl extends AbstractJpaDAO<CalenderEntity> implements
		CalenderDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	public StandardAnalyzer analyzer;

	@Autowired
	public QueryParser queryParser;

	@Autowired
	public ICityService cityservice;

	@Override
	@Transactional
	public void addCalender(CalenderEntity entity) {
		create(entity);
	}

	@Override
	public List<CalenderEntity> getRecentelyAdded(Integer userId,
			Timestamp timestamp) {
		String query = "from CalenderEntity calender where calender.user.userId='"
				+ userId
				+ "' and SUBSTRING(calender.createdOn,1,11)='"
				+ timestamp.toString().substring(0, 11).trim() + "'";
		TypedQuery<CalenderEntity> typedQuery = entityManager.createQuery(
				query, CalenderEntity.class);
		return typedQuery.getResultList();
	}

	@Override
	public List<CalenderEntity> getUserCalender(Integer userId) {
		String query = "from CalenderEntity calender where calender.user.userId="
				+ userId;
		TypedQuery<CalenderEntity> typedQuery = entityManager.createQuery(
				query, CalenderEntity.class);
		return typedQuery.getResultList();
	}

	@Override
	@Cacheable(value = "autoCompleteCache")
	public List<CalenderEntity> getAllCalender() {
		System.out.println("Came In for Query");
		setClazz(CalenderEntity.class);
		return findAll();
	}

	@Override
	public String updateCalender(CalenderEntity entity) {
		update(entity);
		return "success";
	}

	@Override
	public void removeCalender(long calenderId) {
		deleteById(calenderId);
	}

	@Override
	public List<CalenderEntity> getCalendersByKeyword(String keyword) {
		List<CalenderEntity> list = new ArrayList<CalenderEntity>();
		CalenderEntity cal;
		try {
			Path path = Paths.get(SearchUtil.basePath);
			Directory dir = FSDirectory.open(path);
			IndexReader reader = DirectoryReader.open(dir);
			IndexSearcher searcher = new IndexSearcher(reader);
			/*
			 * QueryParser queryParser = new
			 * QueryParser("BasicSearchString",analyzer);
			 */
			Query query = queryParser.parse(keyword);
			TopDocs topDocs = searcher.search(query, 10);
			ScoreDoc[] scoreDosArray = topDocs.scoreDocs;
			for (ScoreDoc scoredoc : scoreDosArray) {
				// Retrieve the matched document and show relevant details
				Document doc = searcher.doc(scoredoc.doc);
				cal = new CalenderEntity();
				cal.setCalenderId(Integer.parseInt(doc.getField("calenderId")
						.stringValue()));
				cal.setCourseTitle(doc.getField("courseTitle").stringValue());
				cal.setFromDate((Timestamp) doc.getField("fromDate"));
				cal.setToDate((Timestamp) doc.getField("toDate"));
				cal.setPrice(Double.parseDouble(doc.getField("price")
						.stringValue()));
				cal.setTrainingKey(doc.getField("trainingKey").stringValue());
				list.add(cal);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<CalenderEntity> getCalendersByAdvancedSearch(CalenderEntity cal) {
		List<CalenderEntity> lstCal = new ArrayList<CalenderEntity>();
		BooleanQuery query;
		Query query1;
		QueryParser queryParser;
		try {
			Path path = Paths.get(SearchUtil.basePath);
			Directory dir = FSDirectory.open(path);
			IndexReader reader = DirectoryReader.open(dir);
			IndexSearcher searcher = new IndexSearcher(reader);
			query = new BooleanQuery();
			if (cal.getTrainingKey() != null) {
				queryParser = new QueryParser("BasicSearchString", analyzer);
				query1 = queryParser.parse(cal.getTrainingKey());
				query.add(query1, BooleanClause.Occur.MUST);
			}
			/*if (cal.getCity().getCityName() != null) {
				queryParser = new QueryParser("place", analyzer);
				query1 = queryParser.parse(cal.getCity().getCityName());
				query.add(query1, BooleanClause.Occur.MUST);
			}*/
			// For Date Range Query
			/*
			 * if(fromDate != null && toDate != null){ Term begin = new
			 * Term("fromDate",fromDate); Term end = new Term("toDate",toDate);
			 * query1 = new RangeQueryBuilder(begin, end, true);
			 * query.add(query1,BooleanClause.Occur.MUST); }
			 */
			TopDocs topDocs = searcher.search(query, 10);
			ScoreDoc[] scoreDosArray = topDocs.scoreDocs;
			for (ScoreDoc scoredoc : scoreDosArray) {
				// Retrieve the matched document and show relevant details
				Document doc = searcher.doc(scoredoc.doc);
				/*
				 * System.out.println("\nKeyWord: "+doc.getField("KeyWord").
				 * stringValue());
				 * System.out.println("Description: "+doc.getField
				 * ("Description").stringValue());
				 * System.out.println("Code: "+doc
				 * .getField("Code").stringValue());
				 */
				cal = new CalenderEntity();
				cal.setCourseTitle(doc.getField("courseTitle").stringValue());
				cal.setFromDate((Timestamp) doc.getField("fromDate"));
				cal.setToDate((Timestamp) doc.getField("toDate"));
				cal.setPrice(Double.parseDouble(doc.getField("price")
						.stringValue()));
				cal.setTrainingKey(doc.getField("trainingKey").stringValue());
				lstCal.add(cal);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return lstCal;
	}

	@Override
	public List<CalenderEntity> getCalendersOnSearch(
			SearchCalendarDTO searchcaldto) {
		String strquery = "from CalenderEntity cal where cal.city.cityId=? AND cal.indstrySubcat.trnIndstrSubCatId=? AND (cal.start_date BETWEEN ? AND ?) ORDER BY cal.trngId DESC";
		TypedQuery<CalenderEntity> typedquery = entityManager.createQuery(
				strquery, CalenderEntity.class);
		typedquery.setParameter(1, searchcaldto.getCityid());
		typedquery.setParameter(2, searchcaldto.getIndustrysubcatid());
		typedquery.setParameter(3, searchcaldto.getFromdate());
		typedquery.setParameter(4, searchcaldto.getTodate());
		return typedquery.getResultList();
	}
}

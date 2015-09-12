package com.searchmytraining.dao.impl;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
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
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.util.SearchUtil;

@Repository
public class CalenderDaoImpl extends AbstractJpaDAO<CalenderEntity> implements
		CalenderDAO {
	EntityManager entityManager;
	@Autowired
	public WebApplicationContext context;
	
	@Autowired
	public StandardAnalyzer analyzer;
	
	@Autowired
	public QueryParser queryParser;
	
	@Autowired
	public ICityService cityservice;

	@Override
	public void addCalender(CalenderEntity entity) {
		create(entity);
	}

	@Override
	public List<CalenderEntity> getRecentelyAdded(Integer userId,
			Timestamp timestamp) {

		String query = "from CalenderEntity calender where calender.user.userId='"+userId+"' and SUBSTRING(calender.createdOn,1,11)='" + timestamp.toString().substring(0, 11).trim()+"'";
		
		entityManager = getEntityManager();
		TypedQuery<CalenderEntity> query1 = entityManager.createQuery(query,CalenderEntity.class);
		List<CalenderEntity> l = query1.getResultList();
		return l;
	}

	@Override
	public List<CalenderEntity> getUserCalender(Integer userId) {
		String query = "from CalenderEntity calender where calender.user.userId="+userId;
		entityManager = getEntityManager();
		TypedQuery<CalenderEntity> query1 = entityManager.createQuery(query,CalenderEntity.class);
		List<CalenderEntity> l = query1.getResultList();
		return l;
	}

	@Override
	@Cacheable(value="autoCompleteCache")
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
		try{
			Path path = Paths.get(SearchUtil.basePath);
			
			
			Directory dir = FSDirectory.open(path);
			
			IndexReader reader = DirectoryReader.open(dir);
			IndexSearcher searcher = new IndexSearcher(reader);
			
			/*QueryParser queryParser = new QueryParser("BasicSearchString",analyzer);*/
			
			Query query = queryParser.parse(keyword);
			
			TopDocs topDocs = searcher.search(query, 10);
			
			ScoreDoc[] scoreDosArray = topDocs.scoreDocs;
			
			System.out.println("Hits: "+topDocs.totalHits);
			
			for(ScoreDoc scoredoc: scoreDosArray){
			      //Retrieve the matched document and show relevant details
			      Document doc = searcher.doc(scoredoc.doc);
			      
			      CityEntity city = cityservice.getCity(doc.getField("place").stringValue().trim());
			      cal = (CalenderEntity)context.getBean("calenderEntity");
			      cal.setTrngId(Integer.parseInt(doc.getField("trngId").stringValue()));
			      cal.setTitle(doc.getField("title").stringValue());
			      cal.setStart_date(doc.getField("start_date").stringValue());
			      cal.setEnd_date(doc.getField("end_date").stringValue());
			      cal.setPrice(Double.parseDouble(doc.getField("price").stringValue()));
			      cal.setKeyword(doc.getField("keyword").stringValue());
			      cal.setTitle(doc.getField("title").stringValue());
			      cal.setCity(city);
			      cal.setDescription(doc.getField("description").stringValue());
			      cal.setType(doc.getField("type").stringValue());
			      cal.setBrochure(doc.getField("brochure").stringValue());
			      list.add(cal);
			   }
			
		}catch(Exception ex){
			System.out.println("Exception::"+ex.getMessage());
			ex.printStackTrace();
		}
		
		return list;
		
	}


	public List<CalenderEntity> getCalendersByAdvancedSearch(CalenderEntity cal){
		
		List<CalenderEntity> lstCal = new ArrayList<CalenderEntity>();
		BooleanQuery query;
		Query query1;
		QueryParser queryParser;
		try{
			
			Path path = Paths.get(SearchUtil.basePath);
			Directory dir = FSDirectory.open(path);
			
			IndexReader reader = DirectoryReader.open(dir);
			IndexSearcher searcher = new IndexSearcher(reader);
			
			query = new BooleanQuery();
			if(cal.getKeyword() != null){
				queryParser = new QueryParser("BasicSearchString",analyzer);
				query1 = queryParser.parse(cal.getKeyword());
				query.add(query1,BooleanClause.Occur.MUST);
			}
			if(cal.getCity().getCityName() != null){
				queryParser = new QueryParser("place", analyzer);
				query1 = queryParser.parse(cal.getCity().getCityName());
				query.add(query1,BooleanClause.Occur.MUST);
			}
			
			//For Date Range Query
			/*if(fromDate != null && toDate != null){
				Term begin = new Term("fromDate",fromDate);
				Term end = new Term("toDate",toDate);
				query1 = new RangeQueryBuilder(begin, end, true);
				query.add(query1,BooleanClause.Occur.MUST);
			}*/
			
			TopDocs topDocs = searcher.search(query, 10);
			
			ScoreDoc[] scoreDosArray = topDocs.scoreDocs;
			
			for(ScoreDoc scoredoc: scoreDosArray){
			      //Retrieve the matched document and show relevant details
			      Document doc = searcher.doc(scoredoc.doc);
			      
			      /*System.out.println("\nKeyWord: "+doc.getField("KeyWord").stringValue());
			      System.out.println("Description: "+doc.getField("Description").stringValue());
			      System.out.println("Code: "+doc.getField("Code").stringValue());*/

			      System.out.println("\nTitle: "+doc.getField("title").stringValue());
			      System.out.println("KeyWord: "+doc.getField("keyword").stringValue());
			      System.out.println("Place: "+doc.getField("place").stringValue());
			     
			      cal = (CalenderEntity)context.getBean("calenderEntity");
			      
			      CityEntity city = cityservice.getCity(doc.getField("place").stringValue().trim());
			      
			      cal.setTitle(doc.getField("title").stringValue());
			      cal.setStart_date(doc.getField("start_date").stringValue());
			      cal.setEnd_date(doc.getField("end_date").stringValue());
			      cal.setPrice(Double.parseDouble(doc.getField("price").stringValue()));
			      cal.setKeyword(doc.getField("keyword").stringValue());
			      cal.setTitle(doc.getField("title").stringValue());
			      cal.setCity(city);
			      cal.setDescription(doc.getField("description").stringValue());
			      cal.setType(doc.getField("type").stringValue());
			      lstCal.add(cal);
			   }
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return lstCal;
	}

	@Override
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto) {

		entityManager = getEntityManager();
		String strquery = "from CalenderEntity cal where cal.city.cityId=? AND cal.indstrySubcat.trnIndstrSubCatId=? AND (cal.start_date BETWEEN ? AND ?) ORDER BY cal.trngId DESC";
		TypedQuery<CalenderEntity> typedquery = entityManager.createQuery(strquery, CalenderEntity.class);
		typedquery.setParameter(1, searchcaldto.getCityid());
		typedquery.setParameter(2, searchcaldto.getIndustrysubcatid());
		typedquery.setParameter(3, searchcaldto.getFromdate());
		typedquery.setParameter(4, searchcaldto.getTodate());
		List<CalenderEntity> callist = typedquery.getResultList(); 
		for(CalenderEntity cal:callist)
			System.out.println("Title: "+cal.getTitle()+"\n"+cal.getStart_date()+"\nStart Date: "+cal.getCity().getCityName()+"\n");
		return callist;
	}
}

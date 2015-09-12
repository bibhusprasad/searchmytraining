package com.searchmytraining.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.lucene.analysis.core.StopAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.entity.CalenderEntity;

public class SearchUtil {
	
	@Autowired
	public WebApplicationContext context;
	
	public static String basePath;
	public static String basePath1;
	
	public String getBasePath() {
		return basePath;
	}
	public static String getBasePath1() {
		return basePath1;
	}
	
	public IndexWriter getIndexforCalenderEntities() throws Exception{
		
		File file = new File(basePath);
		
		file.delete();
		
		Path path = Paths.get(basePath);
		Directory dir = FSDirectory.open(path);
		IndexWriterConfig conf = new IndexWriterConfig(new StopAnalyzer());
		IndexWriter idx = new IndexWriter(dir,conf);
		return idx;
		
	}
	
	public IndexWriter getIndexforinstituteEntities() throws IOException
	{
		/*File file = new File(basePath1);
		file.delete();*/
		Path path = Paths.get(basePath1);
		Directory dir = FSDirectory.open(path);
		IndexWriterConfig config = new IndexWriterConfig(new StopAnalyzer());
		IndexWriter index = new IndexWriter(dir, config);
		return index;
	}
	
	@SuppressWarnings("deprecation")
	public void addCalenderEntryToIndex(CalenderEntity cal){
		
		IndexWriter idx = null;
		try {
			idx = getIndexforCalenderEntities();
			Document doc = (Document)context.getBean("lucenedocument");
			IndexableField idxCalId = new Field("trngId",cal.getTrngId().toString(),Store.NO, Index.NOT_ANALYZED);
			doc.add(idxCalId);
			IndexableField idxKeyword = new Field("keyword",cal.getKeyword(),Store.YES,Index.ANALYZED);
			doc.add(idxKeyword);
			IndexableField idxTitle = new Field("title", cal.getTitle(), Store.YES, Index.ANALYZED);
			doc.add(idxTitle);
			IndexableField idxStartDate = new Field("start_date",cal.getStart_date(),Store.YES,Index.ANALYZED);
			doc.add(idxStartDate);
			IndexableField idxEndDate = new Field("end_date",cal.getEnd_date(),Store.YES,Index.ANALYZED);
			doc.add(idxEndDate);
			IndexableField idxPrice = new Field("price",cal.getPrice().toString(),Store.YES,Index.ANALYZED);
			doc.add(idxPrice);
			IndexableField idxPlace = new Field("place",cal.getCity().getCityName(),Store.YES,Index.ANALYZED);
			doc.add(idxPlace);
			IndexableField idxType = new Field("type",cal.getType(),Store.YES,Index.ANALYZED);
			doc.add(idxType);
			IndexableField idxDesc = new Field("description",cal.getDescription(),Store.YES,Index.ANALYZED_NO_NORMS);
			doc.add(idxDesc);
			IndexableField idxBasicSearch = new Field("BasicSearchString",cal.getTitle()+" "+cal.getDescription()+" "+cal.getKeyword()+" "+cal.getCity().getCityName()+" "+cal.getPrice().toString(),Store.NO,Index.ANALYZED);
			doc.add(idxBasicSearch);
			
			idx.addDocument(doc);
			
			idx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(idx != null && idx.isOpen()){
				try {
					idx.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}

package com.searchmytraining.enquiry.training;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.apache.lucene.search.suggest.InputIterator;
import org.apache.lucene.util.BytesRef;

import com.searchmytraining.entity.CalenderEntity;

public class TrainingIterator implements InputIterator {

	private Iterator<CalenderEntity> calIterator;
	private CalenderEntity currTraining;
	
	TrainingIterator(Iterator<CalenderEntity> iterator){
		this.calIterator = iterator;
	}
	
	public BytesRef next(){
		if(calIterator.hasNext()){
			currTraining = calIterator.next();
			try{
				return new BytesRef((currTraining.getTitle()+currTraining.getKeyword()).getBytes("UTF8"));
			}catch(UnsupportedEncodingException ex){
				throw new Error("Not able to convert to UTF8");
			}
		}else{
			return null;
		}
	}

	public boolean hasContexts() {
		return false;
	}
	
	public Set<BytesRef> contexts() {
		try {
            Set<BytesRef> addlParams = new HashSet<BytesRef>();
            addlParams.add(new BytesRef(currTraining.getDescription().getBytes("UTF8")));
            return addlParams;
        } catch (UnsupportedEncodingException e) {
            throw new Error("Couldn't convert to UTF-8");
        }
	}
 
	public boolean hasPayloads() {
		return true;
	}

	public BytesRef payload() {
		try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ObjectOutputStream out = new ObjectOutputStream(bos);
            out.writeObject(currTraining);
            out.close();
         //   System.out.println("inflated object:"+bos);
            return new BytesRef(bos.toByteArray());
        } catch (IOException e) {
        	e.printStackTrace();
            throw new Error("Well that's unfortunate.");
            
        }
	}

	public long weight() {
		return currTraining.getRank();    /*getPriority();*/
	}
	
	 public Comparator<BytesRef> getComparator() {
	        return null;
	    }

}

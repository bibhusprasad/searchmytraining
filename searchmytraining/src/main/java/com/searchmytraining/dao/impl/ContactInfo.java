package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IContactInfoDAO;
import com.searchmytraining.entity.ContactInfoEntity;

@Repository
public class ContactInfo extends AbstractJpaDAO<ContactInfoEntity> implements IContactInfoDAO{

	@Override
	public void insertContactInfo(ContactInfoEntity entity) {
		ContactInfoEntity contact = getContactInfoDetails(entity.getUser().getUserId().longValue());
		if(contact!=null)
		{
			entity.setContctinfoId(contact.getContctinfoId());
			update(entity);
		}
		else
			create(entity);
	}

	@Override
	public ContactInfoEntity getContactInfoDetails(Long userid) {
		
		EntityManager entitymanager = getEntityManager();
		String strquery = "from ContactInfoEntity contact where contact.user.userId=?";
		TypedQuery<ContactInfoEntity> typedquery  = entitymanager.createQuery(strquery,ContactInfoEntity.class);
		
		try{
			typedquery.setParameter(1, userid.intValue());
			ContactInfoEntity contact = typedquery.getSingleResult();
			return contact;
		}
		catch(NoResultException e)
		{
			System.out.println(e.getMessage()+"\nContact Info is not Available");
			return null;
		}
	}
}

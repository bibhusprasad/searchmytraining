package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IFreeeLCertificationAwrdDAO;
import com.searchmytraining.entity.CertificationAwardEntity;

@Repository
public class FreeeLCertificationAwrdDAO extends AbstractJpaDAO<CertificationAwardEntity> implements IFreeeLCertificationAwrdDAO {
	
	@Override
	public void insertCertificationAwrdDet(CertificationAwardEntity certientity) {
		create(certientity);
	}
	
	public CertificationAwardEntity getCertificationDetByUserId(Long userid)
	{
		EntityManager em = getEntityManager();
		String strqry = "from CertificationAwardEntity certi where certi.user.userId = ?";
		TypedQuery<CertificationAwardEntity> typedqry = em.createQuery(strqry, CertificationAwardEntity.class);
		
		try{
			typedqry.setParameter(1, userid.intValue());
			CertificationAwardEntity certientity = typedqry.getSingleResult();
			return certientity;
		}
		catch(NoResultException e)
		{
			System.out.println(e.getMessage());
			System.out.println("No result found for Certification Details....");
			return null;
		}
	}

	@Override
	public void updateCertificationAwrdDet(CertificationAwardEntity certientity) {
		update(certientity)		;
	}
}

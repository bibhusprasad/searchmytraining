package com.searchmytraining.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IAdminChartDAO;
import com.searchmytraining.entity.ChartEntity;

@Repository
public class AdminChartDAO extends AbstractJpaDAO<ChartEntity> implements
		IAdminChartDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	public List<ChartEntity> tpfRegistered() {

		String role = "TPF";
		String strquery = "select MONTH(user.modified_On) as month_no,MONTHNAME(user.modified_On) as month_name, count(user_roles.ROLE) from UserEntity user,RoleEntity user_roles "
				+ "where user.userId = user_roles.user.userId and user_roles.ROLE=? "
				+ "group by 1 order by 1";

		Query query = entitymanager.createQuery(strquery);
		query.setParameter(1, role);
		@SuppressWarnings("unchecked")
		List<Object[]> resulList = query.getResultList();
		List<ChartEntity> chartEntitList = new ArrayList<ChartEntity>();
		ChartEntity chartEntity = null;
		for (Object[] objects : resulList) {
			chartEntity= new ChartEntity();
			chartEntity.setLabel((String) objects[1]);
			chartEntity.setY((Long) objects[2]);
			chartEntitList.add(chartEntity);
		}
		return chartEntitList;
	}

	@Override
	public List<ChartEntity> tpiRegistered() {
		String role = "TPI";
		String strquery = "select MONTH(user.modified_On) as month_no,MONTHNAME(user.modified_On) as month_name, count(user_roles.ROLE) from UserEntity user,RoleEntity user_roles "
				+ "where user.userId = user_roles.user.userId and user_roles.ROLE=? "
				+ "group by 1 order by 1";

		Query query = entitymanager.createQuery(strquery);
		query.setParameter(1, role);
		@SuppressWarnings("unchecked")
		List<Object[]> rList = query.getResultList();
		List<ChartEntity> cEntities = new ArrayList<ChartEntity>();
		ChartEntity chartEntity = null;
		for (Object[] objects : rList) {
			chartEntity = new ChartEntity();
			chartEntity.setLabel((String) objects[1]);
			chartEntity.setY((Long) objects[2]);
			cEntities.add(chartEntity);
		}
		return cEntities;
	}

}

package com.searchmytraining.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IAdminChartDAO;
import com.searchmytraining.entity.ChartEntity;

@Repository
public class AdminChartDAO extends AbstractJpaDAO<ChartEntity> implements IAdminChartDAO {

	EntityManager entitymanager;
	
	@Autowired
	private WebApplicationContext context;
	
	@Override
	public List<ChartEntity> tpfRegistered() {
		
		entitymanager = getEntityManager();
		String role = "TPF";
		String strquery = "select MONTH(user.modified_On) as month_no,MONTHNAME(user.modified_On) as month_name, count(user_roles.ROLE) from UserEntity user,RoleEntity user_roles "
				+ "where user.userId = user_roles.user.userId and user_roles.ROLE=? "
				+ "group by 1 order by 1";
		
		Query query = entitymanager.createQuery(strquery);
		query.setParameter(1, role);
		
		@SuppressWarnings("unchecked")
		List<Object[]> l1 = query.getResultList();
		List<ChartEntity> chart = new ArrayList<ChartEntity>();
		for(Object[] objects:l1)
		{
			ChartEntity datapoints = (ChartEntity)context.getBean("chartEntity");
			datapoints.setLabel((String)objects[1]);
			datapoints.setY((Long)objects[2]);
			chart.add(datapoints);
		}
		for(ChartEntity c:chart)
			System.out.println(c.getLabel()+" "+c.getY());
		return chart;
	}

	@Override
	public List<ChartEntity> tpiRegistered() {
		entitymanager = getEntityManager();
		String role = "TPI";
		String strquery = "select MONTH(user.modified_On) as month_no,MONTHNAME(user.modified_On) as month_name, count(user_roles.ROLE) from UserEntity user,RoleEntity user_roles "
				+ "where user.userId = user_roles.user.userId and user_roles.ROLE=? "
				+ "group by 1 order by 1";
		
		Query query = entitymanager.createQuery(strquery);
		query.setParameter(1, role);
		
		@SuppressWarnings("unchecked")
		List<Object[]> l1 = query.getResultList();
		List<ChartEntity> chart = new ArrayList<ChartEntity>();
		for(Object[] objects:l1)
		{
			ChartEntity datapoints = (ChartEntity)context.getBean("chartEntity");
			datapoints.setLabel((String)objects[1]);
			datapoints.setY((Long)objects[2]);
			chart.add(datapoints);
		}
		for(ChartEntity c:chart)
			System.out.println(c.getLabel()+" "+c.getY());
		return chart;
	}

}

package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.IAdminChartDAO;
import com.searchmytraining.entity.ChartEntity;
import com.searchmytraining.service.IAdminChartService;

@Service
public class AdminChartService implements IAdminChartService {
	
	@Autowired
	private WebApplicationContext context;
	
	@Override
	public List<ChartEntity> tpfRegistered() {
		IAdminChartDAO chartdao = (IAdminChartDAO)context.getBean("adminChartDAO"); 
		System.out.println("chartdao: "+chartdao);
		return chartdao.tpfRegistered();
	}

	@Override
	public List<ChartEntity> tpiRegistered() {
		IAdminChartDAO chartdao = (IAdminChartDAO)context.getBean("adminChartDAO");
		System.out.println("chartdaotpi: "+chartdao);
		return chartdao.tpiRegistered();
	}
}

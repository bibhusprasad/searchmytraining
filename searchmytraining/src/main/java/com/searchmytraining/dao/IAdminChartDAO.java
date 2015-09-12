package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.ChartEntity;

public interface IAdminChartDAO {
	
	public List<ChartEntity> tpfRegistered();
	public List<ChartEntity> tpiRegistered();

}

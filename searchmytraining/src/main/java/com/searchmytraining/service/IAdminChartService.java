package com.searchmytraining.service;
import java.util.List;
import com.searchmytraining.entity.ChartEntity;

public interface IAdminChartService {
	
	public List<ChartEntity> tpfRegistered();
	public List<ChartEntity> tpiRegistered();
}

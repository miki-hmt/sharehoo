package com.sharehoo.service.shop;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Cdk;

//2017.10.26	miki cdk生产方法接口

public interface CdkService {
	
	public void add(Cdk cdk);
	
	public void delete(Cdk cdk);
	
	public List<Cdk> getCdkList(PageBean pageBean);
	
	public Long getCdkTotal();
	
	public Cdk getCdk(int cdkId);
	
	public Cdk getCdkByCode(String code);
	
	
}

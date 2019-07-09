package com.sharehoo.service;

import java.util.List;

import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.shop.Exchange;

public interface ExchangeService {
	
	 public void addLog( Exchange exchane); 
	 
	 public void delete(Exchange exchange);
	 
	 public List<Exchange> getExchanges(PageBean pageBean);
	 
	//2017.10.27 统计用户单日充值次数，超过三次则无法充值
	public Long getTotalByUserId(int userId);
}

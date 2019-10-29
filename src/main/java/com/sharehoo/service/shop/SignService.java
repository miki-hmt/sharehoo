package com.sharehoo.service.shop;

import com.sharehoo.entity.shop.Sign;

/*
 * 2018.02.02 miki 签到天数统计接口实现
 */
public interface SignService {
	
	public void saveSign(Sign sign);
	
	public void delete(Sign sign);
	public Sign getSignByShopId(int shopId);
}

package com.sharehoo.controller.shop;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.service.shop.SearchService;
import com.sharehoo.util.forum.Getweekutils;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	/*
	 * 2017.12.28 18:30 miki 得到下载排行
	 */
	@RequestMapping("/shop/download/rank")
	public String rank(Model model)throws Exception{

		String date=Getweekutils.getFirstDayOfWeek(new Date());
		List<Source> userweeklist=searchService.getSRankByWeek(date);
		model.addAttribute("userweeklist", userweeklist);

		List<Shop> shopweekList=searchService.getURankByWeek(date);
		model.addAttribute("shopweekList", shopweekList);

		List<Source> uploadrankweekList=searchService.getUploadRankByWeek(date);
		model.addAttribute("uploadrankweekList", uploadrankweekList);
		
		Map<Source, Long> uploadCount=new HashMap<Source, Long>();
		Map<Source, Long> monthUploadCount=new HashMap<Source, Long>();
		for(Source source : uploadrankweekList){
			Long count=searchService.getweekCount(date, source.getShop().getId());
			uploadCount.put(source, count);
		}
		model.addAttribute("uploadCount", uploadCount);
		
		 DateFormat dFormat = new SimpleDateFormat("yyyy-MM"); //HH表示24小时制；  
         List<Source> userMonthList=searchService.getSRankByMonth(dFormat.format(new Date()));
         model.addAttribute("userMonthList", userMonthList);

         List<Shop> shopmonthList=searchService.getURankByMonth(dFormat.format(new Date()));
         model.addAttribute("shopmonthList", shopmonthList);

         List<Source> uploadrankmonthList=searchService.getUploadRankByMonth(dFormat.format(new Date()));
         model.addAttribute("uploadrankmonthList", uploadrankmonthList);

         for(Source source : uploadrankmonthList){
 			Long count=searchService.getMonthCount(dFormat.format(new Date()), source.getShop().getId());
 			monthUploadCount.put(source, count);
 		}

        model.addAttribute("monthUploadCount", monthUploadCount);
		return "shop/source_rank"; 
	}
}

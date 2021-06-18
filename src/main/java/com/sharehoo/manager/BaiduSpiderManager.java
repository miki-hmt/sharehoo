package com.sharehoo.manager;

import com.sharehoo.config.RedisUtil;
import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.manager.factory.AsyncFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName BaiduSpiderManager
 * @Description TODO
 * @Author miki
 * @Date 2021/6/8 10:00
 * @Version 1.0
 */
@Component
public class BaiduSpiderManager {

    @Autowired
    private RedisUtil redisTemplate8;
    private final static String SPIDER_PREFIX = "push:spider:";
    private final static String SPIDER_SUFFIX_TOPIC = "topic:";
    private final static String SPIDER_SUFFIX_SECTION = "section:";
    private final static String SPIDER_SUFFIX_SHOP = "shop:";
    private final static String SPIDER_SUFFIX_SOURCE = "source:";

    /**
     *@Author miki
     *@Description 异步线程向百度爬虫提交帖子版块信息
     *@Date 2021/6/8 10:01
     *@Param [sectionList]
     *@Return void
     *@Version 1.0
     */
    public void asyncCommitSections(List<Section> sectionList){

        List<String> urls = new ArrayList<String>();
        //2020.05.05 miki 推送网站信息到百度爬虫
        for (Section section : sectionList) {
            urls.add("http://sharehoo.cn/topic/section/"+section.getId());
        }
        AsyncManager.me().execute(AsyncFactory.commitSections(urls));
    }


    /**
     *@Author miki
     *@Description 异步线程向百度爬虫提交下载社区分类信息
     *@Date 2021/6/8 10:01
     *@Param [sectionList]
     *@Return void
     *@Version 1.0
     */
    public void asyncCommitDownloadCategories(){
        AsyncManager.me().execute(AsyncFactory.asyncCommitDownloadCategories());
    }


    /**
     *@Author miki
     *@Description 异步线程向百度爬虫提交下载社区资源详情信息
     *@Date 2021/6/8 10:01
     *@Param [sectionList]
     *@Return void
     *@Version 1.0
     */
    public void asyncCommitDownloadSourceInfo(Integer sourceId){
        Long date = redisTemplate8.getExpire(SPIDER_PREFIX + SPIDER_SUFFIX_SOURCE + sourceId);
        if(date <= -1) {
            redisTemplate8.setEx(SPIDER_PREFIX + SPIDER_SUFFIX_SOURCE + sourceId, sourceId, 7, TimeUnit.DAYS);

            AsyncManager.me().execute(AsyncFactory.asyncCommitDownloadSourceInfo(sourceId));
        }
    }


    //2020.10.26 miki 防止过度提交百度爬虫，造成每天几千条的数据日志垃圾
    public void asyncCommitShopInfoLog( Shop shop){
        Long date = redisTemplate8.getExpire(SPIDER_PREFIX + SPIDER_SUFFIX_SHOP + shop.getId());
        if(date <= -1) {
            redisTemplate8.setEx(SPIDER_PREFIX + SPIDER_SUFFIX_SHOP + shop.getId(), shop.getShop_name(), 7, TimeUnit.DAYS);

            AsyncManager.me().execute(AsyncFactory.asyncCommitShopInfo(shop.getId()));
        }
    }


    //2020.10.26 miki 防止过度提交百度爬虫，造成每天几千条的数据日志垃圾
    public void asyncCommitTopicInfoLog( Topic topic){
        Long date = redisTemplate8.getExpire(SPIDER_PREFIX + SPIDER_SUFFIX_TOPIC + topic.getId());
        if(date <= -1) {
            redisTemplate8.setEx(SPIDER_PREFIX + SPIDER_SUFFIX_TOPIC + topic.getId(), topic.getTitle(), 7, TimeUnit.DAYS);

            AsyncManager.me().execute(AsyncFactory.asyncCommitTopicInfo(topic.getCode()));
        }
    }


    //2020.10.26 miki 防止过度提交百度爬虫，造成每天几千条的数据日志垃圾
    public void asyncCommitSectionInfoLog(Section section){
        Long date = redisTemplate8.getExpire(SPIDER_PREFIX + SPIDER_SUFFIX_SECTION + section.getId());
        if(date <= -1) {
            redisTemplate8.setEx(""+section.getId(), section.getName(), 7, TimeUnit.DAYS);

            AsyncManager.me().execute(AsyncFactory.asyncCommitSectionInfo(section.getId()));
        }
    }


    /**
     *@Author miki
     *@Description 用户上传资源文件之后，更新到百度爬虫
     *@Date 2021/6/8 11:04
     *@Param [section]
     *@Return void
     *@Version 1.0
     */
    public void asyncCommitSourceUploadInfoLog(Integer sourceId, Integer shopId){
        AsyncManager.me().execute(AsyncFactory.asyncCommitSourceUploadInfoLog(sourceId, shopId));
    }
}

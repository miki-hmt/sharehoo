package com.sharehoo.manager;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.lang.BusinessType;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.User;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.entity.shop.Shop;
import com.sharehoo.entity.shop.Source;
import com.sharehoo.manager.factory.AsyncFactory;
import com.sharehoo.service.LogService;
import com.sharehoo.util.ServletUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @ClassName UserOperateManager
 * @Description 用户登录行为，操作行为管理
 * @Author miki
 * @Date 2020/12/17 14:34
 * @Version 1.0
 */
@Component
public class UserOperateManager {

    @Autowired
    private LogService logService;

        public void recordOper(Log operLog){
        logService.save(operLog);
    }


    public void asyncOperateSearchLog(){
        HttpServletRequest request = ServletUtils.getRequest();
        String ip= IpGet.getIp2(request);
        Log log1=new Log(ip, new Date(), BusinessType.SHOP_SEARCH.toString(), "搜索资源", SessionUtil.getUserNoThrowException(), null, null);
        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }


    public void asyncOperateShopViewLog(Source source, Shop shop){
        HttpServletRequest request = ServletUtils.getRequest();
        String ip= IpGet.getIp2(request);
        Log log1 = new Log(ip, new Date(), BusinessType.VISITOR.toString(), "店铺访问资源：【"+source.getName(), SessionUtil.getUserNoThrowException(), shop, null);
        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }

    public void asyncOperateShopInfoLog(Shop shop){
        Log log1=new Log();
        HttpServletRequest request = ServletUtils.getRequest();
        String ip= IpGet.getIp2(request);

        log1.setIp(ip);
        log1.setTime(new Date());
        log1.setType(BusinessType.VISITOR.toString());
        log1.setOperation_log("店铺主页访问");
        log1.setUser(SessionUtil.getUserNoThrowException());
        log1.setShop(shop);

        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }


    public void asyncOperateUserLoginLog(){
        Log log1=new Log();
        HttpServletRequest request = ServletUtils.getRequest();
        String ip=IpGet.getIp2(request);

        log1.setIp(ip);
        log1.setTime(new Date());
        log1.setType(BusinessType.USER_LOGIN.toString());
        log1.setOperation_log("用户登录");
        log1.setUser(SessionUtil.getUserNoThrowException());

        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }

    public void asyncOperateAdminLoginLog(){
        Log log1=new Log();
        HttpServletRequest request = ServletUtils.getRequest();
        String ip=IpGet.getIp2(request);

        log1.setIp(ip);
        log1.setTime(new Date());
        log1.setType(BusinessType.ADMIN_LOGIN.toString());
        log1.setOperation_log("管理员登录");
        log1.setUser(SessionUtil.getUserNoThrowException());

        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }


    public void asyncOperateCritiqueLog(){
        Log log1=new Log();
        HttpServletRequest request = ServletUtils.getRequest();
        String ip=IpGet.getIp2(request);

        log1.setIp(ip);
        log1.setTime(new Date());
        log1.setType(BusinessType.BLOG_CRITIQUE.toString());
        log1.setOperation_log("博客留言");

        log1.setUser(SessionUtil.getUserNoThrowException());

        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }

    public void asyncOperateReplyLog(Topic topic){
        Log log1=new Log();
        HttpServletRequest request = ServletUtils.getRequest();
        String ip=IpGet.getIp2(request);

        User user = SessionUtil.getUserNoThrowException();

        log1.setIp(ip);
        log1.setTime(new Date());
        log1.setType(BusinessType.TOPIC_REPLY.toString());
        log1.setOperation_log("用户："+ user.getNickName() + "对帖子:"+topic.getTitle()+"发表评论");

        log1.setUser(SessionUtil.getUserNoThrowException());

        AsyncManager.me().execute(AsyncFactory.recordOper(log1));
    }

}

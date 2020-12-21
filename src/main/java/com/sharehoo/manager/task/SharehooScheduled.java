package com.sharehoo.manager.task;

import com.sharehoo.base.exception.BusinessException;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.util.Const;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName SharehooScheduled
 * @Description 社区定时任务管理
 * @Author miki
 * @Date 2020/12/21 15:33
 * @Version 1.0
 */

@Component
public class SharehooScheduled {

    private static Logger log = LoggerFactory.getLogger(SharehooScheduled.class);
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Scheduled(cron = "0 0/2 * * * ?")
    public void updateOnlineUser() throws BusinessException {
        int number = 0;

        //去redis中根据sessionId获取
        @SuppressWarnings("unchecked")
        Set<Object> set = redisTemplate.keys("spring:session:sessions*");	//"*" + session.getId() + "*"
        ArrayList<Object> list = new ArrayList<>(set);
        for (int i = 0; i < list.size(); i++) {
            String key = list.get(i).toString();
            //判断是否hash类型 并且判断是否是有效的用户session
            if (redisTemplate.type(key) == DataType.HASH) {
                Map<String, Object> map = redisTemplate.opsForHash().entries(key);
                if (map.containsKey(Consts.SESSION_USER_CODE)) {
                    number++;
                }
            }
        }

        log.info("定时更新在线用户信息到redis, date:["+Const.SDF.format(new Date())+"],检测在线人数：{}", number);
        if(number > 0) {
            stringRedisTemplate.opsForValue().set(Consts.ONLINE_USERS_NUMBER, String.valueOf(number));
        }
    }
}

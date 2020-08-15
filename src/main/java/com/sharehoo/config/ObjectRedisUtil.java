package com.sharehoo.config;

import java.util.Collection;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.stereotype.Component;

/**
 * @ClassName ObjectRedisUtil
 * @Description TODO 存储集合对象工具类
 * @Author miki
 * @Date 2020/7/22 20:46
 * @Version 1.0
 */
@Component
public class ObjectRedisUtil {
    @Resource
    private RedisTemplate redisTemplate;

    /**
     * 设置指定 key 的值
     *
     * @param key key
     */
    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 获取指定 key 的值
     *
     * @param key key
     * @return --
     */
    public Object get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    /**
     * 将值 value 关联到 key ，并将 key 的过期时间设为 timeout
     *
     * @param key     key
     * @param timeout 过期时间
     * @param unit    时间单位, 天:TimeUnit.DAYS 小时:TimeUnit.HOURS 分钟:TimeUnit.MINUTES
     *                秒:TimeUnit.SECONDS 毫秒:TimeUnit.MILLISECONDS
     */
    public void setEx(String key, Object value, long timeout, TimeUnit unit) {
        redisTemplate.opsForValue().set(key, value, timeout, unit);
    }

    /**
     * 存储在list头部
     *
     * @param key key
     * @return --
     */
    public Long lLeftPush(String key, Object value) {
        return redisTemplate.opsForList().leftPush(key, value);
    }

    /**
     * @param key key
     * @return --
     */
    public Long lLeftPushAll(String key, Object... value) {
        return redisTemplate.opsForList().leftPushAll(key, value);
    }

    /**
     * @param key key
     * @return --
     */
    public Long lLeftPushAll(String key, Collection<Object> value) {
        return redisTemplate.opsForList().leftPushAll(key, value);
    }

    /**
     * 获取列表长度
     *
     * @param key key
     * @return --
     */
    public Long lLen(String key) {
        return redisTemplate.opsForList().size(key);
    }

    /**
     * 移出并获取列表的第一个元素
     *
     * @param key key
     * @return -- 删除的元素
     */
    public Object lLeftPop(String key) {
        return redisTemplate.opsForList().leftPop(key);
    }

    /**
     * 移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止
     *
     * @param key key
     * @param timeout 等待时间
     * @param unit 时间单位
     * @return --
     */
    public Object lBLeftPop(String key, long timeout, TimeUnit unit) {
        return redisTemplate.opsForList().leftPop(key, timeout, unit);
    }
}

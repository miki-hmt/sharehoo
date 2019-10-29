package com.sharehoo.util;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.apache.log4j.Logger;

import java.util.List;
import java.util.Map;

/**
 * Title: CxCacheUtil Description: 缓存管理类 Company: cosmosource
 *
 * @date 2017-2-22
 */
public class CxCacheUtil {
    private static CxCacheUtil instance;
    private static Cache cache;
    private static Logger logger = Logger.getLogger(CxCacheUtil.class);

    private CxCacheUtil() {
        CacheManager manager = CacheManager.create();
        cache = manager.getCache("dxpCache");
    }

    public static CxCacheUtil getIntance() {
        if (instance == null) {
            instance = new CxCacheUtil();
        }
        return instance;
    }

    /**
     * 保存数据到缓存
     *
     * @param key
     * @param value
     * @return
     */
    public boolean setValue(String key, Object value) {
        cache.put(new Element(key, value));
        return true;
    }

    /**
     * 从缓存读取数据
     *
     * @param key
     * @return
     */
    public Object getValue(String key) {
        Element element = cache.get(key);
        if (element == null) {
            // logger.debug("READ FAILED:" + key);
            return null;
        } else {
            // logger.debug("READ FROM CACHE:" + key);
            return element.getObjectValue();
        }
    }

    /**
     * 从缓存删除数据
     *
     * @param key
     * @return
     */
    public boolean unSetValue(String key) {
        return cache.remove(key);
    }

    /**
     * 缓存区主键列表
     *
     * @return
     */
    public List keyList() {
        return cache.getKeys();
    }

    /**
     * 获取缓存区全部数据
     *
     * @return
     */
    public Map valueList() {
        return cache.getAll(keyList());
    }

    public String info() {
        StringBuffer sb = new StringBuffer("");
        sb.append("得到缓存中的对象数:");
        sb.append(cache.getSize());
        sb.append(";<br/>");
        sb.append("得到缓存对象占用内存的大小:");
        sb.append(cache.getMemoryStoreSize());
        sb.append(";<br/>");
        sb.append("得到缓存读取的命中次数:");
    	sb.append(cache.getStatistics().cacheHitCount());
    	sb.append(";<br/>");
    	sb.append("得到缓存读取的错失次数:");
    	sb.append(cache.getStatistics().cacheMissCount());
    	sb.append(";<br/>");
        return sb.toString();
    }

}

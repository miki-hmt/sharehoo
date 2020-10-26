package com.sharehoo.config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.StringRedisConnection;
import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;


@Component
public class StringRedisUtil {

  private static final Logger LOGGER = LoggerFactory.getLogger(StringRedisUtil.class);

  @Autowired
  private StringRedisTemplate stringRedisTemplate;

  public Long sadd(final String key, final String value) {
    BoundSetOperations<String, String> v = stringRedisTemplate.boundSetOps(key);
    return v.add(value);
  }

  public Long sremove(final String key, final String value) {
    BoundSetOperations<String, String> v = stringRedisTemplate.boundSetOps(key);
    return v.remove(value);
  }

  public boolean isMemeber(final String key, final String value) {
    BoundSetOperations<String, String> v = stringRedisTemplate.boundSetOps(key);
    return v.isMember(value);
  }


  public String popPriority(final String[] keys, final int timeout) {
    return stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        List<String> list = stringRedisConn.bRPop(timeout, keys);
        if (list == null) {
          return null;
        } else {
          return list.get(1);
        }
      }
    });
  }

  public Boolean expire(final String key, final long liveTime) {
    return stringRedisTemplate.expire(key, liveTime, TimeUnit.SECONDS);
  }

  /**
   * <p>
   * Title: pop</br>
   * <p>
   * Description: TODO(延时提出redis中的值)</br>
   */
  public String pop(final String key, final int timeout) {
    return stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        List<String> list = stringRedisConn.bRPop(timeout, key);

        if (list == null) {
          return null;
        } else {
          return list.get(1);
        }
      }
    });
  }

  public String pop(final String key) {
    return stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        String value = stringRedisConn.rPop(key);

        return value;
      }
    });
  }

  /**
   * <p>
   * Title: lpop</br>
   * <p>
   * Description: TODO()</br>
   */
  public String rpop(final String key) {
    return stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        String s = stringRedisConn.rPop(key);
        if (s == null || "".equals(s)) {
          return null;
        } else {
          return s;
        }
      }
    });
  }

  /**
   * <p>
   * Title: set</br>
   *
   * @tags @param key
   * @tags @param value
   */
  public void set(String key, String value) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    v.set(value);
  }

  public void set(String key, Integer value) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    v.set("" + value);
  }

  public Long incr(String key, long value) {
//		BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    return stringRedisTemplate.opsForValue().increment(key, value);
    // v.increment(value);
//		System.out.println("expire : " + v.getExpire());
  }

  public Long incr(String key, long value, int timeout) {
    if (!stringRedisTemplate.hasKey(key)) {
      BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
      Long r = v.increment(value);
      v.expire(timeout, TimeUnit.SECONDS);
      return r;
    } else {
      return stringRedisTemplate.opsForValue().increment(key, value);
    }
  }

  /**
   * <p>
   * Title: set</br>
   *
   * @tags @param key
   * @tags @param value
   * @tags @param timeout 单位秒
   */
  public void set(String key, String value, long timeout) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    v.set(value, timeout, TimeUnit.SECONDS);
  }

  public void set(String key, Integer value, long timeout) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    v.set("" + value, timeout, TimeUnit.SECONDS);
  }

  /**
   * <p>
   * Title: get</br>
   *
   * @tags @param key
   * @tags @return
   */
  public String get(String key) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    return v.get();
  }

  public Integer getInt(String key) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    if (v == null) {
      return null;
    }
    try {
      return Integer.parseInt(v.get());
    } catch (Exception e) {
      // e.printStackTrace();
    }
    return null;
  }


  public Long getLong(String key) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    if (v == null) {
      return null;
    }
    try {
      return Long.parseLong(v.get());
    } catch (Exception e) {
      // e.printStackTrace();
    }
    return null;
  }

  public String getAndDel(String key) {
    BoundValueOperations<String, String> v = stringRedisTemplate.boundValueOps(key);
    String result = v.get();
    stringRedisTemplate.delete(key);
    return result;
  }

  public Long getExpire(String key) {
    return stringRedisTemplate.getExpire(key);
  }

  // 延时取出
  public String delayPop(final String key) {
    return stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        double startTime = 0;
        double endTime = System.currentTimeMillis() / 1000;
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        int i = 0;
        while (i < 3) {
          i++;
          Set<String> set = stringRedisConn.zRangeByScore(key, startTime, endTime, 0, 1);
          if (set != null && set.size() > 0) {
            String data = set.toArray(new String[]{})[0];
            Long res = stringRedisConn.zRem(key, data);
            if (res > 0) {
              return data;
            }
          }
        }
        return null;
      }
    });
  }

  // 延时插入
  public void delayPush(final String queue, final String key, final long delay) {
    stringRedisTemplate.execute(new RedisCallback<String>() {
      public String doInRedis(RedisConnection connection) throws DataAccessException {
        double time = System.currentTimeMillis() / 1000 + delay;
        //double time = delay;
        StringRedisConnection stringRedisConn = (StringRedisConnection) connection;
        stringRedisConn.zAdd(queue, time, key);
        return "";
      }
    });

  }

  public boolean zadd(String key, double score, String value) {
    BoundZSetOperations<String, String> v = stringRedisTemplate.boundZSetOps(key);
    return v.add(value, score);
  }

  public Long zrem(String key, String value) {
    BoundZSetOperations<String, String> v = stringRedisTemplate.boundZSetOps(key);
    return v.remove(value);
  }

  public String[] zlist(String key) {
    BoundZSetOperations<String, String> v = stringRedisTemplate.boundZSetOps(key);
    Set<String> set = v.reverseRangeByScore(0, Double.MAX_VALUE);
    String[] r = new String[set.size()];
    set.toArray(r);
    return r;
  }

  public boolean getLock(String key, long timeout) {
    Boolean result = stringRedisTemplate.opsForValue().setIfAbsent(key, "1");
    if (result.booleanValue()) {
      stringRedisTemplate.expire(key, timeout, TimeUnit.SECONDS);
    }
    return result.booleanValue();
  }

  public void releaseLock(String key) {
    stringRedisTemplate.delete(key);
  }

  /**
   * Huo；
   */
  public Long getKey(String key) throws Exception {
    try {
      if (!stringRedisTemplate.hasKey(key)) {
        return null;
      } else {
        return Long.parseLong(stringRedisTemplate.opsForValue().get(key));
      }
    } catch (Exception e) {
      LOGGER.error("redis get Exception:", e);
      return null;
    }

  }

  public String getKeys(String key) throws Exception {
    try {
      if (!stringRedisTemplate.hasKey(key)) {
        return null;
      } else {
        return stringRedisTemplate.opsForValue().get(key);
      }
    } catch (Exception e) {
      LOGGER.error("redis get Exception:", e);
      return null;
    }

  }

  public void setKey(String key, Long value, int expire) throws Exception {
    try {
      stringRedisTemplate.opsForValue().set(key, "" + value, 60 * 10, TimeUnit.SECONDS);
    } catch (Exception e) {
      LOGGER.error("redis incr Exception:", e);
    }
  }

  public Integer dec(String key) throws Exception {

    try {
      if (!stringRedisTemplate.hasKey(key)) {
        return null;
      } else {
        //return jedis.decr(key).intValue();
        Long increment = stringRedisTemplate.boundValueOps("test").increment(-1);
        return Integer.parseInt(increment.toString());
      }
    } catch (Exception e) {
      LOGGER.error("Jedis incr Exception:", e);
      throw e;
    }
  }


  public Long incBy(String key, long count) {
    Long nCount = 0L;
    try {
      // 如果不存在则设置超时时间
      nCount = stringRedisTemplate.boundValueOps(key).increment(count);
    } catch (Exception e) {
      LOGGER.error("Jedis incr Exception:", e);
    }
    return nCount;
  }

  /**
   * 根据key删除缓存；
   */
  public void deleteKey(String key) {
    stringRedisTemplate.delete(key);
  }

  /**
   * 判断key存在与否
   */
  public boolean hasKey(String key) {
    return stringRedisTemplate.hasKey(key);
  }

  /**
   * 保存对象对缓存服务器
   *
   * @param key 缓存key
   * @param value 缓存值
   */
  public void put(String key, Object value) {
    BoundValueOperations valueOper = stringRedisTemplate.boundValueOps(key);
    valueOper.set(value);
  }

  public Long getTtl(String key) {
    return stringRedisTemplate.getExpire(key);
  }

  /**
   * @Author miki
   * @Description //覆盖旧值，不改变过期时间，直接使用set方法覆盖值，会导致失效时间重置 *
   * @Date 18:18 2020/6/3
   * @Param [key, value]
   * @return void
   **/
  public void coverValue(String key,String value){
    stringRedisTemplate.opsForValue().set(key,value,0);
  }

}

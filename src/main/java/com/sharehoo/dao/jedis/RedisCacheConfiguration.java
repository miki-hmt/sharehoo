package com.sharehoo.dao.jedis;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
* @ClassName: RedisCacheConfiguration  
* @Description: TODO(依托于springboot创建redisPool的bean)  
* @author miki
* @date 2019年9月13日 上午12:17:35  
*
 */
@Configuration
@EnableCaching
public class RedisCacheConfiguration {
	Logger logger = Logger.getLogger(RedisCacheConfiguration.class);
	
	@Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private int port;

    @Value("${spring.redis.timeout}")
    private int timeout;

    @Value("${spring.redis.jedis.pool.max-idle}")
    private int maxIdle;

    @Value("${spring.redis.jedis.pool.max-wait}")
    private long maxWaitMillis;

    @Value("${spring.redis.password}")
    private String password;

    @Bean
    public JedisPool redisPoolFactory() {
        logger.info("JedisPool注入成功！！");
        logger.info("redis地址：" + host + ":" + port);
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxIdle(maxIdle);
        jedisPoolConfig.setMaxWaitMillis(maxWaitMillis);

        JedisPool jedisPool = new JedisPool(jedisPoolConfig, host, port, timeout);
        
        /**************
         * 2019.09.13 miki 如果没设置密码，就不要加上密码参数，即使为空也会获取不到redisPool
         * *****************************************************************************/
        //JedisPool jedisPool = new JedisPool(jedisPoolConfig, host, port, timeout,password);
        return jedisPool;
    }
}

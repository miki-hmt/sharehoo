package com.sharehoo.config;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.session.data.redis.config.ConfigureRedisAction;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;


@EnableCaching
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 3600)//session过期时间(秒)
@Configuration
public class SessionConfig {
	private static Logger logger = LoggerFactory.getLogger(SessionConfig.class);
    @Bean
    public static ConfigureRedisAction configureRedisAction(){
        //让springSession不再执行config命令
        return ConfigureRedisAction.NO_OP;
    }
    
    /**
    * @Title: defaultRedisSerializer  
    * @Description: TODO(spring session的自定义key value序列化方式)  
    * @author miki 
    * @date 2020年9月4日 下午8:50:34   
    * @throws
     */
    @Bean("springSessionDefaultRedisSerializer")
    public RedisSerializer<Object> defaultRedisSerializer(){
    	logger.debug("自定义Redis Session序列化加载成功");
        return valueSerializer();
    }
 
    @SuppressWarnings({ "rawtypes", "unchecked" })
	private RedisSerializer<Object> valueSerializer() {
    	
    	Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(
                Object.class);
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        objectMapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(objectMapper);
        return jackson2JsonRedisSerializer; //new GenericJackson2JsonRedisSerializer();
    }
    
    /**2020.12.02 miki
     * 对spring session的redisMessageListenerContailner线程做线程池管理，解决系统内存飞涨的问题
     * 用于spring session，防止每次创建一个线程，造成oom
     * @return
     */
    @Bean
    public ThreadPoolTaskExecutor springSessionRedisTaskExecutor(){
        ThreadPoolTaskExecutor springSessionRedisTaskExecutor = new ThreadPoolTaskExecutor();
        springSessionRedisTaskExecutor.setCorePoolSize(8);
        springSessionRedisTaskExecutor.setMaxPoolSize(16);
        springSessionRedisTaskExecutor.setKeepAliveSeconds(10);
        springSessionRedisTaskExecutor.setQueueCapacity(1000);
        springSessionRedisTaskExecutor.setThreadNamePrefix("Spring session redis executor thread: ");
        return springSessionRedisTaskExecutor;
    }

}

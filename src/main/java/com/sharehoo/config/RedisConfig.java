package com.sharehoo.config;

import java.time.Duration;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisClientConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

import redis.clients.jedis.JedisPoolConfig;

/**
 * @author a small asshole
 * @version 1.0
 * @description redis配置类
 * @date in 17:14 2020/3/13
 * @since 1.0
 */
@EnableCaching
@EnableRedisHttpSession(maxInactiveIntervalInSeconds = 3600)//session过期时间(秒)
@Configuration
public class RedisConfig {
    @Value("${spring.redis.host}")
    private String host;
    @Value("${spring.redis.database}")
    private Integer database;
    @Value("${spring.redis.password}")
    private String password;
    @Value("${spring.redis.port}")
    private Integer port;
    @Value("${spring.redis.timeout}")
    private Integer timeout;
    
    @Bean(name = "redisTemplate")
    @ConditionalOnMissingBean(name = "redisTemplate")
    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        RedisTemplate<Object, Object> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        objectMapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(objectMapper);
        // 设置value的序列化规则和 key的序列化规则
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);
        
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.afterPropertiesSet();
        return redisTemplate;
    }
    
    
    @Bean("redisTemplate8")
    public RedisTemplate<Object, Object> redisTemplate8(@Qualifier("factory2") RedisConnectionFactory connectionFactory) {
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(connectionFactory);

        //使用Jackson2JsonRedisSerializer来序列化和反序列化redis的value值（默认使用JDK的序列化方式）
        Jackson2JsonRedisSerializer<Object> serializer = new Jackson2JsonRedisSerializer<>(Object.class);

        ObjectMapper mapper = new ObjectMapper();
        mapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        mapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        serializer.setObjectMapper(mapper);

        template.setValueSerializer(serializer);
        //使用StringRedisSerializer来序列化和反序列化redis的key值
        template.setKeySerializer(new StringRedisSerializer());
        template.afterPropertiesSet();
        return template;
    }
    
    
    @Bean(name = "stringRedisTemplate")
    @ConditionalOnMissingBean(name = "stringRedisTemplate")
    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
        StringRedisTemplate stringRedisTemplate = new StringRedisTemplate();
        stringRedisTemplate.setConnectionFactory(redisConnectionFactory);
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(
                Object.class);
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        objectMapper.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(objectMapper);
        // 设置value的序列化规则和 key的序列化规则
        stringRedisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        stringRedisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);
        
        stringRedisTemplate.setHashKeySerializer(new StringRedisSerializer());
        
        stringRedisTemplate.setKeySerializer(new StringRedisSerializer());
        stringRedisTemplate.afterPropertiesSet();
        return stringRedisTemplate;
    }
    
    @Bean(name = "jedisPool")
    @ConfigurationProperties(prefix = "spring.redis.jedis.pool")
    public JedisPoolConfig jedisPoolConfig() {
        return new JedisPoolConfig();
    }

    @Bean
    @Primary
    public RedisConnectionFactory redisConnectionFactory(@Qualifier("jedisPool") JedisPoolConfig jedisPoolConfig) {
        //单机模式 没情趣不想理你 小气鬼 我中国银行和支付宝解绑了 为啥不回家搞不想回家
    	   	
        RedisStandaloneConfiguration redisStandaloneConfiguration =
                new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setHostName(host);
        redisStandaloneConfiguration.setDatabase(database);
        //密码解密
        redisStandaloneConfiguration.setPassword(RedisPassword.of(password));
        redisStandaloneConfiguration.setPort(port);
        //坑壁，竟然是个内部类,pool配置
        JedisClientConfiguration.DefaultJedisClientConfigurationBuilder clientConfigBuilder =
                (JedisClientConfiguration.DefaultJedisClientConfigurationBuilder) JedisClientConfiguration.builder();
        clientConfigBuilder.readTimeout(Duration.ofSeconds(50l)).connectTimeout(Duration.ofSeconds(50l));
        JedisClientConfiguration clientConfiguration = clientConfigBuilder.usePooling().poolConfig(jedisPoolConfig).build();
        
        JedisConnectionFactory factory = new JedisConnectionFactory(redisStandaloneConfiguration, clientConfiguration);
        factory.afterPropertiesSet();
        return factory;
    }

    
    @Bean("factory2")
    public RedisConnectionFactory redisConnectionFactory8(@Qualifier("jedisPool") JedisPoolConfig jedisPoolConfig) {
        //单机模式
        RedisStandaloneConfiguration redisStandaloneConfiguration =
                new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setHostName(host);
        redisStandaloneConfiguration.setDatabase(8);
        //密码解密
        redisStandaloneConfiguration.setPassword(password);
        redisStandaloneConfiguration.setPort(port);
        //坑壁，竟然是个内部类,pool配置
        JedisClientConfiguration.DefaultJedisClientConfigurationBuilder clientConfigBuilder =
                (JedisClientConfiguration.DefaultJedisClientConfigurationBuilder) JedisClientConfiguration.builder();
        clientConfigBuilder.readTimeout(Duration.ofSeconds(50l)).connectTimeout(Duration.ofSeconds(50l));
        JedisClientConfiguration clientConfiguration = clientConfigBuilder.usePooling().poolConfig(jedisPoolConfig).build();
        
        JedisConnectionFactory factory = new JedisConnectionFactory(redisStandaloneConfiguration, clientConfiguration);
        factory.afterPropertiesSet();
        return factory;
    }

    @Bean
    public CacheManager cacheManagerBuilder(RedisConnectionFactory connectionFactory) {
        // 设置缓存有效期20天
        RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig()
                .entryTtl(Duration.ofDays(20));
        return RedisCacheManager
                .builder(RedisCacheWriter.nonLockingRedisCacheWriter(connectionFactory))
                .cacheDefaults(redisCacheConfiguration).build();
    }
    
    

}

package com.sharehoo.manager.mq;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.annotation.PostConstruct;

import com.sharehoo.entity.forum.Section;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.service.forum.TopicService;
import org.apache.log4j.Logger;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.common.consumer.ConsumeFromWhere;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import com.alibaba.fastjson.JSONObject;
import com.sharehoo.entity.forum.Article;
import com.sharehoo.entity.forum.User;
import com.sharehoo.manager.mq.dto.Blog;
import com.sharehoo.service.forum.ArticleService;
import com.sharehoo.service.forum.UserService;

/**
* @ClassName: ArticleConsumer  
* @Description: TODO(文章消费者)  
* @author miki
* @date 2020年11月25日 下午11:37:20  
*
 */
@Component
@Configuration
public class ArticleConsumer {
	private static Logger log = Logger.getLogger(ArticleConsumer.class);
	
	@Value("${rocketmq.name-server}")
    public String ROCKETMQ_NAME_SERVER;
    @Value("${rocketmq.consumer.group}")
    public String ROCKETMQ_CONSUMER_GROUP;
    @Value("${rocketmq.consumer.topic}")
    public String ROCKETMQ_CONSUMER_TOPIC;
    @Value("${rocketmq.consumer.tag_report}")
    public String ROCKETMQ_CONSUMER_TAG_REPORT;
    
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private TopicService topicService;

    /**
     * @Description //TODO callservice模块的消费者，用来消费smartcall Reporter.java上报的会话消息*
     * @Param []
     * @return void
     **/
    @PostConstruct
    public void defaultMQPushConsumer() {
        //消费者的组名
        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer(ROCKETMQ_CONSUMER_GROUP);

        //指定NameServer地址，多个地址以 ; 隔开
        consumer.setNamesrvAddr(ROCKETMQ_NAME_SERVER);
        try {
            //订阅PushTopic下Tag为push的消息
            consumer.subscribe(ROCKETMQ_CONSUMER_TOPIC, "*");

            //设置Consumer第一次启动是从队列头部开始消费还是队列尾部开始消费
            //如果非第一次启动，那么按照上次消费的位置继续消费
            consumer.setConsumeFromWhere(ConsumeFromWhere.CONSUME_FROM_FIRST_OFFSET);
            consumer.registerMessageListener((MessageListenerConcurrently) (list, context) -> {
                try {
                    for (MessageExt messageExt : list) {
                        String messageBody = new String(messageExt.getBody(), StandardCharsets.UTF_8);
                        
                        dispatch(messageBody);
                    }
                } catch (Exception e) {
                    log.error("消费消息失败", e);
                    //return ConsumeConcurrentlyStatus.RECONSUME_LATER;
                }
                //消费成功
                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            });
            consumer.start();
        } catch (Exception e) {
            log.error("监听失败", e);
        }
    }

    private void dispatch(String  message) {
    	
    	if (message == null) {
            return;
        }
    	Blog blog = JSONObject.parseObject(message, Blog.class);
    	Assert.notNull(blog, "命令不能为空");
    	
        // 打日志需要 added by hxy
        log.info("MQ接收消息体[" + blog.getTitle());
        System.out.println("接收到MQ消息体["+blog.getTitle());
        // 重新写入
        Article article = new Article();
        Long userCount = userService.getUserCount(null);
        //随机生成用户id
        int randNum = 1 + (int)(Math.random() * ((userCount - 1) + 1));
        User user = userService.getUserById(randNum);
        while(user == null) {
        	randNum = 1 + (int)(Math.random() * ((userCount - 1) + 1));
            user = userService.getUserById(randNum);
        }

        //发布为博客
        article.setUser(user);
        article.setImage(blog.getHeaderImg());
        article.setKeywords("java#转载#编码");
        article.setContent(blog.getContent());
        article.setCount(0);
        article.setEditer(user.getNickName());
        article.setType("javaEE");
        article.setNotice("recommendArticles");
        article.setTime(new Date());
        article.setTitle(blog.getTitle());
        
        articleService.saveArticle(article);

        //发布为帖子
        Topic topic = new Topic();
        topic.setGood(0);
        topic.setTop(0);
        topic.setPublishTime(new Date());

        Section section = new Section();
        section.setId(21);
        topic.setSection(section);
        topic.setContent(blog.getContent());
        topic.setTitle(blog.getTitle());
        topic.setUser(user);
        topicService.saveTopic(topic);

        int score = user.getScore() + 6;
        user.setScore(score);
        userService.saveUser(user);
    }
}

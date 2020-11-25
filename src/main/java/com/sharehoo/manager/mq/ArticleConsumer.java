package com.sharehoo.manager.mq;

import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.common.consumer.ConsumeFromWhere;
import org.apache.rocketmq.common.message.MessageExt;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

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
                        JSONObject message = JSON.parseObject(messageBody);
                        dispatch(message);
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

    private void dispatch(JSONObject message) {
        if (message == null) {
            return;
        }
        String object = message.getString("object");
        String type = message.getString("type");
        String operation = message.getString("operation");
        String callee = message.getString("callee");

        // 打日志需要 added by hxy
        log.info("MQ接收消息体[" + object + "][" + type + "][" + operation + "]" + message.toJSONString());

        // 重新写入
        message.put("callee", callee);

        Assert.notNull(callee, "呼叫命令不能为空");
    }
}

package com.sharehoo.manager.factory;
import com.sharehoo.base.ipseek.IpGet;
import com.sharehoo.base.ipseek.IpSeekUtils;
import com.sharehoo.config.SessionUtil;
import com.sharehoo.entity.shop.Log;
import com.sharehoo.manager.MailSendManager;
import com.sharehoo.manager.UserOperateManager;
import com.sharehoo.util.LogUtils;
import com.sharehoo.util.PostUrlsToBaidu;
import com.sharehoo.util.ServletUtils;
import com.sharehoo.util.SpringUtils;
import com.sharehoo.util.forum.GaoDeUtil;
import com.sharehoo.util.forum.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 * 
 * @author liuhulu
 *
 */
public class AsyncFactory {
	private static final Logger sys_user_logger = LoggerFactory.getLogger(AsyncFactory.class);

	private static final UserOperateManager userOperateManager = SpringUtils.getBean(UserOperateManager.class);

	/**
	 * 动态记录
	 *
	 * @param operLog 操作日志信息
	 * @return 任务task
	 */
	public static TimerTask recordOper(final Log operLog) {
		return new TimerTask() {
			@Override
			public void run() {
				// 远程查询操作地点
				String ip = operLog.getIp();
				String address= GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
				if(address.equals("[]")){
					String provence= IpSeekUtils.getIpProvinceByBaidu(ip);
					operLog.setAddress(provence+">>"+"手机IP访问");
				}else{
					String provence=IpSeekUtils.getIpProvinceByBaidu(ip);
					if(StringUtil.isNotEmpty(address)){
						operLog.setAddress(provence+">>"+address);
					}
				}

				//....
				//v3. 暂时采用多创建一个bean的方式
				userOperateManager.recordOper(operLog);
			}
		};
	}

	/**
	 * 记录登陆信息
	 * 
	 * @param username 用户名
	 * @param status   状态
	 * @param message  消息
	 * @param args     列表
	 * @return 任务task
	 */
	public static TimerTask recordLogininfor(final String username, final String status, final String message,
			final Object... args) {
		return new TimerTask() {
			@Override
			public void run() {
				HttpServletRequest request = ServletUtils.getRequest();
				String ip= IpGet.getIp2(request);
				String address= GaoDeUtil.getAddress(ip);	//2018.01.27运用高德api得到当前地址
				StringBuilder s = new StringBuilder();
				s.append(LogUtils.getBlock(ip));
				s.append(address);
				s.append(LogUtils.getBlock(username));
				s.append(LogUtils.getBlock(status));
				s.append(LogUtils.getBlock(message));
				// 打印信息到日志
				sys_user_logger.info(s.toString(), args);
				// 封装对象
				Log logininfor = new Log();

				// 插入数据
				//v1. 2020.07.03 miki 事先将需要的dubbo服务塞到spring容器中
				//SpringUtils.getBean(ISysLogininforService.class).insertLogininfor(logininfor);

				//TODO v2. 後期考慮隊列去實現日志消化 2020.07.02 miki
				//....
				//v3. 暂时采用多创建一个bean的方式
				userOperateManager.recordOper(logininfor);
			}
		};
	}


	/**
	 * 提交版块信息到百度爬虫
	 *
	 * @param urls 用户名
	 * @return 任务task
	 */
	public static TimerTask commitSections(final List<String> urls) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					String result = PostUrlsToBaidu.postUrl(urls);
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度提交17个版本的链接："+result);

					//v3. 暂时采用多创建一个bean的方式
					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 提交下载社区分类信息到百度爬虫
	 * @return 任务task
	 */
	public static TimerTask asyncCommitDownloadCategories() {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/shop/source/categories");
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/shop/source/categories【提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 提交下载社区资源详细信息到百度爬虫
	 *
	 * @param sourceId 用户名
	 * @return 任务task
	 */
	public static TimerTask asyncCommitDownloadSourceInfo(final Integer sourceId) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/shop/source/"+sourceId);
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/shop/source/"+sourceId +"【提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}



	/**
	 * 提交下载社区资源详细信息到百度爬虫
	 *
	 * @param shopId 用户名
	 * @return 任务task
	 */
	public static TimerTask asyncCommitShopInfo(final Integer shopId) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					//2020.05.05 miki 推送网站信息到百度爬虫
					String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/shop/"+shopId);
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/shop/"+shopId +"【提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 提交下载社区资源详细信息到百度爬虫
	 *
	 * @param topicCode 用户名
	 * @return 任务task
	 */
	public static TimerTask asyncCommitTopicInfo(final String topicCode) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					//2020.05.05 miki 推送网站信息到百度爬虫
					String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/"+topicCode + ".html");
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/"+topicCode + ".html"+"提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 提交下载社区资源详细信息到百度爬虫
	 *
	 * @param sectionId 用户名
	 * @return 任务task
	 */
	public static TimerTask asyncCommitSectionInfo(final Integer sectionId) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					//2020.05.05 miki 推送网站信息到百度爬虫
					String result = PostUrlsToBaidu.postUrl("http://sharehoo.cn/topic/section/"+sectionId);
					Log log = new Log();
					log.setTime(new Date());
					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了该链接：http://sharehoo.cn/topic/section/"+sectionId+"提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 提交下载社区资源详细信息到百度爬虫
	 *
	 * @param sourceId 用户名
	 * @param shopId   状态
	 * @return 任务task
	 */
	public static TimerTask asyncCommitSourceUploadInfoLog(final Integer sourceId, final Integer shopId) {
		return new TimerTask() {
			@Override
			public void run() {
				try {
					//提交索引到百度
					//2020.06.13 miki 推送网站信息到百度爬虫
					List<String> urls = new ArrayList<String>();

					urls.add("http://sharehoo.cn/shop/source/"+sourceId);
					urls.add("http://sharehoo.cn/shop/"+shopId);
					String result = PostUrlsToBaidu.postUrl(urls);
					Log log = new Log();
					log.setTime(new Date());

					log.setType("commit url");
					log.setOperation_log("向百度爬虫提交了新增资源链接以及店铺更新链接：提交结果："+result);

					userOperateManager.recordOper(log);
				} catch (IOException e) {
					sys_user_logger.error("向百度爬虫提交请求，异常：{}", e.getMessage());
				}
			}
		};
	}


	/**
	 * 异步发送帖子回复邮件
	 * 2021.07.15 miki
	 */
	public static TimerTask asyncSendReplyToTopic(String receiver, Integer topicId, String topicTitle ){
		return new TimerTask() {
			@Override
			public void run() {
				MailSendManager mailSendManager = SpringUtils.getBean(MailSendManager.class);
				mailSendManager.sendReplyToTopic(receiver, topicId, topicTitle);
			}
		};
	}

	/**
	 * 异步发送帖子回复邮件
	 * 2021.07.15 miki
	 */
	public static TimerTask asyncSendReplyToComment(String receiver, Integer replyId, String replyContent ){
		return new TimerTask() {
			@Override
			public void run() {
				MailSendManager mailSendManager = SpringUtils.getBean(MailSendManager.class);
				mailSendManager.sendReplyToComment(receiver, replyId, replyContent);
			}
		};
	}

}

package com.sharehoo.config.aspect;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.Log;
import com.sharehoo.entity.forum.User;
import com.sharehoo.manager.AsyncManager;
import com.sharehoo.manager.factory.AsyncFactory;
import com.sharehoo.util.PostUrlsToBaidu;
import com.sharehoo.util.ServletUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.Map;

/**
 * 操作日志记录处理
 * 
 * @author ruoyi
 */
@Aspect
@Component
public class LogAspect {
	private static final Logger log = LoggerFactory.getLogger(LogAspect.class);

	/** 排除敏感属性字段 */
	public static final String[] EXCLUDE_PROPERTIES = { "password", "oldPassword", "newPassword", "confirmPassword" };

	// 配置织入点
	@Pointcut("@annotation(com.sharehoo.config.annotation.Log)")
	public void logPointCut() {
	}

	/**
	 * 处理完请求后执行
	 *
	 * @param joinPoint 切点
	 */
	@AfterReturning(pointcut = "logPointCut()", returning = "jsonResult")
	public void doAfterReturning(JoinPoint joinPoint, Object jsonResult) {
		handleLog(joinPoint, null, jsonResult);
	}

	/**
	 * 拦截异常操作
	 * 
	 * @param joinPoint 切点
	 * @param e         异常
	 */
	@AfterThrowing(value = "logPointCut()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Exception e) {
		handleLog(joinPoint, e, null);
	}

	protected void handleLog(final JoinPoint joinPoint, final Exception e, Object jsonResult) {
		try {
			// 获得注解
			Log controllerLog = getAnnotationLog(joinPoint);
			if (controllerLog == null) {
				return;
			}

			// 获取当前的用户
			com.sharehoo.entity.shop.Log log1 = new com.sharehoo.entity.shop.Log();
			User user = SessionUtil.getUserNoThrowException();	//关注者，
			log1.setUser(user);

			// *========数据库日志=========*//
			log1.setTime(new Date());
			log1.setOperation_log(controllerLog.title());

			if (e != null) {
				log1.setOperation_log(StringUtils.substring(e.getMessage(), 0, 2000));
			}
			// 处理设置注解上的参数
			getControllerMethodDescription(controllerLog, log1);
			// 保存数据库
			AsyncManager.me().execute(AsyncFactory.recordOper(log1));
		} catch (Exception exp) {
			// 记录本地异常日志
			log.error("==前置通知异常==");
			log.error("异常信息:{}", exp.getMessage());
			exp.printStackTrace();
		}
	}

	/**
	 * 获取注解中对方法的描述信息 用于Controller层注解
	 * 
	 * @param log     日志
	 * @param operLog 操作日志
	 * @throws Exception
	 */
	public void getControllerMethodDescription(Log log, com.sharehoo.entity.shop.Log operLog) throws Exception {
		// 设置action动作
		operLog.setType(log.businessType().toString());
		// 设置标题
		operLog.setOperation_log(log.title());

		// 是否需要保存request，参数和值
		if (log.isSaveRequestData()) {
			// 获取参数的信息，传入到数据库中。
			//setRequestValue(operLog);
		}

		switch (log.businessType()){
			case COMMIT_URL:
				recordCommitUrl(log, operLog);
				break;
			case USER_LOGIN:
			default:
				break;
		}
	}



	private void recordCommitUrl(Log logAnnotation, com.sharehoo.entity.shop.Log log1){
		try{
			String url = "";
			String content = "";
			switch (logAnnotation.operatorType()){
				case SHOP_INDEX:
					url = "http://sharehoo.cn/shop/index.htm";
					content = "向百度爬虫提交了该链接：http://sharehoo.cn/shop/index.htm【提交结果：";
					break;
			}

			String result = PostUrlsToBaidu.postUrl(url);
			log1.setOperation_log(content + result);

		}catch (Exception e){
			log.error("向百度提交网站url异常，{}", log1.getOperation_log());
		}

	}


	/**
	 * 获取请求的参数，放到log中
	 *
	 * @param operLog 操作日志
	 * @throws Exception 异常
	 */
	private void setRequestValue(com.sharehoo.entity.shop.Log operLog) throws Exception {
		Map<String, String[]> map = ServletUtils.getRequest().getParameterMap();
//		if (StringUtils.isNotEmpty(map)) {
//			PropertyPreFilters.MySimplePropertyPreFilter excludes = new PropertyPreFilters().addFilter();
//			excludes.addExcludes(EXCLUDE_PROPERTIES);
//			String params = JSONObject.toJSONString(map, excludes);
//			operLog.setOperParam(StringUtils.substring(params, 0, 2000));
//		}
	}

	/**
	 * 是否存在注解，如果存在就获取
	 */
	private Log getAnnotationLog(JoinPoint joinPoint) throws Exception {
		Signature signature = joinPoint.getSignature();
		MethodSignature methodSignature = (MethodSignature) signature;
		Method method = methodSignature.getMethod();

		if (method != null) {
			return method.getAnnotation(Log.class);
		}
		return null;
	}
}

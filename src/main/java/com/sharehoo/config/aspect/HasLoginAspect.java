package com.sharehoo.config.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
@SuppressWarnings({"unused"})
public class HasLoginAspect {
	
	public static final Logger logger = LoggerFactory.getLogger(HasLoginAspect.class);
	
	@Pointcut("@annotation(com.sharehoo.config.annotation.HasLogin)")
    public void annotationPointcut() {

    }
}

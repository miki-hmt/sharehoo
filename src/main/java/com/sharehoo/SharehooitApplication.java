package com.sharehoo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.sharehoo.dao.impl.BaseDAOImpl;

@ServletComponentScan
@EnableJpaRepositories(repositoryBaseClass = BaseDAOImpl.class)
@SpringBootApplication
public class SharehooitApplication extends SpringBootServletInitializer{

	/**
	 * 发布到外部Servlet容器
	 * 使用外部tomcat部署方式，修改启动Application文件继承SpringBootServletInitializer,实现configure方法		2019.04.03	miki
	 * 
	 * @param builder 用于{@link SpringApplication}和{@link ApplicationContext}实例的生成器
	 * @return SpringApplicationBuilder
	 */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SharehooitApplication.class);
    }

    /**
     * Spring boot Jar方式启动入口		2019.03.20	MIIK
     * springboot启动类的默认扫描路径是该类所在的包下面的所有java类。如：启动类在“cn.com.test.app”包下，那么只有cn.com.test.app包下的类会被扫描加载。
     *  且不能同级，如cn.com.test.core下面的类同样也不会被扫描。
     * 如果需要加载的类不在启动类的同一包下，可以在启动类处，手动指定扫描包路径，如下：
     */
    public static void main(String[] args) {
        SpringApplication.run(SharehooitApplication.class, args);
    }

}
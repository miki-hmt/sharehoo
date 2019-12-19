package com.sharehoo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.mail.MailSenderAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import com.sharehoo.dao.impl.BaseDAOImpl;


/*2019.10.11 miki 解决文件上传的监听
* 将 spring 默认的文件上传处理类取消自动配置，这一步很重要，没有这一步，当multipartResolver重新指向了我们定义好
* 的新的文件上传处理类后，前台传回的 file 文件在后台获取会是空，加上这句话就好了，推测不加这句话，spring 依然
* 会先走默认的文件处理流程并修改request对象，再执行我们定义的文件处理类。（这只是个人推测）
* exclude表示自动配置时不包括Multipart配置
*/

@ServletComponentScan
@EnableJpaRepositories(repositoryBaseClass = BaseDAOImpl.class)
@SpringBootApplication(exclude = {MailSenderAutoConfiguration.class})
@ComponentScan(basePackages = {"com.sharehoo", "org.springframework.web.multipart.commons"})
public class SharehooitApplication extends SpringBootServletInitializer{
	
	/*
	* 将 multipartResolver 指向我们刚刚创建好的继承 CommonsMultipartResolver 类的自定义文件上传处理类
	*/
//	@Bean(name = "multipartResolver")
//	public MultipartResolver multipartResolver() {
//		CustomMultipartResolver customMultipartResolver = new CustomMultipartResolver();
//		return customMultipartResolver;
//	}
	
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
package com.sharehoo.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;

@Configuration
public class KaptchaConfig {
	
	@Bean
    public DefaultKaptcha producer() {
        Properties properties = new Properties();
        properties.setProperty(Constants.KAPTCHA_IMAGE_WIDTH, "100");
        properties.setProperty(Constants.KAPTCHA_IMAGE_HEIGHT, "30");
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_FONT_SIZE, "17");
        properties.setProperty(Constants.KAPTCHA_TEXTPRODUCER_CHAR_LENGTH, "6");
        //***** 背景样式，阴影
        properties.setProperty(Constants.KAPTCHA_OBSCURIFICATOR_IMPL, "com.google.code.kaptcha.impl.ShadowGimpy");
        //properties.setProperty(Constants.KAPTCHA_BACKGROUND_CLR_FROM, "RED");
        properties.put("kaptcha.border", "no");
        properties.put("kaptcha.textproducer.font.color", "red");
        properties.put("kaptcha.textproducer.char.space", "4");
        //如果需要生成算法验证码加上一下配置
        properties.put("kaptcha.textproducer.char.string", "1234567890");
        //如果需要去掉干扰线
        properties.put("kaptcha.noise.impl", "com.google.code.kaptcha.impl.NoNoise");
        // 设置字体
        properties.setProperty("kaptcha.textproducer.font.names", "黑体");
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}

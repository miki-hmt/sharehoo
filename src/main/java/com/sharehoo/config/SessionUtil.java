package com.sharehoo.config;

import com.sharehoo.base.exception.UserException;
import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.User;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName SessionUtil
 * @Description 获取用户信息
 * @Author miki
 * @Date 2020/12/7 13:44
 * @Version 1.0
 */
public class SessionUtil {

    /**
     * @Author miki
     * @Description 获取用户信息 *
     * @Date 13:47 2020/12/7
     * @Param []
     * @return com.sharehoo.entity.forum.User
     **/
    public static User getUser(){
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Object user = request.getSession().getAttribute(Consts.CURRENTUSER);
        if(ObjectUtils.isEmpty(user)){
            throw new UserException(401, "请登录后再操作...");
        }

        return (User) user;
    }

    /**
     * @Author miki
     * @Description 不处理异常方法 *
     * @Date 15:08 2020/12/7
     * @Param []
     * @return com.sharehoo.entity.forum.User
     **/
    public static User getUserNoThrowException(){
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Object user = request.getSession().getAttribute(Consts.CURRENTUSER);
        if(ObjectUtils.isEmpty(user)){
            return null;
        }

        return (User) user;
    }


    /**
     * @Author miki
     * @Description 获取用户信息 *
     * @Date 13:47 2020/12/7
     * @Param []
     * @return com.sharehoo.entity.forum.User
     **/
    public static Integer getUserId(){
        HttpServletRequest request =
                ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Object user = request.getSession().getAttribute(Consts.CURRENTUSER);
        if(ObjectUtils.isEmpty(user)){
            return 0;
        }

        User userV0 = (User) user;
        return userV0.getId();
    }
}

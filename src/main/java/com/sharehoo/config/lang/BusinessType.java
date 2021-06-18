package com.sharehoo.config.lang;

/**
 * 业务操作类型
 * 
 * @author ruoyi
 */
public enum BusinessType
{
    /**
     * 其它
     */
    OTHER,

    /**
     * 新增
     */
    INSERT,

    /**
     * 修改
     */
    UPDATE,

    /**
     * 删除
     */
    DELETE,

    
    /**
     * 清空
     */
    CLEAN,
    /**
     * 链接提交
     */
    COMMIT_URL,
    USER_LOGIN,

    /**
     * 店铺访问
     */
    VISITOR,
    /**
     * 店铺搜索
     */
    SHOP_SEARCH,
    /**
     * 管理员登录
     */
    ADMIN_LOGIN,

    BLOG_CRITIQUE,
    TOPIC_REPLY
}

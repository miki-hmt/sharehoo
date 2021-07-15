package com.sharehoo.controller.forum;

import java.io.IOException;
import java.security.Security;
import java.text.MessageFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sharehoo.config.SessionUtil;
import com.sharehoo.config.annotation.HasLogin;
import com.sharehoo.manager.AsyncManager;
import com.sharehoo.manager.UserOperateManager;
import com.sharehoo.manager.factory.AsyncFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehoo.config.lang.Consts;
import com.sharehoo.entity.forum.PageBean;
import com.sharehoo.entity.forum.Reply;
import com.sharehoo.entity.forum.Topic;
import com.sharehoo.entity.forum.User;
import com.sharehoo.service.forum.ReplyService;
import com.sharehoo.service.forum.TopicService;
import com.sharehoo.service.forum.UserService;
import com.sharehoo.util.forum.E3Result;
import com.sharehoo.util.forum.PageUtil;
import com.sharehoo.util.forum.StringUtil;

import net.sf.json.JSONObject;

@Controller
public class ReplyController {

    private static Logger logger = Logger.getLogger(ReplyController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private ReplyService replyService;
    @Autowired
    private TopicService topicService;

    @Autowired
    private UserOperateManager userOperateManager;


    @RequestMapping("/reply/save")
    @ResponseBody
    public E3Result save(Reply reply, @RequestParam("sonId") int sonId, HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute(Consts.CURRENTUSER);
        if (user == null) {
            return E3Result.build(401, "崽种,请登陆后再回帖..");
        }
        reply.setPublishTime(new Date());
        reply.setStatus(0);
        if (sonId > 0) {
            User sonUser = userService.getUserById(sonId);
            reply.setSonUser(sonUser);
        } else {
            reply.setSonUser(null);
        }
        replyService.saveReply(reply);
        Topic topic = topicService.findTopicById(reply.getTopic().getId());
        User topicOwner = userService.getUserById(topic.getUser().getId());    //2017.04.27   得到发帖人，向其发送邮件**1**
        topic.setModifyTime(new Date());
        topicService.saveTopic(topic);

        //	2017.04.27回复功能拓展，通过邮箱的方式提醒用户。  **2**
        User currentUser = userService.getUserById(reply.getUser().getId());
        //2017.05.01	回复帖子实现用户积分+1
        currentUser.setScore(currentUser.getScore() + 1);
        userService.saveUser(currentUser);

        //**********************************回复发帖人
        if (reply.getTitle().equals("")) {
            //************3. 发邮件   **3**
            AsyncManager.me().execute(AsyncFactory.asyncSendReplyToTopic(topicOwner.getEmail(), topic.getId(), topic.getTitle()));

        } else {
            //******************************回复评论人
            Reply targetComment = replyService.findReplyById(Integer.parseInt(reply.getTitle()));
            String to = "";
            if (sonId > 0) {
                User sonUser = userService.getUserById(sonId);
                to = sonUser.getEmail();
            } else {
                to = targetComment.getUser().getEmail();
            }
            AsyncManager.me().execute(AsyncFactory.asyncSendReplyToComment(to, targetComment.getId(), targetComment.getContent()));
        }

        //记录日志
        userOperateManager.asyncOperateReplyLog(topic);
        return E3Result.ok();
    }

    @RequestMapping("/reply/delete")
    @ResponseBody
    public E3Result delete(HttpServletRequest request, @RequestParam("replyId") int replyId) throws Exception {

        User user = SessionUtil.getUser();
        if ("2".equals(user.getType()) || user.getSectionList().size() > 0) {
            Reply reply = replyService.findReplyById(replyId);
            replyService.deleteReply(reply);
            return E3Result.ok();
        }
        return E3Result.build(401, "删除失败..");
    }

    @HasLogin
    @RequestMapping("/admin/reply/update/{replyId}")
    public String update(@PathVariable("replyId") int replyId) throws Exception {
        Reply reply = replyService.findReplyById(replyId);
        reply.setStatus(1);
        replyService.saveReply(reply);
        return "redirect:/user/reply";
    }


    @RequestMapping("/reply/details/{rid}")
    public String details(HttpServletRequest request, @PathVariable("rid") int rid, @RequestParam(value = "page", required = false) String page,
                          Model model) throws Exception {
        if (rid > 0) {
            if (StringUtil.isEmpty(page)) {
                page = "1";
            }
            long total = replyService.getSonCountByRid(rid);
            model.addAttribute("count", total);
            PageBean pageBean = new PageBean(Integer.parseInt(page), 18);
            Reply reply = replyService.findReplyById(rid);
            model.addAttribute("reply", reply);
            List<Reply> sonList = replyService.getSonReplyList(rid, pageBean);
            model.addAttribute("sonList", sonList);

            String pageCode = PageUtil.genPagination(request.getContextPath() + "/reply/details/" + rid, total, Integer.parseInt(page), 18, null);
            model.addAttribute("pageCode", pageCode);
        }
        return "topic/sonReply";
    }


    //2017.12.17	miki 实现点赞功能
    @RequestMapping("/reply/dianzan")
    @ResponseBody
    public JSONObject zan(@RequestParam("rid") int rid, @RequestParam("num") int num) throws Exception {
        JSONObject result = new JSONObject();
        if (rid > 0) {
            Reply rep = replyService.findReplyById(rid);
            if (num > 0) {
                rep.setGood(num);
                replyService.saveReply(rep);
                result.put("success", true);
            } else {
                result.put("success", false);
            }
        } else {
            result.put("success", false);
        }
        return result;
    }

    //2017.12.17	miki 实现点赞功能
    @RequestMapping("/reply/cai")
    @ResponseBody
    public JSONObject bad(@RequestParam("rid") int rid, @RequestParam("num") int num) throws Exception {
        JSONObject result = new JSONObject();
        if (rid > 0) {
            Reply rep = replyService.findReplyById(rid);
            if (num > 0) {
                rep.setBad(num);
                replyService.saveReply(rep);
                result.put("success", true);
            } else {
                result.put("success", false);
            }
        } else {
            result.put("success", false);
        }
        return result;
    }
}

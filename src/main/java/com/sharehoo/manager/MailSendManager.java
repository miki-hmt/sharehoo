package com.sharehoo.manager;

import com.sun.org.apache.bcel.internal.generic.SWITCH;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.security.Security;
import java.text.MessageFormat;
import java.util.Properties;

@Component
public class MailSendManager {

    private static final Logger logger = Logger.getLogger(MailSendManager.class);
    private static final String MAILTOTOPIC = "mailToTopic";
    private static final String MAILTOCOMMENT = "mailToComment";
    private static final String MAILTOREGISTER = "mailToRegister";


    /**
     * 回复发帖人邮件  2021.07.15 miki
     * @param receiver
     * @param topicId
     * @param topicTitle
     */
    public void sendReplyToTopic(String receiver, Integer topicId, String topicTitle) {
        //************3. 发邮件   **3**
        Properties props = initProperties(MAILTOTOPIC);

        //登录邮件服务器，得到session
        Session session = initMailSession(props);

        //初始化文本内容
        String content = MessageFormat.format(props.getProperty("content"), topicId, topicTitle);        //内容
        props.setProperty("receiver", receiver);

        //建立邮件对象
        MimeMessage message = initMimeMessage(session, props, content);
        try {
            //发送邮件
            Transport transport = session.getTransport();
            transport.connect();
            Transport.send(message);
            transport.close();
        } catch (Exception e) {
            //邮件发送失败，可以忽略
            logger.error("帖子回复邮件发送失败.." + e.getMessage());
        }
    }

    /**
     * 回复发帖人邮件  2021.07.15 miki
     * @param receiver
     * @param replyId
     * @param targetReplyContent
     */
    public void sendReplyToComment(String receiver, Integer replyId, String targetReplyContent) {
        //************3. 发邮件   **3**
        Properties props = initProperties(MAILTOCOMMENT);

        //登录邮件服务器，得到session
        Session session = initMailSession(props);

        //初始化文本内容
        String content = MessageFormat.format(props.getProperty("content"), replyId, targetReplyContent);        //内容
        props.setProperty("receiver", receiver);

        //建立邮件对象
        MimeMessage message = initMimeMessage(session, props, content);
        try {
            //发送邮件
            Transport transport = session.getTransport();
            transport.connect();
            Transport.send(message);
            transport.close();
        } catch (Exception e) {
            //邮件发送失败，可以忽略
            logger.error("帖子回复邮件发送失败.." + e.getMessage());
        }
    }


    private Properties initProperties(String type) {
        Properties props = new Properties();
        try {
            switch (type) {
                case MAILTOTOPIC:
                    props.load(this.getClass().getClassLoader().getResourceAsStream("user_reply_email.properties"));
                    break;

                case MAILTOCOMMENT:
                    props.load(this.getClass().getClassLoader().getResourceAsStream("user_comments_email.properties"));
                    break;
                case MAILTOREGISTER:
                    props.load(this.getClass().getClassLoader().getResourceAsStream("register_email.properties"));
                    break;
            }

            //****** 把JavaMail重构成异步，避免阻塞核心业务逻辑。
            props.put("mail.smtp.timeout", 10000);
            props.put("mail.smtp.connectiontimeout", 10000);
            props.put("mail.smtp.writetimeout", 10000);
            props.put("mail.debug", "true");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return props;
    }

    private Session initMailSession(Properties props) {
        //登录邮件服务器，得到session
        //设置SSL连接、邮件环境
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

        //建立邮件会话
        final String userName = props.getProperty("username");
        final String password = props.getProperty("password");

        Session session = Session.getDefaultInstance(props, new Authenticator() {
            //身份认证
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        });
        session.setDebug(false);

        return session;
    }

    private MimeMessage initMimeMessage(Session session, Properties props, String content){
        MimeMessage message = new MimeMessage(session);
        //设置邮件的发件人、收件人、主题
        //附带发件人名字
        String from = props.getProperty("from");
        String title = props.getProperty("subject");
        String to = props.getProperty("receiver");

        try {
            message.setFrom(new InternetAddress(from));
            message.setRecipients(javax.mail.Message.RecipientType.TO, to);

            //邮件标题
            message.setSubject(title);

            //文本部分
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent("<img src='cid:myimg'/><div style='width:1193px; height:100px;border:1px solid red'>" + content + "</div>", "text/html;charset=UTF-8");
            //内嵌图片部分
            MimeBodyPart imagePart = new MimeBodyPart();
            imagePart.setDataHandler(new DataHandler(new FileDataSource("D:/soft/logo.jpg")));//图片路径
            imagePart.setContentID("myimg");
            //图文整合，关联关系
            MimeMultipart mmp1 = new MimeMultipart();
            mmp1.addBodyPart(textPart);
            mmp1.addBodyPart(imagePart);
            mmp1.setSubType("related");
            MimeBodyPart textImagePart = new MimeBodyPart();
            textImagePart.setContent(mmp1);
            //附件部分
            MimeBodyPart attachmentPart = new MimeBodyPart();
            DataHandler dh = new DataHandler(new FileDataSource("D:/soft/freemarker/file/sharehoo社区福利.txt"));//文件路径
            String fileName = dh.getName();
            attachmentPart.setDataHandler(dh);
            attachmentPart.setFileName(fileName);
            //图文和附件整合，复杂关系
            MimeMultipart mmp2 = new MimeMultipart();
            mmp2.addBodyPart(textImagePart);
            mmp2.addBodyPart(attachmentPart);
            mmp2.setSubType("mixed");
            //将以上内容添加到邮件的内容中并确认
            message.setContent(mmp2);
            message.saveChanges();
        }catch (Exception e){
            logger.error("邮件内容初始化失败.." + e.getMessage());
        }
        return message;
    }
}

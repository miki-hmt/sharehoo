/*
package jiabin.entity;


/*
 * import javax.persistence.Entity;   这个包的作用是持久化的作用，具体的说就是在实体类中进行元数据标签的作用，是ORM框架中用到的。
 *ORM框架可以通过这个元数据标签，使得实体类与数据库中的表建立映射关系。
 *例如javax.persistence.Column标识实体类中的这个属性对应于数据库中的一个字段等等。

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="t_message")
public class LMessage {
	private int id;   //留言编号
	private User user;  //留言用户
	private String content;  //留言内容
	private Date PublishTime;  //留言时间 
	
	
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native") 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublishTime() {
		return PublishTime;
	}
	public void setPublishTime(Date publishTime) {
		PublishTime = publishTime;
	}
	
	
}

*/

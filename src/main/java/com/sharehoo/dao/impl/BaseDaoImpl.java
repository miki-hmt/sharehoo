package com.sharehoo.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.PageBean;

/*2016.11.15
 * @Repository注解便属于最先引入的一批，它用于将数据访问层 (DAO 层 ) 的类标识为 Spring Bean。
 * 具体只需将该注解标注在 DAO类上即可。同时，为了让 Spring 能够扫描类路径中的类并识别出 @Repository 注解，
 * 需要在 XML 配置文件中启用Bean 的自动扫描功能，这可以通过<context:component-scan/>实现
 * */

@Repository("baseDAO")
@SuppressWarnings("all")    

/*
 * java.lang.SuppressWarnings是J2SE 5.0中标准的Annotation之一。可以标注在类、字段、方法、参数、构造方法，以及局部变量上。
 * 作用：告诉编译器忽略指定的警告，不用在编译完成后出现警告信息。
 *使用：
 *  */
public class BaseDaoImpl<T> implements BaseDAO<T> {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
       //spring2.5引入autowired注释，它可以完成对类成员变量，方法及构造函数进行标注，完成自动装配的工作，
	   // 通过使用此方法来消除set，get方法
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	public void update(T o) {
		this.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
	}

	public List<T> find(String hql) {
		return this.getCurrentSession().createQuery(hql).list();
	}

	public List<T> find(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Object[] param, PageBean pageBean) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
	}

	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
	}

	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public Long count(String hql) {
		return  (Long) this.getCurrentSession().createQuery(hql).uniqueResult();
	}

	public Long count(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}

	//计算数量
	public Long count(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.uniqueResult();
	}

	public Integer executeHql(String hql) {
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}

	public Integer executeHql(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}

	public void merge(T o) {
		// TODO Auto-generated method stub
		this.getCurrentSession().merge(o);
	}

	public Integer executeSql(String sql) {
		Query q = this.getCurrentSession().createSQLQuery(sql);
		return q.executeUpdate();
	}

	//override说明了被标注的方法重载了父类的方法，起到了断言的作用，
    //如果你想重写父类方法，可以在此方法上加上override，编译器可以帮你判断你写的方法是否错误
		
	@Override
	public List<T> findTopN(String hql, List<Object> param, int N) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		q.setFirstResult(0);
		q.setMaxResults(N);
		return q.list();
	}

}

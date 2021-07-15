package com.sharehoo.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import com.sharehoo.dao.BaseDAO;
import com.sharehoo.entity.forum.PageBean;

public class BaseDAOImpl<T> extends SimpleJpaRepository<T, Integer> implements BaseDAO<T>{

	private static final int BATCH_SIZE = 500;

    private EntityManager entityManager;
    
    public BaseDAOImpl(JpaEntityInformation<T, ?> entityInformation, EntityManager em) {
        super(entityInformation, em);
        this.entityManager = em;

    }

    public BaseDAOImpl(Class<T> domainClass, EntityManager em) {
        super(domainClass, em);
        this.entityManager = em;
    }
    
    private Session getCurrentSession(){
        return entityManager.unwrap(Session.class);
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
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public List<T> find(String hql) {
		return this.getCurrentSession().createQuery(hql).getResultList();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public List<T> find(String hql, Object[] param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public List<T> find(String hql, List<Object> param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.getResultList();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public List<T> find(String hql, Object[] param, PageBean pageBean) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).getResultList();
	}
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
	}
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public Long count(String hql) {
		return  (Long) this.getCurrentSession().createQuery(hql).uniqueResult();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public Long count(String hql, Object[] param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	//计算数量
	public Long count(String hql, List<Object> param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		if(q.uniqueResult()==null) {
			return (long) 0;
		}
		return (Long) q.uniqueResult();
	}

	public Integer executeHql(String hql) {
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public Integer executeHql(String hql, Object[] param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}
	
	
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/
	public Integer executeHql(String hql, List<Object> param) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
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
	
	/*************
	 * 使用sql查询的方法
	 * ************************************/
	public Integer executeSql(String sql) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(sql);
		return q.executeUpdate();
	}

	//override说明了被标注的方法重载了父类的方法，起到了断言的作用，
    //如果你想重写父类方法，可以在此方法上加上override，编译器可以帮你判断你写的方法是否错误
	/*****************
	 * 2019.08.19	miki	
	 * hibernate  里是session.createQuery():  hql查询，session.createSqlQuery():  sql查询 
	 * jpa 里是entityManager.createQuery; jpql查询(类hql)，entityManager.createNativeQuery; sql查询。
	 * **********************************************************/	
	@Override
	public List<T> findTopN(String hql, List<Object> param, int N) {
		Query<T> q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		q.setFirstResult(0);
		q.setMaxResults(N);
		return q.list();
	}
	
	@Override
	public List<T> findTopNBySql(String hql, List<Object> param, int N,Class<T> c) {
		Query<T> q = this.getCurrentSession().createNativeQuery(hql,c);
		
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		q.setFirstResult(0);
		q.setMaxResults(N);
		return q.getResultList();
	}
}

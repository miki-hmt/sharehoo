package com.sharehoo.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
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

	public List<T> find(String hql) {
		return this.getCurrentSession().createNativeQuery(hql).list();
	}

	public List<T> find(String hql, Object[] param) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Object[] param, PageBean pageBean) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult(pageBean.getStart()).setMaxResults(pageBean.getPageSize()).list();
	}

	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
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
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}

	//计算数量
	public Long count(String hql, List<Object> param) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
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
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
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
		NativeQuery<T> q = this.getCurrentSession().createSQLQuery(sql);
		return q.executeUpdate();
	}

	//override说明了被标注的方法重载了父类的方法，起到了断言的作用，
    //如果你想重写父类方法，可以在此方法上加上override，编译器可以帮你判断你写的方法是否错误
		
	@Override
	public List<T> findTopN(String hql, List<Object> param, int N) {
		NativeQuery<T> q = this.getCurrentSession().createNativeQuery(hql);
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

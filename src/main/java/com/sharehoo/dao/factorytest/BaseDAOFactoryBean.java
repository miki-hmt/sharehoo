package com.sharehoo.dao.factorytest;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean;
import org.springframework.data.repository.core.RepositoryInformation;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;

import com.sharehoo.dao.impl.BaseDAOImpl;


/**
* @ClassName: BaseDAOFactoryBean  
* @Description: TODO(利用工厂对象生成EntityManager示例)  
* @author miki
* @date 2019年8月5日 上午9:28:44  
* 
* @param <R>
* @param <T>
* @param <I>
 */
public class BaseDAOFactoryBean<R extends JpaRepository<T, I>, T, I extends Serializable> extends JpaRepositoryFactoryBean<R, T, I> {

	public BaseDAOFactoryBean(Class<? extends R> repositoryInterface) {
		super(repositoryInterface);
		// TODO Auto-generated constructor stub
	}
	
	@SuppressWarnings("rawtypes")
	protected RepositoryFactorySupport createRepositoryFactory(EntityManager em) {
		return new BaseDAOFactory(em);
	}
 
	// 创建一个内部类，该类不用在外部访问
	private static class BaseDAOFactory<T, I extends Serializable> extends JpaRepositoryFactory {
 
		private final EntityManager em;
 
		public BaseDAOFactory(EntityManager em) {
			super(em);
			this.em = em;
		}
 
		// 设置具体的实现类是BaseRepositoryImpl
		@Override
		protected Object getTargetRepository(RepositoryInformation information) {
			return new BaseDAOImpl<T>((Class<T>) information.getDomainType(), em);
		}
 
		// 设置具体的实现类的class
		protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
			return BaseDAOImpl.class;
		}
	}

}

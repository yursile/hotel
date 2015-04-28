package com.hotel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hotel.dao.CommonDAO;

public class CommonDAOImpl<E> extends HibernateDaoSupport implements CommonDAO<E>{

	@Override
	public List<E> findDataByPage(final String hql, final Integer pageNum,
			final Integer numPerPage) throws Exception {
		return (List<E>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setFirstResult((pageNum-1)*numPerPage);
				query.setMaxResults(numPerPage);
				System.out.println("dao excute");
				List<E> list = query.list();
				return query.list();
			}
		});
	}

	@Override
	public void add(Object o) throws Exception {
		this.getHibernateTemplate().save(o);
		
	}

	@Override
	public void delete(Object o) throws Exception {
		this.getHibernateTemplate().delete(o);
		
	}

	@Override
	public void update(Object o) throws Exception {
		this.getHibernateTemplate().update(o);
		
	}

	@Override
	public E findDataByString(final String hql,final String str) throws Exception {
		List<E> curent= this.getHibernateTemplate().find(hql,str);
		return curent.get(0);
	}

	@Override
	public E findById(String hql, long id) throws Exception {
		List<E> curent= this.getHibernateTemplate().find(hql,id);
		return curent.get(0);
	}

}

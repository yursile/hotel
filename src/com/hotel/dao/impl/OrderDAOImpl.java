package com.hotel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hotel.dao.DAOSupport;
import com.hotel.dao.OrderDAO;
import com.hotel.entity.Customer;
import com.hotel.entity.Order;

public class OrderDAOImpl extends HibernateDaoSupport implements OrderDAO{

	

	@Override
	public List<Order> findOrderByCustomerId(long customerId) {
		List<Order> orders = this.getHibernateTemplate().find("from Order o where o.customer.id=?", customerId);
		return orders;
	}

	@Override
	public void saveOrder(Order order) {
		this.getHibernateTemplate().save(order);
	}

	@Override
	public Order findOrderByOrderId(final String hql,final long customerId, final long orderId) {
		return (Order)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setLong(1, orderId);
				System.out.println("dao excute");
				Order order = (Order) query.uniqueResult();
				return order;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrderByTime(final String hql,final long customerId, final int time) {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setInteger(1, time);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrderByTimes(final String hql,final long customerId, final int startTime,
			final int endTime) {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setInteger(1, startTime);
				query.setInteger(2, endTime);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrder(final String hql,final long customerId, final int startTime, final int endTime,
			final int status) {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setInteger(1, startTime);
				query.setInteger(2, endTime);
				query.setInteger(3, status);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrder(final String hql,final long customerId, final int time, final int status) {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setInteger(1, time);
				query.setInteger(2, status);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrderByStauts(final String hql, final long customerId, final int status) {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setInteger(1, status);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findOrder(final String hql, final long customerId, final long hotelId)
			throws Exception {
		return (List<Order>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, customerId);
				query.setLong(1, hotelId);
				System.out.println("dao excute");
				List<Order> list = query.list();
				return list;
			}
		});
	}
	
}

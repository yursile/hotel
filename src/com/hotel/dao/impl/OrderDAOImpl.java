package com.hotel.dao.impl;

import java.util.List;

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

	
}

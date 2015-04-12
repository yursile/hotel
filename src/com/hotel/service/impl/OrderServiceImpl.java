package com.hotel.service.impl;

import java.util.List;

import com.hotel.dao.OrderDAO;
import com.hotel.entity.Customer;
import com.hotel.entity.Order;
import com.hotel.service.OrderService;

public class OrderServiceImpl implements OrderService{
	private OrderDAO orderDAO;
	
	@Override
	public List<Order> findOrderByCustomerId(long customerId) {
		return orderDAO.findOrderByCustomerId(customerId);
	}

	

	@Override
	public void saveOrder(Order order) {
		orderDAO.saveOrder(order);
	}
	
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

}

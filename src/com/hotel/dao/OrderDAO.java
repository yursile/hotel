package com.hotel.dao;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Order;

public interface OrderDAO {
	public List<Order> findOrderByCustomerId(long customerId);
	public void saveOrder(Order order);
}

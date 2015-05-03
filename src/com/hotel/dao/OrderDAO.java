package com.hotel.dao;

import java.util.List;
import com.hotel.entity.Order;

public interface OrderDAO {
	public List<Order> findOrderByCustomerId(long customerId) throws Exception;
	public void saveOrder(Order order)throws Exception;
	public Order findOrderByOrderId(String hql,long customerId,long orderId)throws Exception;
	public List<Order> findOrderByTime(String hql,long customerId,int time)throws Exception;
	public List<Order> findOrderByTimes(String hql,long customerId,int startTime,int endTime)throws Exception;
	public List<Order> findOrderByStauts(String hql,long customerId,int status)throws Exception;
	public List<Order> findOrder(String hql,long customerId,int startTime,int endTime,int status)throws Exception;
	public List<Order> findOrder(String hql,long customerId,int time,int status)throws Exception;
	public List<Order> findOrder(String hql,long customerId,long hotelId)throws Exception;
	public void editOrder(Order order)throws Exception;
	public void deleteOrder(Order order)throws Exception;
}

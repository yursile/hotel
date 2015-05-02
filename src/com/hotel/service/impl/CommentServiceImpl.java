package com.hotel.service.impl;

import java.util.List;

import com.hotel.dao.CommentDAO;
import com.hotel.entity.Comment;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.entity.Order;
import com.hotel.exception.ServException;
import com.hotel.service.CommentService;
import com.hotel.service.OrderService;
import com.hotel.util.HotelUtil;

public class CommentServiceImpl implements CommentService{
	private OrderService orderService;
	private CommentDAO commentDAO;
	@Override
	public String addComment(Customer customer,Hotel hotel, String content, int level,
			int type) throws ServException {
		List<Order> orders = orderService.findOrderByHotel(customer.getId(), hotel.getId());
		if(orders.size()==0){
			return "您没在该店入住";
		}else{
			Comment comment = new Comment();
			comment.setHotel(hotel);
			comment.setCustomer(customer);
			comment.setContent(content);
			comment.setType(type);
			comment.setTime(HotelUtil.getNowDay());
			comment.setLevel(level);
			
			try {
				commentDAO.saveComment(comment);
				return "评论成功";
			} catch (Exception e) {
				e.printStackTrace();
				return "系统出错";
			}
			
		}
		
	}
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public CommentDAO getCommentDAO() {
		return commentDAO;
	}
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	@Override
	public List<Comment> findCommentByHotel(Hotel hotel) throws Exception {
		return commentDAO.findCommentByHotel( hotel);
	}
	@Override
	public List<Comment> findCommentByCustomer(Customer customer)
			throws Exception {
		return commentDAO.findCommentByCustomer(customer);
	}
	@Override
	public List<Comment> findComment(Hotel hotel, Customer customer)
			throws Exception {
		commentDAO.findComment("from Comment c where c.hotel.id=?and c.customer.id=?", hotel, customer);
		return null;
	}

}

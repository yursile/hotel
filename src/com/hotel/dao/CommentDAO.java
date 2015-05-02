package com.hotel.dao;

import java.util.List;

import com.hotel.entity.Comment;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;

public interface CommentDAO {
	public List<Comment> findCommentByHotel(Hotel hotel) throws Exception;
	public List<Comment> findCommentByCustomer(Customer customer) throws Exception;
	public List<Comment> findComment(String hql,Hotel hotel,Customer customer) throws Exception;
	public void saveComment(Comment comment) throws Exception;
}

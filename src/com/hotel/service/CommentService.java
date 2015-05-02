package com.hotel.service;

import java.util.List;

import com.hotel.entity.Comment;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.exception.ServException;

public interface CommentService {
	public String addComment(Customer customer,Hotel hotel,String content,int level,int type)throws ServException;
	public List<Comment> findCommentByHotel(Hotel hotel) throws Exception;
	public List<Comment> findCommentByCustomer(Customer customer) throws Exception;
	public List<Comment> findComment(Hotel hotel,Customer customer) throws Exception;
}

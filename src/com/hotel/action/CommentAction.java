package com.hotel.action;

import java.util.List;

import com.hotel.entity.Comment;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.service.CommentService;

public class CommentAction extends BaseAction{
	private static final long serialVersionUID = 1L;

	private String content;
	private int level;
	private int type;
	private CommentService commentService;
	private String result;
	private List<Comment> comments;
	
	public String addComment(){
		Customer customer = (Customer) session.get("loginCustomer");
		Hotel hotel = (Hotel) session.get("currentHotel");
		try {
			result = commentService.addComment(customer, hotel, content, level, type);
			comments = commentService.findCommentByHotel(hotel);
		} catch (Exception e) {
			e.printStackTrace();
			setResult("系统错误");
		}
		return "addComment";
	}

	public int getLevel() {
		return level;
	}

	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public CommentService getCommentService() {
		return commentService;
	}


	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public void setLevel(int level) {
		this.level = level;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
}

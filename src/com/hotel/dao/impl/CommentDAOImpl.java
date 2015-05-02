package com.hotel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hotel.dao.CommentDAO;
import com.hotel.entity.Comment;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.entity.Order;

public class CommentDAOImpl extends HibernateDaoSupport implements CommentDAO{

	@Override
	public List<Comment> findCommentByHotel(Hotel hotel) throws Exception {
		List<Comment> comments = this.getHibernateTemplate().find("from Comment c where c.hotel.id=? order by c.id desc",hotel.getId());
		return comments;
	}

	@Override
	public List<Comment> findCommentByCustomer(Customer customer)
			throws Exception {
		List<Comment> comments = this.getHibernateTemplate().find("from Comment c where c.hotel.id=?",customer.getId());
		return comments;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> findComment(final String hql,final Hotel hotel, final Customer customer)
			throws Exception {
		return (List<Comment>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setLong(0, hotel.getId());
				query.setLong(1, customer.getId());
				System.out.println("dao excute");
				List<Comment> list = query.list();
				return list;
			}
		});	
	}

	@Override
	public void saveComment(Comment comment) throws Exception {
		this.getHibernateTemplate().save(comment);
	}

}

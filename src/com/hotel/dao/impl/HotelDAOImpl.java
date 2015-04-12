package com.hotel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hotel.dao.HotelDAO;
import com.hotel.entity.Hotel;

public class HotelDAOImpl extends HibernateDaoSupport implements HotelDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> findHotels(final String hql, final String city, final String district,
			final int arriveDate, final int departureDate) throws Exception{
		return (List<Hotel>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = 
					session.createQuery(hql);
				query.setString(2, city);
				query.setString(3, district);
				query.setInteger(0, arriveDate);
				query.setInteger(1, departureDate);
				List<Hotel> list = query.list();
				return list;
			}
		});
	}

}

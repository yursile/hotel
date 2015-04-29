package com.hotel.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
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
				List<Hotel> list =  ((SQLQuery) session.createSQLQuery(hql).setParameter(0, city).setParameter(1, district).setParameter(2, arriveDate).setParameter(3, departureDate)).addEntity(Hotel.class).list();
				return list;
			}
		});
	}

	@Override
	public Hotel findHotelById(long id) {
		Hotel hotel = (Hotel) this.getHibernateTemplate().find("from Hotel h where h.id=?", id).get(0);
		return hotel;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> findHotels(final String hql,final String city) {
		return (List<Hotel>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				List<Hotel> list = ((SQLQuery) session.createSQLQuery(hql).setParameter(0, city)).addEntity(Hotel.class).list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> findHotels(final String hql,final String city, final String district) {
		return (List<Hotel>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				List<Hotel> list =  ((SQLQuery) session.createSQLQuery(hql).setParameter(0, city).setParameter(1, district)).addEntity(Hotel.class).list();
				return list;
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Hotel> findHotels(final String hql,final String city, final int arriveDate,
			final int departureDate) {
		return (List<Hotel>)this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				List<Hotel> list =  ((SQLQuery) session.createSQLQuery(hql).setParameter(0, city).setParameter(1, arriveDate).setParameter(2, departureDate)).addEntity(Hotel.class).list();
				return list;
			}
		});
	}

}

package com.hotel.dao;

import java.util.List;

import com.hotel.entity.Hotel;

public interface HotelDAO {
	public List<Hotel> findHotels(String hql,String city, String district,int arriveDate, int departureDate) throws Exception;
}

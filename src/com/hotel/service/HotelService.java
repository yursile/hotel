package com.hotel.service;

import java.util.List;

import com.hotel.entity.Hotel;

public interface HotelService {
	public List<Hotel> findHotels(String city,String district,String arriveDate,String departureDate);
	public List<Hotel> findHotels(String city);
	public List<Hotel> findHotels(String city,String district);
	public List<Hotel> findHotels(String city,String arriveDate,String departureDate);
	public Hotel findHotelById(long id);
}

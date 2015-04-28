package com.hotel.service.impl;

import java.util.List;

import com.hotel.dao.HotelDAO;
import com.hotel.entity.Hotel;
import com.hotel.service.HotelService;

public class HotelServiceImpl implements HotelService{
	private HotelDAO hotelDAO;
	
	
	public int formatTime(String str ){
		String s1 ="";
		String[] ss = str.split("/");
		for(int i=0;i<ss.length;i++){
			if(ss[i].length()==1){
				ss[i] = "0"+ss[i];
			}
		s1 += ss[i];
		}
		int n = Integer.parseInt(s1);
		return n;
	}
	
	@Override
	public List<Hotel> findHotels(String city, String district,
			String arriveDate, String departureDate) {
		String SQL = "select * from tb_hotel where city=? and district=? and id in (select hotel_id from tb_room where id in (select t.room_id from (select * from tb_roomremain where day >=? and day<=?) t group by t.room_id having MIN(t.remain) > 0 ))";
		try {
			List<Hotel> hotels = hotelDAO.findHotels(SQL,city,district,formatTime(arriveDate),formatTime(departureDate));
			return hotels;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public HotelDAO getHotelDAO() {
		return hotelDAO;
	}

	public void setHotelDAO(HotelDAO hotelDAO) {
		this.hotelDAO = hotelDAO;
	}

	@Override
	public Hotel findHotelById(long id) {
		return hotelDAO.findHotelById(id);
	}

	@Override
	public List<Hotel> findHotels(String city) {
		String SQL = "select * from tb_hotel where city=?";
		try {
			List<Hotel> hotels = hotelDAO.findHotels(SQL,city);
			return hotels;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Hotel> findHotels(String city, String district) {
		String SQL = "select * from tb_hotel where city=? and district=?";
		try {
			List<Hotel> hotels = hotelDAO.findHotels(SQL,city,district);
			return hotels;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Hotel> findHotels(String city, String arriveDate,
			String departureDate) {
		String SQL = "select * from tb_hotel where city=? and id in (select hotel_id from tb_room where id in (select t.room_id from (select * from tb_roomremain where day >=? and day<=?) t group by t.room_id having MIN(t.remain) > 0 ))";
		try {
			List<Hotel> hotels = hotelDAO.findHotels(SQL,city,formatTime(arriveDate),formatTime(departureDate));
			return hotels;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

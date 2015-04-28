package com.hotel.action;

import java.util.List;

import com.hotel.entity.Hotel;
import com.hotel.service.HotelService;

public class DispatchAction extends BaseAction{
	private HotelService hotelService;
	private List<Hotel> hotels;
	
	public String toOrder(){
		hotels = hotelService.findHotels("重庆");
		return "toOrder";
	}

	public HotelService getHotelService() {
		return hotelService;
	}

	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}

	public List<Hotel> getHotels() {
		return hotels;
	}

	public void setHotels(List<Hotel> hotels) {
		this.hotels = hotels;
	}
}

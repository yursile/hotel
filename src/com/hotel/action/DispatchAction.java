package com.hotel.action;

import java.util.List;

import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.service.HotelService;

public class DispatchAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HotelService hotelService;
	private List<Hotel> hotels;
	private Customer customer;
	
	public String toOrder(){
		hotels = hotelService.findHotels("重庆");
		return "toOrder";
	}
	
	public String toInfo(){
		customer = (Customer) session.get("loginCustomer");
		return "toInfo";
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}

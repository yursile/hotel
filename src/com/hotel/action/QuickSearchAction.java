package com.hotel.action;

import java.util.List;

import com.hotel.entity.Hotel;
import com.hotel.service.HotelService;

public class QuickSearchAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String city;
	private String district;
	private String arriveDate;
	private String departureDate;
	private HotelService hotelService;
	private List<Hotel> hotels;
	
	
	public String execute(){
	
		setHotels(hotelService.findHotels(city, district, arriveDate, departureDate));
		return "success";
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getDistrict() {
		return district;
	}


	public void setDistrict(String district) {
		this.district = district;
	}





	public String getArriveDate() {
		return arriveDate;
	}


	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}


	public String getDepartureDate() {
		return departureDate;
	}


	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
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

package com.hotel.action;

import com.hotel.entity.Hotel;
import com.hotel.service.HotelService;

/**
 * 
 * @author 宇
 *	酒店的查询
 */
public class HotelAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long hotelId;
	private HotelService hotelService;
	private Hotel hotel;
	private String roomType;
	

	public String hotelInfo(){
		hotel = hotelService.findHotelById(hotelId);
		return "hotelInfo";
	}
	
	public long getHotelId() {
		return hotelId;
	}

	public void setHotelId(long hotelId) {
		this.hotelId = hotelId;
	}
	
	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public HotelService getHotelService() {
		return hotelService;
	}

	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}


	public Hotel getHotel() {
		return hotel;
	}


	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}

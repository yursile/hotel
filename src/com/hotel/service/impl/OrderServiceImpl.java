package com.hotel.service.impl;

import java.util.List;

import com.hotel.dao.OrderDAO;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.entity.Order;
import com.hotel.entity.Room;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;
import com.hotel.service.RoomService;
import com.hotel.util.HotelUtil;

public class OrderServiceImpl implements OrderService{
	private OrderDAO orderDAO;
	private RoomService roomService;
	private HotelService hotelService;
	
	@Override
	public List<Order> findOrderByCustomerId(long customerId) {
		return orderDAO.findOrderByCustomerId(customerId);
	}

	

	public HotelService getHotelService() {
		return hotelService;
	}



	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}



	@Override
	public void saveOrder(Order order,String day) {
		
		
		orderDAO.saveOrder(order);
	}
	
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}



	@Override
	public void saveOrder(Customer customer,long roomId, long hotelId, int num, String days) {
		List<int []> dayList = HotelUtil.formatDay(days);
		Room room = roomService.findRoomById(roomId);
		Hotel hotel = hotelService.findHotelById(hotelId);
		int generateTime = HotelUtil.getNowDay();
		for(int [] group:dayList){
			int arriveDate = group[0];
			int departureDate = group[group.length-1];
			Order order = new Order();
			order.setRoom(room);
			//order.setHotel(hotel);
			order.setNum(num);
			order.setArriveDate(arriveDate);
			order.setDepartureDate(departureDate);
			order.setPrice(room.getPrice()*(departureDate-arriveDate+1));
			order.setGenerateTime(generateTime);
			order.setStatus(1);
			order.setCustomer(customer);
			orderDAO.saveOrder(order);
			
		}
	}


	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
}

package com.hotel.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.hotel.dao.OrderDAO;
import com.hotel.entity.Customer;
import com.hotel.entity.Hotel;
import com.hotel.entity.Order;
import com.hotel.entity.Room;
import com.hotel.entity.RoomRemain;
import com.hotel.service.HotelService;
import com.hotel.service.OrderService;
import com.hotel.service.RoomRemainService;
import com.hotel.service.RoomService;
import com.hotel.util.HotelUtil;

public class OrderServiceImpl implements OrderService{
	private OrderDAO orderDAO;
	private RoomService roomService;
	private HotelService hotelService;
	private RoomRemainService roomRemainService;
	
	public RoomRemainService getRoomRemainService() {
		return roomRemainService;
	}

	public void setRoomRemainService(RoomRemainService roomRemainService) {
		this.roomRemainService = roomRemainService;
	}


	@Override
	public List<Order> findOrderByCustomerId(long customerId) {
		try {
			return orderDAO.findOrderByCustomerId(customerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	

	public HotelService getHotelService() {
		return hotelService;
	}



	public void setHotelService(HotelService hotelService) {
		this.hotelService = hotelService;
	}



	@Override
	public void saveOrder(Order order,String day) {
		try {
			orderDAO.saveOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
//		RoomRemain rr = roomRemainService.findRoomRemain(day, room);
		Hotel hotel = hotelService.findHotelById(hotelId);
		int generateTime = HotelUtil.getNowDay();
		for(int [] group:dayList){
			int arriveDate = group[0];
			int departureDate = group[group.length-1];
			Order order = new Order();
			
			for(int i=arriveDate;i<=departureDate;i++){
				RoomRemain rr = roomRemainService.findRoomRemain(i, room);
				rr.setRemain(rr.getRemain()-1);
			}
			order.setRoom(room);
			
			//order.setHotel(hotel);
			order.setNum(num);
			order.setArriveDate(arriveDate);
			order.setDepartureDate(departureDate);
			order.setPrice(room.getPrice()*(departureDate-arriveDate+1));
			order.setGenerateTime(generateTime);
			order.setStatus(1);
			order.setCustomer(customer);
			try {
				orderDAO.saveOrder(order);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	public RoomService getRoomService() {
		return roomService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}



	@Override
	public List<Order> findOrder(long customerId, int startTime, int endTime,
			int orderStatus) {
		List<Order> orders;
		try {
			if(startTime==0&&endTime==0&&orderStatus==0){
				orders = orderDAO.findOrderByCustomerId(customerId);
			}else if(startTime==0&&endTime==0&&orderStatus!=0){
				orders = orderDAO.findOrderByStauts("from Order o where o.customer.id=? and o.status =?", customerId, orderStatus);
			}else if(startTime==0&&endTime!=0&&orderStatus!=0){
				orders = orderDAO.findOrder("from Order o where o.customer.id=? and o.departrueDate<=? and o.status=?", customerId, endTime, orderStatus);
			}else if(startTime==0&&endTime!=0&&orderStatus==0){
				orders = orderDAO.findOrderByTime("from Order o where o.customer.id=? and o.departrueDate<=?", customerId, endTime);
			}else if(startTime!=0&&endTime==0&&orderStatus==0){
				orders = orderDAO.findOrderByTime("from Order o where o.customer.id=? and o.arriveDate>=?", customerId, startTime);
			}else if(startTime!=0&&endTime==0&&orderStatus!=0){
				orders = orderDAO.findOrder("from Order o where o.customer.id=? and o.arriveDate=? and o.stauts=?", customerId, startTime,orderStatus);
			}else if(startTime!=0&&endTime!=0&&orderStatus==0){
				orders = orderDAO.findOrderByTimes("from Order o where o.customer.id=? and o.arriveDate>=? and o.departrueDate<=?", customerId, startTime, endTime);
			}else{
				orders = orderDAO.findOrder("from Order o where o.customer.id=? and o.arriveDate>=? and o.departrueDate<=? and o.status = ?", customerId, startTime, endTime, orderStatus);
			}
			return orders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	@Override
	public List<Order> findOrderByOrderId(long customerId,long orderId) {
		List<Order> orders = new ArrayList<Order>();
		try {
			Order order = orderDAO.findOrderByOrderId("from Order o where o.customer.id=? and o.id =?", customerId, orderId);
			orders.add(order);
			return orders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

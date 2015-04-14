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
		String hql = "from Hotel h inner join Room r on h=r.hotel inner join " +
				"RoomRemain rr on rr.room = r where rr.day>=? and rr.day<=? " +
				"and h.city=? " +"and h.district=? and rr.remain>0";
		
		String hq = "from Hotel h where h.rooms.roomRemains.day>=? and h.rooms.roomRemains.day<=?"+
					"and h.city=? and h.district=? and h.rooms.roomRemains.remain>0";
		
		
		String hql2 = "from Hotel as h join h.rooms as room join room.roomRemains as rr "+
						"where h.city=? and h.district=? and rr.day>=? and rr.day<=? and rr.remain>0";
		
		
		String hql3 = "from Hotel as h join h.rooms as room join room.roomRemains as rr "+
				"where h.city=? and h.district=? and room = some (select rr.room from rr where rr.day>=? and rr.day>=? and rr.remain>0)";
		try {
			List<Hotel> hotels = hotelDAO.findHotels(hql3,city,district,formatTime(arriveDate),formatTime(departureDate));
			return hotels;
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
}

package com.hotel.service.impl;

import com.hotel.dao.CommonDAO;
import com.hotel.entity.Room;
import com.hotel.service.RoomService;

public class RoomServiceImpl implements RoomService{
	private CommonDAO<Room> commonDAO;
	
	public Room findRoomById(long roomId){
		try {
			return commonDAO.findById("from Room r where r.id=?", roomId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public CommonDAO<Room> getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO<Room> commonDAO) {
		this.commonDAO = commonDAO;
	}
}

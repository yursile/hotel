package com.hotel.dao;

import com.hotel.entity.RoomRemain;

public interface RoomRemainDAO {
	public RoomRemain findRoom(String hql,int day,long roomId);
}

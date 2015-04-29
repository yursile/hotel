package com.hotel.service;

import com.hotel.entity.Room;
import com.hotel.entity.RoomRemain;

public interface RoomRemainService {
	public RoomRemain findRoomRemain(int day,Room room);
}

package com.hotel.service.impl;

import java.util.Set;

import com.hotel.entity.Room;
import com.hotel.entity.RoomRemain;
import com.hotel.service.RoomRemainService;

public class RoomRemainServiceImpl implements RoomRemainService{

	@Override
	public RoomRemain findRoomRemain(int day, Room room) {
		Set<RoomRemain> roomRemains  = room.getRoomRemains();
		for(RoomRemain roomRemain:roomRemains){
			if(roomRemain.getDay()==day){
				return roomRemain;
			}
		}
		return null;
	}
	
}

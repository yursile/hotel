package com.hotel.entity;

import java.util.Set;

public class Room {
	private long id;
	private String type;
	private double price;
	private int num;
	private Pic picture;
	private Set<RoomRemain> roomRemains;
	private Hotel hotel;
	
	public Pic getPicture() {
		return picture;
	}
	public void setPicture(Pic picture) {
		this.picture = picture;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Set<RoomRemain> getRoomRemains() {
		return roomRemains;
	}
	public void setRoomRemains(Set<RoomRemain> roomRemains) {
		this.roomRemains = roomRemains;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
}

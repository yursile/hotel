package com.hotel.entity;

import java.util.Set;

public class Hotel {
	private long id;
	private String name;
	private String address;
	private Set<Room> rooms;
	private String phone;
	private String[] charactors;
	private Set<Pic> pics;
	private String href;
	private String city;
	private String district;
	
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
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String[] getCharactors() {
		return charactors;
	}
	public void setCharactors(String[] charactors) {
		this.charactors = charactors;
	}
	public String getHref() {
		return href;
	}
	public Set<Room> getRooms() {
		return rooms;
	}
	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}
	public Set<Pic> getPics() {
		return pics;
	}
	public void setPics(Set<Pic> pics) {
		this.pics = pics;
	}
	public void setHref(String href) {
		this.href = href;
	}
	
}

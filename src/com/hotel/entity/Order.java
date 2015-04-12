package com.hotel.entity;

public class Order {
	private long id;
	private Hotel hotel;
	private Customer customer;
	private int arriveDate;
	private int departureDate;
	private int generateTime;
	private double price;
	private int status;//1 预订  2取消  3预订未到  4在住  5离店
	private int num;//预订该房间类型数量 
	private Room room;//预订房间类型
	
	public long getId() {
		return id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public int getArriveDate() {
		return arriveDate;
	}
	public void setArriveDate(int arriveDate) {
		this.arriveDate = arriveDate;
	}
	public int getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(int departureDate) {
		this.departureDate = departureDate;
	}
	public int getGenerateTime() {
		return generateTime;
	}
	public void setGenerateTime(int generateTime) {
		this.generateTime = generateTime;
	}
}

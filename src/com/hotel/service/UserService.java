package com.hotel.service;

import com.hotel.entity.Customer;
import com.hotel.exception.ServException;

public interface UserService {
	public Customer login(Customer customer) throws ServException;
	public void exit(Customer customer) throws ServException;
	public void updateInf(Customer customer) throws ServException;
	public void ajaxLog(Customer customer) throws ServException;
	public void regist(Customer customer) throws ServException;
}

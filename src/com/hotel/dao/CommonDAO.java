package com.hotel.dao;

import java.util.List;

public interface CommonDAO<E> {
	public List<E> findDataByPage(String hql,
			Integer pageNum,Integer numPerPage)throws Exception;
	public void add(Object o)throws Exception;
	public void delete(Object o)throws Exception;
	public void update(Object o)throws Exception;
	public E findDataByString(String hql, String str) throws Exception;
	public E findById(String hql,long id) throws Exception;
}

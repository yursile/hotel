package com.hotel.service.impl;

import com.hotel.dao.CommonDAO;
import com.hotel.entity.Pic;
import com.hotel.service.PicService;

public class PicServiceImpl implements PicService {
	private CommonDAO<Pic> commonDAO;

	@Override
	public void savePic(Pic pic) {
		try {
			commonDAO.update(pic);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public CommonDAO<Pic> getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO<Pic> commonDAO) {
		this.commonDAO = commonDAO;
	}
}

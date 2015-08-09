package com.hotel.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

import com.hotel.entity.Customer;
import com.hotel.entity.Pic;
import com.hotel.exception.ServException;
import com.hotel.service.PicService;
import com.hotel.service.UserService;

public class PicAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private File photo;
	private String uploadFileContentType;
	private String fileName;
	private String result;
	private Pic picture;
	private PicService picService;
	private UserService userService;
	private Customer customer;
	private String picPath;
	
	public String getPicPath() {
		return picPath;
	}


	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}


	public String getUploadFileContentType() {
		return uploadFileContentType;
	}


	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}




	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}

	public String toUploadPhoto(){
		try {
			InputStream is = new FileInputStream(photo);
			String realpath = ServletActionContext.getServletContext().getRealPath(
	                "/images");
			
		  OutputStream os = new FileOutputStream(realpath+"/"+fileName);
	       byte[] buffer = new byte[400];
           int length = 0;
            while ((length = is.read(buffer)) > 0) {
                 os.write(buffer, 0, length);
             }
            is.close();
            os.close(); 
            setResult("images/"+fileName);
//            customer = (Customer) session.get("loginCustomer");
//            customer.getPicture().setPath("images/"+fileName);
//            picture.setPath(realpath+"/"+fileName);
//            picService.savePic(picture);
//            userService.updateInf(customer);
		} catch (Exception e) {
			e.printStackTrace();
			setResult("上传失败");
		}
		
	  return "toUploadPhoto";
	}
	
	public String changePhoto(){
		 customer = (Customer) session.get("loginCustomer");
         customer.getPicture().setPath(picPath);
         try {
			userService.updateInf(customer);
			setResult("保存成功");
		} catch (ServException e) {
			e.printStackTrace();
			setResult("保存失败");
		}
		return "changePhoto";
	}
	

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public Pic getPicture() {
		return picture;
	}


	public void setPicture(Pic picture) {
		this.picture = picture;
	}


	public PicService getPicService() {
		return picService;
	}


	public void setPicService(PicService picService) {
		this.picService = picService;
	}


	public Customer getCustomer() {
		return customer;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}


	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}

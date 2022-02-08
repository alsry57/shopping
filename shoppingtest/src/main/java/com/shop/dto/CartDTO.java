package com.shop.dto;

import java.util.Date;

public class CartDTO {

	private int cartNum;
	private String id;
	private String productnum;
	private int cartStock;
	private Date addDate;
	
	@Override
	public String toString() {
		return "CartDTO [cartNum=" + cartNum + ", id=" + id + ", productnum=" + productnum + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductnum() {
		return productnum;
	}

	public void setProductnum(String productnum) {
		this.productnum = productnum;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	
	
	



	
	
}

package com.shop.dao;

import java.util.ArrayList;

import com.shop.dto.OrderDTO;

public interface OrderDAO {
	public ArrayList<OrderDTO> orderList(String id)throws Exception;
	public void remove(String num)throws Exception;
	public ArrayList<OrderDTO> cashOrderList(String num)throws Exception;
}

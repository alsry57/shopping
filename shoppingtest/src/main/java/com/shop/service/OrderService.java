package com.shop.service;

import java.util.ArrayList;

import com.shop.dto.OrderDTO;

public interface OrderService {
	public ArrayList<OrderDTO> orderList(String id)throws Exception;
	public void remove(String num)throws Exception;
	public ArrayList<OrderDTO> cashOrderList(String num)throws Exception;
}

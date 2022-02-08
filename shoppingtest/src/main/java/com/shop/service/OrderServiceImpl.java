package com.shop.service;

import java.util.ArrayList;
import com.shop.dto.OrderDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.dao.OrderDAO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<OrderDTO> orderList(String id) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		return dao.orderList(id);
	}


	@Override
	public void remove(String num) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		dao.remove(num);
	}


	@Override
	public ArrayList<OrderDTO> cashOrderList(String num) throws Exception {
		// TODO Auto-generated method stub
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		return dao.cashOrderList(num);
	}


}

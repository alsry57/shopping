package com.shop.dao;

import java.util.List;

import com.shop.dto.UserGesipanDTO;
import com.shop.vo.PageMaker;

public interface UserGesipanDAO {
	  public void create(UserGesipanDTO vo) throws Exception;
	  public UserGesipanDTO read(int bno) throws Exception;
	  
	  public List<UserGesipanDTO> myread(String id) throws Exception;

	  public void update(UserGesipanDTO vo) throws Exception;

	  public void delete(int bno) throws Exception;

	//  
	  public List<UserGesipanDTO> UserGesipanlistSearch(PageMaker pm)throws Exception;
	//  
	  public int UserGesipanlistSearchCount(PageMaker pm)throws Exception;

}

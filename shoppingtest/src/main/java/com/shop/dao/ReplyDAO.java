package com.shop.dao;

import java.util.List;

import com.shop.dto.ReplyDTO;

public interface ReplyDAO {
	  public List<ReplyDTO> readReply(int bno) throws Exception;
}

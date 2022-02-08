package com.shop.service;

import java.util.List;

import com.shop.dto.ReplyDTO;

public interface ReplyService {
	  public List<ReplyDTO> readReply(int bno) throws Exception;
}

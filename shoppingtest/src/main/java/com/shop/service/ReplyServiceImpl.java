package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.shop.dao.ReplyDAO;
import com.shop.dto.ReplyDTO;

public class ReplyServiceImpl implements ReplyService {

	@Inject
	private SqlSession sqlSession;
	private ReplyDAO dao;
	
	@Override
	public List<ReplyDTO> readReply(int bno) throws Exception {
		ReplyDAO dao=sqlSession.getMapper(ReplyDAO.class);
		return dao.readReply(bno);
	}

}

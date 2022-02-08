package com.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.ProductDAO;
import com.shop.dto.CartDTO;
import com.shop.dto.CartListDTO;
import com.shop.dto.ProductDTO;
import com.shop.vo.PageMaker;


@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private SqlSession sqlSession;
	private ProductDAO dao;
	
	@Override
	public void regist(ProductDTO board) throws Exception {

	}

	@Override
	public ProductDTO read(Integer bno) throws Exception {
		return null;
	}

	@Override
	public void modify(ProductDTO board) throws Exception {

	}

	@Override
	public void remove(Integer bno) throws Exception {

	}

	@Override
	public List<ProductDTO> listAll() throws Exception {
		  ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		  List<ProductDTO> dtos=dao.listAll();
		  System.out.println(dtos);
	    return dtos;
		
	}

	@Override
	public List<ProductDTO> ProductBestSales(PageMaker pm) throws Exception {
		  ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		  List<ProductDTO> dtos=dao.ProductBestSales(pm);
		  System.out.println(dtos);
	    return dtos;
	}

	
	@Override
	public List<ProductDTO> listSearchCriteria(PageMaker pm) throws Exception {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		return dao.listSearch(pm);
	}

	@Override
	public int listSearchCount(PageMaker pm) throws Exception {
		ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
		return dao.listSearchCount(pm);
	}
	
	@Override
	   public ProductDTO view(String productnum) throws Exception {
	      ProductDAO dao=sqlSession.getMapper(ProductDAO.class);
	      return dao.view(productnum);
	   }

	@Override
	public void addCart(CartDTO cart) throws Exception {
		dao.addCart(cart);
		
	}

	@Override
	public List<CartListDTO> cartList(String id) throws Exception {
		return dao.cartList(id);
	}



	

}
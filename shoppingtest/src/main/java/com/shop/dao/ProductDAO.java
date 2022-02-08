package com.shop.dao;

import java.util.List;

import com.shop.dto.ProductDTO;
import com.shop.dto.CartDTO;
import com.shop.dto.CartListDTO;
import com.shop.vo.PageMaker;

public interface ProductDAO {
	public void create(ProductDTO vo) throws Exception;

	  public ProductDTO read(Integer bno) throws Exception;

	  public void update(ProductDTO vo) throws Exception;

	  public void delete(Integer bno) throws Exception;

	  public List<ProductDTO> listAll() throws Exception;
	  
	  public List<ProductDTO> ProductBestSales(PageMaker pm) throws Exception;
	  
	  public List<ProductDTO> listSearch(PageMaker pm)throws Exception;
		  
	  public int listSearchCount(PageMaker pm)throws Exception;
	  
	  public ProductDTO view(String productnum) throws Exception;
	  
	  public void addCart(CartDTO cart) throws Exception;
	  
	  public List<CartListDTO> cartList(String id)throws Exception;
	  
}


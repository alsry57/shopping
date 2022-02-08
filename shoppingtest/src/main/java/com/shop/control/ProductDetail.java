package com.shop.control;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.dto.CartDTO;
import com.shop.dto.CartListDTO;
import com.shop.dto.MemberDTO;
import com.shop.dto.ProductDTO;
import com.shop.service.ProductService;


@Controller
public class ProductDetail {
	
		
	@Inject
	private ProductService service;

	
	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public void getView(@RequestParam("productnum") String productnum, Model model) throws Exception {
		
		ProductDTO dto=service.view(productnum);
		
		model.addAttribute("view",dto);
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public int addCart(CartDTO cart, HttpSession session) throws Exception {
	 
	 int result = 0;
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 
	 if(member != null) {
	  cart.setId(member.getId());
	  service.addCart(cart);
	  result = 1;
	 }
	 
	 return result;
	}
	
	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 String id = member.getId();
	 
	 List<CartListDTO> cartList = service.cartList(id);
	 
	 model.addAttribute("cartList", cartList);
	 
	}
	
}

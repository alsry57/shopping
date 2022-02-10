package com.shop.control;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.CartListDTO;
import com.shop.dto.MemberDTO;
import com.shop.dto.ProductDTO;
import com.shop.service.MemberService;
import com.shop.service.ProductService;


@Controller
public class ProductDetailController {
	
		
	@Inject
	private ProductService service;
	@Inject
	private MemberService memberService;
	
	HttpServletRequest request;
	String id;
	private CartListDTO cart;

	
	@RequestMapping(value = "/productdetail", method = RequestMethod.GET)
	public void getView(@RequestParam("productnum") String productnum, Model model) throws Exception {
		
		ProductDTO dto=service.view(productnum);
		
		model.addAttribute("view",dto);
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartListDTO cart,Model model,HttpServletRequest request) throws Exception {
		int result = 0;
		
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");
			
		if(id != null) {
			cart.setId(id);;
			service.addCart(cart);
			result = 1;
		}
		return result;
	}
	
	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(CartListDTO cart,Model model,HttpServletRequest request) throws Exception {
	 
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");	
		
		List<CartListDTO> cartList = service.cartList(id);
	 
		model.addAttribute("cartList", cartList);
	 
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(@RequestParam(value = "chbox[]") List<String> chArr,CartListDTO cart,Model model,HttpServletRequest request) throws Exception {
		int result = 0;
		int cartNum = 0;
		
		HttpSession session = request.getSession();
		id=(String)session.getAttribute("id");	
	 

	 if(id != null) {
	  cart.setId(id);
	  
	  for(String i : chArr) {   
		   cartNum = Integer.parseInt(i);
		   cart.setCartNum(cartNum);
		   service.deleteCart(cart);
		  }   
	     
	  result = 1;
	 }  
	 return result;  
	}
	
}

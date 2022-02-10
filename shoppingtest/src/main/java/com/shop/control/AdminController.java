package com.shop.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.ProductDTO;
import com.shop.dto.UserGesipanDTO;
import com.shop.service.AdminService;
import com.shop.service.MemberService;
import com.shop.vo.PageMaker;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;
	@Inject
	private MemberService ms;

	@RequestMapping(value = "/admin/adminProduct", method = RequestMethod.GET)
	public void listAll(PageMaker pm, Model model) throws Exception {

		pm.setProductkind("");
		model.addAttribute("ProductListAll", service.ProductListAll(pm));

		logger.info("listPage");
		System.out.println(pm);
		System.out.println("model checkfront"+model);
		
		model.addAttribute("ProductListAll", service.listSearchCriteria(pm));
		pm.setTotalCount(service.listSearchCount(pm));
		System.out.println("테스트1"+model);

		System.out.println("model checkback"+model);

	}

	@RequestMapping(value = "/admin/adminProduct", method = RequestMethod.POST)
	public String writePost(ProductDTO dto, RedirectAttributes rttr) throws Exception {
		service.write(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/adminProduct";
	}
	
	@RequestMapping(value = "/admin/adminMemberList", method = RequestMethod.GET)
	public void listAll2(PageMaker pm, Model model) throws Exception {


		pm.setProductkind("");
		model.addAttribute("MemberList", service.MemberList(pm));

		logger.info("listPage");
		System.out.println(pm);
		System.out.println("model checkfront"+model);
		model.addAttribute("MemberList", service.listSearchMemberCriteria(pm));
		System.out.println("model checkback1"+model);
		pm.setTotalCount(service.listSearchMemberCount(pm));
		System.out.println("model checkback2"+model);

	}
	
	@RequestMapping(value = "/admin/adminOrder", method = RequestMethod.GET)
	public void listAll3(PageMaker pm, Model model) throws Exception {

		pm.setProductkind("");
		model.addAttribute("ProductListAll", service.ProductListAll(pm));

		logger.info("listPage");
		System.out.println(pm);
		model.addAttribute("ProductListAll", service.listSearchCriteria(pm));
		pm.setTotalCount(service.listSearchCount(pm));

	}

	@RequestMapping(value = "/admin/adminProductRemove", method = RequestMethod.GET)
	public String remove(@RequestParam("productnum") String productnum, RedirectAttributes rttr) throws Exception {
		System.out.println(productnum);

		service.remove(productnum);
		logger.info("삭제실행"+productnum);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/adminProduct";
	}
	
	
//	@RequestMapping(value = "/admin/adminProductModify", method = RequestMethod.GET)
//	public void modifyGet(@RequestParam("productnum") String productnum,Model model) throws Exception {
//		
//		model.addAttribute("read",service.read(productnum));
//		service.read(productnum);
//		System.out.println(model);
//	}
	
	@RequestMapping(value = "/admin/adminProductModify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam("productnum") String productnum,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
		model.addAttribute(service.read(productnum));
		System.out.println("모델확인"+model);
	}


	@RequestMapping(value = "/admin/adminProductModify", method = RequestMethod.POST)
	public String modifyPost(ProductDTO board,PageMaker pm,Model model,RedirectAttributes rttr) throws Exception {
		service.modify(board);
		System.out.println("수정실행 "+board);
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("searchType", pm.getSearchType());
		rttr.addAttribute("keyword", pm.getKeyword());

		rttr.addFlashAttribute("msg","success");
		return "redirect:/admin/adminProduct";
	}
	
	@RequestMapping(value = "/admin/adminMemberRemove", method = RequestMethod.GET)
	public String removeM(@RequestParam("id") String id, RedirectAttributes rttr) throws Exception {

		System.out.println(id);
		ms.delete(id);
		System.out.println("00000");
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/adminMemberList";
	}

	

}

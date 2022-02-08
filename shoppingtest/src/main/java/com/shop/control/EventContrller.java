package com.shop.control;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.dto.EventDTO;
import com.shop.dto.ReplyDTO;
import com.shop.service.EventService;
import com.shop.service.ReplyService;
import com.shop.vo.PageMaker;

@Controller
@RequestMapping("/")
public class EventContrller {
	@Inject
	private EventService es;
	private ReplyService rs;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/eventgesipan/eventmain", method = RequestMethod.GET)
	public String list(PageMaker pm,Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		model.addAttribute("list",es.EventlistSearchCriteria(pm));
		pm.setTotalCount(es.EventlistSearchCount(pm));
		
		if(session.getAttribute("id") != null) {
			String id = (String)session.getAttribute("id");
			int authority = (int) session.getAttribute("authority");
			
			if(authority == 1) {	
				return "/eventgesipan/eventmainA";
			}else {
			}

		}

		return "/eventgesipan/eventmain";

	}
	
	
	
	@RequestMapping(value = "/eventgesipan/eventwrite", method = RequestMethod.GET)
	public void writeGet() throws Exception {
		//return "/sboard/write
	
	}
	@RequestMapping(value = "/eventgesipan/eventwrite", method = RequestMethod.POST)
	public String writePost(EventDTO event,RedirectAttributes rttr) throws Exception {
		es.write(event);
		//rttr.addAttribute("msg","success");
		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";		
	}
	
	@RequestMapping(value = "/eventgesipan/eventread", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
//		model.addAttribute(es.readimage(bno));
//		System.out.println(es.readimage(bno));
		model.addAttribute("eventDTO",es.read(bno));
		System.out.println(es.read(bno));
		System.out.println("--------------------------------------------------");
		es.viewcount(bno);
		System.out.println(bno);
//		System.out.println(es.selectBno(bno));
		
		
//		List<ReplyDTO> replyList = es.readReply(bno);
//		System.out.println(replyList);
		System.out.println(es.readReply(bno));
		model.addAttribute("replyList",es.readReply(bno));
//		model.addAttribute("replyList",replyList);
		
//		return "/eventgesipan/eventread";
		
	}
	
	@RequestMapping(value = "/eventgesipan/eventremove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,PageMaker pm,Model model,RedirectAttributes rttr) throws Exception {
		es.remove(bno);
		
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("searchType", pm.getSearchType());
		rttr.addAttribute("keyword", pm.getKeyword());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";	
	}
	
	@RequestMapping(value = "/eventgesipan/eventmodify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam("bno") int bno,PageMaker pm,Model model) throws Exception {
		System.out.println(pm);
		model.addAttribute(es.read(bno));
	}


	@RequestMapping(value = "/eventgesipan/eventmodify", method = RequestMethod.POST)
	public String modifyPost(EventDTO board,PageMaker pm,Model model,RedirectAttributes rttr) throws Exception {
		es.modify(board);
		System.out.println(pm);
		
		rttr.addAttribute("page", pm.getPage());
		rttr.addAttribute("perPageNum", pm.getPerPageNum());
		rttr.addAttribute("searchType", pm.getSearchType());
		rttr.addAttribute("keyword", pm.getKeyword());

		rttr.addFlashAttribute("msg","success");
		return "redirect:/eventgesipan/eventmain";	
	}

	
}










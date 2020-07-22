package oracle.java.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;
import oracle.java.test.service.MainService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("main")
	public String main(Model model, Paging paging) {
		System.out.println("main controller");
		
		List<Member> mainList = mainService.mainList(paging);
		int total = mainService.total(paging);
		paging.setTotal(total);
		
		model.addAttribute("mainList", mainList);
		model.addAttribute("paging", paging);
		model.addAttribute("total", total);
		
		return "main";
	}

	@RequestMapping("content")
	public String content(int no, Model model, Paging paging) {
		System.out.println("content");

		Member member = mainService.memberinfo(no);
		model.addAttribute("member", member);
		model.addAttribute("paging", paging);
		return "content";
	}

	@RequestMapping("insertForm")
	public String insertForm(Model model) {
		System.out.println("insertForm controller");

		return "insertForm";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(Member member, Model model, Paging paging, HttpSession session) throws IOException {
		System.out.println("insert controller");
		
		String savedName = member.getFile().getOriginalFilename();
		String savePath = session.getServletContext().getRealPath("/")+ "image/";
		member.getFile().transferTo(new File(savePath + savedName));
		member.setImage("/image/" + savedName);
		/*
		 * File target = new File("C://upload/", savedName);
		 * FileCopyUtils.copy(member.getFile().getBytes(), target);
		 */
		model.addAttribute("member", member);
		model.addAttribute("paging", paging);
		int result = mainService.insert(member);
		System.out.println(result);
		if (result > 0) {
			return "redirect:main";
		}
		return "redirect:insertForm";
	}

	@RequestMapping("delete")
	public String delete(int no, Paging paging, Model model) {
		System.out.println("delete controller");
		System.out.println(no);

		mainService.delete(no);
		model.addAttribute("paging", paging);
		return "redirect:main";
	}

	@RequestMapping("updateForm")
	public String updateForm(int no, Model model, Paging paging) {
		System.out.println("updateForm controller");

		Member member = mainService.memberinfo(no);
		model.addAttribute("member", member);
		model.addAttribute("paging", paging);

		return "updateForm";
	}

	
	 @RequestMapping("update") public String update (Member member, Model model, Paging paging) {
	 System.out.println("update controller");
	 
	 mainService.update(member); 
	 model.addAttribute("member", member);
	 model.addAttribute("paging", paging);
	 
	 return "forward:main";
	 
	  }
	 
}

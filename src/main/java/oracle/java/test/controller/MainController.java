package oracle.java.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.java.test.model.Member;
import oracle.java.test.service.MainService;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping("main")
	public String main (Model model) {
		System.out.println("main controller");
		List<Member> mainList = mainService.mainList();
		model.addAttribute("mainList", mainList);
		return "main";
		
	}
	
	@RequestMapping("insertForm")
	public String insertForm (Model model) {
		System.out.println("insertForm controller");
		
		return "insertForm";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert (Model model, Member member) {
		System.out.println("insert controller");
		
		model.addAttribute("member", member);
		int result = mainService.insert(member);
		System.out.println(result);
		if(result > 0 ) {
			return "redirect:main";
		}
		return "redirect:insertForm";
	}
}

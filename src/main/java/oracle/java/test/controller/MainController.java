package oracle.java.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}

package oracle.java.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String insert(Member member, Model model, Paging paging, MultipartHttpServletRequest mtfRequest) {
		System.out.println("insert controller");
		
		MultipartFile file = mtfRequest.getFile("file");
		String uploadPath = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contextType: " + file.getContentType());
		
		String savedNameThum = null;
		try {
			savedNameThum = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			System.out.println("savedNameThum -> " + savedNameThum);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		logger.info("savedNameThum: " + savedNameThum);
		
		member.setImage(savedNameThum);
		
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
	@ResponseBody
	public int delete(String arr) {
		System.out.println("delete controller");
		int result = 1;
		try {
            System.out.println(arr);
            String [] strArray = arr.split(",");
            mainService.delete(strArray);
            
        } catch (Exception e) {
            e.printStackTrace();
            result=0;
        }
        return result;
    }
	

	@RequestMapping("updateForm")
	public String updateForm(int no, Model model, Paging paging) {
		System.out.println("updateForm controller");

		Member member = mainService.memberinfo(no);
		model.addAttribute("member", member);
		model.addAttribute("paging", paging);

		return "updateForm";
	}

	
	 @RequestMapping("update") public String update (Member member, Model model, Paging paging, MultipartHttpServletRequest mtfRequest) {
		 System.out.println("update controller");
	 
		 MultipartFile file = mtfRequest.getFile("file");
		 String uploadPath = mtfRequest.getSession().getServletContext().getRealPath("/upload/");
		
		 logger.info("originalName: " + file.getOriginalFilename());
		 logger.info("size: " + file.getSize());
		 logger.info("contextType: " + file.getContentType());
		 String savedNameThum = "";
		 try {
			 if(!file.getOriginalFilename().equals("")) {
				 savedNameThum = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
				 System.out.println("savedNameThum -> " + savedNameThum);
			 }
		 } catch (Exception e1) {
		 	e1.printStackTrace();
		 }
		 logger.info("savedNameThum: " + savedNameThum);
		
		 member.setImage(savedNameThum);
		 
		 mainService.update(member); 
		 model.addAttribute("member", member);
		 model.addAttribute("paging", paging);
	 
		 return "forward:main";
	 
	  }
	 
	 private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
			UUID uid = UUID.randomUUID();
			//requestPath = requestPath + "/resources/image";
			System.out.println("uploadPath -> " + uploadPath);
			// Directory 생성
			File fileDirectory = new File(uploadPath);
			if(!fileDirectory.exists()) {
				fileDirectory.mkdirs();
				System.out.println("업로드용 폴더 생성: " + uploadPath);
			}
			String savedName = uid.toString() + "_" + originalName;
			//String path1 = "C:\\spring\\springSrc39\\.metadata\\.plugins\\org.eclipse.wst.server...";
			File target = new File(uploadPath, savedName);
			//File target = new File(requestPath, savedName);
			FileCopyUtils.copy(fileData, target);
			
			return savedName;
		}
	 
}

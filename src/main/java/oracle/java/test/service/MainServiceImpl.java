package oracle.java.test.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import oracle.java.test.dao.MainDao;
import oracle.java.test.model.Board;
import oracle.java.test.model.Member;
import oracle.java.test.model.Paging;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;

	@Override
	public List<Member> mainList(Paging paging) {
		return mainDao.mainList(paging);
	}

	@Override
	public int insert(Member member) {
		return mainDao.insert(member);
	}

	@Override
	public Member memberinfo(int no) {
		return mainDao.memberinfo(no);
	}

	@Override
	public void update(Member member) {
		mainDao.update(member);	
	}

	@Override
	public int total(Paging paging) {
		return mainDao.total(paging);
	}

	@Override
	public void delete(String[] strArray) {
		mainDao.delete(strArray);
	}

	@Override
	public int juminchk(Member member) {
		return mainDao.juminchk(member);
	}

	@Override
	public void excelFileUpload(MultipartHttpServletRequest mReq) {
        String uploadPath = "c:/upload2/";
        File dir = new File(uploadPath);
        if(!dir.isDirectory()) {
            dir.mkdirs();
        }
        Iterator<String> iter = mReq.getFileNames();
        while(iter.hasNext()){
            String uploadFileName = iter.next();
            MultipartFile mFile = mReq.getFile(uploadFileName);
            String fileName = mFile.getOriginalFilename();
            String jumin = mReq.getParameter("jumin");
            System.out.println(jumin);
            if(fileName != null&& !fileName.equals("")){
                File file = null;
                try{
                    file = new File(uploadPath + fileName);
                    mFile.transferTo(file);
                     
                    // Excel 파일 읽기!!
                    List<Board> list = null;
                    list = readExcelFile(file);
                     
                    // DB insert
                    for(int i = 0; i <list.size(); i++){
                    	list.get(i).setJumin(jumin);
                        mainDao.insertBoard(list.get(i));
                    }
                } catch(Exception e ){
                    e.printStackTrace();
                } finally{
                    if( file != null&&file.exists()){
                        file.delete();
                    }
                }
            }
        }
    }

	private List<Board> readExcelFile(File file) throws IOException, BiffException {
        
        List<Board> list = new ArrayList<>();
        Board boardDto = null;
        Workbook book = Workbook.getWorkbook(file);
         
        Sheet sheet = book.getSheet(0);
         
        int rowCount = sheet.getRows();
         
        for(int row = 1; row < rowCount; row++){
            boardDto = new Board();
             
            Cell c1 = sheet.getCell(0, row);
            Cell c2 = sheet.getCell(1, row);
            Cell c3 = sheet.getCell(2, row);
             
            String id = c1.getContents();
            String title = c2.getContents();
            String content = c3.getContents();
             
            boardDto.setTitle(title);
            boardDto.setContent(content);
            boardDto.setId(id);
             
            list.add(boardDto);
        }
        book.close();
        return list;
    }
	
	public List<Board> getList() {
		return mainDao.getBoardList();
	}   
	
}

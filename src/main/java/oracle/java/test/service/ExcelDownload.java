package oracle.java.test.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import oracle.java.test.dao.MainDao;
import oracle.java.test.model.Board;

public class ExcelDownload extends AbstractJExcelView {
 
	@Override
    protected void buildExcelDocument(
    		Map<String, Object> model,
    		WritableWorkbook workbook,
    		HttpServletRequest request,
    		HttpServletResponse response) throws Exception {
        List<Board> list = (List<Board>) model.get("list");
 
        String fileName = "excel.xls";
 
        response.setHeader("Content-Disposition", "attachement; filename=\""+ java.net.URLEncoder.encode(fileName, "UTF-8") + "\";charset=\"UTF-8\"");
 
        makeExcelFile(workbook, list);
    }
 
    private void makeExcelFile(WritableWorkbook workbook, List<Board> list)
            throws RowsExceededException, WriteException {
 
        // 시트 생성( 시트명, 인덱스 )
        WritableSheet ws = workbook.createSheet("게시물 목록", 0);
 
        setExcelTitle(ws);
        setExcelContent(ws, list);
    }
 
    private void setExcelContent(WritableSheet ws, List<Board> list)
            throws RowsExceededException, WriteException {
        for(int i = 1; i <list.size()+1; i++) {
            ws.addCell((new Label(0, i, list.get(i-1).getId()+"")));
            ws.addCell((new Label(1, i, list.get(i-1).getTitle()+"")));
            ws.addCell((new Label(2, i, list.get(i-1).getContent()+"")));
        }
    }
    
    private void setExcelTitle(WritableSheet ws) throws RowsExceededException, WriteException {
        ws.addCell((new Label(0, 0, "번호")));
        ws.addCell((new Label(1, 0, "제목")));
        ws.addCell((new Label(2, 0, "내용")));
    }



}

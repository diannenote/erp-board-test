<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<style type="text/css">
		.img_wrap {
			width: 100px;
		}
		.img_wrap img {
			max-width: 100%;
		}
	
	</style>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		var sel_files;
		
		$(document).ready(function() {
			$("#input_img").on("change", handleImgFileSelect);
		});
		
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				
				sel_file= f;
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
	</script>
</head>
<body topmargin="0" leftmargin="0">
	<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return confirm('등록하시겠습니까?')">
		<table width="640" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td width="640">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
		      <strong>사원 기본 정보 등록</strong></td>
		  </tr>
		  <tr> 
		    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
		        <tr> 
		          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td height="2" background="image/bar_bg1.gif"></td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
		                          <tr> 
		                            <td align="center"><strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 
		                              정보 |경력정보 | 근무정보</strong></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr align="center" bgcolor="F8F8F8"> 
		                      <td height="3" align="right" background="image/bar_bg1.gif"></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="6" align="center" valign="top">&nbsp;</td>
		        </tr>
		        <tr>
		          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
		                        <tr>
		                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
		                            <tr>
		                              <td height="112" bgcolor="#CCCCCC">
			                              <table width="100" border="0" cellspacing="1" cellpadding="0">
			                                  <tr>
			                                    <td height="110" bgcolor="#FFFFFF"><div class="img_wrap"><img id="img"><!-- 사진들어갈곳 --></div></td>
			                                  </tr>
			                              </table></td>
		                            </tr>
		                          </table></td>
		                          <td width="456"><table width="423" border="0" cellspacing="2" cellpadding="0">
		                            <tr>
		                              <td height="2" colspan="2"></td>
		                              </tr>
		                            <tr>
		                              <td width="107" height="26" align="right"><strong>한글이름 :</strong>&nbsp;</td>
		                              <td width="310" height="26">
		                                <input type="text" name="kor_name" required="required">
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
		                              <td height="26">
		                              <input type="text" name="eng_name"></td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
		                              <td height="26"><input type="text" name="chn_name"></td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
		                              <td height="26">
		                              <input name="jumin_nof" type="text" size="15" required="required">
								      	-
								      <input name="jumin_nob" type="text" size="15" required="required"></td>
		                            </tr>
		                          </table></td>
		                        </tr>
		                      </table></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="7" align="center" valign="top">&nbsp;</td>
		        </tr>
		        <tr> 
		          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
		              <tr> 
		                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="300" align="center"><strong>사진파일명 : &nbsp;</strong></td>
		                            <td width="268">
		                            	<!--사진업로드-->
		                            	<input name="file" type="file" id="input_img">
		                            </td>
		                            <td width="400"></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
		                            <td width="391">
		                            	<input name="birth1" type="text" size="5">년
		                                <input name="birth2" type="text" size="3">월
		                                <input name="birth3" type="text" size="3">일
		                               
		                               (<input type="radio" name="sol_flag" value="양력" checked="checked">양력
		                                <input type="radio" name="sol_flag" value="음력">음력 )
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
		                            <td width="391"> 
		                            	<input type="radio" name="sex" value="남자" checked="checked"> 남자
		                                <input type="radio" name="sex" value="여자"> 여자
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
		                            <td width="391"> 
		                            	<input type="radio" name="marry_flag" value="유" checked="checked"> 유
		                                <input type="radio" name="marry_flag" value="무"> 무
		                             </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
		                            <td width="392"><input name="work_year" type="text" size="10"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>급여 지급유형 :&nbsp;</strong></td>
		                            <td width="392"> <select name="payment_type">
		                                <option value="월급">월급</option>
		                                <option value="주급">주급</option>
		                              </select> </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
		                            <td width="392"> <select name="dept">
		                                <option value="SI">SI</option>
		                                <option value="SM">SM</option>
		                              </select> </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
		                            <td width="392"> <select name="job_type">
		                                <option value="정규직">정규직</option>
		                                <option value="계약직">계약직</option>
		                              </select> </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
		                            <td width="392">
		                              <input name="address" type="text" size="40"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="phone1" type="text" size="10">
		                              		- 
		                              	<input name="phone2" type="text" size="10">
		                              		- 
		                              	<input name="phone3" type="text" size="10"></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
		                            <td width="392"><input name="email" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
		                            <td width="392"><input name="tech_lev" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
		                            <td width="392"><input name="liquor" type="text" size="20"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                  </table></td>
		              </tr>
		            </table></td>
		        </tr>
		        <tr> 
		          <td height="3" align="center">&nbsp;</td>
		        </tr>
		        <tr>
		          <td height="3" align="center"><table width="107" border="0" cellpadding="1" cellspacing="1">
		            <tr>
		              <td width="49"><input type="image" src="image/bt_add.gif" width="49" height="18" name="submit" value="submit"></td>
		              <td width="51"><img src="image/bt_cancel.gif" width="49" height="18" onclick="history.back()"></td>
		            </tr>
		          </table>            </td>
		        </tr>
		        <tr> 
		          <td height="7" align="right">&nbsp;</td>
		        </tr>
		      </table></td>
		  </tr>
		</table>
	</form>
</body>
</html>
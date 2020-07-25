<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="upload" %>
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
				if(!f.type.match(".jpg*")) {
					alert("JPG파일만 등록 가능합니다.");
					$('#input_img').val('');
					return;
				}
				
				sel_file= f;
				
				var reader = new FileReader();
				
				reader.onload = function(e) {
					$("#preImg").remove();
					$("#img").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		
		function validate() {
			var regKor = /^[가-힣]+$/; 
			var regEng =  /^[a-zA-Z]+$/;
			var fegHanm = /^[\u4E00-\u9FD5]+$/;
			var regNum =  /^[0-9]+$/;
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var regJumin1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
			var regJumin2 = /^[1-4][0-9]{6}$/;

			var kor = document.getElementById("kor").value;
			var eng = document.getElementById("eng").value;
			var hanm = document.getElementById("hanm").value;
			var jumin1 = document.getElementById("jumin1").value;
			var jumin2 = document.getElementById("jumin2").value;
			var birth1 = document.getElementById("birth1").value;
			var birth2 = document.getElementById("birth2").value;
			var birth3 = document.getElementById("birth3").value;
			var work_year = document.getElementById("work_year").value;
			var phone1 = document.getElementById("phone1").value;
			var phone2 = document.getElementById("phone2").value;
			var phone3 = document.getElementById("phone3").value;
			var email = document.getElementById("email").value;
			
			if(confirm("수정하시겠습니까?")) {
				var korck = regKor.test(kor);
				var engck = regEng.test(eng);
				var hanmchk = fegHanm.test(hanm);
				var jumin1chk = regJumin1.test(jumin1);
				var jumin2 = regJumin2.test(jumin2);
				var birth1ck = regNum.test(birth1);
				var birth2ck = regNum.test(birth2);
				var birth3ck = regNum.test(birth3);
				var work_yearchk = regNum.test(work_year);
				var phone1chk = regNum.test(phone1);
				var phone2chk = regNum.test(phone2);
				var phone3chk = regNum.test(phone3);
				var emailchk = regEmail.test(email);
				var juminfStr = document.insert.jumin_nof.value.length;
				var juminbStr = document.insert.jumin_nob.value.length;
				if(!korck) {
					alert("한글이름은 한글로 입력해주세요");
					$("#kor").val('');
					$("#kor").focus();
					return false;
				}
				if(!engck) {
					alert("영어이름은 영어로 입력해주세요");
					$("#eng").val('');
					$("#eng").focus();
					return false;
				}
				if(!hanmchk) {
					alert("한문이름은 한자로 입력해주세요");
					$("#hanm").val('');
					$("#hanm").focus();
					return false;
				}
				if(!jumin1chk) {
					alert("주민등록번호 앞 6자리를 입력해주세요");
					$("#jumin1").val('');
					$("#jumin1").focus();
					return false;
				}
				if(!jumin2) {
					alert("주민등록번호 뒤 7자리를 입력해주세요");
					$("#jumin2").val('');
					$("#jumin2").focus();
					return false;
				}
				if(!birth1ck) {
					alert("생년월일는 숫자로 입력해주세요");
					$("#birth1").val('');
					$("#birth1").focus();
					return false;
				}
				if(!birth2ck) {
					alert("생년월일는 숫자로 입력해주세요");
					$("#birth2").val('');
					$("#birth2").focus();
					return false;
				}
				if(!birth3ck) {
					alert("생년월일는 숫자로 입력해주세요");
					$("#birth3").val('');
					$("#birth3").focus();
					return false;
				}
				if(!work_yearchk) {
					alert("연차는 숫자로 입력해주세요");
					$("#work_year").val('');
					$("#work_year").focus();
					return false;
				}
				if(!phone1chk) {
					alert("연락처는 숫자로 입력해주세요");
					$("#phone1").val('');
					$("#phone1").focus();
					return false;
				}
				if(!phone2chk) {
					alert("연락처는 숫자로 입력해주세요");
					$("#phone2").val('');
					$("#phone2").focus();
					return false;
				}
				if(!phone3chk) {
					alert("연락처는 숫자로 입력해주세요");
					$("#phone3").val('');
					$("#phone3").focus();
					return false;
				}
				if(!emailchk) {
					alert("이메일는 이메일양식으로 입력해주세요");
					$("#email").val('');
					$("#email").focus();
					return false;
				}
			

			}
		}
		function check() {
			var str = document.insert.jumin_nof.value.length;
		     if(str == 6) {
		       document.insert.jumin_nob.focus();
		     }
		     if(str > 6) {
		    	alert("주민등록번호 앞 6자리를 입력해주세요");
		    	$("#jumin1").val('');
				$("#jumin1").focus();
		     }
		}
		
		function inputbirth() {
		    var temp1,temp2,temp3;

		        temp1 = document.insert.jumin_nof.value.substring(0,2);
		        temp2 = document.insert.jumin_nof.value.substring(2,4);
		        temp3 = document.insert.jumin_nof.value.substring(4,6);
		        if( temp1 < 30 ){ 
		        	document.insert.birth1.value="20"+temp1; 
		        } else { 
		        	document.insert.birth1.value="19"+temp1; 
		        }
		            document.insert.birth2.value=temp2;
		            document.insert.birth3.value=temp3; 
		}
		
		function check2() {
			var str = document.insert.jumin_nob.value.length;
		    if(str > 7) {
		    	alert("주민등록번호 뒤 7자리를 입력해주세요");
		    	$("#jumin2").val('');
				$("#jumin2").focus();
		    }
		    if(str == 7) {
		    	var jumin_nof = document.insert.jumin_nof.value;
		    	var jumin_nob = document.insert.jumin_nob.value;
		    	$.ajax({
					type : "POST",
					url: "juminchk",
					data: { jumin_nof,
							jumin_nob },
					success : function(data) {
						if(data == 1) {
							alert("이미등록되어 있습니다.");
							$("#jumin1").val('');
							$("#jumin2").val('');
							$("#jumin1").focus();
							
						} else {
							alert("미등록 주민번호 확인 ok");
						}
					},	
					error:function(request, status, error){
			      	   alert("code=" + request.status + "message=" + request.responseText + "error=" + error);
					}    
				});
		    }
		}
		
	</script>
</head>
<body topmargin="0" leftmargin="0">
	<form name="insert" action="update" method="post"  enctype="multipart/form-data" onsubmit="return validate();">
		<input type="hidden" name="no" value="${member.no }">
		<table width="640" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td width="640">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
		      <strong>사원 기본 정보 수정</strong></td>
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
		                              <td height="112" bgcolor="#CCCCCC"><table width="100" border="0" cellspacing="1" cellpadding="0">
		                                  <tr>
		                                    <td height="110" bgcolor="#FFFFFF">
		                                    	<div class="img_wrap">
		                                    		<!-- 사진들어갈곳 -->
		                                    		<img id="img" />
		                                    		<img id="preImg" src="<upload:url value='/upload/${member.image }' />" />
		                                    	</div>
		                                    </td>
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
		                                <input type="text" name="kor_name" required="required" id="kor" value=${member.kor_name }>
		                              </td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
		                              <td height="26">
		                              <input type="text" name="eng_name" id="eng" value=${member.eng_name }></td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
		                              <td height="26"><input type="text" name="chn_name" id="hanm" value=${member.chn_name }></td>
		                            </tr>
		                            <tr>
		                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
		                              <td height="26">
			                              <input name="jumin_nof" type="text" size="15" required="required" id="jumin1" value=${member.jumin_nof }
			                              	onKeyUp="check();" onChange="inputbirth()">
									      	-
									      <input name="jumin_nob" type="text" size="15" required="required" id="jumin2" value=${member.jumin_nob }
									      	onKeyUp="check2();">
								      	</td>
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
		                            <td width="102" align="right"><strong>사진파일명 :&nbsp;</strong></td>
		                            <td width="268">
		                            <!--사진업로드--> ${member.image }
		                            	<input name="file" type="file" id="input_img" accept="image/jpg">이거
		                            <td width="400"></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
		                            <td width="391">
		                            	<input name="birth1" type="text" size="5" id="birth1" value=${member.birth1 }>년
		                                <input name="birth2" type="text" size="3" id="birth2" value=${member.birth2 }>월
		                                <input name="birth3" type="text" size="3" id="birth3" value=${member.birth3 }>일
		                               <c:choose>
			                               <c:when test="${member.sol_flag eq '양력' }">
			                                	(<input type="radio" name="sol_flag" value="양력" checked="checked">양력
			                                	<input type="radio" name="sol_flag" value="음력">음력 )
			                                </c:when>
			                                <c:otherwise>
			                                	(<input type="radio" name="sol_flag" value="양력">양력
			                                	<input type="radio" name="sol_flag" value="음력" checked="checked">음력 )
			                                </c:otherwise>
		                               </c:choose>
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
		                            <td width="391"> 
		                            	<c:choose>
		                            		<c:when test="${member.sex eq '남자' }">
		                            			<input type="radio" name="sex" value="남자" checked="checked"> 남자
		                                		<input type="radio" name="sex" value="여자"> 여자
		                            		</c:when>
		                            		<c:otherwise>
		                            			<input type="radio" name="sex" value="남자" > 남자
		                                		<input type="radio" name="sex" value="여자" checked="checked"> 여자
		                            		</c:otherwise>
		                            	</c:choose>
		                            	
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
		                            <td width="391"> 
		                            	<c:choose>
		                            		<c:when test="${member.marry_flag eq '유' }">
		                            			<input type="radio" name="marry_flag" value="유" checked="checked"> 유
		                                		<input type="radio" name="marry_flag" value="무"> 무
		                            		</c:when>
		                            		<c:otherwise>
		                            			<input type="radio" name="marry_flag" value="유" > 유
		                                		<input type="radio" name="marry_flag" value="무" checked="checked"> 무
		                            		</c:otherwise>
		                            	</c:choose>
		                            	
		                             </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
		                            <td width="392"><input name="work_year" id="work_year" type="text" size="10" value="${member.work_year }"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>급여 지급유형 :&nbsp;</strong></td>
		                            <td width="392"> 
		                            	<select name="payment_type">
		                            	<c:choose>
		                            		<c:when test="${member.payment_type eq '월급' }">
		                            			<option selected value="월급">월급</option>
		                                		<option value="주급">주급</option>
		                            		</c:when>
		                            		<c:otherwise>
		                                		<option selected value="주급">주급</option>
		                            			<option value="월급">월급</option>
		                            		</c:otherwise>
		                            	</c:choose>
		                                
		                              </select> </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
		                            <td width="392"> 
		                            	<select name="dept">
		                            	<c:choose>
		                            		<c:when test="${member.dept eq 'SI' }">
		                            			<option selected value="SI">SI</option>
		                                		<option value="SM">SM</option>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<option value="SI">SI</option>
		                                		<option selected value="SM">SM</option>
		                            		</c:otherwise>
		                            	</c:choose>
		                                </select> 
		                             </td>
		                           </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
		                            <td width="392"> 
		                            	<select name="job_type">
		                            	<c:choose>
		                            		<c:when test="${member.job_type eq '정규직' }">
		                            			<option selected value="정규직">정규직</option>
		                                		<option value="계약직">계약직</option>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<option value="정규직">정규직</option>
		                                		<option selected value="계약직">계약직</option>
		                            		</c:otherwise>
		                            	</c:choose>
		                              	</select> 
		                             </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
		                            <td width="392">
		                              <input name="address" type="text" size="40" value="${member.address }"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
		                            <td width="392">
		                            	<input name="phone1" id="phone1" type="text" size="10" value="${member.phone1 }">
		                              		- 
		                              	<input name="phone2" id="phone2" type="text" size="10" value="${member.phone2 }">
		                              		- 
		                              	<input name="phone3" id="phone3" type="text" size="10" value="${member.phone3 }"></td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
		                            <td width="392"><input name="email" id="email" type="text" size="20" value="${member.email }"></td> 
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
		                            <td width="392"><input name="tech_lev" type="text" size="20" value="${member.tech_lev }"> 
		                            </td>
		                          </tr>
		                        </table></td>
		                    </tr>
		                    <tr> 
		                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
		                          <tr> 
		                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
		                            <td width="392"><input name="liquor" type="text" size="20" value="${member.liquor }"> 
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
		              <td width="49"><input type="image" src="image/bt_remove.gif" width="49" height="18" name="submit" value="submit"></td>
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
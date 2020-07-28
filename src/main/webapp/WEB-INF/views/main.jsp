<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body topmargin="0" leftmargin="0">
<div style="float:left; margin: 3%">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td>&nbsp;</td>
	  </tr>
	  <tr> 
	    <td align="center" valign="top"><table width="170" height="300" border="0" cellpadding="0" cellspacing="0">
	        <tr> 
	          <td height="9"><img src="image/left_top.gif" width="170" height="9"></td>
	        </tr>
	        <tr> 
	          <td align="center" valign="top" background="image/left_bg.gif">
			  <!----------------------  메뉴들 ----------------------------->
			  <table width="150" border="0" cellspacing="0" cellpadding="0">
	              <tr> 
	                <td width="17" height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td width="133"><a href="main">기본정보</a></td>
	              </tr>
	              <tr> 
	                <td height="20">&nbsp;</td>
	                <td><a href="insertForm">- 등록</td>
	              </tr>
	              <tr> 
	                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td>직원명부</td>
	              </tr>
	              <tr> 
	                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td>퇴직자현황</td>
	              </tr>
	              <tr> 
	                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td>예비인력정보</td>
	              </tr>
	              <tr> 
	                <td height="20"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td>거래처정보</td>
	              </tr>
	              <tr> 
	                <td height="20">&nbsp;</td>
	                <td>- 등록</td>
	              </tr>
	            </table>
			  <!----------------------  메뉴들 ----------------------------->
				</td>
	        </tr>
	        <tr> 
	          <td height="9"><img src="image/left_bottom.gif" width="170" height="9"></td>
	        </tr>
	      </table></td>
	  </tr>
	  <tr> 
	    <td>&nbsp;</td>
	  </tr>
	  <tr> 
	    <td align="center"><table width="170" height="49" border="0" cellpadding="0" cellspacing="0">
	        <tr> 
	          <td align="center" background="image/left_box.gif">
			  <!------------------------------ 경력검색 ---------------------------------->
			  <table width="155" border="0" cellspacing="0" cellpadding="0">
	              <tr> 
	                <td width="17"><img src="image/left_icon.gif" width="11" height="11" align="absmiddle"></td>
	                <td width="143" height="20"><strong>경력검색</strong></td>
	              </tr>
	              <tr align="right"> 
	                <td colspan="2">
	                	<input name="textfield" type="text" class="flat" size="15" maxlength="14"> 
	                    <img src="image/search.gif" width="49" height="18" align="absmiddle"></td>
	              </tr>
	            </table>
			  <!------------------------------ 경력검색 ---------------------------------->
				</td>
	        </tr>
	      </table></td>
	  </tr>
	</table>
</div>

<div style="float:left; margin: 3% 0;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td>&nbsp;</td>
	  </tr>
	  <tr> 
	    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
	      <strong>사원조회</strong></td>
	  </tr>
	  <tr> 
	    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td height="30" align="right">
	        	 <form action="main" id="keyword">
		          	 <select name="type" class="INPUT">
			              <option selected value="all">::::: 전체 :::::</option>
			              <option value="name">이름 </option>
			              <option value="jumin_nof">생년월일 </option>
		           	 </select> 
		           	 <input name="keyword" type="text" class="INPUT">
		           	 <img src="image/search.gif" width="49" height="18" border="0" align="absmiddle" onclick="submit();">
		          </form> 	 
	           </td>
	        </tr>
	        <!--다중검색  -->
	        <tr>
	        	<td>
	        		<form action="main" name="frm">
	        			<select name="sex" onchange="selsubmit()">
	        				<option value="">:::성별:::</option>
	        				<option value="남자" <c:if test="${param.sex eq '남자'}">selected</c:if>>남자</option>
	        				<option value="여자" <c:if test="${param.sex eq '여자'}">selected</c:if>>여자</option>
	        			</select>
	        			<select name="tech_lev" onchange="selsubmit()">
	        				<option value="">::기술등급::</option>
	        				<option value="초급" <c:if test="${param.tech_lev eq '초급'}">selected</c:if>>초급</option>
	        				<option value="중급" <c:if test="${param.tech_lev eq '중급'}">selected</c:if>>중급</option>
	        				<option value="고급" <c:if test="${param.tech_lev eq '고급'}">selected</c:if>>고급</option>
	        			</select>
	        			<select name="job_type" onchange="selsubmit()">
	        				<option value="">::입사유형::</option>
	        				<option value="정규직" <c:if test="${param.job_type eq '초급'}">selected</c:if>>정규직</option>
	        				<option value="계약직" <c:if test="${param.job_type eq '초급'}">selected</c:if>>계약직</option>
	        			</select>
	        			<select name="dept" onchange="selsubmit()">
	        				<option value="">::직무::</option>
	        				<option value="SI" <c:if test="${param.dept eq 'SI'}">selected</c:if>>SI</option>
	        				<option value="SM" <c:if test="${param.dept eq 'SM'}">selected</c:if>>SM</option>
	        			</select>
	        		</form>
	        	</td>
	        </tr>
	        <tr> 
	          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
	              <tr> 
	                <td height="3" background="image/bar_bg1.gif"></td>
	              </tr>
	              <tr align="center" bgcolor="F8F8F8"> 
	                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a onclick="update()">수정</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">근무정보</a> </td>
	              </tr>
	              <tr align="center" bgcolor="F8F8F8"> 
	                <td height="1" align="right" bgcolor="B1B1B1"></td>
	              </tr>
	              <tr> 
	                <td>
					<!-------------------------  리스트 ------------------------------>
					<table width="640" border="0" cellspacing="0" cellpadding="0">
						<tr al>
							<td width="35" height="20" align="center"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" ></td>
							<td width="85" align="center">이름</td>
							<td width="153" align="center">주민번호</td>
							<td width="91" align="center">성별</td>
							<td width="91" align="center">기술등급</td>
							<td width="91" align="center">상태</td>
							<td width="94" align="center">근무</td>
							<td></td>
						</tr>
						<c:forEach items="${mainList }" var="member">
		                    <tr> 
		                      <td width="35" height="20" align="center"><input type="checkbox" name="checkbox" class="checkbox" value="${member.no }"></td>
		                      <td width="85" align="center"><a href='content?no=${member.no }&currentPage=${paging.currentPage}'>${member.kor_name }</a></td>
		                      <td width="153" align="center"><span id="target">${member.jumin_nof }</span>-${member.jumin_nob }</td>
		                      <td width="91" align="center">${member.sex }</td>
		                      <td width="91" align="center">${member.tech_lev }</td>
		                      <td width="91" align="center">${member.job_type }</td>
		                      <td width="94" align="center">${member.dept }</td>
		                      <td>
		                      	<c:if test="${member.id ne null }" >
		                     		<span style="color:green"><i class="far fa-file-excel" onclick="exdownload(${member.jumin_nob})"></i></span>
		                      	</c:if>
		                      </td>
		                    </tr>
		                  </c:forEach>  
	                    <tr> 
	                    	<td height="35" colspan="7" align="center" style="padding-bottom:3"> 
								<a href="main?currentPage=1&type=${param.type}&keyword=${param.keyword}&kor_name=${param.kor_name}&jumin_nof=${param.jumin_nof}&sex=${param.sex}&tech_lev=${param.tech_lev}&job_type=${param.job_type}&dept=${param.dept}">
									<img src="image/prev.gif" width="22" height="15" border="0" align="absmiddle">
								</a>
	                    		<c:if test="${paging.before eq true }">
									<a href="main?currentPage=${paging.startPage - 1}&type=${param.type}&keyword=${param.keyword}&kor_name=${param.kor_name}&jumin_nof=${param.jumin_nof}&sex=${param.sex}&tech_lev=${param.tech_lev}&job_type=${param.job_type}&dept=${param.dept}">
									<img src="image/pre.gif" width="42" height="15" border="0" align="absmiddle"></a>
								</c:if>
								<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="main?currentPage=${i}&type=${param.type}&keyword=${param.keyword}&kor_name=${param.kor_name}&jumin_nof=${param.jumin_nof}&sex=${param.sex}&tech_lev=${param.tech_lev}&job_type=${param.job_type}&dept=${param.dept}" class="paging-num">&nbsp;${i}&nbsp;</a>
								</c:forEach>
								<c:if test="${paging.next eq true}">
									<a href="main?currentPage=${paging.endPage + 1}&type=${param.type}&keyword=${param.keyword}&kor_name=${param.kor_name}&jumin_nof=${param.jumin_nof}&sex=${param.sex}&tech_lev=${param.tech_lev}&job_type=${param.job_type}&dept=${param.dept}"> </a>
									<img src="image/next.gif" width="42" height="15" border="0" align="absmiddle">
								</c:if>
								<a href="main?currentPage=${paging.totalPage }&kor_name=${param.kor_name}&jumin_nof=${param.jumin_nof}&sex=${param.sex}&tech_lev=${param.tech_lev}&job_type=${param.job_type}&dept=${param.dept}">
									<img src="image/next_.gif" width="22" height="15" border="0" align="absmiddle">
								</a>
	                    	</td>
	                    </tr>
	                  </table>
	 				<!-------------------------  리스트 ------------------------------>
					  </td>
	              </tr>
	              <tr align="center" bgcolor="F8F8F8"> 
	                <td height="1" align="right" bgcolor="B1B1B1"></td>
	              </tr>
	              <tr align="center" bgcolor="F8F8F8"> 
	                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a onclick="del()">삭제</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
	                  <a href="#">근무정보</a> </td>
	              </tr>
	            </table></td>
	        </tr>
	        <tr> 
	          <td height="3" background="image/bar_bg1.gif"></td>
	        </tr>
	      </table></td>
	  </tr>
	</table>
</div>

	<script type="text/javascript">

		 function del() {
			var checkbox = $('input[class=checkbox]:checked');
			var arr = new Array();
			var result = confirm('삭제 하시겠습니까?');
			if(result) {
				$('input[name="checkbox"]:checked').each(function(i) {
					arr.push(checkbox[i].value);
				});
				
				if(checkbox.length == 0) {
					alert("체크된 항목이 없습니다.");
				} else {
					$.ajax({
		                type: "POST",
		                url: "delete" ,
		                data: { arr : arr.join(",")},
		                dataType:"json",
		                success: function(jdata){
		                    if(jdata) {
		                    	alert("삭제 성공");
		                        location.reload();
		                    } else {
		                    	alert("삭제 오류");
		                    }
		                },
		                error: function(){alert("서버통신 오류");}
					});
				}
			} 
		 }
		
		function update() {
			var checkbox = $('input[class=checkbox]:checked');
			if(checkbox.length > 1) {
				alert('하나만 선택해주세요');
				return;
			}
			if(checkbox.length == 0) {
				alert("체크된 항목이 없습니다.");
				return;
			}	
			location.href = "updateForm?no=" + checkbox.val();
		}
		
		function submit() {
			var formTag = document.getElementById("keyword");
			formTag.submit();
		}
		
		function checkAll() {
			if( $('#th_checkAll').is(':checked', true) ){
				$('input[name=checkbox]').prop('checked', true);
			} else {
				$('input[name=checkbox]').prop('checked', false);
			}
		}
		function selsubmit() {
			document.frm.submit();
		}
	    function exdownload(jumin) {
	    	console.log(jumin);
			location.href = "exceldownload?jumin=" + jumin;
		} 
	
	</script>
</body>
</html>
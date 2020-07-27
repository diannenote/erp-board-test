<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function submit() {
		var formData = new FormData;
		var file = document.getElementById("fileupload").files[0];
		var jumin = opener.document.getElementById("jumin2").value;
		formData.append("excelfile", file);
		formData.append("jumin", jumin);
		console.log(formData);
		$.ajax({
		    type : "POST",
		    url : "excelupload",
		    data : formData,
		    processData: false,
		    contentType: false,
		    success : function(data) {
		        alert("등록되었습니다.");
		        opener.document.getElementById("exfilename").innerText = document.getElementById("fileupload").files[0].name;
		        window.close();
		    },
		    err : function(err) {
		        alert(err.status);
		    }
		});
	}

</script>	
</head>
<body>
	<input name="files" id="fileupload" type="file" />
	<button onclick="submit()">등록</button>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>


<title>납품 페이지</title>
<link rel="stylesheet" href="../css/productor.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	 $(document).ready(function(){
		  var currentPosition = parseInt($("#quickmenu").css("top"));
		  $(window).scroll(function() {
		    var position = $(window).scrollTop(); 
		    $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
		  });
		});
	 
	 function validateForm(){
		 
  		  return true;
     }
</script>
</head>
<body>
<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement("select * from product");
	    rs = pstmt.executeQuery();
%>

<div id="wrapper">
	<button id="btn1">LogOut</button>
	<header>납품 페이지</header>

	<div id="quickmenu">
	퀵메뉴
	</div>
	
	<div id="productor_table1">
		<br><br><a>최근 납품 내역</a><br><br>
		<table class="tb1">
		 <thead>
		  <tr>
			<th>물품명</th> <th>종류</th> <th>수량</th> <th>생산 일자</th> <th>상태</th>
		  </tr>
		 </thead>
		 <tbody>
		 <%
		 while (rs.next()) {
	      %><tr>
	      		<%
	        	out.println("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(6) + "</td>");
	      		%>
 		    </tr><%
		    }      
		 %>
		 </tbody>
		</table>
	</div>
		
	<div id="productor_table2">
		<form name="productorform" action=productor_ok.jsp method=get onsubmit="return validform()" enctype="multipart/form-data">		
		  <br><br><a>납품 입력</a><br><br>
            <table class = "tb2">
				<tr>
				 <td>물품명</td><td><input type="text" name="obj_name" id="obj_name"></td>
				</tr>
				<tr>
				 <td>종류</td><td><select name="obj_kind" id="obj_kind">
									    <option value=""disabled selected>-선택-</option>
									    <option value="채소">채소</option>
									    <option value="육류">육류</option>
									    <option value="유제품">유제품</option>
									    <option value="소스류">소스류</option>
								</select>
				</td>
				</tr>
				<tr>
				 <td>수량</td><td><input type="text" name="obj_amount" id="obj_amount"></td>
				</tr>
				<tr>
				 <td>제품 사진</td>
				 <td>
				 <div class="imgbtn">
        			<label for="obj_img">
            			파일 업로드
        			</label>
    			</div>
				 <input type="file" id="obj_img" name="obj_img" accept="image/*" onchange="loadFile(event)"></td>
				</tr>
				<tr>
				 <td>생산일자</td><td><input type="date" name="obj_date" id="obj_date"></td>
				</tr>
            </table>
        <button type="submit" id="btn2">입력</button>
        </form>
    </div>
	
	
	
	
	
</body>
</html>
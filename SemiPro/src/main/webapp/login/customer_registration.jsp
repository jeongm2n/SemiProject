<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="css/regist.css">
<title>관리자 회원가입 페이지</title>
<style>
#test_btn1 {
  border: 0;
  outline: none;
  font-size: 30px;
  background: white;
  color: rgb(111,167,235);
  cursor: pointer;
  border: solid 1px rgb(111,167,235);
  box-sizing: border-box;
  width: 150px;
}
#test_btn2 {
  border: 0;
  outline: none;
  font-size: 30px;
  background: 1px rgb(111,167,235);
  color: white;
  cursor: pointer;

  width: 150px;
}

</style>
	<script>
	function domainChange(d){
		var v=d.value;
		document.A_Registform.A_domain.value=v;
	}
	</script>
</head>
<body>
	<center>
		<button id="test_btn1" onClick="location.href='delivery_registration.jsp'">납품자</button>
		<button id="test_btn1" onClick="location.href='admin_registration.jsp'">관리자</button>
		<button id="test_btn2">구매자</button>
		<br><br>
	
	<form name="D_Registform" action="" method="" onSubmit="">
		<table border="1" bordercolor="blue" width="50%" height="50px">
		<!-- 아이디 -->
		<tr><th class="info" align="center">아이디 </th>
			<td class="input_info" align="center">
				<input type = "text" name = "D_id" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 비밀번호 1차 -->
		<tr><th class="info" align="center">비밀번호 </th>
			<td class="input_info" align="center">
				<input type = "password" name = "D_pwd_1" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 비밀번호 2차 -->
		<tr><th class="info" align="center">비밀번호 </th>
			<td class="input_info" align="center">
				<input type = "password" name = "D_pwd_2" size="20" style="width: 445px;">
			</td>
		</tr>	
		<!-- 이름 -->
		<tr><th class="info" align="center">이름 </th>
			<td class="input_info" align="center">
				<input type = "text" name = "D_name" size="20" style="width: 445px;">
			</td>
		</tr>
		<!-- 이메일 -->
		<tr><th class="info" align="center">이메일 </th>
			<td class="input_info" align="center">
				<input type="text" name="front"/>
				@<input type="text" name="domain">
					<select name=domain_input ondhange="domainChange(this);">
						<option selected="selected" value="null">직접입력</option>
						<option value="naver.com"&gtnaver.com>naver.com</option>
						<option value="gmail.com"&gtnaver.com>gmail.com</option>
					</select>
			</td>
		</tr>
		<!-- 기업 -->
		<tr><th class="info" align="center">기업 </th>
			<td class="input_info" align="center">
				<input type = "text" name = "D_name" size="20" style="width: 445px;">
			</td>
		</tr>									
	</table>
	  <input type="submit" style="width:150px;height:50px;margin-left:auto;margin-right:auto" value="가입"/>
	</form>
	</center>
</body>
</html>
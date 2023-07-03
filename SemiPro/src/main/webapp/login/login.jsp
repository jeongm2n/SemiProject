<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        #login_table {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .btn-container button {
            margin: 0 10px;
        }
    </style>
    <title>로그인 페이지</title>
    
    <script>
        function RegistrationPage() {
            var position = document.querySelector('input[name="position"]:checked').value;
            if (position === "productor") {
                window.location.href = "delivery_registration.jsp";
            } else if(position === "manager"){
            	 window.location.href = "admin_registration.jsp";
            } else if(position === "customer"){
            	 window.location.href = "customer_registration.jsp";
            }
        }
        
       function validateForm(){
    	   var position = document.login_page.position.value;
    	   var id = document.login_page.id_input.value;
    	   var pwd = document.login_page.pwd_input.value;
    	   
    	   if( !position || !id || !pwd){
				alert('모든 항목을 입력해주세요!');
				return false;
    	   } else{
    		   return true;
    	   }
       }
    </script>
    
</head>
<body>
<!-- <button class="btn" style="float: left " onclick="return RegistrationPage()">회원가입</button>-->
    <div id="login_table">
        <form name="login_page" action="login_ok.jsp" method="get" onSubmit="return validateForm()">
            <table align="center">
                <tr>
                    <th class="info" align="right">아이디: </th>
                    <td class="input_info">
                        <input type="text" name="id_input" id="id" size="20">
                        <input type="submit" value="로그인">
                    </td>
                </tr>

                <tr>
                    <th class="info" align="right">비밀번호: </th>
                    <td class="input_info">
                        <input type="password" name="pwd_input" id="pwd" size="20">
                    </td>
                </tr>
                <tr>
                    <th class="info"></th>
                    <td class="input_info">
                        <input type="radio" name="position" id="position" value="productor" checked>납품업자
                        <input type="radio" name="position" id="position" value="manager">관리자
                        <input type="radio" name="position" id="position" value="customer">소비자
                    </td>
                </tr>
            </table>
        </form>
    <div class="btn-container" style="text-align: center;">
        <button class="btn" style="position: absolute; bottom: 20px; left: 50%; transform: translateX(-50%);" onclick="RegistrationPage()">회원가입</button>
    </div>
    </div>
</body>
</html>

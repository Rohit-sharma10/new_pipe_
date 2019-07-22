<%-- 
    Document   : index
    Created on : 11 Mar, 2016, 2:12:49 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subhlagan - login</title>
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <link href="${context}/css/subhlagan-style.css" rel="stylesheet" />
    <script src="${context}/js/jquery.js"></script>
    <script type="text/javascript">
        function forgotPassword()
        {
//                alert("here");
            var emailId = document.getElementById('emailId').value;
            var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!regEmail.test(emailId))
            {
                alert("Please enter valid emailId");
            } else {
                $.ajax({
                    type: "post",
                    url: "forgotPassword",
                    data: "email=" + emailId,
                    success: function (html) {
                        alert(html);
                    }
                });
            }
        }
    </script>
</head>
<body>
    <!-- New login Start-->
    <section class="pattern-login">
        <div class="loinLogo"><img src="${context}/img/loginlogo.png"/></div>
        <div class="loginBG">
            <div class="loginText">
                <div class="memberLogText">Member Login</div>
            </div>
            <div class="loginDiv">
                <div id="err"></div>

                <form action="userLogin" method="post">
                    <div class="login-form">
                        <label>Email Address</label>
                        <input type="text"  id="emailId" class="emailIcon" name="userLogin.loginId"/>
                    </div>
                    <div class="login-form">
                        <label>Password</label>
                        <input type="password" class="passwordIcon" name="userLogin.password"/>
                    </div>
                    <div class="login-form">
                        <label >${result}</label>
                        <input type="submit"  value="Login"/>

                    </div>
                    <div class="loginBottom">Forgot your password? <a href="#!" onclick="forgotPassword()">Click here</a></div>

                </form>
            </div>
        </div>

    </section>

    <!--New Login ends-->








    <!--         <div class="loinLogo"><img src="img/logo-subhlagan.jpg"/></div>
            <div class="loginOuter">
                <form action="userLogin" method="post">
                   
    
                    <div class="loginTop">
                        <span>Find the Most Genuine Partner Search Experience</span><br/>
                        <span>Join with <b>Subhlagan</b> and we can help you to find a perfect partner.</span>
                    </div>
                    <div class="loginMidd">
                        <input type="text"  class="emailIcon" name="userLogin.loginId"/>
                         <input type="password" class="passwordIcon" name="userLogin.password"/>
                         <input type="submit"  value="Login"/>
                    </div>
                </form>
                <div class="loginBottom">Forgot your password? <a href="#">Click here</a></div>
            </div>-->
</body>
</html>

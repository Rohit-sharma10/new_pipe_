<%-- 
    Document   : profileList
    Created on : 11 Mar, 2016, 4:52:02 PM
    Author     : OpenSpace004
--%>
<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="java.util.List"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="s" uri="/struts-tags" %>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-responsive.css" rel="stylesheet" />
        <link href="css/subhlagan-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/datepicker.css"/>
        <script>
            function transferdata()
            {
                document.getElementById("loading").style.display="block";
                $.ajax({
                    type: "post",
                    url: "transferdata",
                    success: function (html) {
document.getElementById("loading").style.display="none";
                    }
                });
            }

        </script>
    </head>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP">
                            <!--copy till here-->
                            <form method="post" action="" >


                                <a href="Profile/profileList">Profile List</a><br/>
                                <a href="Profile/reportList">Report</a>
                                <a href="#!" onclick="transferdata()">transfer</a>
                                <img src="../img/loader1.gif" id="loading"></img>
                            </form>
                            <!-- for Height start-->
                            <div class="blankdivHeight"></div>
                            <!-- for Height ends-->
                            <!--copy from here-->
                        </div>
                    </div>
                </section>
            </section>
        </section>
<datalist id="searchNameHeader" style="display:none;">

            <%
                List contactList = (List) session.getAttribute("contactListHeader");
                for (int i = 0; i < contactList.size(); i++) {
                    Contact contact = (Contact) contactList.get(i);
            %>
            <option value="<%=contact.getFirstName()%> <%=contact.getMiddleName()%> <%=contact.getLastName()%> <%=contact.getProfileId()%>"> </option>
            <%
                }
            %>

        </datalist>     

        <s:include value="../includes/footer.jsp" />
        <!--FOOTER-->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="css/elegant-icons-style.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- nice scroll -->
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="js/scripts.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
    </body>
</html>

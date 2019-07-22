<%-- 
    Document   : profileList
    Created on : 11 Mar, 2016, 4:52:02 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="s" uri="/struts-tags" %>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
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
                $.ajax({
                    type: "post",
                    url: "transferdata",
                    success: function (html) {

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
                            <div class="row">
                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box blue-bg">

                                        <div class="count">
                                            <c:if test="${ntarm!=0}">
                                                <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=7">${ntarm}</a>
                                            </c:if>
                                            <c:if test="${ntarm==0}">
                                                ${ntarm}
                                            </c:if>
                                        </div>
                                        <div class="title">NTARM </div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->
                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box green-bg">

                                        <div class="count">
                                            <c:if test="${freshCallCount!=0}">
                                                <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=2">${freshCallCount}</a>
                                            </c:if>
                                            <c:if test="${freshCallCount==0}">
                                                ${freshCallCount}
                                            </c:if>
                                        </div>
                                        <div class="title">Fresh Calls</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->

                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box brown-bg">

                                        <div class="count">
                                            <c:if test="${armFollowupCount!=0}">
                                                <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=3">${armFollowupCount}</a>
                                            </c:if>
                                            <c:if test="${armFollowupCount==0}">
                                                ${armFollowupCount}
                                            </c:if></div>
                                        <div class="title">Followup</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->	

                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box dark-bg colorBG">

                                        <div class="count">
                                            <c:if test="${contactExchangeCount!=0}">
                                                <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=4">${contactExchangeCount}</a>
                                            </c:if>
                                            <c:if test="${contactExchangeCount==0}">
                                                ${contactExchangeCount}
                                            </c:if></div>
                                        <div class="title">Mobile Exchange</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->

                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box blue-bg">

                                        <div class="count">
                                            <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=5">${twoWayAccepted}</a>  
                                        </div>
                                        <div class="title">Match Calls (Two way accept Call)</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->
                                <div class="col-lg-4 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box yelloBg">

                                        <div class="count">
                                            <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=6">${oneWayAccepted}</a>      
                                        </div>
                                        <div class="title">Match Calls(One Side Accept Calls)</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->

                            </div><!--/.row-->

                        </div>
                    </div>
                </section>
            </section>
        </section>


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

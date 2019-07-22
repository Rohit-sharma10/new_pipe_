<%-- 
    Document   : community
    Created on : 6 Oct, 2016, 3:18:42 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Country</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/subhlagan-style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/css/elegant-icons-style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />

    </head>
    <script type="text/javascript">
        function fetchCountryDetails(id, name)
        {           
            document.getElementById('countryId').value = id;
            document.getElementById('countryName').value = name;
        }
        function addCountry()
        {
            document.getElementById('countryId').value = "0";
            document.getElementById('countryName').value = "";
        }
    </script>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP">
                            <div class="formDATA">
                                <h4 class="candidateName">Country
                                </h4>
                                <div class="text-center" style="float: right;"><input type="submit" onclick="addCountry()" class="btn btn-primary" value="Add" data-toggle="modal" data-target="#country"> </div>

                            </div>

                            <!--copy till here-->
                            <display:table   name="countryList"  id="countryListId" pagesize="15"  requestURI="" class="borderNoneTable tableBG uiTable"  >
                                <display:column property="countryId"/>
                                <display:column property="countryName"/>
                                <display:column title="Edit" media="html" sortable="" style="width:5%;text-align:left" >
                                    <a href="#" onclick="fetchCountryDetails(${countryListId.countryId}, '${countryListId.countryName}')"   data-toggle="modal" data-target="#country" >
                                        <img src="../img/graphics_pen_black.png" title="Edit"/></a>
                                    </display:column>

                                <display:column title="Delete" media="html" sortable="" style="width:5%;text-align:left" >
                                    <a href="deleteCountry?countryId=${countryListId.countryId}&countryName=${countryListId.countryName}&status=0">
                                        <img src="../img/newdel.png"  title="Delete"/></a>
                                    </display:column>
                                </display:table>
                            <div id="country" class="modal fade" role="dialog"  >
                                <div class="modal-dialog" style="width:30%">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button"  class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Country</h4>
                                        </div>
                                        <!--                                        <div class="tab-subject">
                                                                                    
                                            
                                        </div>-->
                                        <form action="saveCountry">
                                            <div class="tab-content" style="height: 100px;">
                                                <input type="hidden" name="country.countryId"  id="countryId" />
                                                <div class="formDATA" style="padding: 0 10px;">
                                                    <label><b>Country Name</b></label>
                                                    <div class="controlsData marginData"> 
                                                        <input type="text"  name="country.countryName" id="countryName"/>
                                                    </div>
                                                    <div class="text-center" style="margin:19px 0 0 0;"><input type="submit" class="btn btn-primary" value="Submit">  </div>
                                                </div>  
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <!--copy from here-->
                        </div>
                    </div>
                </section>
            </section>
        </section>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.hotkeys.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    </body>

</html>

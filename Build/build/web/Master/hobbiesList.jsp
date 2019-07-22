<%-- 
    Document   : astroCity
    Created on : 09 June, 2017, 12:10:07 PM
    Author     : OpenSpace
--%>

<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page buffer = "100kb" %>
        <s:set name="theme" value="'simple'" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style-responsive.css" rel="stylesheet" />
        <link href="../css/subhlagan-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/datepicker.css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="../css/elegant-icons-style.css" rel="stylesheet" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" />
        <script src="../js/profileList.js"></script>

        <script type="text/javascript">
        function editHobbi(id, name)
        {
            document.getElementById('hobbyId').value = id;
            document.getElementById('hobbyName').value = name;
        }
        function addHobbi()
        {
            document.getElementById('hobbyId').value = "0";
            document.getElementById('hobbyName').value = "";
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

                            <h4 class="candidateName">Hobbies List</h4>
                                                         <!--Dont Remove it's SearchFilter-->
                            <form action="fetchHobbiesList" method="post">                                                                                                       
                                <div class="col-lg-2">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="hobbiBean.hobbies" value="${hobbiBean.hobbies}" placeholder="Hobby" id="hobbi"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="formDATA"><button value="search" class="btn btn-primary" >Search</button></div>  </div>                                    
                                       
                            </form>
                                      <div class="text-center" ><input type="submit" onclick="addHobbi()" class="btn btn-primary" value="Add Hobby" data-toggle="modal" data-target="#hobby"> </div> 
                            <div class="row">
                                <div class="col-lg-12" >
                                     <h5>${message}</h5>
                                    <display:table   name="hobbiesList"  id="hobbiesListId" pagesize="15" export="true"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" >                                                                                                    
                                        <display:column title="NO." property="hobbiesid" sortable="true"/>
                                        <display:column title="Name" property="hobbies" sortable="true"/>                           
                                         <display:column title="Edit" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="#" onclick="editHobbi(${hobbiesListId.hobbiesid},'${hobbiesListId.hobbies}')" data-toggle="modal" data-target="#hobby">
                                                <img src="../img/graphics_pen_black.png" title="Edit"/></a>
                                            </display:column>

                                        <display:column title="Delete" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="deleteHobby?hobbiId=${hobbiesListId.hobbiesid}">
                                                <img src="../img/newdel.png"  title="Delete"/></a>
                                            </display:column>
                                            <display:setProperty name="paging.banner.placement" value="bottom"/>
                                            <display:setProperty name="export.csv.include_header" value="true" />
                                            <display:setProperty name="export.csv" value="true" />
                                            <display:setProperty name="export.csv.filename" value="hobby.csv"/>
                                            <display:setProperty name="export.excel.filename" value="hobby.xls"/>
                                            <display:setProperty name="export.excel" value="true" />     
                                            <display:setProperty name="export.xml" value="false" />
                                            <display:setProperty name="export.xml.filename" value="hobby.xml"/> 
                                    </display:table>
                                    
                                    
                                    
                                      <div id="hobby" class="modal fade" role="dialog"  >
                                <div class="modal-dialog" style="width:30%">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button"  class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Hobby</h4>
                                        </div>                          
                                        <form action="saveHobby">
                                            <div class="tab-content" style="height: 100px;">
                                                <input type="hidden" name="hobbiBean.hobbiesid"  id="hobbyId" />
                                                <div class="formDATA" style="padding: 0 10px;">
                                                    <label><b>Hobby</b></label>
                                                    <div class="controlsData"> 
                                                        <input type="text"  name="hobbiBean.hobbies" id="hobbyName"/>
                                                    </div>
                                                    <div class="text-center" style="margin:19px 0 0 0;"><input type="submit" class="btn btn-primary" value="Submit">  </div>
                                                </div>  
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                                    
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <script src="../js/bootstrap-wysiwyg.js"></script>
        <script src="../js/bootstrap-wysiwyg-custom.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>
        <link href="../css/timepicki.css" rel="stylesheet">
        <script src="../js/timepicki.js"></script>            
        <script src="../js/scripts.js"></script>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(function ()
            {
//                $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
//                $("#toDate").datepicker({format: 'dd/mm/yyyy'});
            });
        </script>
    </body>
</html>

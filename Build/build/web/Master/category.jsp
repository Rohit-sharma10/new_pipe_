<%-- 
    Document   : astroCity
    Created on : 13 Aug, 2016, 12:10:07 PM
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

        <script>
            function fetchCategoryDetails(id, name, sequence, gender)
            {
                document.getElementById('categoryId').value = id;
                document.getElementById('categoryName').value = name;
                document.getElementById('sequence').value = sequence;
                document.getElementById('gender').value= gender;              
            }
            function addOccupation()
            {
                document.getElementById('categoryId').value = "0";
                document.getElementById('categoryName').value = "";
                document.getElementById('sequence').value = "";
                document.getElementById('gender').value="";
            }
            
             function validateCategory()
            {
                var categoryName = document.getElementById('categoryName').value;
                var gender = document.getElementById('gender').value;
                var sequence = document.getElementById('sequence').value;          
                 var regNum = /^\d{1,15}$/;

                if (categoryName == '')
                {
                    document.getElementById('validateCategory').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCategory').style.display = "none";
                }
                 if (gender == 0)
                {
                    document.getElementById('validateGender').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateGender').style.display = "none";
                }              
                  if (!regNum.test(sequence))
                {
                    document.getElementById('validateSequence').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateSequence').style.display = "none";
                }
       
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

                            <h4 class="candidateName">Category List</h4>                     
                            <div class="text-center" style="float: right;"><input type="submit" onclick="addCategory()" class="btn btn-primary" value="Add" data-toggle="modal" data-target="#category"> </div>
                       
                            <div class="row">
                                <div class="col-lg-12" >

                                    <display:table   name="categoryList"  id="categoryListId" pagesize="15"   requestURI="" class="borderNoneTable tableBG uiTable postedTable" >                                                                                                    
                                        <display:column title="Category Name" property="categoryName" sortable="true"/>
                                        <display:column title="Gender" property="gender" sortable="true"/>
                                        <display:column title="Sequence" property="sequence" sortable="true"/>                                                                         
                                        <display:column title="Edit" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="#" onclick="fetchCategoryDetails(${categoryListId.categoryId}, '${categoryListId.categoryName}', ${categoryListId.sequence},'${categoryListId.gender}')"   data-toggle="modal" data-target="#category" >
                                                <img src="../img/graphics_pen_black.png" title="Edit"/></a>
                                            </display:column>

                                        <display:column title="Delete" media="html" sortable="" style="width:5%;text-align:left" >
                                            <a href="deleteCategory?categoryId=${categoryListId.categoryId}&categoryName=${categoryListId.categoryName}&sequence=${categoryListId.sequence}&gender=${categoryListId.gender}&status=0">
                                                <img src="../img/newdel.png"  title="Delete"/></a>
                                            </display:column>

                                    </display:table>

                                    <div id="category" class="modal fade" role="dialog"  >
                                        <div class="modal-dialog" style="width:30%">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button"  class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Category</h4>
                                                </div>
                                                <!--                                        <div class="tab-subject">
                                                                                            
                                                    
                                                </div>-->
                                                <form action="saveCategory">
                                                    <div class="tab-content">
                                                        <input type="hidden" name="category.categoryId" id="categoryId" />
                                                        <div class="formDATA" style="padding: 0 10px;">
                                                            <label><b>Category Name</b></label>
                                                            <div class="controlsData marginData"> 
                                                                <input type="text" name="category.categoryName" id="categoryName"/>
                                                                 <label id="validateCategory" style="color:red!important;display:none!important; width:100%!important;">Please Enter Category Name</label>
                                                            </div>

                                                            <label><b>Gender</b></label>
                                                            <div class="controlsData marginData"> 
                                                                <select  id="gender" name="category.gender" >
                                                                    <option value="0">Select</option>
                                                                    <option value="M">Male</option>
                                                                    <option value="F">Female</option>                                                     
                                                                </select> 
                                                                 <label id="validateGender" style="color:red!important;display:none!important; width:100%!important;">Please Select Gender</label>
                                                            </div>

                                                          
                                                            <label><b>Sequence</b></label>
                                                            <div class="controlsData marginData"> 
                                                                <input type="text"  name="category.sequence" id="sequence"/>
                                                                 <label id="validateSequence" style="color:red!important;display:none!important; width:100%!important;">Please Enter Sequence</label>
                                                            </div>
                                                            
                                                            <div class="text-center" style="margin-left:25px;"><input type="submit" class="btn btn-primary" value="Submit" onclick="return validateCategory()">  </div>
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

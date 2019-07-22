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
        <title>Mass Mail</title>
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
        function checkConfirm()
        {
            var mailNote = CKEDITOR.instances.emailContent.getData();
            document.getElementById('emailContent1').value = mailNote;
            var txt;
            var r = confirm("Are you sure ,you want to send mail!");
            if (r == true) {
                return true;
            } else {
                return false;
            }

        }
        function showcategory(id)
        {
            var value = document.getElementById(id).checked;
            if (value === true)
            {
                document.getElementById("categoryIdDiv").style.display = "none";
            } else {
                document.getElementById("categoryIdDiv").style.display = "block";
            }
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
                                <h4 class="candidateName">Mass Mail
                                </h4>
                                <div class="text-center" style="float: right;"> </div>

                            </div>

                            <!--copy till here-->
                            <form action="saveTemplate" method="post">


                                <section class="formHalf">
                                    <div class="formDATA">
                                        <label>Title</label>
                                        <div class="controlsData">
                                            <input type="hidden" name="template.templateId" value="${template.templateId}"/>
                                            <input type="text" name="template.title" value="${template.title}"/>
                                        </div>
                                        <div class="formDATA">
                                            <label>Subject</label>
                                            <div class="controlsData">
                                                <input type="text" name="template.subject" value="${template.subject}"/>
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>All Category</label>
                                            <div class="controlsData">
                                                <input type="checkbox" id="allCat" checked="true" value="1" onclick="showcategory(this.id)"  name="template.categoryFlag"/>
                                            </div>
                                        </div>
                                        <div class="formDATA" style="display:none" id="categoryIdDiv">
                                            <label>Category</label>
                                            <div class="controlsData">
                                                <s:select  style="height:90px!important;" list="categoryList" multiple="true" name="template.categoryArray" listKey="categoryId" listValue="categoryName" />
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>Member Status</label>
                                            <div class="controlsData">
                                                <select property="type" style="width: 335px;"  name="template.type"  value="${template.type}">
                                                    <option value="1">All</option>
                                                    <option value="2">Success</option>
                                                    <option value="3">Lost Oppurtunity</option>
                                                    <option value="4">Deleted</option>
                                                    <option value="5">Success & Lost Oppurtunity</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="formDATA">
                                            <label>From Email</label>
                                            <div class="controlsData">
                                                <s:select list="userList"   listKey="userName" listValue="name"  name="template.fromEmailId" headerKey="0" headerValue="--Select user--"  />
                                            </div>
                                        </div>
                                        <div class="formDATA">
                                            <label>Test Email Id</label>
                                            <div class="controlsData">
                                                <input type="email" name="template.testEmailId" value="${template.testEmailId}"/>
                                            </div>
                                        </div>


                                </section>
                                <div class="formDATA">
                                    <label style="width: 179px;padding-left: 15px;">Content</label>
                                    <div class="controlsData">
                                        <textarea id="emailContent" class="form-control ckeditor" rows="6"  >${template.template}</textarea>
                                        <textarea type="text" style="display:none;" id="emailContent1" rows="6" name="template.template" >${template.template}</textarea>
                                    </div>
                                </div>

                                <div class="text-center"><input type="submit" value="Save"  class="btn btn-primary" onclick="return checkConfirm();"/></div>
                            </form>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
    </body>
    <script>
                                    $(document).ready(function ()
                                    {
//                                        alert("Inside");
//                                        var mailNote = CKEDITOR.instances.emailContent.getData();
//                                        alert(mailNote);
//                                        document.getElementById('emailContent1').value = mailNote;
                                    });
    </script>
</html>

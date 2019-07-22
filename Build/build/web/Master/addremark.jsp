
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <s:set name="theme" value="'simple'" scope="page" />
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
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style-responsive.css" rel="stylesheet" />
        <link href="../css/subhlagan-style.css" rel="stylesheet" /> 
        <link rel="stylesheet" href="../css/datepicker.css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="../css/elegant-icons-style.css" rel="stylesheet" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <script src="../js/jquery.autocomplete.js"></script>

        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

        <!-- checkbox styling script -->
        <script type="text/javascript">
            function addRemark()
            {
                var reason = document.getElementById('reason').value;
                var mainStatus = document.getElementById('mainStatus').value;
                var yesOrNo = document.getElementById('yesOrNo').value;
                var shortCode = document.getElementById('shortCode').value;

                if (reason == '')
                {
                    document.getElementById('validateRemark').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateRemark').style.display = "none";
                }
                if (shortCode == '')
                {
                    document.getElementById('validateShortCode').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateShortCode').style.display = "none";
                }

                if (mainStatus == 0)
                {
                    document.getElementById('validateMainStatus').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateMainStatus').style.display = "none";
                }
                if (yesOrNo == 0)
                {
                    document.getElementById('validateYesOrNo').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateYesOrNo').style.display = "none";
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

                            <h4 class="candidateName">Add Remark </h4>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <form action="saveRemark" method="post" id="formId">                                       

                                        <!--<input type="hidden" name="masterBean.astroCityId" value="$"/>-->             

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Remark Name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="reasonBean.reason" id="reason"/> 
                                                    <label id="validateRemark" style="color:red!important;display:none!important; width:100%!important;">Please Enter Remark</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Short Code</label>
                                                <div class="controlsData">
                                                    <input type="text" name="reasonBean.shortCode"  id="shortCode"/>        
                                                    <label id="validateShortCode" style="color:red!important;display:none!important; width:100%!important;">Please Enter Short Code</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Main Status</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="mainStatus"
                                                              list="mainStatusList" listKey="mainStatusId"  listValue="mainStatusName" 
                                                              name="reasonBean.mainStatusId" />      
                                                    <label id="validateMainStatus" style="color:red!important;display:none!important; width:100%!important;">Please Select Main Status</label>
                                                </div>
                                            </div>                                           

                                            <div class="formDATA">
                                                <label>Yes/No</label>
                                                <div class="controlsData">
                                                    <select  id="yesOrNo" name="reasonBean.yesOrNo" >
                                                        <option value="0">Select</option>
                                                        <option value="Y">Yes</option>
                                                        <option value="N">No</option>                                                     
                                                    </select> 
                                                    <label id="validateYesOrNo" style="color:red!important;display:none!important; width:100%!important;">Please Select Status Yes/No</label>
                                                </div>
                                            </div>                                           
                                            <div class="formEdit" style="margin-right: 130px;margin-top: 18px;"><input type="submit" class="btn btn-primary saveBtn" value="submit" onclick="return addRemark()"/></div>

                                        </section>


                                    </form>

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
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>       
        <script src="../js/scripts.js"></script>

    </body>   
</html>


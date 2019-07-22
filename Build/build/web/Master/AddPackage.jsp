
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

                            <h4 class="candidateName">Add Package </h4>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <form action="savePackage" method="post" id="formId">                                       

                                        <!--<input type="hidden" name="masterBean.astroCityId" value="$"/>-->             

                                        <section class="formHalf">
                                            <div class="formDATA controlWidth">
                                                <label>Package Name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="packageBean.packageName" id="packageName"/> 
                                                    <label id="validatePackage" style="color:red!important;display:none!important; width:100%!important;">Please Enter Office Name</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Package Price</label>
                                                <div class="controlsData">
                                                    <input type="text" name="packageBean.packagePrice"  id="address1"/>        
                                                    <label id="validatePackagePrice" style="color:red!important;display:none!important; width:100%!important;">Please Enter Address1</label>
                                                </div>
                                            </div>


                                            <div class="formDATA">
                                                <label>Package Code</label>
                                                <div class="controlsData">
                                                    <input type="text" name="packageBean.packageCode" id="mobile"/> 
                                                    <label id="validatePackageCode" style="color:red!important;display:none!important; width:100%!important;">Please Enter valid Mobile</label>
                                                </div>
                                            </div>                                            
                                            <div class="formEdit" style="margin-right: 30px;margin-top: 18px; "><input type="submit" class="btn btn-primary saveBtn" value="submit"/></div>

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
    <script>
                                            $(function () {
                                                $("#datepicker").datepicker({dateFormat: 'dd/mm/yy'});
                                            });
    </script>
</html>


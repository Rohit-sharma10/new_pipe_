
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcQtbUPnDeXNOYEHFqlnXI8Nxu8RoPDjQ&amp;sensor=false&amp;libraries=places"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

        <!-- checkbox styling script -->
        <script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker({dateFormat: 'dd-mm-yy'});
            });

            function editGotra()
            {
                var gotraName = document.getElementById('gotraName').value;
                var community = document.getElementById('community').value;
               

                if (gotraName == '')
                {
                    document.getElementById('validateCity').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCity').style.display = "none";
                }

                if (community == 0)
                {
                    document.getElementById('validateCountry').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCountry').style.display = "none";
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

                            <h4 class="candidateName">Edit Gotra</h4>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <form action="updateGotra" method="post" id="formId">     
                                        
                                         <input type="hidden" name="gotraBean.gotraId" value="${gotraBean.gotraId}"/> 
                                        
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Gotra Name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="gotraBean.gotraName" value="${gotraBean.gotraName}" id="gotraName"/> 
                                                    <label id="validateCity" style="color:red!important;display:none!important; width:100%!important;">Please Enter City</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Community</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="community"
                                                              list="communityList" listKey="communityId"  listValue="communityName" 
                                                              name="gotraBean.communityId"  value="%{gotraBean.communityId}" />      
                                                    <label id="validateCountry" style="color:red!important;display:none!important; width:100%!important;">Please Select Country</label>
                                                </div>
                                            </div> 

                                           <div class="formEdit" style="margin-right: 18px;margin-top: 18px;">                     
                                            <input type="submit" class="btn btn-primary saveBtn" value="submit" onclick="return addGotra()"/>
                                        </div>
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
                                                var options = {
                                                    types: ['(cities)'],
//                                                    componentRestrictions: {country: "ind"}
                                                };
                                                var input = (document.getElementById("cityName"));
                                                var autocomplete = new google.maps.places.Autocomplete(input, options);
                                            });
    </script>
</html>


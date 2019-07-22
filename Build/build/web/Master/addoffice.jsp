
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
            function addOffice()
            {
                var officeName = document.getElementById('officeName').value;
                var country = document.getElementById('country').value;
                var address1 = document.getElementById('address1').value;
                var address2 = document.getElementById('address2').value;
                var person = document.getElementById('person').value;
                var email = document.getElementById('email').value;
                var mobile = document.getElementById('mobile').value;
                var telephone = document.getElementById('telephone').value;
                var pincode = document.getElementById('pincode').value;
                var city = document.getElementById('city').value;
                var state = document.getElementById('state').value;
               
                var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                 var regMob = /^\d{10,15}$/;
                 var pin = /^\d{5,8}$/;
                if (officeName == '')
                {
                    document.getElementById('validateOffice').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateOffice').style.display = "none";
                }
                 if (person == '')
                {
                    document.getElementById('validatePerson').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePerson').style.display = "none";
                }
                
                 if (address1 == '')
                {
                    document.getElementById('validateAddress1').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateAddress1').style.display = "none";
                }
                
                if (address2 == '')
                {
                    document.getElementById('validateAddress2').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateAddress2').style.display = "none";
                }
                
                 if (country == 0)
                {
                    document.getElementById('validateCountry').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCountry').style.display = "none";
                }
                if (state == 0)
                {
                    document.getElementById('validateState').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateState').style.display = "none";
                }
                
                  if (city == 0)
                {
                    document.getElementById('validateCity').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCity').style.display = "none";
                }
                
                  if (!pin.test(pincode))
                {
                    document.getElementById('validatePincode').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePincode').style.display = "none";
                }
                
                if (!regMob.test(mobile))
                {
                    document.getElementById('validateMobile').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateMobile').style.display = "none";
                }
             
                 if (telephone == '')
                {
                    document.getElementById('validateTelephone').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateTelephone').style.display = "none";
                }

                 if (!regEmail.test(email))
                {
                    document.getElementById('validateEmail').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateEmail').style.display = "none";
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

                            <h4 class="candidateName">Add Office </h4>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <form action="saveOffice" method="post" id="formId">                                       

                                        <!--<input type="hidden" name="masterBean.astroCityId" value="$"/>-->             

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Office Name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.officeName" id="officeName"/> 
                                                    <label id="validateOffice" style="color:red!important;display:none!important; width:100%!important;">Please Enter Office Name</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Address 1</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.address1"  id="address1"/>        
                                                    <label id="validateAddress1" style="color:red!important;display:none!important; width:100%!important;">Please Enter Address1</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Country</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="country"
                                                              list="countryList" listKey="countryId"  listValue="countryName" 
                                                              name="office.countryId" />      
                                                    <label id="validateCountry" style="color:red!important;display:none!important; width:100%!important;">Please Select Country</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>City</label>
                                                <div class="controlsData">
                                                   <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="city"
                                                              list="cityList" listKey="cityId"  listValue="cityName" 
                                                              name="office.cityId"   /> 
                                                    <label id="validateCity" style="color:red!important;display:none!important; width:100%!important;">Please Select City</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Mobile</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.mobile" id="mobile"/> 
                                                    <label id="validateMobile" style="color:red!important;display:none!important; width:100%!important;">Please Enter valid Mobile</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Email</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.email" id="email"/> 
                                                    <label id="validateEmail" style="color:red!important;display:none!important; width:100%!important;">Please Enter valid Email</label>
                                                </div>
                                            </div> 


                                        </section>

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Contact Person</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.contactPerson"  id="person"/> 
                                                    <label id="validatePerson" style="color:red!important;display:none!important; width:100%!important;">Please Enter Contact Person</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Address 2</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.address2"  id="address2"/> 
                                                    <label id="validateAddress2" style="color:red!important;display:none!important; width:100%!important;">Please Enter Address2</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>State</label>
                                                <div class="controlsData">
                                                   <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="state"
                                                              list="stateList" listKey="stateId"  listValue="stateName" 
                                                              name="office.stateId" /> 
                                                    <label id="validateState" style="color:red!important;display:none!important; width:100%!important;">Please Select State</label>
                                                </div>
                                            </div>  

                                            <div class="formDATA">
                                                <label>PinCode</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.pincode"  id="pincode"/>
                                                    <label id="validatePincode" style="color:red!important;display:none!important; width:100%!important;">Please Enter Valid Pin Code</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Telephone</label>
                                                <div class="controlsData">
                                                    <input type="text" name="office.telephone" id="telephone"/> 
                                                    <label id="validateTelephone" style="color:red!important;display:none!important; width:100%!important;">Please Enter Telephone</label>
                                                </div>
                                            </div> 

                                        </section>

                                        <div class="formEdit" style="margin-right: 18px;margin-top: 18px;"><input type="submit" class="btn btn-primary saveBtn" value="submit" onclick="return addOffice()"/></div>


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


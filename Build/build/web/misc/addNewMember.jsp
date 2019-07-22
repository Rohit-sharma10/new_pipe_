<%-- 
    Document   : addNewMember
    Created on : 17 Mar, 2016, 4:33:05 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
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
        <!--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>-->
        <script src="../js/jquery.autocomplete.js"></script>
        <script type="text/javascript">
            function addUser()
            {
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
//                var confirmPassword = document.getElementById('confirmPassword').value;
                var createdBy = document.getElementById('createdBy').value;
                var telephoneSubhlagan = document.getElementById('telephoneSubhlagan').value;
                var firstName = document.getElementById('firstName').value;
                var lastName = document.getElementById('lastName').value;
//                var mobile = document.getElementById('mobile').value;
                var height = document.getElementById('heightId').value;
//                return false;
                var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var reg = /^[a-zA-Z]*$/;
                var regMob = /^\d{10,15}$/;
//                             
//
                if (!regEmail.test(email))
                {
                    document.getElementById('validateEmail').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateEmail').style.display = "none";
                }
                if (password === '')
                {
                    document.getElementById('validatePassword').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePassword').style.display = "none";
                }
                if (createdBy === '')
                {
                    document.getElementById('validateCreatedBy').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCreatedBy').style.display = "none";
                }
                if (telephoneSubhlagan === "")
                {
                    document.getElementById('validatetelephoneSubhlagan').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatetelephoneSubhlagan').style.display = "none";
                }
                if (!regMob.test(telephoneSubhlagan))
                {
                    document.getElementById('validatetelephoneSubhlagan').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatetelephoneSubhlagan').style.display = "none";
                }
                if (firstName === '' || !reg.test(firstName))
                {
                    document.getElementById('validateName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateName').style.display = "none";
                }
                if (lastName === '' || !reg.test(lastName))
                {
                    document.getElementById('validateName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateName').style.display = "none";
                }
                if (height === "0")
                {
                    document.getElementById('validateHeight').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateHeight').style.display = "none";

                }
//                if (mobile === "")
//                {
//                    document.getElementById('validateMobile').style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById('validateMobile').style.display = "none";
//                }
//                if (!regMob.test(mobile) && mobile !== "")
//                {
//                    document.getElementById('validateMobile').style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById('validateMobile').style.display = "none";
//                }
//                return false;
                if (confirm("Are you sure you want to create a new profile?"))
                {
                    return true;
                } else {
                    return false;
                }


            }
            jQuery(function () {

                $("#country").autocomplete("List.jsp");

            });

            function check()
            {
                var contact = document.getElementById('country').value;
                var contactList = document.getElementById('contactList').value;
                if (contactList === "")
                {
                    contactList = contact;
                } else {
                    contactList = contactList + "," + contact;
                }
                document.getElementById('contactList').value = contactList;



                document.getElementById('country').value = "";
                return false;
            }
            function fetchCityList(id)
            {
                $.ajax({
                    type: "post",
                    url: "fetchCityListNew",
                    data: "countryId=" + id,
                    success: function (html) {
                        document.getElementById("citySelectDiv").innerHTML = html;
                       
                    }
                });
            }
        </script>
        <script>
            function verifyContact()
            {
                var email = document.getElementById('email').value;
                alert(email);
                $.ajax({
                    type: "post",
                    url: "isAddressValid",
                    data: "email=" + email,
                    success: function (html) {

                    }, error: function ()
                    {
//            alert("Please try later");
                    }
                });
            }
        </script>
        <style>
            .validation{

            }
            ac_results {
                padding: 0px;
                border: 1px solid #aeabab;
                background-color: #aeabab;
                overflow: hidden;
            }
            .ac_results ul {
                width: 100%;
                list-style-position: outside;
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .ac_results li {
                margin: 0px;
                padding: 2px 5px;
                cursor: default;
                display: block;
                color: #fff;
                font-family:verdana;background-color: #aeabab; cursor: pointer;border-bottom: 1px dashed #ccc;
                /*
                if width will be 100% horizontal scrollbar will apear
                when scroll mode will be used
                */
                /*width: 100%;*/
                font-size: 12px;
                /*
                it is very important, if line-height not setted or setted
                in relative units scroll will be broken in firefox
                */
                line-height: 16px;
                overflow: hidden;
            }
            .ac_results li:hover{background-color: #e0e0e0;
                                 color: #888;}
            .ac_loading {
                background: white url('../images/indicator.gif') right center no-repeat;
            }
            .ac_odd {
                background-color: #fcc300;
                color: #ffffff;
            }
            .ac_over {
                background-color: #fcc300;
                color: #000;
            }
            .input_text{
                font-family:Arial, Helvetica, sans-serif;
                font-size:12px;
                border:1px solid #84a10b;
                padding:2px;
                width:150px;
                color:#000;
                background:white url(../images/search.png) no-repeat 3px 2px;
                padding-left:17px;
            }
        </style>
    </head>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row marginTOP">
                        <form method="post" action="createContact">

                            <!--                            <div class="col-lg-12">      
                                                        <div class="formDATA formDataWidth">
                                                            <div class="controlsData">-->
                            <label style="color:red!important;width:100%!important; text-align: center">${message}</label>
                            <!--                                </div>
                                                        </div>
                                                        </div>-->

                            <div class="col-lg-12">
                                <div><h3>Add New Member (Lead)</h3></div>
                                <div class="acHead"><span>Account Information</span></div>
                                <section>
                                    <div class="formDATA formDataWidth">
                                        <label >Your Email Address<span style="color:red">*</span></label>
                                        <div class="controlsData">
                                            <input placeholder="Your Email Address" type="email" name="contact.email" value="${contact.email}" id="email">
                                            <label id="validateEmail" style="color:red!important;display:none!important; width:100%!important;">Please enter valid email</label>
                                            <div id="searchButton" class="searchprofileButtonDiv"  >
                                                <!--<a class="btn btn-primary"  value="Verify" onclick="verifyContact()">Search</a>-->

                                            </div>
                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label >Password<span style="color:red">*</span></label>
                                        <div class="controlsData">
                                            <input  style="display:inline-block!important;width:95%!important; text-transform: none!important;" class="password" placeholder="Password" type="password" name="contact.password" value="${contact.password}" id="password"/>
                                            <!--<input  style="display:inline-block!important;width:5%!important" type="checkbox" id="showHide" onclick="showPassword()">-->
                                            <label   style="color:red!important;display:none!important; width:100%!important;" id="validatePassword">Please enter valid password</label>
                                        </div>
                                    </div>
                                    <!--                                    <div class="formDATA formDataWidth">
                                                                            <label  >Confirm Password<span style="color:red">*</span></label>
                                                                            <div class="controlsData">
                                                                                <input  style="display:inline-block!important;width:95%!important" placeholder="Confirm Password" type="password"  id="confirmPassword"><input  style="display:inline-block!important;width:5%!important" type="checkbox" id="showHide1" onclick="showPassword1()">
                                                                                <label   style="color:red!important;display:none!important; width:100%!important;" id="validateConfirmPassword">Both passwords must be same</label>
                                                                            </div>
                                                                        </div>-->
                                </section>
                            </div>
                            <div class="col-lg-12">
                                <div class="acHead"><span>Communication Information</span></div>
                                <section>
                                    <div class="formDATA formDataWidth">
                                        <label>Profile created by <span style="color:red">*</span></label>
                                        <div class="controlsData profileSelectDiv">
                                            <select name="contact.createdBy" id="createdBy" value="${contact.createdBy}">
                                                <option value="" ${contact.createdBy==""?'selected':''}>Select</option>
                                                <option value="Self" ${contact.createdBy=="Self"?'selected':''}>Self</option>
                                                <option value="Parent/Guardian" ${contact.createdBy=="Parent/Guardian"?'selected':''}>Parent/Guardian</option>
                                                <option value="Sibling" ${contact.createdBy=="Sibling"?'selected':''}>Sibling</option>
                                                <option value="Friend" ${contact.createdBy=="Friend"?'selected':''}>Friend</option>
                                                <option value="Other" ${contact.createdBy=="Other"?'selected':''}>Other</option>
                                            </select>
                                            <label  style="color:red!important;display:none!important; width:100%!important;" id="validateCreatedBy">Please select profile created by
                                        </div>
                                    </div>


                                    <div class="formDATA formDataWidth">
                                        <label>Mobile Number <span style="color:red">*</span></label>
                                        <div class="controlsData">
                                            <input placeholder="Mobile Number" type="text" name="contact.telephoneSubhlagan" value="${contact.telephoneSubhlagan}" id="telephoneSubhlagan">
                                            <label style="color:red!important;display:none!important; width:100%!important;" id="validatetelephoneSubhlagan">Please enter mobile number</label>
                                        </div>
                                    </div>



                                </section>
                            </div>
                            <div class="col-lg-12">
                                <div class="acHead"><span>Profile Details</span></div>
                                <section>

                                    <div class="formDATA formDataWidth">
                                        <label>Name<span style="color:red">*</span></label>
                                        <div class="controlsData fullnameDiv">
                                            <input placeholder="First Name" type="text" id="firstName" name="contact.firstName" value="${contact.firstName}" style="width: 31%!important;"/>
                                            <input placeholder="Middle Name" type="text" id="middleName" name="contact.middleName" value="${contact.middleName}" style="width: 32%!important;"/>
                                            <input placeholder="Last Name" type="text" id="lastName" name="contact.lastName" value="${contact.lastName}" style="width: 32%!important;"/>
                                            <label  style="color:red!important;display:none!important; width:100%!important;" id="validateName">Please enter first and last name
                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Country</label>
                                        <div class="controlsData countrySelectDiv">
                                            <s:select list="countryList" tabindex="4" headerKey="0" headerValue="Country" listKey="countryId" listValue="countryName" id="countryId"  name="contact.countryId" value="%{contact.countryId}" onchange="fetchCityList(this.value)"></s:select>
                                                <!--<option value="0">Country</option>-->
                                            <%--<s:iterator value="countryList" id="countryListId">--%>
                                                <!--<option value="${countryListId.countryId}">${countryListId.countryName}</option>-->
                                            <%--</s:iterator>--%>   

                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>City</label>
                                        <div class="controlsData countrySelectDiv" id="citySelectDiv">
                                            <s:select list="cityList" headerKey="0" headerValue="City" listKey="cityId" listValue="cityName" name="contact.cityId" value="%{contact.cityId}" id="cityId"></s:select>
                                            </div>
                                        </div>

                                        <div class="formDATA formDataWidth">
                                            <label/>Caste</label>
                                            <div class="controlsData countrySelectDiv">
                                            <s:select list="communityList" headerKey="0" headerValue="SELECT CASTE" listKey="communityId" listValue="communityName" tabindex="1"  id="communityId" name="contact.communityId" value="%{contact.communityId}" >
                                                <!--<option value="0">select category</option>-->
                                                <%--<s:iterator value="communityList" id="communityListId">--%>
                                                    <!--<option value="${communityListId.communityId}">${communityListId.communityName}</option>-->
                                                <%--</s:iterator>--%>   
                                            </s:select>
                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Mobile Number</label>
                                        <div class="controlsData">
                                            <input placeholder="Mobile Number" type="text" name="contact.mobile" value="${contact.mobile}" id="mobile">
                                            <label style="color:red!important;display:none!important; width:100%!important;" id="validateMobile">Please enter mobile number</label>
                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Gender</label>
                                        <div class="controlsData genderOptionsDiv"  >
                                            <input type="radio" checked="true" name="contact.gender" value="M"> Male
                                            <input type="radio" name="contact.gender" value="F" name="contact.gender"> Female<!--
                                            <input type="text" id="gender" name="contact.gender"/>-->
                                            <%--<s:radio name="contact.gender" list="#{'M':'Male','F':'Female'}" value="M"  />--%>


                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Date Of Birth</label>
                                        <div class="controlsData">
                                            <select  tabindex="5"  id="dayString" name="contact.dayString" value="${contact.dayString}" style="width: 32%!important;display: inline-block;">
                                                <s:iterator value="daysList" id="daysListId">
                                                    <option value="${daysListId.baseId}">${daysListId.baseValue}</option>
                                                </s:iterator>   
                                            </select>
                                            <select  tabindex="5"  id="monthString" name="contact.monthString" value="${contact.monthString}" style="width: 33%!important;display: inline-block;">
                                                <s:iterator value="monthList" id="monthListId">
                                                    <option value="${monthListId.baseId}">${monthListId.baseValue}</option>
                                                </s:iterator>   
                                            </select>

                                            <!--<select  tabindex="5"  id="yearString" name="contact.yearString" value="${contact.yearString}"  style="width: 33%!important;display: inline-block;">-->

                                            <select  tabindex="5"  id="yearString" name="contact.yearString"   style="width: 32%!important;display: inline-block;">

                                                <s:iterator value="yearList" id="yearListId">
                                                    <option value="${yearListId.baseValue}">${yearListId.baseValue}</option>
                                                </s:iterator>   
                                            </select>

                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Height</label>
                                        <div class="controlsData fullnameDiv">
                                            <select  id="heightId" tabindex="5"  name="contact.heightString" value="${contact.heightString}">
                                                <option value="0">Select Height</option>
                                                <s:iterator value="heightList" id="heightListId">
                                                    <option value="${heightListId.baseId}">${heightListId.baseValue}</option>
                                                </s:iterator>   
                                            </select>
                                            <label  style="color:red!important;display:none!important; width:100%!important;" id="validateHeight">Please select height</label>
                                        </div>
                                    </div>
                                    <div class="formDATA formDataWidth">
                                        <label>Marital Status</label>
                                        <div class="controlsData genderOptionsDiv">
                                            <input type="radio" name="contact.maritalStatus" value="Never Married" checked="true" id="maritalStatus1" > Never Married
                                            <input type="radio" name="contact.maritalStatus" value="Divorced"> Divorced
                                            <input type="radio" name="contact.maritalStatus" value="Widowed"> Widowed<!--
                                            <input type="text" id="maritalStatus" name="contact.maritalStatus"/>-->
                                            <%--<s:radio   name="contact.maritalStatus" list="#{'Never Married':'Never Married','Divorced':'Divorced','Widowed':'Widowed'}"  />--%>
                                        </div>
                                    </div>

                                    <div class="formDATA formDataWidth">
                                        <label>Divyang</label>
                                        <div class="controlsData genderOptionsDiv">
                                            <input type="radio" name="contact.divyangFlag" value="0" checked="true" id="divyang" > No
                                            <input type="radio" name="contact.divyangFlag" value="1"> Yes                                      
                                        </div>
                                    </div>

                                    <div class="formDATA formDataWidth">
                                        <label>Restricted Profile</label>
                                        <div class="controlsData">
                                            <input style="display: inline-block;width: 33%!important;" type="text" id="country"  class="input_text" /><button class="btn btn-primary" onclick="return check()"> Add</button>
                                            <textarea style="display: inline-block;width: 57%;height: 100px!important;"  id="contactList" name="contact.sameFamily" rows="10" cols="10">${contact.sameFamily}</textarea>
                                        </div>
                                    </div>
                                    <!--                                    <div class="ui-widget">
                                                                            <p>Type "a" or "s"</p>
                                                                            <label for="automplete-1">Tags: </label>
                                                                            <input id="automplete-1">
                                                                            <input id="sffnextDate">
                                                                        </div>-->
                                    <div class="formDATA  formHalf pull-right">
                                        <input type="submit" value="submit" onclick="return addUser()" class="btn btn-save" />
                                        <input type="reset" value="Reset" onclick="" class="btn btn-save" />
                                        <a href="${pageContext.request.contextPath}/Profile/profileList"><input type="cancel" value="cancel" onclick="" class="btn btn-save" style="width: 100px"/></a>
                                    </div>
                                </section>
                            </div>
                        </form>
                    </div>
                </section>
            </section><!--MAIN CONTENT ENDS-->

        </section><!--Section Ends - Page ends-->

        <s:include value="/includes/footer.jsp" /><!--FOOTER-->



        <!-- ==========================================Use in every page - this is for bootstrap =============================================== -->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
        <!--[if lt IE 9]>
          <script src="js/html5shiv.js"></script>
          <script src="js/respond.min.js"></script>
          <script src="js/lte-ie7.js"></script>
        <![endif]-->

        <!-- javascripts -->
        <!--<script src="../js/jquery.js"></script>-->


        <script src="../js/bootstrap.min.js"></script>

        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="../js/scripts.js"></script>
        <script type="text/javascript" src="../js/nicEdit-latest.js"></script>
        <script type="text/javascript">

//                                            bkLib.onDomLoaded(function () {
//                                                nicEditors.allTextAreas();
//                                                alert("Inside");
//                                            });
                                            function showPassword()
                                            {
                                                var showHide = document.getElementById('showHide').checked;
                                                var tag2 = document.getElementById("password");
                                                if (showHide === true)
                                                {
                                                    tag2.setAttribute('type', 'text');
                                                    tag2.innerHTML = 'Hide';
                                                } else {
                                                    tag2.setAttribute('type', 'password');
                                                    tag2.innerHTML = 'Show';
                                                }
                                            }
                                            function showPassword1()
                                            {
                                                var showHide = document.getElementById('showHide1').checked;
                                                var tag2 = document.getElementById("confirmPassword");
                                                if (showHide === true)
                                                {
                                                    tag2.setAttribute('type', 'text');
                                                    tag2.innerHTML = 'Hide';
                                                } else {
                                                    tag2.setAttribute('type', 'password');
                                                    tag2.innerHTML = 'Show';
                                                }
                                            }

                                            $(document).ready(function () {

                                            });

        </script>

    </body>
</html>

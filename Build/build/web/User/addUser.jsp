<%-- 
    Document   : profileList
    Created on : 12 Mar, 2016, 12:53:44 PM
    Author     : OpenSpace004
--%>
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <!-- checkbox styling script -->
        <script type="text/javascript">


            //Validation Form

            function addUser()
            {
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;
                var confirmPassword = document.getElementById('confirmPassword').value;
                var contactName = document.getElementById('contactName').value;
                var shortName = document.getElementById('shortName').value;
                var mobile = document.getElementById('mobile').value;
                var serverName = document.getElementById('serverName').value;
                var port = document.getElementById('port').value;
                var userName = document.getElementById('userName').value;
                var serverPassword = document.getElementById('serverPassword').value;
                var modulePer = document.getElementById('modulePer').value;
                var status = document.getElementById('status').value;
                var officeListid = document.getElementById('officeListId').value;
                var deptListId = document.getElementById('deptListId').value;
                var datepicker = document.getElementById('datepicker').value;
//                var height = document.getElementById('heightId').value;   
                var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var reg = /^[a-zA-Z]*$/;
                var regMob = /^\d{10,15}$/;

                if (officeListid == 0)
                {
                    document.getElementById('validateOfficeListId').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateOfficeListId').style.display = "none";
                }
//                
                if (deptListId == 0)
                {
                    document.getElementById('validateDeptListId').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateDeptListId').style.display = "none";
                }
//                
                if (contactName === '')
                {
                    document.getElementById('validateContactName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateContactName').style.display = "none";
                }

                if (shortName === '')
                {
                    document.getElementById('validateShortName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateShortName').style.display = "none";
                }

                if (!regEmail.test(email))
                {
                    document.getElementById('validateEmail').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateEmail').style.display = "none";
                }

                if (mobile === '')
                {
                    document.getElementById('validateMobile').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateMobile').style.display = "none";
                }

                if (password === '')
                {
                    document.getElementById('validatePassword').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePassword').style.display = "none";
                }

                if (password !== confirmPassword)
                {
                    document.getElementById('validateConfirmPassword').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateConfirmPassword').style.display = "none";
                }
                
                 if (serverName === '')
                {
                    document.getElementById('validateServerName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateServerName').style.display = "none";
                }

//                if (!regEmail.test(serverName))
//                {
//                    document.getElementById('validateServerName').style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById('validateServerName').style.display = "none";
//                }

                if (port === '')
                {
                    document.getElementById('validatePort').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePort').style.display = "none";
                }


                if (!regEmail.test(userName))
                {
                    document.getElementById('validateUserName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateUserName').style.display = "none";
                }
//                if (userName !== email)
//                {
//                    document.getElementById('validateUserName').style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById('validateUserName').style.display = "none";
//                }

                if (serverPassword === '')
                {
                    document.getElementById('validateSPassword').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateSPassword').style.display = "none";
                }

                if (modulePer === '')
                {
                    document.getElementByd('validateModulePer').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateModulePer').style.display = "none";
                }

                if (status == (-1))
                {
                    document.getElementById('validateStatus').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateStatus').style.display = "none";
                }

                if (datepicker === '')
                {
                    document.getElementById('validateDate').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateDate').style.display = "none";
                }
                return true;
            }

            //Form Validation Completed...
            function getRMList(officeId)
            {
//                alert("Here" + officeId);
                $.ajax({
                    type: "post",
                    url: "getRMList",
                    data: "officeId=" + officeId,
                    success: function (html) {
                        document.getElementById("rmListId").innerHTML = html;

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
                            <!--copy till here-->


                            <div class="row">
                                <div class="col-lg-12" >
                                    <form action="saveUser" method="post" id="formId">
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span>Location Information</span></div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Office</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="officeListId"
                                                              list="offList" listKey="officeId"  listValue="officeName" 
                                                              name="userMaster.officeId" value="%{officeId}" cssStyle="width:190px;" onchange="getRMList(this.value)"/>

                                                    <label id="validateOfficeListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Department</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="deptListId"
                                                              list="deptList" listKey="deptId"  listValue="deptName" 
                                                              name="userMaster.deptId" value="%{deptId}" cssStyle="width:190px;"/>
                                                    <label id="validateDeptListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>RM</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="rmListId"
                                                              list="rmList" listKey="rmId"  listValue="rmName" 
                                                              name="userMaster.rmId" value="%{rmId}" cssStyle="width:190px;"/>
                                                    <!--<label id="validateDeptListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>--> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span>Access Information</span></div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Contact name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.name" id="contactName"/>
                                                    <label id="validateContactName" style="color:red!important;display:none!important; width:100%!important;">Please enter  name</label>  
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Email</label>
                                                <div class="controlsData">
                                                    <input type="email" name="userMaster.userName" id="email"/>
                                                    <label id="validateEmail" style="color:red!important;display:none!important; width:100%!important;">Please enter valid email</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Password</label>
                                                <div class="controlsData">
                                                    <input type="password" name="userMaster.password" id="password"/>
                                                    <label id="validatePassword" style="color:red!important;display:none!important; width:100%!important;">Please enter Password</label> 
                                                </div>
                                            </div>
                                        </section>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Short name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.shortName" id="shortName" maxlength="3"/>
                                                    <label id="validateShortName" style="color:red!important;display:none!important; width:100%!important;">Please enter Short name</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Mobile/Tel.</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.mobile" id="mobile"/>
                                                    <label id="validateMobile" style="color:red!important;display:none!important; width:100%!important;">Please enter Mobile/Tel number</label>  
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Confirm Password</label>
                                                <div class="controlsData">
                                                    <input type="password" name="userMaster.confirmPassword" id="confirmPassword"/>
                                                    <label id="validateConfirmPassword" style="color:red!important;display:none!important; width:100%!important;">Confirm password should be same as Password</label>   
                                                </div>
                                            </div>

                                        </section>
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span>Email Server Details</span></div>
                                        </div>
                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>SMTP Host Name</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.host" id="serverName" />
                                                    <label id="validateServerName" style="color:red!important;display:none!important; width:100%!important;">Can not be Empty</label>     
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label>Rm Server Name</label>
                                                <div class="controlsData">
                                                    <input type="email" name="userMaster.serverUserName" id="userName"/>
                                                    <label id="validateUserName" style="color:red!important;display:none!important; width:100%!important;">Please enter valid email </label>
                                                </div>
                                            </div>


                                        </section>

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Port</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.port" id="port"/>
                                                    <label id="validatePort" style="color:red!important;display:none!important; width:100%!important;">Please enter port</label>
                                                </div>
                                            </div>
                                            <div class="formDATA">
                                                <label> Rm Server Password</label>
                                                <div class="controlsData">
                                                    <input type="password" name="userMaster.serverPassword" id="serverPassword"/>
                                                    <label id="validateSPassword" style="color:red!important;display:none!important; width:100%!important;">Please Enter Server Password </label>
                                                </div>
                                            </div>


                                        </section>
                                        <div class="formHEADDiv whiteBG">
                                            <div class="formHead"><span>Rights And Permission</span></div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">
                                                    <input type="checkbox" name="userMaster.assigned" value="1" id="assigned"/>&nbsp;&nbsp;Assigned
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">
                                                    <input type="checkbox" name="userMaster.unassigned" value="1" id="unassigned"/>&nbsp;&nbsp;Unassigned
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">
                                                    <input type="checkbox" name="userMaster.all" value="1" id="all"/>&nbsp;&nbsp;All
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">
                                                    <input type="checkBox" name="userMaster.kundaliper" value="1" id="kundaliPer"/>&nbsp;&nbsp; Kundali Permission 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">
                                                    <input type="checkBox" name="userMaster.pauseper" value="1" id="pausePer"/>&nbsp;&nbsp; Pause Permission
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <div class="controlsData">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Module Permission</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0"  cssClass="input_box"  id="modulePer"
                                                              multiple="true"  size="6"   list="moduleList" listKey="moduleId"  listValue="moduleName" 
                                                              name="userMaster.moduleaccess" value="%{moduleaccess}" style="height:90px!important;"/>

                                                    <label id="validateModulePer" style="color:red!important;display:none!important; width:100%!important;">Please Select At Least One </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Status</label>
                                                <div class="controlsData">
                                                    <select name="userMaster.status" id="status">
                                                        <option value="-1">--Status--</option>
                                                        <option value="1">Active</option>
                                                        <option value="0">InActive</option></select>
                                                    <label id="validateStatus" style="color:red!important;display:none!important; width:100%!important;">Please Select At Least One </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="formDATA">
                                                <label>Expiry Date</label>
                                                <div class="controlsData">
                                                    <input type="text" name="userMaster.expiryDate" id="datepicker" />
                                                    <label id="validateDate" style="color:red!important;display:none!important; width:100%!important;">Please enter Date</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="formEdit" style="margin-right: 18px;margin-top: 18px;"><input type="submit" class="btn btn-primary saveBtn" value="submit" onclick="return addUser()"/></div>

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
        <script src="../js/bootstrap-wysiwyg.js"></script>
        <script src="../js/bootstrap-wysiwyg-custom.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->               
        <script src="../js/scripts.js"></script>



    </body>

    <script src="../js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">

                                            $(document).ready(function () {
                                                $('#datepicker').datepicker({
                                                    format: "dd/mm/yyyy",
                                                });
                                            });

    </script>
</html>

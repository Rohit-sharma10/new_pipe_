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
                alert(modulePer);
                var status = document.getElementById('status').value;
                var officeListid = document.getElementById('officeListId').value;
                var deptListId = document.getElementById('deptListId').value;
                var datepicker = document.getElementById('datepicker').value;
//                var height = document.getElementById('heightId').value;   
                var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                var reg = /^[a-zA-Z]*$/;
                var regMob = /^\d{10,15}$/;

                if (officeListid === '')
                {
                    document.getElementById('validateOfficeListId').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateOfficeListId').style.display = "none";
                }
//                
                if (deptListId === '')
                {
                    document.getElementById('validateDeptListId').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateDeptListId').style.display = "none";
                }
//                
                if (contactName === '' || !reg.test(contactName))
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

                if (!regMob.test(mobile))
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

                if (!regEmail.test(serverName))
                {
                    document.getElementById('validateServerName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateServerName').style.display = "none";
                }

                if (port === '')
                {
                    document.getElementById('validatePort').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validatePort').style.display = "none";
                }

                if (userName !== email)
                {
                    document.getElementById('validateUserName').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateUserName').style.display = "none";
                }

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

                if (status === '')
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
                       document.getElementById("rmListId").innerHTML=html;
                       
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
                                        <table align="center"  border="0" cellspacing="0" width="80%">                                                                                
                                            <tr><td colspan="4">Location Information</td></tr>
                                            <tr><td colspan="4" style="height: 7px;"></td>
                                            </tr>
                                            <tr>

                                                <th>Office</th>
                                                <td> <s:select headerKey="" headerValue="--- Select ---" cssClass="input_box" id="officeListId"
                                                          list="offList" listKey="officeId"  listValue="officeName" 
                                                          name="userBeans.officeId" value="%{officeId}" cssStyle="width:190px;" onchange="getRMList(this.value)"/>

                                                    <label id="validateOfficeListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>                                

                                                </td>
                                                <th>Department</th>   
                                                <td><s:select headerKey="" headerValue="--- Select ---" cssClass="input_box" id="deptListId"
                                                          list="deptList" listKey="deptId"  listValue="deptName" 
                                                          name="userBeans.deptId" value="%{deptId}" cssStyle="width:190px;"/>
                                                    <label id="validateDeptListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>                                

                                                </td>
                                            <tr>
                                            <tr>
                                                <th>RM</th>   
                                                <td id="rmTd"><s:select headerKey="" headerValue="--- Select ---" cssClass="input_box" id="rmListId"
                                                          list="rmList" listKey="rmId"  listValue="rmName" 
                                                          name="userBeans.rmId"  cssStyle="width:190px;"/>
                                                    <!--<label id="validateDeptListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>-->                                

                                                </td>
                                            </tr>

                                            <tr><td colspan="4">Access Information</td></tr>
                                            <tr>
                                                <th>Contact name</th>
                                                <td><input type="text" name="userBeans.name" id="contactName"/>
                                                    <label id="validateContactName" style="color:red!important;display:none!important; width:100%!important;">Please enter  name</label>                                
                                                </td>
                                                <th>Short name</th>
                                                <td><input type="text" name="userBeans.shortName" id="shortName" maxlength="3"/>
                                                    <label id="validateShortName" style="color:red!important;display:none!important; width:100%!important;">Please enter Short name</label>
                                                </td> 

                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td><input type="text" name="userBeans.userName" id="email"/>
                                                    <label id="validateEmail" style="color:red!important;display:none!important; width:100%!important;">Please enter valid email</label>
                                                </td>
                                                <th>Mobile</th>
                                                <td><input type="text" name="userBeans.mobile" id="mobile"/>
                                                    <label id="validateMobile" style="color:red!important;display:none!important; width:100%!important;">Please enter Mobile number</label>                       
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Password</th>
                                                <td><input type="password" name="userBeans.password" id="password"/>
                                                    <label id="validatePassword" style="color:red!important;display:none!important; width:100%!important;">Please enter Password</label>                        
                                                </td>
                                                <th>Confirm Password</th>
                                                <td><input type="password" name="userBeans.confirmPassword" id="confirmPassword"/>
                                                    <label id="validateConfirmPassword" style="color:red!important;display:none!important; width:100%!important;">Confirm password should be same as Password</label>                       
                                                </td>
                                            </tr>
                                            <tr><td>Email Server Details</td></tr>
                                            <tr>
                                                <th>SMTP Server Name</th>
                                                <td><input type="text" name="userBeans.serverUserName" id="serverName" />
                                                    <label id="validateServerName" style="color:red!important;display:none!important; width:100%!important;">Please enter valid SMTP server email</label>                      
                                                </td>
                                                <th>Port</th>
                                                <td><input type="text" name="userBeans.port" id="port"/>
                                                    <label id="validatePort" style="color:red!important;display:none!important; width:100%!important;">Please enter port</label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>User Name</th>
                                                <td><input type="text" name="userBeans.userName" id="userName"/>
                                                    <label id="validateUserName" style="color:red!important;display:none!important; width:100%!important;">user name should be same as Email </label>
                                                </td>
                                                <th>Password</th>
                                                <td><input type="password" name="userBeans.serverPassword" id="serverPassword"/>
                                                    <label id="validateSPassword" style="color:red!important;display:none!important; width:100%!important;">Please Enter Server Password </label>
                                                </td>
                                            </tr>
                                        </table>
                                        <table align="center"  border="0" cellspacing="0" width="80%">
                                            <tr><td colspan="3">Rights And Permission</td></tr>
                                            <tr><td>
                                                    <input type="checkbox" name="userBeans.assigned" value="1" id="assigned"/>&nbsp;&nbsp;Assigned
                                                </td>
                                                <td>
                                                    <input type="checkbox" name="userBeans.unassigned" value="1" id="unassigned"/>&nbsp;&nbsp;Unassigned
                                                </td>
                                                <td>
                                                    <input type="checkbox" name="userBeans.all" value="1" id="all"/>&nbsp;&nbsp;All
                                                </td>
                                            </tr>
                                            <tr><td>Kundali Permission &nbsp;&nbsp;<input type="checkBox" name="userBeans.kundaliper" value="1" id="kundaliPer"/></td>
                                                <td></td>
                                                <td>Pause Permission &nbsp;&nbsp;<input type="checkBox" name="userBeans.pauseper" value="1" id="pausePer"/></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Module Permission &nbsp;&nbsp;&nbsp;&nbsp;                                              
                                                </td>
                                                <td> <s:select headerKey=""  cssClass="input_box"  id="modulePer"
                                                          multiple="true"  size="6"   list="moduleList" listKey="moduleId"  listValue="moduleName" 
                                                          name="userBeans.moduleaccess" value="%{moduleaccess}" cssStyle="width:190px;"/>

                                                    <label id="validateModulePer" style="color:red!important;display:none!important; width:100%!important;">Please Select At Least One </label>

                                                </td>


                                                <td> Status</td>
                                                <td>
                                                    <select name="userBeans.status" id="status">
                                                        <option value="">--Status--</option>
                                                        <option value="0">Active</option>
                                                        <option value="1">InActive</option></select>
                                                    <label id="validateStatus" style="color:red!important;display:none!important; width:100%!important;">Please Select At Least One </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Expiry Date</td>
                                                <td><input type="text" name="userBeans.expiryDate" id="datepicker" />
                                                    <label id="validateDate" style="color:red!important;display:none!important; width:100%!important;">Please enter Date</label>
                                                </td>
                                            </tr>
                                        </table >
                                        <table align="center"  border="0" cellspacing="0" width="80%">
                                            <tr>
                                                <td Colspan="4"><input type="submit" value="submit" onclick="return addUser()"/></td>
                                            </tr>
                                        </table>    

                                        <%--</s:iterator>--%>
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
    <script>
                                                    $(function () {
                                                        $("#datepicker").datepicker({dateFormat: 'dd-mm-yy'});
                                                    });


    </script>
</html>

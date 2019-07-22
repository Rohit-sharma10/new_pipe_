<%-- 
    Document   : profileList
    Created on : 25 Nov, 2016, 10:53:44 AM
    Author     : OpenSpace004
--%>
<!DOCTYPE html>

<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page buffer = "100kb" %>
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
        <script type="text/javascript">
            jQuery(function () {
                $("#txtAutoComplete").autocomplete("List1.jsp");
//                 $("#txtAutoComplete").autocomplete("List.jsp");

            });
            $('#txtAutoComplete').on('change', function () {
                $('#tagsname').html('You selected: ' + this.value);
            }).change();



            function getProfileListForArm(armId)
            {
                var searchValue = 0;
                $.ajax({
                    type: "post",
                    url: "getProfileListForArm",
                    data: "armId=" + armId + "&searchValue=" + searchValue,
                    success: function (html)
                    {
                        var temp = html.split("__");
                        document.getElementById("transferProfileListDiv").innerHTML = temp[0];
                        document.getElementById("toArm").innerHTML = "";
                        document.getElementById("toArmDiv").innerHTML = temp[1];
                        $("#searchButtonId").show();
                        $("#txtAutoComplete").show();
                    }
                });
            }

            function updateTransferProfileCheck()
            {
                var toArm = document.getElementById('toArm').value;
                if (toArm == 0)
                {
                    alert("Please Select ARM to Transfer");
                    return false;
                }
            }
            function checkAll()
            {
                $("#select_all").change(function () {
                    var status = this.checked; // "select all" checked status
                    $('.boxToCheck').each(function () { //iterate all listed checkbox items
                        this.checked = status; //change ".checkbox" checked status
                    });
                });
            }
            function searchProfileToTransfer(e)
            {
                e.preventDefault();
                var armId = $("#armListId").val();
                var searchValue = $("#txtAutoComplete").val();
                $.ajax({
                    type: "post",
                    url: "getProfileListForArm",
                    data: "armId=" + armId + "&searchValue=" + searchValue,
                    success: function (html)
                    {
                        var temp = html.split("__");
                        document.getElementById("transferProfileListDiv").innerHTML = "";
                        document.getElementById("transferProfileListDiv").innerHTML = temp[0];
                    }
                });
            }

            function reverseCheck() {
                $('.boxToCheck').change(function () {
                    if (this.checked == false) { //if this item is unchecked
                        $("#select_all")[0].checked = false; //change "select all" checked status to false
                    }
                    if ($('.boxToCheck:checked').length == $('.boxToCheck').length) {
                        $("#select_all")[0].checked = true; //change "select all" checked status to true
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

                    <div class="row">

                        <!--copy till here-->

                        <form action="updateTransferProfile" method="post" id="searchFrm">  
                            <h4>Transfer Profile</h4>



                            <div class="col-lg-12 marginTOP">
                                <div class="col-lg-6">
                                    <div class="formDATA">
                                        <div class="controlsData">

                                            <s:select headerKey="0" headerValue="--- SELECT FROM  ARM (Transfer) ---" cssClass="input_box" id="armListId"
                                                      list="armList" listKey="userId"  listValue="userName" 
                                                      name="masterBean.fromArmId" value="%{masterBean.fromArmId}" onchange="getProfileListForArm(this.value)"/>                                               
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="formDATA">
                                        <div class="controlsData" id="toArmDiv">

                                            <s:select headerKey="0" headerValue="--- SELECT TO ARM (Receive) ---" cssClass="input_box" id="toArm"
                                                      list="armList" listKey="userId"  listValue="userName" 
                                                      name="masterBean.toArmId" value="%{masterBean.toArmId}"/>                                               
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <span  ><h4 style="width: 50%; color: red; text-align: center">${messageKey}</h4></span>

                            <div class="row">                 

                                <div class="col-sm-12">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-6">


                                        <div class="formDATA">
                                            <div class="controlsData controlWidth">
                                                <input  type="text" id="txtAutoComplete" style="display:none" class="input_text" Placeholder="Name"/>
                                                <div id="tagsname"></div>
                                            </div>
                                        </div>              
                                        <div class="col-sm-12 ">
                                            <div class="formDATA" align="center"><button value="search" class="btn btn-primary" id="searchButtonId" style="display:none" onclick="searchProfileToTransfer(event);">Search</button>
                                            </div>       </div> 


                                        <div class="tab-content table-align" id="transferProfileListDiv">

                                        </div>
                                    </div>
                                    <div class="col-sm-3"></div>
                                </div></div>
                            <div class="row">
                                <div class="col-sm-12 ">
                                    <div class="formDATA" align="center"><button value="search" class="btn btn-primary" onclick="return updateTransferProfileCheck();">Transfer</button>
                                    </div>       </div>                       
                            </div>
                        </form>
                        <!--copy from here-->
                    </div>

                </section>
            </section>
        </section>
        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <!--<script src="../js/jquery.js"></script>-->
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>
        <script>
//            $(".content").on('click', function () {
//                var contactId = $(this).attr('payment');
//                $.ajax({
//                    type: "post",
//                    url: "getPaymentContent",
//                    data: "contactId=" + contactId,
//                    success: function (html)
//                    {
//                        if (html)
////                            var splithtml=html.split("___");
////                            $('.tab-subject').html("  Subject : "+splithtml[0]+"<br><br>");
//                            $('.tab-content').html(html);
//                    }
//                });
//            });

                                        $(function ()
                                        {
                                            $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                                            $("#toDate").datepicker({format: 'dd/mm/yyyy'});
                                        });

                                        //            $(function () {
//                /* #txt is display table id & employee_search_ class is field id which you want to filter */
//                var oTable = $('#userListId').dataTable({
//                    "bPaginate": false,
//                    "bLengthChange": false,
//                    "bFilter": true,
//                    "bSort": false,
//                    "bInfo": false,
//                    "bAutoWidth": false,
//                    "bStateSave": false
//                });
//                $("thead input").keyup(function () {
//                    oTable.fnFilter(this.value, $("thead input").index(this));
//                });
//
//                $("thead input").focus(function () {
//                    if (this.className == "employee_search_") {
//                        this.className = "";
//                        this.value = "";
//                    }
//                });
//
//                $("thead input").blur(function (i) {
//                    if (this.value == "") {
//                        this.className = "employee_search_";
//                        this.value = asInitVals[$("thead input").index(this)];
//                    }
//                }); 
//            });  auto search box commented by vineet on 

        </script>
        <script src="../js/scripts.js"></script>
    </body>
</html>

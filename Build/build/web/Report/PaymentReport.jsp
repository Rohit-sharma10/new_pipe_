<%-- 
    Document   : profileList
    Created on : 17 Nov, 2016, 12:53:44 PM
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
                $("#txtAutoComplete").autocomplete("List.jsp");
//                 $("#txtAutoComplete").autocomplete("List.jsp");

            });
            $('#txtAutoComplete').on('change', function () {
                $('#tagsname').html('You selected: ' + this.value);
            }).change();
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
                        <div class="col-lg-12 marginTOP">
                            <!--copy till here-->

                            <h4 class="candidateName">Payment Report</h4>

                            <form action="paymentReport" method="post">  

                                <div class="col-lg-2 col-select-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            
                                            <s:select headerKey="0" headerValue="--- SELECT RM---" cssClass="input_box" id="rmListId"
                                                      list="rmList" listKey="userId"  listValue="userName" 
                                                      name="paymentBean.rmId" value="%{paymentBean.rmId}"/>                                                                                        
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-select-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            
                                            <s:select headerKey="0" headerValue="--- SELECT ARM ---" cssClass="input_box" id="armListId"
                                                      list="armList" listKey="userId"  listValue="userName" 
                                                      name="paymentBean.armId" value="%{paymentBean.armId}"/>                                               
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-select-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            
                                            <s:select headerKey="0" headerValue="--- Select Office ---" cssClass="input_box" id="officeListId"
                                                      list="officeList" listKey="officeId"  listValue="officeName" 
                                                      name="paymentBean.officeId" value="%{paymentBean.officeId}"/>                                               
                                        </div>
                                    </div>
                                </div>


                                <div class="col-lg-2 col-select-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <select class="styledselect" name="paymentBean.paymentFlag">
                                                <option value="0" selected="selected">--- Payment Status ---</option>
                                                 <option value="3" ${paymentBean.paymentFlag=="3"?'selected':''}>No Payment</option>
                                                <option value="1" ${paymentBean.paymentFlag=="1"?'selected':''}>Half Payment</option>                 
                                                <option value="2" ${paymentBean.paymentFlag=="2"?'selected':''}>Full Payment</option>                                   
                                            </select>
                                        </div>
                                    </div>
                                </div> 
                                           
                                <div class="col-lg-2 col-input-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" id="txtAutoComplete" name="paymentBean.search" value="${paymentBean.search}" placeholder="Contact Name"/> 
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-input-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="paymentBean.fromDate" value="${paymentBean.fromDate}" placeholder="From Date" id="fromDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-input-widthForPayment">
                                    <div class="formDATA">
                                        <div class="controlsData controlWidth">
                                            <input type="text" name="paymentBean.toDate" value="${paymentBean.toDate}" placeholder="To Date" id="toDate"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 ">
                                    <div class="formDATA"><button value="search" class="btn btn-primary" >Search</button></div>  </div>                            
                            </form>


                            <display:table export="true"  name="paymentList"  id="paymentListId"  pagesize="25"  requestURI="" class="borderNoneTable tableBG uiTable postedTable" >                                                                                             

                                <display:column  title="Contact name" sortable="true" media="html">             
                                    <a href="getContactDetail?contactId=${paymentListId.contactId}"> ${paymentListId.fullContactName} </a>                                                                    
                                </display:column> 
                                <display:column title="Posted To " property="fullContactName" media="csv"/>
                                <display:column title="Posted To " property="fullContactName" media="excel"/>
                                <display:column  title="Reg. Charg" sortable="" property="regCharges"/> 
                                <%--<display:column  title="Tax" sortable="" property="tax"/>--%> 
                                <display:column  title="Payment Status" sortable="" property="paymentStatus"/>
                                <display:column  title="Office" sortable="" property="officeName"/>
                                <display:column  title="Inserted By" sortable="" property="userShortName"/>  
                                <display:column  title="Inserted On" sortable="" property="insertedOn"/>  
                                <display:column title="Content" sortable="" media="html" style="width:5%;text-align:left">
                                    <a href="#"  title="Payment" data-toggle="modal" data-target="#payment" class="content" payment="${paymentListId.contactId}">
                                        <img src="../img/view_detail.png"  title="Content"/></a>
                                    </display:column>                      
                                    <display:setProperty name="paging.banner.placement" value="both"/>
                                    <display:setProperty name="export.csv.include_header" value="true" />
                                    <display:setProperty name="export.csv" value="true" />
                                    <display:setProperty name="export.csv.filename" value="PaymentReport.csv"/>
                                    <display:setProperty name="export.excel.filename" value="PaymentReport.xls"/>
                                    <display:setProperty name="export.excel" value="true" />
                                    <display:setProperty name="export.xml" value="false" />
                                    <display:setProperty name="export.xml.filename" value="PaymentReport.xml"/> 
                                </display:table>
                            <div id="payment" class="modal fade" role="dialog" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Payment Status</h4>
                                        </div>
                                        <!--                                        <div class="tab-subject">
                                                                                    
                                                                                </div>-->
                                         <div class="modal-body">
                                        <div class="tab-content"  style="letter-spacing: 1px; text-align: center;height: 50%">

                                        </div>
                                             </div>
                                        <div class="modal-footer">

                                    <!--<button type="button" class="btn btn-default" data-dismiss="modal"></button>-->
                                </div>
                                    </div>
                                </div>
                            </div>
                            <!--copy from here-->
                        </div>
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
            $(".content").on('click', function () {
                var contactId = $(this).attr('payment');
                $.ajax({
                    type: "post",
                    url: "getPaymentContent",
                    data: "contactId=" + contactId,
                    success: function (html)
                    {
                        if (html)
//                            var splithtml=html.split("___");
//                            $('.tab-subject').html("  Subject : "+splithtml[0]+"<br><br>");
                            $('.tab-content').html(html);
                    }
                });
            });

            $(function ()
            {
                $("#fromDate").datepicker({format: 'dd/mm/yyyy'});
                $("#toDate").datepicker({format: 'dd/mm/yyyy'});
            });

        </script>
        <script src="../js/scripts.js"></script>
    </body>
</html>

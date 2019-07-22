<%-- 
    Document   : profileList
    Created on : 11 Mar, 2016, 4:52:02 PM
    Author     : OpenSpace004
--%>
<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="com.crm.bean.UserLogin"%>
<%@page language="java" import="com.crm.manager.ProfileManager"%>
<%@page language="java" import="com.crm.manager.DashboardManager"%>
<%@page language="java" import="java.util.List"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="s" uri="/struts-tags" %>        
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content=""></meta>
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <script type="text/javascript" src="../js/jquery.js"></script>
        <link href="css/style.css" rel="stylesheet" />
        <link href="css/style-responsive.css" rel="stylesheet" />
        <link href="css/subhlagan-style.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/datepicker.css"/>
        <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

        <script>
            function transferdata()
            {
                $.ajax({
                    type: "post",
                    url: "transferdata",
                    success: function (html) {

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
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 "><!--colwidthchange Removed class from div for all by vineet on 11-02-2017-->
                                    <div class="info-box blue-bg">

                                        <div class="count"><a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=1">
                                                <% 
  session = request.getSession(false);
  UserLogin userBean = (UserLogin) session.getAttribute("userSession");
                                       List contactList1=new DashboardManager().fetchuntouchedWithinMonthCount(userBean.getUserId(),"","",0);  //For change on manager funtion by vineet on 6-12-2016
out.println(contactList1.size());
                                                %></a></div>
                                        <div class="title">Untouch Bio – Data</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <div class="info-box brown-bg">
                                       <!--{meetingCount}-->
                                       <div class="count">${meetingListForToday.size()} / ${meetingList.size()}</a></div>
                                        <div class="title">Meeting Schedule (Today)</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->	

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 "><!--colwidthchange Removed class from div for all -->
                                    <div class="info-box dark-bg colorBG">

                                        <div class="count"><a href="${pageContext.request.contextPath}/RmReport/reportList">${profileFollowupCount}</a></div>
                                        <div class="title">Followup</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <div class="info-box green-bg">

                                        <div class="count"> <a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=9">${ntbCount}</a>
                                         
                                        </div>
                                        <div class="title">NTR - New To RM</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                                    <div class="info-box yelloBg">

                                        <div class="count"><a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=8">${paymentCount}</a></div>
                                        <div class="title">Pending Payment</div>						
                                    </div><!--/.info-box-->			
                                </div><!--/.col-->
                                <!--Added by vineet on 24-11-2016 For Two Way Accepted-->
                                 <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box green-bg"><!--

-->                                        <div class="count"><a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=10">${twoWayAcceptedCount}</a></div>
                                        <div class="title">Match Status(TwoWay Accepted)</div>						
                                    </div><!--/.info-box--> 			
                                </div><!--/.col-->


 <!--Added by vineet on 30-01-2017 For Two Way Accepted-->
                                 <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <div class="info-box yelloBg">

                                        <div class="count"><a href="${pageContext.request.contextPath}/Profile/profileList?untouchedFlag=11">${oneWayAcceptedCount}</a></div>
                                        <div class="title">Match Status(One Way Accepted)</div>						
                                    </div><!--/.info-box -->			
                                </div><!--/.col-->

                            </div><!--/.row-->
                            
                            
                            
                            <!--Meeting List For Today By Vineet -->
                            <s:if test="!meetingListForToday.isEmpty()">
                            <div class="row">

                                <div class="col-lg-12 col-md-12">	
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h2><i class="fa fa-flag-o red"></i><strong>Meeting Scheduled For Today</strong></h2>

                                        </div>
                                        <div class="panel-body">
                                            
                                            <!--</table>-->

                                            <display:table pagesize="10" name="meetingListForToday" id="meetingListForTodayId" requestURI=""  >
                                                <display:column title="Boy Name" sortProperty="boyName" sortable="true">
                                                    ${meetingListForTodayId.boyName}
                                                </display:column>
                                                <display:column title="Girl Name" sortProperty="girlName" sortable="true">
                                                    ${meetingListForTodayId.girlName}
                                                </display:column>
                                                <display:column title="Venue"  sortProperty="meetingVenue" sortable="true">
                                                    ${meetingListForTodayId.meetingVenue}
                                                </display:column>
                                                <display:column title="Time"  sortProperty="time"  sortable="true">
                                                    ${meetingListForTodayId.time}      
                                                </display:column>
                                                <display:column title="Rm / Scheduled By" sortProperty="armWorking" sortable="true">
                                                    ${meetingListForTodayId.armWorking}                  
                                                </display:column>
                                            </display:table>
                                        </div>

                                    </div>
                                    <!-- ARM Meeting Start-->
                                   
                                    <!-- ARM Meeting ends-->

                                </div><!--/col-->
                                <div class="col-md-6">
                                   
                                                                            
                                </div>



                            </div>
                            </s:if>

                            <!--Today Meeting Block Finished-->
                            
                            <!-- For Meeting and to do start-->
                            <div class="row">

                                <div class="col-lg-12 col-md-12">	
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h2><i class="fa fa-flag-o red"></i><strong>Meeting Status</strong></h2>

                                        </div>
                                        <div class="panel-body">
                                            <!--                                            <table id="example" class="table dataTable countries">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th>Boy name with ID</th>
                                                                                                    <th>Girl Name with ID  </th>
                                                                                                    <th>Meeting Venue</th>
                                                                                                    <th>Time</th>
                                                                                                    <th>ARM working</th>
                                                                                                </tr>
                                                                                            </thead>  
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>Rishi Rajendra Gokharu <span class="color2">C2SL12624(CHP)</span></td>
                                                                                                    <td>Radhika Lalchand Agarwal <span class="color2">S2SL012617(CHP)</span> </td>
                                                                                                    <td>Mumbai</td>
                                                                                                    <td>01.30 pm</td>
                                                                                                    <td>ARM Name</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Sunil Kailash Chand Godika <span class="color2">C3SL12457(RK)</span></td>
                                                                                                    <td>Neha Laxi Narayan Khunteta <span class="color2">C2SL012615(CHP) </span></td>
                                                                                                    <td>Mumbai</td>
                                                                                                    <td>05.30 pm</td>
                                                                                                    <td>Self</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Rishi Rajendra Gokharu <span class="color2">C2SL12413(RP)</span></td>
                                                                                                    <td>Radhika Lalchand Agarwal <span class="color2">S2SL012617(CHP)</span> </td>
                                                                                                    <td>Mumbai</td>
                                                                                                    <td>01.30 pm</td>
                                                                                                    <td>ARM Name</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Sunil Kailash Chand Godika <span class="color2">C5SL12612(CEO) </span></td>
                                                                                                    <td>Neha Laxi Narayan Khunteta <span class="color2"> S1SL10243(SK) </span></td>
                                                                                                    <td>Mumbai</td>
                                                                                                    <td>05.30 pm</td>
                                                                                                    <td>Self</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td>Rishi Rajendra Gokharu <span class="color2">C3SL12457(RK)</span></td>
                                                                                                    <td>Radhika Lalchand Agarwal <span class="color2">C2SL012615(CHP)</span> </td>
                                                                                                    <td>Mumbai</td>
                                                                                                    <td>01.30 pm</td>
                                                                                                    <td>ARM Name</td>
                                                                                                </tr>
                                            
                                            
                                                                                            </tbody>-->
                                            <!--</table>-->

                                            <display:table pagesize="10" name="meetingList" id="meetingListId" requestURI=""  >
                                                <display:column title="Boy Name" sortProperty="boyName" sortable="true">
                                                    ${meetingListId.boyName}
                                                </display:column>
                                                <display:column title="Girl Name" sortProperty="girlName" sortable="true">
                                                    ${meetingListId.girlName}
                                                </display:column>
                                                <display:column title="Venue"  sortProperty="meetingVenue" sortable="true">
                                                    ${meetingListId.meetingVenue}
                                                </display:column>
                                                <display:column title="Time"  sortProperty="time"  sortable="true">
                                                    ${meetingListId.time}      
                                                </display:column>
                                                <display:column title="Rm / Scheduled By" sortProperty="armWorking" sortable="true">
                                                    ${meetingListId.armWorking}                  
                                                </display:column>
                                            </display:table>
                                        </div>

                                    </div>
                                    <!-- ARM Meeting Start-->
                                    <!--                                    <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                <h2><i class="fa fa-flag-o red"></i><strong>ARM Meeting Status</strong></h2>
                                                                              
                                                                            </div>
                                                                            <div class="panel-body">
                                                                                <table class="table bootstrap-datatable countries">
                                    
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td>Rishi Rajendra Gokharu (<span class="color2">SL09916</span>)</td>
                                                                                            <td>Radhika Lalchand Agarwal (<span class="color2">SL09911</span>) </td>
                                                                                            <td>Mumbai</td>
                                                                                            <td>01.30 pm</td>
                                                                                           
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Sunil Kailash Chand Godika (<span class="color2">SL09916</span>)</td>
                                                                                            <td>Neha Laxi Narayan Khunteta (<span class="color2">SL09911</span>)</td>
                                                                                             <td>Mumbai</td>
                                                                                            <td>05.30 pm</td>
                                                                                            
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Rishi Rajendra Gokharu (<span class="color2">SL09916</span>)</td>
                                                                                            <td>Radhika Lalchand Agarwal (<span class="color2">SL09911</span>) </td>
                                                                                            <td>Mumbai</td>
                                                                                            <td>01.30 pm</td>
                                                                                            
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Sunil Kailash Chand Godika (<span class="color2">SL09916</span>)</td>
                                                                                            <td>Neha Laxi Narayan Khunteta (<span class="color2">SL09911</span>)</td>
                                                                                             <td>Mumbai</td>
                                                                                            <td>05.30 pm</td>
                                                                                            
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Rishi Rajendra Gokharu (<span class="color2">SL09916</span>)</td>
                                                                                            <td>Radhika Lalchand Agarwal (<span class="color2">SL09911</span>) </td>
                                                                                            <td>Mumbai</td>
                                                                                            <td>01.30 pm</td>
                                                                                            
                                                                                        </tr>
                                    
                                    
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                    
                                                                        </div>-->
                                    <!-- ARM Meeting ends-->

                                </div><!--/col-->
                                <div class="col-md-6">
                                    <!--                                    <table class="table table-striped table-advance table-hover tableLayout">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th style="border-right: 0 none !important;" colspan="4"><i class="fa fa-list"></i> <span class="todohead"> To do list</span></th>
                                                                                    <th style=" border-left: 0 none !important;"><div class="btn-group"><a class="btn btn-primary" href="#" title="Add"><i class="icon_plus" title="Add"></i></a></div>
                                                                            </th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="11%">Sr No.</td>
                                                                                <td width="50%">Details </td>
                                                                                <td width="20%">Date </td>
                                                                                <td width="20%">Status </td>
                                                                                <td width="11%">Action</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>1.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>31/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-important">I</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr> 
                                                                            <tr>
                                                                                <td colspan="5">
                                                                                    <table class="table table-striped table-advance table-hover tableLayout" style="margin-bottom: 0 !important">
                                                                                        <tr>
                                                                                            <td><div class="controlsData controlWidth"><input type="text"/></div></td>
                                                                                            <td><div class="controlsData controlWidth"><input type="text" name="contact.regDateFrom" id="example1" placeholder="Select date"></div></td>
                                                                                            <td>
                                                                                                <div class="controlsData controlWidth">
                                                                                                    <select>
                                                                                                        <option>Important</option>
                                                                                                        <option>Normal</option>
                                                                                                        <option>Minor</option>
                                                                                                        <option>Complete</option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </td> 
                                                                                            <td>
                                                                                                <div class="btn-group">
                                                                                                    <input type="submit" onclick="return checkDates()" value="Save" class="btn btn-go">
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                    
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>30/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-normal">N</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>30/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-minor">M</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>4.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>30/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-complete">C</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>5.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>30/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-minor">M</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>6.</td>
                                                                                <td>Lorem ipsum dolor sit amet, </td>
                                                                                <td>30/5/2016</td>
                                                                                <td><span class="icon-task-l">
                                                                                        <span class="badge bg-important">I</span>
                                                                                    </span></td>
                                                                                <td>
                                                                                    <div class="btn-group">
                                                                                        <a class="btn btn-primary" href="#" title="Edit"><i class="fa fa-edit" title="Edit"></i></a>
                                    
                                    
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            </tbody>
                                                                        </table>-->

                                </div>



                            </div>

                            <!-- For Meeting and to do ends-->
                        </div>
                    </div>
                </section>
            </section>
        </section>

        <datalist id="searchNameHeader" style="display:none;">

            <%

                List contactList=new ProfileManager().getContactListByNameHeader();
                for (int i = 0; i < contactList.size(); i++) {
                    Contact contact = (Contact) contactList.get(i);
            %>
            <option value="<%=contact.getFirstName()%> <%=contact.getMiddleName()%> <%=contact.getLastName()%> <%=contact.getProfileId()%>"> </option>
            <%
                }
            %>

        </datalist>  
        <s:include value="../includes/footer.jsp" />
        <!--FOOTER-->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="css/elegant-icons-style.css" rel="stylesheet" />
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!-- nice scroll -->
        <script src="js/jquery.scrollTo.min.js"></script>
        <script src="js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="js/scripts.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>

        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').dataTable();
                document.getElementById('txtAutoCompleteHeader').style.display = "block";
                document.getElementById('searchMagnifyButtonHeader').style.display = "block";
            });
        </script>
        <script type="text/javascript">
            $(function () {
                /* #txt is display table id & employee_search_ class is field id which you want to filter */
                var oTable = $('#meetingListId').dataTable({
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bFilter": true,
                    "bSort": false,
                    "bInfo": false,
                    "bAutoWidth": false,
                    "bStateSave": false
                });
                $("thead input").keyup(function () {
                    oTable.fnFilter(this.value, $("thead input").index(this));
                });

                $("thead input").focus(function () {
                    if (this.className == "employee_search_") {
                        this.className = "";
                        this.value = "";
                    }
                });

                $("thead input").blur(function (i) {
                    if (this.value == "") {
                        this.className = "employee_search_";
                        this.value = asInitVals[$("thead input").index(this)];
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function ()
            {
                document.getElementById('txtAutoCompleteHeader').addEventListener('input', function () {
                    var a = document.createElement('a');
                    var linkText = document.createTextNode("my title text");
                    a.appendChild(linkText);
                    a.title = "my title text";
                    var val = document.getElementById("txtAutoCompleteHeader").value;

                    var data = val.split(" ");
                    var profileId = data[data.length - 1];
                    if (data.length > 3)
                    {
                        var hrefData = "/Subhlagancrm/Profile/getMatchListByName?contactId=" + profileId.substr(2, profileId.length);
                        a.href = hrefData;
                        document.body.appendChild(a);
                        a.click();
                    }
                });
            });
        </script>

    </body>
</html>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<aside>
    <form>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <div id="sidebar"  class="nav-collapse" >
            <ul class="sidebar-menu"> 
                <c:if test="${(userSession.deptId==8) || (userSession.deptId==12) || (userSession.deptId==13) || (userSession.deptId==14) || (userSession.deptId==17)}">      <!--Conditions added by vineet on 24-11-2016 --> 
                    <li class="">
                        <a class="" href="${pageContext.request.contextPath}/rmdashboard">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/dashboardIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${(userSession.deptId==9) || (userSession.deptId==15) || (userSession.deptId==16)  || (userSession.deptId==18)}">     <!--Conditions added by vineet on 24-11-2016 --> 
                    <li class="">
                        <a class="" href="${pageContext.request.contextPath}/armdashboard">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/dashboardIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                </c:if>
                <li class="">
                    <a class="" href="${pageContext.request.contextPath}/Profile/profileList">
                        <i class="fa fa-list" style="padding-right: 15px; vertical-align: middle">

                        </i>
                        <span>Profile List</span>
                    </a>
                </li>


 <c:if test="${(userSession.deptId==9) || (userSession.deptId==15) || (userSession.deptId==16) ||(userSession.deptId==18)}">    <!--Conditions added by vineet on 27-01-2016 to Show moved Member to ARM-->  
       <li class=""><a class="" href="${pageContext.request.contextPath}/Master/movedBioDataList">
                       <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/mastersIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                        <span>Moved Member</span>
           </a></li>
 
 </c:if>

                <c:if test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16)  && (userSession.deptId!=18)}">    <!--Conditions added by vineet on 24-11-2016 -->  
                    <!--                    <li class="">
                                            <a class="" href="${pageContext.request.contextPath}/RmReport/reportList">
                                                <i class="fa fa-file" style="padding-right: 15px; vertical-align: middle">
                                                </i>
                                                <span>Report</span>
                                            </a>-->
                    <%--</c:if>--%>
                    <!--//Added By Vineet on 14-06-2016 For User List//--> 

                    <!--                    <li class="">
                                            <a class="" href="${pageContext.request.contextPath}/User/userList">
                                                <i class="fa fa-list" style="padding-right: 15px; vertical-align: middle">
                    
                                                </i>
                                                <span>User List</span>
                                            </a>
                                        </li>-->

                    <!--End Here-->

                    <!--            <li class="sub-menu">
                                    <a href="javascript:;" class="">
                                        <i class="">
                                            <img src="{pageContext.request.contextPath}/img/menuicons/communicationIconWhite.png" alt="Icon" title="Dashboard"/>
                                        </i>
                                        <span>Report</span>
                                    </a>
                                </li>
                            
    
                    -->                               
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/mastersIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Master 1</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="${pageContext.request.contextPath}/Master/packageList">Package</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/transferProfile">Transfer Profile</a></li>
                            <c:if test="${(userSession.deptId==2) || (userSession.deptId==12) || (userSession.deptId==4)}">
                            <li><a class="" href="${pageContext.request.contextPath}/User/userList">User</a></li></c:if>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/movedBioDataList">Moved Member</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/AstroCity/astroCityList">Astro City</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/ChangeRequest/changeRequest" title="Change Request">Change Request </a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/community" title="Community">Community </a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/fetchCityList"> City </a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/fetchGotraList"> Gotra </a></li>

                        </ul>
                    </li> 
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/mastersIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Master 2</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="${pageContext.request.contextPath}/Master/country" title="Country">Country</a></li> 
                            <li><a class="" href="${pageContext.request.contextPath}/Master/office" title="Office">Office</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/occupation" title="Occupation">Occupation</a></li>
                             <li><a class="" href="${pageContext.request.contextPath}/Master/fetchHobbiesList" title="Hobbies">Hobbies</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/category" title="Category">Category</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/mainStatus" title="MainStatus">Main Status</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/remark" title="Remark">Remark</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Master/fetchTemplateList" title="Mass Mail">Mass Mail </a></li>                 
                        </ul>
                    </li> 


                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/reportsIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Report 1</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="${pageContext.request.contextPath}/Email/emailList">Email Report </a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/shortProfileList" >ShortList Report </a></li>                          
                            <li><a class="" href="${pageContext.request.contextPath}/LoginAccess/loginAccessReport">Login Access </a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/matchReport">Match Report</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/statusReportList">Status Report</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/meetingReportList">Meeting Report</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/kundaliReport">Kundali Report</a></li>

                            <!--<li><a class="" href="#" title="Kundli">Kundli </a></li>-->
                        </ul>
                    </li> 


                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="${pageContext.request.contextPath}/img/menuicons/reportsIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Report 2</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">                        
                            <li><a class="" href="${pageContext.request.contextPath}/Report/paymentReport">Payment Report</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/contactExchangeReport">Contact Exchange Report</a></li>
                            <li><a class="" href="${pageContext.request.contextPath}/Report/acceptedThroughWeb">Accepted through Web</a></li>
                            <!--<li><a class="" href="#" title="Kundli">Kundli </a></li>-->
                        </ul>
                    </li> 

                    <!--                    <li class="">
                                            <a class="" href="${pageContext.request.contextPath}/Email/emailList">
                                                <i class="fa fa-list" style="padding-right: 15px; vertical-align: middle">
                    
                                                </i>
                                                <span>Email Report</span>
                                            </a>
                                        </li>
                    
                                        <li class="">
                                            <a class="" href="${pageContext.request.contextPath}/ShortList/shortProfileList">
                                                <i class="fa fa-list" style="padding-right: 15px; vertical-align: middle">
                    
                                                </i>
                                                <span>Short List Report</span>
                                            </a>
                                        </li>-->



                    <!--<!--
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class=""><img src="{pageContext.request.contextPath}/img/menuicons/reportsIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Reports</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="#" title="Login Access">Login Access</a></li>
                            <li><a class="" href="#" title="Short List">Short List</a></li>
                            <li><a class="" href="#" title="Facebook">Facebook</a></li>
                            <li><a class="" href="#" title="Followup">Followup</a></li>
                            <li><a class="" href="#" title="Email">Email</a></li>
                            <li><a class="" href="#" title="SMS">SMS</a></li>
                            <li><a class="" href="../Match/matchList.xhtml" title="Match">Match</a></li>
                            <li><a class="" href="#" title="Untouched Biodatas">Untouched Biodatas</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="{pageContext.request.contextPath}/img/menuicons/userIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Users</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li><a class="" href="#" title="Admin Users">Admin Users</a></li>
                            <li><a class="" href="#" title="Members">Members</a></li>
                            <li><a class="" href="#" title="View Details">View Details</a></li>
                            <li><a class="" href="#" title="Change Request">Change Request</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;" class="">
                            <i class="">
                                <img src="{pageContext.request.contextPath}/img/menuicons/mastersIconWhite.png" alt="Icon" title="Dashboard"/>
                            </i>
                            <span>Masters</span>
                            <span class="menu-arrow arrow_carrot-right"></span>
                        </a>
                        <ul class="sub">
                            <li class="sub-menu">
                                <a href="javascript:;" class="">
                                    <span>Masters 1</span>
                                    <span class="menu-arrow arrow_carrot-right"></span>
                                </a>
                                <ul class="sub sub-menu-level3">
                                    <li><a class="" href="#" title="SMTP">SMTP </a></li>
                                    <li><a class="" href="#" title="Category">Category</a></li>
                                    <li><a class="" href="#" title="Highest Degree">Highest Degree</a></li>
                                    <li><a class="" href="#" title="Country">Country</a></li>
                                    <li><a class="" href="#" title="State">State </a></li>
                                    <li><a class="" href="#" title="City">City </a></li>
                                </ul>
                            </li>
                            <li class="sub-menu">
                                <a href="javascript:;" class="">
                                    <span>Masters 2</span>
                                    <span class="menu-arrow arrow_carrot-right"></span>
                                </a>
                                <ul class="sub sub-menu-level3">
                                    <li><a class="" href="#" title="My lifestyle">My lifestyle </a></li>
                                    <li><a class="" href="#" title="Hobbies and Interests"> Hobbies and Interests</a></li>
                                    <li><a class="" href="#" title="Religion">Religion </a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>-->
                </c:if>
            </ul>
            <div class="footerMain">
                <span> Copyright &#169; 2016 SubhLagan.com Pvt. Ltd. All Rights Reserved.</span>
            </div>
        </div>
    </form>
</aside>


<%-- 
    Document   : statusReportIndividual
    Created on : 15 Apr, 2016, 10:46:50 AM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<table class="commonTable tableBG" id="statusListIndividualTable">    

    <tr>
        <th>Name</th>
        <!--<th>ID</th>-->
        <!--<th>Cat</th>-->
        <th>Profile Exchange</th>
        <th>Match Status</th>
        <th>Meeting Status</th>
        <th>Final Status</th>
        <th>Priority</th>
    </tr>
    <tr>
        <td colspan="6" style="padding: 0" >
            <table class="commonTableInner">
                <s:iterator value="statusReportList" var="statusReport">
                    <tr>
                        <td>
                            ${statusReport.firstname}   ${statusReport.middlename}  
                        </td>
                        
                        <td>
                            <c:if test="${statusReport.emailType==2}">
                                <a href="#"  ><img src="../img/icons/nonActiveArrow.png" title="twoway"/></a>
                                </c:if>

                            <c:if test="${statusReport.emailType==1}">
                                <a href="#" > <img src="../img/icons/boyActiveArrow.png" title="oneway"/></a>
                                </c:if>
                        </td>
                        <td>
                            <c:if test="${statusReport.matchDate==null}"> 
                                <div class="reportStatusDiv">
                                    <c:if test="${statusReport.emailType==1}">
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png"/></a>
                                            </c:if>

                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='M'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">
                                            <a href="#!" ><img src="../img/icons/boyYellowIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyRedIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlRedIcon.png" /></a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${statusReport.emailType==2}">
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">

                                            <a href="#!" title="Pending" ><img src="../img/icons/boyYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='M' }">
                                            <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                            <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png"/></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">

                                            <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                            <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                            <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                            </c:if>
                                            <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                            <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                            </c:if>
                                        </c:if>


                                </div>
                            </c:if>
                            <c:if test="${statusReport.matchDate!=null}"> 
                                <div class="reportStatusDiv">
                                    <c:if test="${statusReport.st1==0 && statusReport.gender=='M'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==0 && statusReport.gender=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==1 && statusReport.gender=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==1 && statusReport.gender=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st1==2 && statusReport.gender=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==0 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/boyYellowIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==0 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Pending"><img src="../img/icons/girlYellowIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==1 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==1 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==2 && statusReport.gender1=='M'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st2==2 && statusReport.gender1=='F'}">
                                        <a href="#!" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>

                                </div>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${statusReport.matchDate!=null}">
                                <div class="reportStatusDiv">

                                    <c:if test="${statusReport.st3==0 && statusReport.gender=='M'}">
                                        <a href="#" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==0 && statusReport.gender=='F'}">
                                        <a href="#" title="Pending"><img src="../img/icons/girlYellowIcon.png"  /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='M'}">
                                        <a href="#" title="Accept"><img src="../img/icons/boyGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==1 && statusReport.gender=='F'}">
                                        <a href="#" title="Accept"><img src="../img/icons/girlGreenIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='M'}">
                                        <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==2 && statusReport.gender=='F'}">
                                        <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='M'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/boyBlueIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st3==3 && statusReport.gender=='F'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/girlBlueIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='M'}">
                                        <a href="#" title="Pending"><img src="../img/icons/boyYellowIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==0 && statusReport.gender1=='F'}">
                                        <a href="#" title="Pending"><img src="../img/icons/girlYellowIcon.png"/></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='M'}">
                                        <a href="#" title="Accept"><img src="../img/icons/boyGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==1 && statusReport.gender1=='F'}">
                                        <a href="#" title="Accept"><img src="../img/icons/girlGreenIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='M'}">
                                        <a href="#" title="Reject"><img src="../img/icons/boyRedIcon.png" /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==2 && statusReport.gender1=='F'}">
                                        <a href="#" title="Reject"><img src="../img/icons/girlRedIcon.png" /></a>
                                        </c:if>

                                    <c:if test="${statusReport.st4==3 && statusReport.gender=='M'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/boyBlueIcon.png"  /></a>
                                        </c:if>
                                        <c:if test="${statusReport.st4==3 && statusReport.gender1=='F'}">
                                        <a href="#" title="Reschedule"><img src="../img/icons/girlBlueIcon.png"  /></a>
                                        </c:if>

                                </div>
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate==null}">                 
                                <a href="#" > 
                                    Schedule meeting date
                                </a>                              
                            </c:if>
                            <c:if test="${statusReport.st2==1 and statusReport.st1==1 and statusReport.matchDate!=null}">   
                                <a href="#" >
                                    ${statusReport.matchDate} 
                                </a>
                            </c:if>
                        </td>
                        <td>

                            <c:if test="${statusReport.fst==0 && statusReport.matchDate!=null && st3==1 && st4==1}">

                                <a href="#"><img src="../img/icons/girlYellowIcon.png" /></a>
                                </c:if>
                                <c:if test="${statusReport.fst==1}">
                                <a href="#"><img src="../img/icons/girlGreenIcon.png" /></a>
                                </c:if>
                                <c:if test="${statusReport.fst==2}">
                                <a href="#"><img src="../img/icons/girlRedIcon.png" /></a>
                                </c:if>

                        </td>
                        <td>
                            <c:if test="${statusReport.priority==0}">
                                <a href="#!"><img src="../img/icons/priorityicon.png"/></a> 
                                </c:if>
                                <c:if test="${statusReport.priority==3}">
                                <a href="#!" >High</a> 
                            </c:if>
                            <c:if test="${statusReport.priority==2}">
                                <a href="#!">Medium</a> 
                            </c:if>
                            <c:if test="${statusReport.priority==1}">
                                <a href="#!" >Low</a> 
                            </c:if>

                        </td>
                    </tr>

                </s:iterator>
            </table>
        </td>
    </tr>

</table>


<%-- 
    Document   : reschedule
    Created on : 25 Mar, 2016, 7:27:41 PM
    Author     : OpenSpace004
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Reschedule start-->
<div class="addfollowup addfollowupbg">
    <h3 class="popupheads">Reschedule Followup </h3>
    <div class="formDATA followup">
        <label>Subject*</label><br/>
        <div class="controlsData controlWidth">
            <input type="hidden" name="followup.projectId" value="${followup.projectId}" id="sfrprojectId">
            <input type="hidden"  value="${followup.followupId}" id="sfrfollowupId">
            <input type="hidden"  value="${followup.contactId}" id="sfrcontactId">

            <select id="sfrprojectId1">
                <option value="0">--Select--</option>
                <option value="3">Matching</option>
                <option value="4">Meeting</option>
                <option value="2">Payment</option>
                <option value="1">Renewal</option>
            </select>      
            <label  id="sfsvalidateProjectId" style="width:100%;display:none;color:red;">Please select subject</label>
        </div>

    </div>
    <div class="formDATA followup">
        <label>Details*</label><br/>
        <div class="controlsData controlWidth">
            <input type="text" id="sfscontent"  name="${followup.projectId}"  value="${followup.content}"  >
            <label  id="sfsvalidateContent" style="width:100%;display:none;color:red">Please enter content</label>
        </div>
    </div>

    <div class="formDATA followup">
        <div class="col-lg-6">
        <div class="controlsData controlWidth">
            <label >Next Date *</label>
            <input class="form-control" type="text"  name="${followup.nextDate}"  value="${followup.nextDate}" id="sfexample4" />

            <label  id="sfsvalidatenextDate" style="width:100%;display:none;color:red">Please select date</label>
        </div>
        </div>
        <div class="col-lg-6">
            <label value="Next Date*" >Time</label>
            <input id="timepicker4" type="text" name="timepicker4" class="form-control" style="height: 30px !important;"/>
        </div>
    </div>

    <div class="formDATA followupgo">
        <input type="submit" onclick="return saveRescheduleStatusFinal()" value="Go" class="btn btn-go btn-margin">
    </div>

</div>
<!-- Reschedule ends-->







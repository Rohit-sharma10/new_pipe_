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
            <input type="hidden" name="followup.projectId" value="${followup.projectId}" id="irprojectId">
            <input type="hidden"  value="${followup.followupId}" id="irfollowupId">
            <input type="hidden"  value="${followup.contactId}" id="ircontactId">

            <select id="irprojectId1">
                <option value="0">--Select--</option>
                <option value="3">Matching</option>
                <option value="4">Meeting</option>
                <option value="2">Payment</option>
                <option value="1">Renewal</option>
            </select>      
            <label  id="isvalidateProjectId" style="width:100%;display:none;color:red;">Please select subject</label>
        </div>

    </div>
    <div class="formDATA followup">
        <label>Details*</label><br/>
        <div class="controlsData controlWidth">
            <input type="text" id="iscontent"  name="${followup.projectId}"  value="${followup.content}"  ></h:inputTextarea>
            <label  id="isvalidateContent" style="width:100%;display:none;color:red">Please enter content</label>
        </div>
    </div>

    <div class="formDATA followup">
        <label >Next Date *</label>
        <div class="controlsData controlWidth">
            <input class="form-control" type="text"  name="${followup.nextDate}"  value="${followup.nextDate}" id="iexample4" />

            <label  id="isvalidatenextDate" style="width:100%;display:none;color:red">Please select date</label>
        </div>
    </div>

    <div class="formDATA followupgo">
        <input type="submit" onclick="return saveRescheduleIndividual()" value="Go" class="btn btn-go btn-margin">
    </div>

</div>
<!-- Reschedule ends-->







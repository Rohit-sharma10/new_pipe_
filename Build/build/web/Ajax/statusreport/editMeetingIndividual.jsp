<%-- 
    Document   : editMeeting
    Created on : 14 Apr, 2016, 7:54:08 PM
    Author     : OpenSpace004
--%>
<br/><br/>
<table>
    <tr>
        <td>
            Venue:  
        </td>
        <td>
            <input type="hidden" id="eischeduleMeetingMatchId">
            <input type="hidden"  id="eischeduleMeetingStatusid" value="${meeting.statusId}"/>
            <input type="hidden"  id="eischeduleMeetingMeetingId" value="${meeting.meetingId}"/>
            <input type="hidden"  id="eischeduleMeetingContactId" value="${meeting.contactId}"/>
            <div class="controlsData"><input type="text"  id="eivenue" value="${meeting.venue}"/></div>
            <label  style="color:red;display:none" id="eivalidateVenue">Please enter venue</label>

        </td>
    </tr>
    <tr>
        <td>
            Date/Time:
        </td>
        <td>
            <div class="col-lg-6 paddingNone">
                <input class="form-control" type="text"  id="eischeduleDate" value="${meeting.date}" />                                 
                <label  style="color:red;display:none" id="eivalidatescheduleDate">Please select date and time</label>
            </div>

            <div class="col-lg-6">
                <input id="timepicker2" type="text" name="timepicker2" class="form-control"/>

            </div>
        </td>
    </tr>
    <tr>
        <td>
            Description
        </td>
        <td>
            <div class="controlsData"><input class="form-control" type="text"  id="eidescription"  value="${meeting.description}"/> </div> 
            <label  style="color:red;display:none" id="eivalidateDescription">Please select date</label>
        </td>
    </tr>
    <tr>
        <td>
            From Groom Side:
        </td>
        <td>
            <div class="controlsData"><input type="text" id="eifromGroomSide" value="${meeting.fromGroomSide}">   </div>                                                   
            <label  value="Please enter side" style="color:red;display:none" id="eivalidatefromGroomSide"></label>
        </td>
    </tr>
    <tr>
        <td>
            From Bride Side:
        </td>
        <td>

            <div class="controlsData"><input  type="text" id="eifromBrideSide" value="${meeting.fromBrideSide}" ></div>
            <label value="" style="color:red;display:none" id="eivalidatefromBrideSide">Please enter side</label>
        </td>
    </tr>
    <tr>
        <td>
           Remarks:
        </td>
        <td>

            <div class="controlsData"><input  type="text" id="eiRemarks" value="${meeting.remarks}" ></div>
         
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="radio"  value="1" name="mtp" id="mtp3" > New Meeting
            <input type="radio"  value="2" checked="true" name="mtp" id="mtp4" > Reschedule
        </td>
    </tr>
    <tr>
        <td colspan="2">

            <input type="checkbox" value="1" checked id="sendMailFlagEdit">Send Mail
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <button class="btn btn-primary" value="save" onclick="saveEditMeetingIndividual()">save</button>
        </td>
    </tr>
</table>

<%-- 
    Document   : editMeeting
    Created on : 14 Apr, 2016, 7:54:08 PM
    Author     : OpenSpace004
--%>
<table>
    <tr>
        <td>
            Venue:  
        </td>
        <td>
            <input type="hidden"  id="ehscheduleMeetingStatusid" value="${meeting.statusId}"/>
              <input type="hidden"  id="ehscheduleMeetingMeetingId" value="${meeting.meetingId}"/>
            <input type="hidden"  id="ehscheduleMeetingContactId" value="${meeting.contactId}"/>
            <input type="text"  id="ehvenue" value="${meeting.venue}"/>
            <label  style="color:red;display:none" id="ehvalidateVenue">Please enter venue</label>

        </td>
    </tr>
    <tr>
        <td>
            Date/Time:
        </td>
        <td>
            <input class="form-control" type="text"  id="ehscheduleDate" value="${meeting.date}" />                                                
            <label  style="color:red;display:none" id="ehvalidatescheduleDate">Please select date</label>
        </td>
    </tr>
    <tr>
        <td>
            Description
        </td>
        <td>
            <input class="form-control" type="text"  id="ehdescription"  value="${meeting.description}"/>  
            <label  style="color:red;display:none" id="ehvalidateDescription">Please select date</label>
        </td>
    </tr>
    <tr>
        <td>
            From Groom Side:
        </td>
        <td>
            <input type="text" id="ehfromGroomSide" value="${meeting.fromGroomSide}">                                                      
            <label  value="Please enter side" style="color:red;display:none" id="ehvalidatefromGroomSide"></label>
        </td>
    </tr>
    <tr>
        <td>
            From Bride Side:
        </td>
        <td>

            <input  type="text" id="ehfromBrideSide" value="${meeting.fromBrideSide}" >
            <label value="" style="color:red;display:none" id="ehvalidatefromBrideSide">Please enter side</label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="radio"  value="1"   > New Meeting
            <input type="radio"  value="2" checked="true"> Reschedule
        </td>
    </tr>
    <tr colspan="2">
        <td>

            <input type="checkbox" value="1">Send Mail
        </td>
    </tr>
    <tr colspan="2">
        <td>
            <button value="save" onclick="saveEditMeetingHorizontal()">save</button>
        </td>
    </tr>
</table>

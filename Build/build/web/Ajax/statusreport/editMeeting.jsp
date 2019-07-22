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
            <input type="hidden"  id="escheduleMeetingStatusid" value="${meeting.statusId}"/>
              <input type="hidden"  id="escheduleMeetingMeetingId" value="${meeting.meetingId}"/>
            <input type="hidden"  id="escheduleMeetingContactId" value="${meeting.contactId}"/>
            <input type="text"  id="evenue" value="${meeting.venue}"/>
            <label  style="color:red;display:none" id="evalidateVenue">Please enter venue</label>

        </td>
    </tr>
    <tr>
        <td>
            Date/Time:
        </td>
        <td>
            <input class="form-control" type="text"  id="escheduleDate" value="${meeting.date}" />                                                
            <label  style="color:red;display:none" id="evalidatescheduleDate">Please select date</label>
        </td>
    </tr>
    <tr>
        <td>
            Description
        </td>
        <td>
            <input class="form-control" type="text"  id="edescription"  value="${meeting.description}"/>  
            <label  style="color:red;display:none" id="evalidateDescription">Please select date</label>
        </td>
    </tr>
    <tr>
        <td>
            From Groom Side:
        </td>
        <td>
            <input type="text" id="efromGroomSide" value="${meeting.fromGroomSide}">                                                      
            <label  value="Please enter side" style="color:red;display:none" id="evalidatefromGroomSide"></label>
        </td>
    </tr>
    <tr>
        <td>
            From Bride Side:
        </td>
        <td>

            <input  type="text" id="efromBrideSide" value="${meeting.fromBrideSide}" >
            <label value="" style="color:red;display:none" id="evalidatefromBrideSide">Please enter side</label>
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
            <button value="save" onclick="saveEditMeeting()">save</button>
        </td>
    </tr>
</table>

function matchReportIndi(contactId) {
    var contactId1 = contactId;
    alert(contactId);
   
//    $('#divideList').val(0);
//    $('#listViewMatch').show();
//    $('#gridViewMatch').show();
//    $('#listView').hide();
//    $('.listViewStatus').hide();
//    $('#homeHide').show();
//    $('#searchTab').click();
     showMatchDiv(contactId1);
    alert();
//    setTimeout(function () {
//        $('#searchButtonTag').click();
//    }, 500);
}


function matchReportIndi() {
    $('#divideList').val(0);
 
    $('#listViewMatch').show();
 
    $('#gridViewMatch').show();
 
    $('#listView').hide();
 
    $('.listViewStatus').hide();
 
    $('#homeHide').show();
 
    $('#searchTab').click();
 
    
//    setTimeout(function () {
//        $('#searchButtonTag').click();
//    }, 500);
}


function feedback(contactId)
{
    $.ajax({
        type: "post",
        url: "feedbackListIndividualDup",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedBackHistory").style.display = "block";
            document.getElementById("feedBackHistory").innerHTML = temp[0];
            document.getElementById("budgetDivMatch").innerHTML = temp[1];
            document.getElementById("preferenceDivMatch").innerHTML = temp[2];
            document.getElementById("familySalaryDivMatch").innerHTML = temp[3];
            document.getElementById("propertyOfOwnershipDivMatch").innerHTML = temp[4];
            document.getElementById("reasonOfDivorceDivMatch").innerHTML = temp[5];
            document.getElementById("divorcedOrSettledDivMatch").innerHTML = temp[6];
            document.getElementById("referenceGivenByDivMatch").innerHTML = temp[7];
            document.getElementById("familyBackgroundDivMatch").innerHTML = temp[8];
            document.getElementById("fcontactId").value = contactId;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("feedbackMatchReport").innerHTML = "Additional Information of " + html;
        }
    });
    $("#additionalInfoListMatchLi").click();

}
function feedbackIndividual(contactId)
{

    $.ajax({
        type: "post",
        url: "feedbackListIndividual",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedbackHistoryIndividual").style.display = "block";
            document.getElementById("feedbackHistoryIndividual").innerHTML = temp[0];
            document.getElementById("ifcontactId").value = contactId;
        }
    });
}
function feedbackStatusFinal(contactId)
{
    $.ajax({
        type: "post",
        url: "feedbackListIndividual",
        data: "contactId=" + contactId,
        success: function (html) {

            var temp = html.split("___");
            document.getElementById("feedBackHistoryStatusFinal").style.display = "block";
            document.getElementById("feedBackHistoryStatusFinal").innerHTML = temp[0];
            document.getElementById("sfcontactId").value = contactId;
        }
    });
}

function displayContactDetails(contactId)
{
    $.ajax({
        type: "post",
        url: "fetchContactData",
        data: "contactId=" + contactId,
        success: function (html) {

            document.getElementById("contactDetailsDiv").style.display = "block";
            document.getElementById("contactDetailsDiv").innerHTML = html;
        }

    });
}
function displayContactDetails1(contactId)
{
//    document.getElementById('kundaliVerticalDiv').style.display = "none";
//    document.getElementById('profileFollowupDiv').style.display = "none";
//    document.getElementById('profileActivityIndividualVerticalDiv').style.display = "none";
//    document.getElementById("statusReportIndividualVerticalDiv").style.display = "none";
//    document.getElementById("emailHistoryIndividual").style.display = "none";
    $.ajax({
        type: "post",
        url: "fetchContactData",
        data: "contactId=" + contactId,
        success: function (html) {

            document.getElementById("displayContactVertical1").style.display = "block";
            document.getElementById("displayContactVertical1").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }

    });
}
function email(contactId) {
    $.ajax({
        type: "post",
        url: "fetchEmailList",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("emailHistory").style.display = "block";
            document.getElementById("emailHistory").innerHTML = html;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("emailHeadingMatchReport").innerHTML = "Email History of " + html + "<a  class='emailSubinay' title='email' target='_blank' href='getMatchListByName?contactId=" + contactId + "&emailFlagIcon=1'><i class='fa fa-envelope'></i></a>";
        }
    });
}
function fetchEmailStatusFinal(contactId)
{
    $('#matchListReport').hide();
    $('#menus2').show();
//   $('#menus2').hide();
    $.ajax({
        type: "post",
        url: "fetchEmailList",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("emailHistoryStatusFinal").style.display = "block";
            document.getElementById("emailHistoryStatusFinal").innerHTML = html;
            document.getElementById("sfemailcontactId").value = contactId;
        }
    });
}
function emailIndividual(contactId) {
    document.getElementById("displayContactVertical1").style.display = "none";
    $.ajax({
        type: "post",
        url: "fetchEmailList",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("emailHistoryIndividual").style.display = "block";
            document.getElementById("emailHistoryIndividual").innerHTML = html;
            document.getElementById("iemailcontactId").value = contactId;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("emailHistoryHeadingStatusReportIndividual").innerHTML = "Email History of " + html;
        }
    });

}
function followUp(contactId)
{
    $.ajax({
        type: "post",
        url: "fetchFollowupList",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("followupMatchReport").innerHTML = "Follow-up of " + html;
        }
    });
}
function followUpIndividual(contactId)
{
    document.getElementById('ifollowupContactId').value = contactId;
    $.ajax({
        type: "post",
        url: "fetchFollowupListIndividual",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("followupHistoryIndividual").style.display = "block";
            document.getElementById("followupHistoryIndividual").innerHTML = html;
        }
    });
}
function followUpStatusFinal(contactId)
{
    document.getElementById('sffollowupContactId').value = contactId;
    $.ajax({
        type: "post",
        url: "fetchFollowupListStatusFinal",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("followupHistoryStatusFinal").style.display = "block";
            document.getElementById("followupHistoryStatusFinal").innerHTML = html;
        }
    });
}
function showCloseFollowup(followupId, contactId)
{
    $.ajax({
        type: "post",
        url: "showCloseFollowup",
        data: "followupId=" + followupId + "&contactId=" + contactId,
        success: function (html)
        {
            document.getElementById("rescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("rescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function showCloseFollowupIndividual(followupId, contactId)
{
    $.ajax({
        type: "post",
        url: "showCloseFollowupIndividual",
        data: "followupId=" + followupId + "&contactId=" + contactId,
        success: function (html)
        {
            document.getElementById("irescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("irescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("irescheduleSection" + followupId).style.display = "block";
            document.getElementById("irescheduleSection" + followupId).innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function showCloseFollowupStatusFinal(followupId, contactId)
{
    $.ajax({
        type: "post",
        url: "showCloseFollowupStatusFinal",
        data: "followupId=" + followupId + "&contactId=" + contactId,
        success: function (html)
        {
            document.getElementById("sfrescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSection" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSection" + followupId).innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function rescheduleFollowup(followupId)
{
    $.ajax({
        type: "post",
        url: "fetchRescheduleData",
        data: "followupId=" + followupId,
        success: function (html)
        {
//                        var trdisplay=document.getElementById("rescheduleSectiontr" + followupId).style.display;
            $("#followupListIdTable").find("section").css("display", "none");
            document.getElementById("rescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("rescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).innerHTML = html;
            var projectId = document.getElementById("rprojectId").value;
            document.getElementById("rfollowupId").value = followupId;
            document.getElementById("rprojectId1").value = projectId;
            $("#example4").datepicker({
                format: "dd/mm/yyyy",
            });
//                        $('.nav-tabs a[href="#rescheduleFollowup"]').tab('show');

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function rescheduleFollowupIndividual(followupId)
{
    $.ajax({
        type: "post",
        url: "fetchRescheduleDataIndividual",
        data: "followupId=" + followupId,
        success: function (html)
        {
//                        var trdisplay=document.getElementById("rescheduleSectiontr" + followupId).style.display;
            $("#ifollowupListIdTable").find("section").css("display", "none");
            document.getElementById("irescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("irescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("irescheduleSection" + followupId).style.display = "block";
            document.getElementById("irescheduleSection" + followupId).innerHTML = html;
            var projectId = document.getElementById("irprojectId").value;
            document.getElementById("irfollowupId").value = followupId;
            document.getElementById("irprojectId1").value = projectId;
            $("#example4").datepicker({
                format: "dd/mm/yyyy",
            });
//                        $('.nav-tabs a[href="#rescheduleFollowup"]').tab('show');

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function rescheduleFollowupStatusFinal(followupId)
{
    $.ajax({
        type: "post",
        url: "fetchRescheduleDataStatusFinal",
        data: "followupId=" + followupId,
        success: function (html)
        {
//                        var trdisplay=document.getElementById("rescheduleSectiontr" + followupId).style.display;
            $("#ifollowupListIdTable").find("section").css("display", "none");
            document.getElementById("sfrescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSection" + followupId).style.display = "block";
            document.getElementById("sfrescheduleSection" + followupId).innerHTML = html;
            var projectId = document.getElementById("sfrprojectId").value;
            document.getElementById("sfrfollowupId").value = followupId;
            document.getElementById("sfrprojectId1").value = projectId;
            $("#sfexample4").datepicker({
                format: "dd/mm/yyyy",
            });
            $('#timepicker4').timepicki();
//                        $('.nav-tabs a[href="#rescheduleFollowup"]').tab('show');

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function closeFollowup()
{
    var closeFollowupContent = document.getElementById('closeFollowupContent').value;
    var contactId = document.getElementById('ccontactId').value;
    var cfollowupId = document.getElementById('cfollowupId').value;
//                alert(contactId);
//                alert(cfollowupId);
    if (closeFollowupContent === '')
    {

        alert("Please enter content");
        return false;
    }
    $.ajax({
        type: "post",
        url: "closeFollowUp",
        data: "followupId=" + cfollowupId + "&contactId=" + contactId + "&content=" + closeFollowupContent,
        success: function (html)
        {

            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
//                        $('.nav-tabs a[href="#homeFollowup"]').tab('show');


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function closeFollowupIndividual()
{
    var closeFollowupContent = document.getElementById('icloseFollowupContent').value;
    var contactId = document.getElementById('iccontactId').value;
    var cfollowupId = document.getElementById('icfollowupId').value;
    if (closeFollowupContent === '')
    {

        alert("Please enter content");
        return false;
    }
    $.ajax({
        type: "post",
        url: "closeFollowUpIndividual",
        data: "followupId=" + cfollowupId + "&contactId=" + contactId + "&content=" + closeFollowupContent,
        success: function (html)
        {

            document.getElementById("followupHistoryIndividual").style.display = "block";
            document.getElementById("followupHistoryIndividual").innerHTML = html;
//                        $('.nav-tabs a[href="#homeFollowup"]').tab('show');


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function closeFollowupStatusFinal()
{
    var closeFollowupContent = document.getElementById('sfcloseFollowupContent').value;
    var contactId = document.getElementById('sfccontactId').value;
    var cfollowupId = document.getElementById('sfcfollowupId').value;
    if (closeFollowupContent === '')
    {

        alert("Please enter content");
        return false;
    }
    $.ajax({
        type: "post",
        url: "closeFollowUpStatusFinal",
        data: "followupId=" + cfollowupId + "&contactId=" + contactId + "&content=" + closeFollowupContent,
        success: function (html)
        {

            document.getElementById("followupHistoryStatusFinal").style.display = "block";
            document.getElementById("followupHistoryStatusFinal").innerHTML = html;
//                        $('.nav-tabs a[href="#homeFollowup"]').tab('show');


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveReschedule()
{
    var contactId = document.getElementById('rcontactId').value;
    var projectId = document.getElementById('rprojectId1').value;
    var content = document.getElementById('scontent').value;
    var example4 = document.getElementById('example4').value;
    var followupId = document.getElementById("rfollowupId").value;
//               
    if (projectId === '0')
    {

        document.getElementById('svalidateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('svalidateProjectId').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('svalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('svalidateContent').style.display = "none";
    }
    if (example4 === '')
    {
        document.getElementById('svalidatenextDate').style.display = "block";
        return false;
    } else {
        document.getElementById('svalidatenextDate').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "rescheduleFollowUp",
        data: "followupId=" + followupId + "&content=" + content + "&example4=" + example4 + "&projectId=" + projectId + "&contactId=" + contactId + "&nextDate=" + example4,
        success: function (html)
        {
            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
            $('.nav-tabs a[href="#homeFollowup"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveRescheduleIndividual()
{
    var contactId = document.getElementById('ircontactId').value;
    var projectId = document.getElementById('irprojectId1').value;
    var content = document.getElementById('iscontent').value;
    var example4 = document.getElementById('iexample4').value;
    var followupId = document.getElementById("irfollowupId").value;
//               
    if (projectId === '0')
    {

        document.getElementById('isvalidateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('isvalidateProjectId').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('isvalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('isvalidateContent').style.display = "none";
    }
    if (example4 === '')
    {
        document.getElementById('isvalidatenextDate').style.display = "block";
        return false;
    } else {
        document.getElementById('isvalidatenextDate').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "rescheduleFollowUpIndividual",
        data: "followupId=" + followupId + "&content=" + content + "&example4=" + example4 + "&projectId=" + projectId + "&contactId=" + contactId + "&nextDate=" + example4,
        success: function (html)
        {
//                        alert(html);
            document.getElementById("followupHistoryIndividual").style.display = "block";
            document.getElementById("followupHistoryIndividual").innerHTML = html;
            $('.nav-tabs a[href="#homeFollowup"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveRescheduleStatusFinal()
{
    var contactId = document.getElementById('sfrcontactId').value;
    var projectId = document.getElementById('sfrprojectId1').value;
    var content = document.getElementById('sfscontent').value;
    var example4 = document.getElementById('sfexample4').value;
    var followupId = document.getElementById("sfrfollowupId").value;
    var time = document.getElementById("timepicker4").value;

    if (projectId === '0')
    {

        document.getElementById('sfsvalidateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('sfsvalidateProjectId').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('sfsvalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('sfsvalidateContent').style.display = "none";
    }
    if (example4 === '')
    {
        document.getElementById('sfsvalidatenextDate').style.display = "block";
        return false;
    } else {
        document.getElementById('sfsvalidatenextDate').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "rescheduleFollowUpStatusFinal",
        data: "time=" + time + "&followupId=" + followupId + "&content=" + content + "&example4=" + example4 + "&projectId=" + projectId + "&contactId=" + contactId + "&nextDate=" + example4,
        success: function (html)
        {
//                        alert(html);
            document.getElementById("followupHistoryStatusFinal").style.display = "block";
            document.getElementById("followupHistoryStatusFinal").innerHTML = html;
//                        $('.nav-tabs a[href="#homeFollowup"]').tab('show');


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveFeedBack()
{
    var subject = document.getElementById("fsubject").value;
    var content = document.getElementById("fcontent").value;
    var contactId = document.getElementById("fcontactId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveFeedBack",
        data: "fcontactId=" + contactId + "&fsubject=" + subject + "&fcontent=" + content,
        success: function (html) {
            document.getElementById("feedBackHistory").style.display = "block";
            document.getElementById("feedBackHistory").innerHTML = html;
            document.getElementById("fcontent").value = "";
            document.getElementById("fsubject").value = "";
            $('.nav-tabs a[href="#homeFeedBackStatus"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}


function saveFeedBackStatusFinal()
{
    var subject = document.getElementById("sffsubject").value;
    var content = document.getElementById("sffcontent").value;
    var contactId = document.getElementById("sffcontactId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveFeedBack",
        data: "fcontactId=" + contactId + "&fsubject=" + subject + "&fcontent=" + content,
        success: function (html) {
            document.getElementById("feedBackHistoryStatusFinal").style.display = "block";
            document.getElementById("feedBackHistoryStatusFinal").innerHTML = html;
            document.getElementById("sffcontent").value = "";
            document.getElementById("sffsubject").value = "";
            $('.nav-tabs a[href="#homeFeedBackStatusFinal"]').tab('show');
//                        document.getElementById("men3").click();
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveEditFeedBackStatusFinal()
{

    var subject = document.getElementById("sffeditsubject").value;
    var content = document.getElementById("sffeditcontent").value;
    var contactId = document.getElementById("sffeditcontactId").value;
    var feedBackId = document.getElementById("sffeditfeedbackId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveEditFeedBack",
        data: "contactId=" + contactId + "&feedbackId=" + feedBackId + "&subject=" + subject + "&content=" + content,
        success: function (html) {
            document.getElementById("feedBackHistoryStatusFinal").style.display = "block";
            document.getElementById("feedBackHistoryStatusFinal").innerHTML = html;
            document.getElementById("sffcontent").value = "";
            document.getElementById("sffsubject").value = "";
            $('.nav-tabs a[href="#homeFeedBackStatusFinal"]').tab('show');
//                        document.getElementById("men3").click();
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveFeedBackIndividual()
{
    var subject = document.getElementById("ifsubject").value;
    var content = document.getElementById("ifcontent").value;
    var contactId = document.getElementById("ifcontactId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveFeedBack",
        data: "fcontactId=" + contactId + "&fsubject=" + subject + "&fcontent=" + content,
        success: function (html) {
            document.getElementById("feedbackHistoryIndividual").style.display = "block";
            document.getElementById("feedbackHistoryIndividual").innerHTML = html;
            document.getElementById("ifcontent").value = "";
            document.getElementById("ifsubject").value = "";
            $('.nav-tabs a[href="#homeFeedBackIndividual"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function statusReport(contactId)
{
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("statusReportListHead").innerHTML = "Status Report of " + html;
        }
    });
    $.ajax({
        type: "post",
        url: "getStatusList",
        data: "contactId=" + contactId,
        success: function (html) {

            document.getElementById("statusReportList").style.display = "block";
            document.getElementById("statusReportList").innerHTML = html;
        }
    });
    document.getElementById('searchContactId').value = contactId;
}
function statusReportIndividualVertical(contactId)
{
//                var d = document.getElementById("divcontent1");
//                d.className += " in";
    document.getElementById("displayContactVertical1").style.display = "none";
    $.ajax({
        type: "post",
        url: "getStatusListHorizontal",
        data: "contactId=" + contactId,
        success: function (html) {

            document.getElementById("statusReportIndividualVerticalDiv").style.display = "block";
            document.getElementById("statusReportIndividualVerticalDiv").innerHTML = html;
            document.getElementById("vsearchContactId").value = contactId;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("statusReportIndividualVerticalHead").innerHTML = "Status Report of " + html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });


}
function changeValue(matchId, field, contactId, mid, groom)
{
    document.getElementById('amatchId').value = matchId;
    document.getElementById('afield').value = field;
    document.getElementById('acontactId').value = contactId;
    document.getElementById('amid').value = mid;
    document.getElementById('agroom').value = groom;
}
function changeValueIndividual(matchId, field, contactId, mid, groom, type)
{


    document.getElementById('aimatchId').value = matchId;
    document.getElementById('aifield').value = field;
    document.getElementById('aicontactId').value = contactId;
    document.getElementById('aimid').value = mid;
    document.getElementById('aigroom').value = groom;
    document.getElementById('airemark').value = "";
    var headingId = "0";
    if (field === 'i_st1' || field === 'i_st3')
    {
        headingId = contactId;
    } else if (field === 'i_st2' || field === 'i_st4')
    {
        headingId = matchId;
    }

    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + headingId,
        success: function (html) {
            document.getElementById('matchHeading').innerHTML = "Match Status " + html;
            if (type === 2)
            {
                document.getElementById('matchHeading').innerHTML = "Meeting Status " + html;
                var html = "<select id='aistatus'><option value='3'>Reschedule</option><option value='1'>Accept</option><option value='2'>Reject</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }
            if (type === 0)
            {
                document.getElementById('matchHeading').innerHTML = "Match Status " + html;
                var html = "<select id='aistatus'><option value='0'>Pending</option><option value='1'>Accept</option><option value='2'>Reject</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }
            if (type === 1)
            {
                document.getElementById('matchHeading').innerHTML = "Final Status";
                var html = "<select id='aistatus'><option value='1'>Sucess</option><option value='2'>Not a Sucess</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }


        }, error: function ()
        {
//            alert("Please try later");
        }
    });



}

//ADDED By Vineet For Grid View Accept/Reject On 28-11-2016
function changeValueIndividualForGrid(matchId, field, contactId, mid, groom, type)
{
    document.getElementById('aimatchId1').value = matchId;
    document.getElementById('aifield1').value = field;
    document.getElementById('aicontactId1').value = contactId;
    document.getElementById('aimid1').value = mid;
    document.getElementById('aigroom1').value = groom;
    document.getElementById('airemark1').value = "";
    var headingId = "0";
    if (field === 'i_st1' || field === 'i_st3')
    {
        headingId = contactId;
    } else if (field === 'i_st2' || field === 'i_st4')
    {
        headingId = matchId;
    }

    $.ajax({
        type: "post",
        url: "getHeadingForGridView",
        data: "contactId=" + headingId,
        success: function (html) {
            document.getElementById('matchHeadingForGridView').innerHTML = "Match Status " + html;
            if (type === 2)
            {
                document.getElementById('matchHeadingForGridView').innerHTML = "Meeting Status " + html;
                var html = "<select id='aistatus1'><option value='3'>Reschedule</option><option value='1'>Accept</option><option value='2'>Reject</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }
            if (type === 0)
            {
                document.getElementById('matchHeadingForGridView').innerHTML = "Match Status " + html;
                var html = "<select id='aistatus1'><option value='0'>Pending</option><option value='1'>Accept</option><option value='2'>Reject</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }
            if (type === 1)
            {
                document.getElementById('matchHeadingForGridView').innerHTML = "Final Status";
                var html = "<select id='aistatus1'><option value='1'>Sucess</option><option value='2'>Not a Sucess</option></select>";
                document.getElementById('changeStatusDiv').innerHTML = html;
            }


        }, error: function ()
        {
//            alert("Please try later");
        }
    });



}




function changeValueHorizontal(matchId, field, contactId, mid, groom)
{
    document.getElementById('ahmatchId').value = matchId;
    document.getElementById('ahfield').value = field;
    document.getElementById('ahcontactId').value = contactId;
    document.getElementById('ahmid').value = mid;
    document.getElementById('ahgroom').value = groom;
}
function saveStatus()
{
    var matchId = document.getElementById('amatchId').value;
    var field = document.getElementById('afield').value;
    var contactId = document.getElementById('acontactId').value;
    var mid = document.getElementById('amid').value;
    var groom = document.getElementById('agroom').value;
    var status = document.getElementById('astatus').value;
    var remark = document.getElementById('aremark').value;
    $.ajax({
        type: "post",
        url: "updateStatus",
        data: "matchId=" + matchId + "&field=" + field + "&contactId=" + contactId + "&mid=" + mid + "&groom=" + groom + "&status=" + status + "&remark=" + remark,
        success: function (html) {

            document.getElementById("statusReportList").style.display = "block";
            document.getElementById("statusReportList").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveStatusIndividual()
{
    var matchId = document.getElementById('aimatchId').value;
    var field = document.getElementById('aifield').value;
    var contactId = document.getElementById('aicontactId').value;
    var mid = document.getElementById('aimid').value;
    var groom = document.getElementById('aigroom').value;
    var status = document.getElementById('aistatus').value;
    var remark = document.getElementById('airemark').value;
    var sendMailFlag = "";
    if ($('input.checkbox_check').prop('checked')) {
        sendMailFlag = 1;
    } else {
        sendMailFlag = 0;
    }
    $.ajax({
        type: "post",
        url: "updateStatusIndividual",
        data: "sendMailFlag=" + sendMailFlag + "&matchId=" + matchId + "&field=" + field + "&contactId=" + contactId + "&mid=" + mid + "&groom=" + groom + "&status=" + status + "&remark=" + remark,
        success: function (html) {
            var temp = html.split("+++");
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = temp[0];
            document.getElementById("closeModal21").click();
        }
    });
}

//Added By vineet on 28-11-2016

function saveStatusIndividualForGridView()
{
    var matchId = document.getElementById('aimatchId1').value;
    var field = document.getElementById('aifield1').value;
    var contactId = document.getElementById('aicontactId1').value;
    var mid = document.getElementById('aimid1').value;
    var groom = document.getElementById('aigroom1').value;
    var status = document.getElementById('aistatus1').value;
    var remark = document.getElementById('airemark1').value;
    var sendMailFlag = "";
    if ($('input.checkbox_checkForGrid').prop('checked')) {
        sendMailFlag = 1;
    } else {
        sendMailFlag = 0;
    }
    $.ajax({
        type: "post",
        url: "updateStatusIndividualForGridView",
        data: "sendMailFlag=" + sendMailFlag + "&matchId=" + matchId + "&field=" + field + "&contactId=" + contactId + "&mid=" + mid + "&groom=" + groom + "&status=" + status + "&remark=" + remark,
        success: function (html) {
            var temp = html.split("+++");
            document.getElementById("subinay2").style.display = "block";
            document.getElementById("subinay2").innerHTML = html;
            document.getElementById("closeModal22").click();
        }
    });
}


function saveStatusHorizontal()
{
    var matchId = document.getElementById('ahmatchId').value;
    var field = document.getElementById('ahfield').value;
    var contactId = document.getElementById('ahcontactId').value;
    var mid = document.getElementById('ahmid').value;
    var groom = document.getElementById('ahgroom').value;
    var status = document.getElementById('ahstatus').value;
    var remark = document.getElementById('ahremark').value;
    $.ajax({
        type: "post",
        url: "updateStatusHorizontal",
        data: "matchId=" + matchId + "&field=" + field + "&contactId=" + contactId + "&mid=" + mid + "&groom=" + groom + "&status=" + status + "&remark=" + remark,
        success: function (html) {

            document.getElementById("statusReportIndividualVerticalDiv").style.display = "block";
            document.getElementById("statusReportIndividualVerticalDiv").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveScheduleMeetingIds(stid, contactId)
{

    document.getElementById('scheduleMeetingStatusid').value = stid;
    document.getElementById('scheduleMeetingContactId').value = contactId;
}
function saveScheduleMeetingIdsIndividual(stid, contactId, matchId)
{

    document.getElementById('ischeduleMeetingStatusid').value = stid;
    document.getElementById('ischeduleMeetingMatchId').value = matchId;
    document.getElementById('ischeduleMeetingContactId').value = contactId;
    document.getElementById('ivenue').value = "";
    document.getElementById('ischeduleDate').value = "";
    document.getElementById('idescription').value = "";
    document.getElementById('ifromGroomSide').value = "";
    document.getElementById('ifromBrideSide').value = "";
    document.getElementById('ifRemarks').value = "";

}
function saveScheduleMeetingIdsHorizontal(stid, contactId)
{

    document.getElementById('hscheduleMeetingStatusid').value = stid;
    document.getElementById('hscheduleMeetingContactId').value = contactId;
}
function scheduleMeeting()
{

    var venue = document.getElementById('venue').value;
    var date = document.getElementById('scheduleDate').value;
    var description = document.getElementById('description').value;
    var fromGroomSide = document.getElementById('fromGroomSide').value;
    var fromBrideSide = document.getElementById('fromBrideSide').value;
    var statusId = document.getElementById('scheduleMeetingStatusid').value;
    var contactId = document.getElementById('scheduleMeetingContactId').value;
    if (venue === "")
    {

        document.getElementById('validateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('validateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('validatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('validatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('validateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('validatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('validatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('validatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('validatefromBrideSide').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "createSchedule",
        data: "venue=" + venue + "&date=" + date + "&description=" + description + "&fromGroomSide=" + fromGroomSide + "&fromBrideSide=" + fromBrideSide + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {

            document.getElementById("statusReportList").style.display = "block";
            document.getElementById("statusReportList").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
//               
}
function scheduleMeetingIndividual()
{

    var venue = document.getElementById('ivenue').value;
    var date = document.getElementById('ischeduleDate').value;
    var description = document.getElementById('idescription').value;
    var fromGroomSide = document.getElementById('ifromGroomSide').value;
    var fromBrideSide = document.getElementById('ifromBrideSide').value;
    var statusId = document.getElementById('ischeduleMeetingStatusid').value;
    var contactId = document.getElementById('ischeduleMeetingContactId').value;
    var matchId = document.getElementById('ischeduleMeetingMatchId').value;
    var remarks = document.getElementById('ifRemarks').value;
    var sendMailFlag = 0;
    if (document.getElementById('sendMailFlag').checked == true)
    {
        sendMailFlag = 1;
    } else
    {
        sendMailFlag = 0;
    }
    var mtp = "";
    var mtp1 = document.getElementById('mtp1').checked;
    var mtp2 = document.getElementById('mtp2').checked;
    var time = document.getElementById('timepicker1').value;
    if (mtp1 === true)
    {
        mtp = 1;
    } else {
        mtp = 2;
    }
    if (venue === "")
    {
        document.getElementById('ivalidateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('ivalidatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidatescheduleDate').style.display = "none";
    }
    if (time === "")
    {
        document.getElementById('ivalidatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('ivalidateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('ivalidatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('ivalidatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidatefromBrideSide').style.display = "none";
    }
    document.getElementById("loading").style.display = "block";
    $.ajax({
        type: "post",
        url: "createScheduleIndividual",
        data: "sendMailFlag=" + sendMailFlag + "&remarks=" + remarks.replace("&", " and ") + "&matchId=" + matchId + "&time=" + time + "&mtp=" + mtp + "&venue=" + venue.replace("&", " and ") + "&date=" + date + "&description=" + description.replace("&", " and ") + "&fromGroomSide=" + fromGroomSide.replace("&", " and ") + "&fromBrideSide=" + fromBrideSide.replace("&", " and ") + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById('closeMeeting').click();
            var temp = html.split("+++");
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = temp[0];
            document.getElementById("loading").style.display = "none";


        }, error: function ()
        {
            document.getElementById("loading").style.display = "none";
//            alert("Please try later");
        }
    });
//               
}
function scheduleMeetingHorizontal()
{

    var venue = document.getElementById('hvenue').value;
    var date = document.getElementById('hscheduleDate').value;
    var description = document.getElementById('hdescription').value;
    var fromGroomSide = document.getElementById('hfromGroomSide').value;
    var fromBrideSide = document.getElementById('hfromBrideSide').value;
    var statusId = document.getElementById('hscheduleMeetingStatusid').value;
    var contactId = document.getElementById('hscheduleMeetingContactId').value;
    if (venue === "")
    {

        document.getElementById('hvalidateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('hvalidateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('hvalidatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('hvalidatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('hvalidateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('hvalidateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('hvalidatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('hvalidatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('hvalidatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('hvalidatefromBrideSide').style.display = "none";
    }
//            alert("here");
    $.ajax({
        type: "post",
        url: "createScheduleHorizontal",
        data: "venue=" + venue + "&date=" + date + "&description=" + description + "&fromGroomSide=" + fromGroomSide + "&fromBrideSide=" + fromBrideSide + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {
//                    
            document.getElementById("statusReportIndividualVerticalDiv").style.display = "block";
            document.getElementById("statusReportIndividualVerticalDiv").innerHTML = html;
        }, error: function ()
        {
        }
    });
//               
}
function saveEditMeeting()
{

    var venue = document.getElementById('evenue').value;
    var date = document.getElementById('escheduleDate').value;
    var description = document.getElementById('edescription').value;
    var fromGroomSide = document.getElementById('efromGroomSide').value;
    var fromBrideSide = document.getElementById('efromBrideSide').value;
    var statusId = document.getElementById('escheduleMeetingStatusid').value;
    var contactId = document.getElementById('escheduleMeetingContactId').value;
    var meetingId = document.getElementById('escheduleMeetingMeetingId').value;


    if (venue === "")
    {

        document.getElementById('evalidateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('evalidateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('evalidatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('evalidatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('evalidateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('evalidatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('evalidatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('evalidatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('evalidatefromBrideSide').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "updateMeeting",
        data: "meetingId=" + meetingId + "&venue=" + venue + "&date=" + date + "&description=" + description + "&fromGroomSide=" + fromGroomSide + "&fromBrideSide=" + fromBrideSide + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("statusReportList").style.display = "block";
            document.getElementById("statusReportList").innerHTML = html;
        }, error: function ()
        {
        }
    });
//               
}
function saveEditMeetingIndividual()
{
    var venue = document.getElementById('eivenue').value;
    var date = document.getElementById('eischeduleDate').value;
    var description = document.getElementById('eidescription').value;
    var fromGroomSide = document.getElementById('eifromGroomSide').value;
    var fromBrideSide = document.getElementById('eifromBrideSide').value;
    var statusId = document.getElementById('eischeduleMeetingStatusid').value;
    var contactId = document.getElementById('eischeduleMeetingContactId').value;
    var meetingId = document.getElementById('eischeduleMeetingMeetingId').value;
    var meetingId = document.getElementById('eischeduleMeetingMeetingId').value;
    var matchId = document.getElementById("eischeduleMeetingMatchId").value;
    var remarks = document.getElementById("eiRemarks").value;
    var timepicker2 = document.getElementById("timepicker2").value;
    var sendMailFlag = "";
    if (document.getElementById('sendMailFlagEdit').checked == true)
    {
        sendMailFlag = 1;
    } else {
        sendMailFlag = 0;
    }
    var mtp = "";
    var mtp1 = document.getElementById('mtp3').checked;
    var mtp2 = document.getElementById('mtp4').checked;
    if (mtp1 === true)
    {
        mtp = 1;
    } else {
        mtp = 2;
    }
    if (venue === "")
    {
        document.getElementById('eivalidateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('eivalidateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('eivalidatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('eivalidatescheduleDate').style.display = "none";
    }
    if (timepicker2 === '')
    {
        document.getElementById('eivalidatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('eivalidatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('eivalidateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('eivalidateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('eivalidatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('eivalidatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('eivalidatefromBrideSide').style.display = "block";
        return false;
    } else {

        document.getElementById('eivalidatefromBrideSide').style.display = "none";
    }
    document.getElementById("loading").style.display = "block";
    $.ajax({
        type: "post",
        url: "updateMeetingIndividual",
        data: "sendMailFlag=" + sendMailFlag + "&remarks=" + remarks.replace("&", " and ") + "&time=" + timepicker2 + "&matchId=" + matchId + "&mtp=" + mtp + "&time=" + timepicker2 + "&meetingId=" + meetingId + "&venue=" + venue.replace("&", " and ") + "&date=" + date + "&description=" + description.replace("&", " and ") + "&fromGroomSide=" + fromGroomSide.replace("&", " and ") + "&fromBrideSide=" + fromBrideSide.replace("&", " and ") + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("loading").style.display = "none";
            document.getElementById("myModal2Individual").click();
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = html;
        }
    });
}
function saveEditMeetingHorizontal()
{

    var venue = document.getElementById('ehvenue').value;
    var date = document.getElementById('ehscheduleDate').value;
    var description = document.getElementById('ehdescription').value;
    var fromGroomSide = document.getElementById('ehfromGroomSide').value;
    var fromBrideSide = document.getElementById('ehfromBrideSide').value;
    var statusId = document.getElementById('ehscheduleMeetingStatusid').value;
    var contactId = document.getElementById('ehscheduleMeetingContactId').value;
    var meetingId = document.getElementById('ehscheduleMeetingMeetingId').value;
    if (venue === "")
    {

        document.getElementById('ehvalidateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('ehvalidateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('ehvalidatescheduleDate').style.display = "block";
        return false;
    } else {

        document.getElementById('ehvalidatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('ehvalidateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('ehvalidateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('ehvalidatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('ehvalidatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('ehvalidatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('ehvalidatefromBrideSide').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "updateMeetingHorizontal",
        data: "meetingId=" + meetingId + "&venue=" + venue + "&date=" + date + "&description=" + description + "&fromGroomSide=" + fromGroomSide + "&fromBrideSide=" + fromBrideSide + "&statusId=" + statusId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("statusReportIndividualVerticalDiv").style.display = "block";
            document.getElementById("statusReportIndividualVerticalDiv").innerHTML = html;
        }, error: function ()
        {
        }
    });
//               
}
function editMeeting(statusId, meetingId, contactId)
{

    $.ajax({
        type: "post",
        url: "editMeeting",
        data: "statusId=" + statusId + "&meetingId=" + meetingId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("editMeeting").style.display = "block";
            document.getElementById("editMeeting").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function editMeetingIndividual(statusId, meetingId, contactId, matchId)
{

    $.ajax({
        type: "post",
        url: "editMeetingIndividual",
        data: "statusId=" + statusId + "&meetingId=" + meetingId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("editMeetingIndividual").style.display = "block";
            document.getElementById("editMeetingIndividual").innerHTML = html;

            $("#eischeduleDate").datepicker({
                format: "dd/mm/yyyy",
            });
            $('#timepicker2').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});
            document.getElementById("eischeduleMeetingMatchId").value = matchId;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function editMeetingHorizontal(statusId, meetingId, contactId)
{

    $.ajax({
        type: "post",
        url: "editMeetingHorizontal",
        data: "statusId=" + statusId + "&meetingId=" + meetingId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById("editMeetingHorizontal").style.display = "block";
            document.getElementById("editMeetingHorizontal").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function statusReportIndividual(contactId)
{
    var twoWayFlag = document.getElementById('twoWayFlag').value;  //added by vineet on 28-01-2017 from arm Dashboard
    $('#listViewMatch').hide();
    $('#gridViewMatch').hide();
    $('#listView').show();
    $('.listViewStatus').show();
    $('#divideList').val(0);
    var deptId = document.getElementById("deptId").value;
    document.getElementById('listView').style.display = "inline-block";
    document.getElementById('statusDivColumn').style.display = "none";
    if (deptId != 9 && deptId != 15 && deptId != 16 && deptId != 18)  // conditions added by vineet on 24-11-2016
    {
        document.getElementById('matchListReport').style.display = "none";
    }
    document.getElementById('statusDivRow').style.display = "block";
//                var d1 = document.getElementById("statusReportIndividualVertical");
//                alert(d1);
//                 d1.className += "fade";

//                  var d = document.getElementById("divcontent1");
//                d.className += " in";
//                document.getElementById("statusReportIndividualVertical").style.display="none";   

//                 var d = document.getElementById("usersListIndividual");
//                d.removeClass= "in";

//                    document.getElementById("usersListIndividual").style.display = "none";

    $.ajax({
        type: "post",
        url: "fetchStatusListIndividual",
        data: "contactId=" + contactId + "&twoWayFlag=" + twoWayFlag,
        success: function (html) {

//                        var temp = html.split("+++");
//                        alert(html);
//                        document.getElementById("statusReportIndividualDiv").style.display = "block";
//                        document.getElementById("statusReportIndividualDiv").innerHTML = html;
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = html;
//                        document.getElementById("subinay2").style.display = "block";
//                        document.getElementById("subinay2").innerHTML = temp[1];

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
//                document.getElementById("usersListIndividual").style.display = "none";
}

//New Function by vineet for Match Report List View

function MatchReportIndividual(contactId)
{
    document.getElementById('searchDivMatchList').style.display = "inline-block";
    document.getElementById('listViewMatch').style.display = "inline-block";
    document.getElementById('homeHide').style.display = "none";
    document.getElementById('divcontent').style.display = "none";
    document.getElementById('sent1').style.display = "none";
    document.getElementById('search1').style.display = "none";
    document.getElementById('received1').style.display = "none";
    document.getElementById('both1').style.display = "none";
    document.getElementById('rejected1').style.display = "none";
    document.getElementById('rejectedoneside1').style.display = "none";
    document.getElementById('matchListReport').style.display = "block";
    $('#searchButtonTag').click();

    var maritalStatus = document.getElementById("maritalStatus").value;
    var gender = document.getElementById("gender").value;
    var desiredPartnersAge1 = document.getElementById("partnerage1").value;
    var desiredPartnersAge2 = document.getElementById("partnerage2").value;
    var categoryId = "";
    var communityId = "";

    var countryId = "";
    var cityId = document.getElementById("tags").value;
    var excludeCity = document.getElementById("excludeCity").value;
    var education = document.getElementById("tags1").value;
    var gotra = document.getElementById("gotra").value;
    var motherTongueId = document.getElementById("motherTongueId").value;
    var heightFrom = document.getElementById("heightFrom").value;
    var heightTo = document.getElementById("heightTo").value;
    var searchBy = document.getElementById("searchBy").value;
    var allVals = [];
    var allVals1 = [];
    var manglik = document.getElementById("manglik").value;
    var allVals2 = [];
    $('#checkboxes2 :checked').each(function () {
        allVals2.push($(this).val());
    });
    if (allVals2 !== "")
    {
        countryId = allVals2;
    }
    $('#checkboxes :checked').each(function () {
        allVals.push($(this).val());
    });
    if (allVals !== "")
    {
        categoryId = allVals;
    }
    $('#checkboxes1 :checked').each(function () {
        allVals1.push($(this).val());
    });
    if (allVals1 !== "")
    {
        communityId = allVals1;
    }
    document.getElementById("loading").style.display = "block";
    $.ajax({
        type: "post",
        url: "fetchMatchListIndividual",
        data: "manglik=" + manglik + "&education=" + education + "&communityId=" + communityId + "&desiredPartnersAge2=" + desiredPartnersAge2 + "&desiredPartnersAge1=" + desiredPartnersAge1 + "&contactId=" + contactId + "&searchBy=" + searchBy + "&maritalStatus=" + maritalStatus + "&gender=" + gender + "&categoryId=" + categoryId + "&countryId=" + countryId + "&cityId=" + cityId + "&countryId=" + countryId + "&gotra=" + gotra + "&motherTongueId=" + motherTongueId + "&heightFrom=" + heightFrom + "&heightTo=" + heightTo + "&excludeCity=" + excludeCity,
        success: function (html) {
            document.getElementById("loading").style.display = "none";
            document.getElementById("matchReportIndividualDiv").style.display = "block";
            document.getElementById("matchReportIndividualDiv").innerHTML = html;
            $('#searchButtonTag').click();

        }
    });
}

//Finished Match report List View

function showMatchDiv(contactId)
{ 
   // alert();
//    $('#searchTab').on('click',function(){ alert();
//        $('#searchButton').click();
//    });


    $('#searchTab').click();
    setTimeout(function () {
        $('#searchButtonTag').click();
    }, 0);
//alert("showMatchDiv 1690");
//    document.getElementById('searchDivMatchList').style.display = "inline-block";
//    document.getElementById('listViewMatch').style.display = "inline-block";
//    document.getElementByClass('homeHide').style.display = "block";
//    document.getElementById('divcontent').style.display = "none";
//    document.getElementById('sent1').style.display = "none";
//    document.getElementById('search1').style.display = "none";
//    document.getElementById('received1').style.display = "none";
//    document.getElementById('matchListReport').style.display = "none";
//    document.getElementById('both1').style.display = "none";
//    document.getElementById('rejected1').style.display = "none";
//    document.getElementById('rejectedoneside1').style.display = "none";
//    document.getElementById('matchListReport').style.display = "none";

}

function statusReportVertical(contactId)
{
    document.getElementById("statusListIndividualTable").style.display = "none";
    document.getElementById("disp").style.display = "block";
//                alert(contactId);
//                $.ajax({
//                    type: "post",
//                    url: "fetchStatusListIndividualVertical",
//                    data: "contactId=" + contactId,
//                     alert("sdfsdf");
//                    success: function (html) {
//                        alert(html);
//                         document.getElementById("statusReportIndividualDiv").style.display = "none";
//                        document.getElementById("statusReportIndividualDivVertical").style.display = "block";
//                        document.getElementById("statusReportIndividualDivVertical").innerHTML = html;
//
//                    }, error: function ()
//                    {
//                        alert("Please try later");
//                    }
//                });
}
function showdivStatus(contactId)
{
    $('#divideList').val(1);
    var deptId = document.getElementById("deptId").value;
    document.getElementById('statusDivColumn').style.display = "block";
    document.getElementById('statusDivRow').style.display = "none";
    if (deptId != 9 && deptId != 15 && deptId != 16 && deptId != 18) // conditions added by vineet on 24-11-2016
    {
        document.getElementById('matchListReport').style.display = "none";
    }
    var twoWayFlag = document.getElementById('twoWayFlag').value;  //added by vineet on 28-01-2017 from arm Dashboard
    $.ajax({
        type: "post",
        url: "fetchStatusListVertical",
        data: "contactId=" + contactId + "&twoWayFlag=" + twoWayFlag,
        success: function (html) {
            document.getElementById("subinay2").style.display = "block";
            document.getElementById("subinay2").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}

//function showdivMatch(contactId)
//{
//    document.getElementById('').style.display="none";
//    doculent.getElementById('home').style.display="block";
//}

function saveFollowUp()
{
//                alert("Inside");
    var projectId = document.getElementById('projectId1').value;
    var content = document.getElementById('content').value;
    var nextDate = document.getElementById('nextDate').value;
    var contactId = document.getElementById('followupContactId').value;
//                alert(projectId);
//                alert(content);
//
//                alert(nextDate);
//                alert(contactId);

    if (projectId === '0')
    {
        document.getElementById('validateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('validateProject').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('validateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('validateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('validateDate').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "saveFollowup",
        data: "contactId=" + contactId + "&nextDate=" + nextDate + "&content=" + content + "&projectId=" + projectId,
        success: function (html)
        {
//                        alert("Followup saved" + html);
            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
            $('.nav-tabs a[href="#homeFollowup"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveFollowUpStatusFinal()
{

    var projectId = document.getElementById('sffprojectId').value;
    var content = document.getElementById('sffcontent1').value;
    var nextDate = document.getElementById('sffnextDate').value;
    var contactId = document.getElementById('sffollowupContactId').value;
    var timepicker = document.getElementById('timepicker3').value;
//                  alert(projectId);
//                alert(content);
//
//                alert(nextDate);
//                alert(contactId);
    if (projectId === '0')
    {
        document.getElementById('sffvalidateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('sffvalidateProject').style.display = "none";
    }
//                alert(content);
    if (content === '')
    {
        document.getElementById('sffvalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('sffvalidateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('sffvalidateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('sffvalidateDate').style.display = "none";
    }
//                alert("here");
    $.ajax({
        type: "post",
        url: "saveFollowupStatusFinal",
        data: "time=" + timepicker + "&contactId=" + contactId + "&nextDate=" + nextDate + "&content=" + content + "&projectId=" + projectId,
        success: function (html)
        {
            alert("Followup saved");
            document.getElementById("followupHistoryStatusFinal").style.display = "block";
            document.getElementById("followupHistoryStatusFinal").innerHTML = html;
            document.getElementById('sffcontent1').value = "";
            document.getElementById('sffprojectId').value = "0";
            document.getElementById('timepicker3').value = "";
            document.getElementById('sffnextDate').value = "";

            $('.nav-tabs a[href="#homeFollowupStatusFinal"]').tab('show');


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveFollowUpIndividual()
{
    var projectId = document.getElementById('iprojectId').value;
    var content = document.getElementById('icontent').value;
    var nextDate = document.getElementById('inextDate').value;
    var contactId = document.getElementById('ifollowupContactId').value;
    if (projectId === '0')
    {
        document.getElementById('ivalidateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidateProject').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('ivalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('ivalidateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('ivalidateDate').style.display = "none";
    }
    $.ajax({
        type: "post",
        url: "saveFollowup",
        data: "contactId=" + contactId + "&nextDate=" + nextDate + "&content=" + content + "&projectId=" + projectId,
        success: function (html)
        {
            alert("Followup saved");
            document.getElementById("followupHistoryIndividual").style.display = "block";
            document.getElementById("followupHistoryIndividual").innerHTML = html;
//                        $('.nav-tabs a[href="#homeFollowup"]').tab('show');
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function moveToOutBox(contactId)
{
    $.ajax({
        type: "post",
        url: "moveto",
        data: "contactId=" + contactId,
        success: function (html)
        {
            document.getElementById("size").style.display = "block";
            document.getElementById("size").innerHTML = html;
//            document.getElementById("sizeForOutBoxCountDisplay").innerHTML = html;
        }
    });
}
function fetchOutBoxData(contactId)
{
    $.ajax({
        type: "post",
        url: "fetchOutBoxList",
        data: "contactId=" + contactId,
        success: function (html)
        {
            var tempArray = html.split("______");
            document.getElementById("outBoxSection").style.display = "block";
            document.getElementById("outBoxSection").innerHTML = tempArray[0];
//            document.getElementById("templateDivId").innerHTML = tempArray[1];
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function fetchTemplateData(templateId) {
    $.ajax({
        type: "post",
        url: "fetchTemplateData",
        data: "templateId=" + templateId,
        success: function (html)
        {
//            CKEDITOR.instances.mailNote.setData(html);
//alert("Inside");
            CKEDITOR.instances.mailNote.setData(html);
//   alert(html);
//            document.getElementById("mailNote").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function changeMovetoOutBox()
{
    $.ajax({
        type: "post",
        url: "changeOutBoxCount",
        data: "outBoxContactIds=" + 1,
        success: function (html)
        {
            document.getElementById("size").innerHTML = html;
//            document.getElementById("sizeForOutBoxCountDisplay").innerHTML = html;
        }
    });
}
function closeMoveToOutBox(type)
{
    var abc = closeMoveToOutBox1(type);
    $.when(abc).then(function () {
        changeMovetoOutBox();
        $(".iconinLine").removeClass("highlightYellow");
    });
}
function closeMoveToOutBox1(type)
{
    var deferred = $.Deferred();
    var id = "";
    var intMailBy = document.getElementById('intMailBy').value;
    var mailTo = document.getElementById('mailTo').value;
    var emails = document.getElementById('emails').value;
    var mailNote = document.getElementById('mailNote').value;
    var contactId = document.getElementById('ocontactId').value;
    var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (emails.indexOf(',') > -1)
    {
        var valid = true;
        var member_split = emails.split(',');
        for (var n = 0; n < member_split.length; n++) {
            if (!regEmail.test(member_split[n]))
            {
                alert("Please check email");
                return false;
            }
        }
    } else {
        if (emails !== "")
        {
            if (!regEmail.test(emails))
            {
                alert("Please check email");
                return false;
            }
        }

    }
    var outBoxContactIds = "";
    $("input:checkbox[class=chk]").each(function () {
        if ($(this).is(":checked") === true)
        {
            id = id + ',' + $(this).val();
        }
    });
    if (type === 1)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            outBoxContactIds = document.getElementById('outBoxContactIds').value = id;
//            alert("This will mail biodata of selected contact");
            document.getElementById("loading").style.display = "block";
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + outBoxContactIds,
                success: function (html)
                {
                    document.getElementById('closeModal4').click();
                    document.getElementById("loading").style.display = "none";
//                    alert("Mail Sent successfully");

                    if (html.length > 5)
                    {
                        alert("Generate Batch Id=" + html);
                    } else {
                        alert("Please try later");
                    }

                    deferred.resolve(true);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }
    if (type === 2)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            outBoxContactIds = document.getElementById('outBoxContactIds').value = id;
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
            document.getElementById("loading").style.display = "block";
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + outBoxContactIds,
                success: function (html)
                {
                    document.getElementById("loading").style.display = "none";
                    document.getElementById('closeModal4').click();
                    if (html.length > 5)
                    {
                        alert("Generate Batch Id=" + html);
                    } else {
                        alert("Please try later");
                    }
//                    alert("Mail Sent successfully");
                    deferred.resolve(true);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }
    if (type === 5)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            outBoxContactIds = document.getElementById('outBoxContactIds').value = id;
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
            document.getElementById("loading").style.display = "block";
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=1&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + outBoxContactIds,
                success: function (html)
                {
                    document.getElementById("loading").style.display = "none";
                    document.getElementById('closeModal4').click();
//                    alert("Mail Sent successfully");
                    if (html.length > 5)
                    {
                        alert("Generate Batch Id=" + html);
                    } else {
                        alert("Please try later");
                    }
                    deferred.resolve(true);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }
    if (type === 4)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            outBoxContactIds = document.getElementById('outBoxContactIds').value = id;
            $.ajax({
                type: "post",
                url: "saveToShortlist",
                data: "intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + outBoxContactIds,
                success: function (html)
                {
                    document.getElementById('closeModal4').click();
                    document.getElementById("outBoxSection").style.display = "block";
                    deferred.resolve(true);
                }
            });
        }
    }

    if (type === 3)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        }
        $.ajax({
            type: "post",
            url: "deleteFromOutBox",
            data: "outBoxContactIds=" + id,
            success: function (html)
            {
                document.getElementById('closeModal4').click();
                document.getElementById("size").style.display = "block";
                document.getElementById("size").innerHTML = html;
                deferred.resolve(true);
            }
        });
    }
    return deferred.promise();

}
function saveEmail()
{
    var recepient = document.getElementById('recepientIds').value;
    var subject = document.getElementById('emailSubject').value;
    if (recepient === '')
    {
        document.getElementById('recepientIdsValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('recepientIdsValidate').style.display = "none";
    }
    if (subject === '')
    {
        document.getElementById('emailSubjectValidate').style.display = "block";
    } else {
        document.getElementById('emailSubjectValidate').style.display = "none";
    }
    return true;
}
function saveEmailIndividual()
{
    var recepient = document.getElementById('irecepientIds').value;
    var subject = document.getElementById('iemailSubject').value;
    if (recepient === '')
    {
        document.getElementById('irecepientIdsValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('irecepientIdsValidate').style.display = "none";
    }
    if (subject === '')
    {
        document.getElementById('iemailSubjectValidate').style.display = "block";
    } else {
        document.getElementById('iemailSubjectValidate').style.display = "none";
    }
    return true;
}
function saveEmailStatusFinal()
{
    var recepient = document.getElementById('sfrecepientIds').value;
    var subject = document.getElementById('sfemailSubject').value;
    var mailNote = CKEDITOR.instances.emailContent.getData();
    document.getElementById('emailContent1').value = mailNote;
    if (recepient === '')
    {
        document.getElementById('sfrecepientIdsValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('sfrecepientIdsValidate').style.display = "none";
    }
    if (subject === '')
    {
        document.getElementById('sfemailSubjectValidate').style.display = "block";
    } else {
        document.getElementById('sfemailSubjectValidate').style.display = "none";
    }
    var text = confirm("Are you sure you want to send mail.");
    if (text == true) {
        return true;
    } else {
        return false;
    }

}
function searchStatusReport()
{
    var matchStatus = document.getElementById("matchStatus").value;
    var meetingStatus = document.getElementById("meetingStatus").value;
    var finalStatus = document.getElementById("finalStatus").value;
    var priority = document.getElementById("priority").value;
    var search = document.getElementById("search").value;
    var contactId = document.getElementById("searchContactId").value;
    $.ajax({
        type: "post",
        url: "searchStatusReport",
        data: "contactId=" + contactId + "&matchStatus=" + matchStatus + "&meetingStatus=" + meetingStatus + "&finalStatus=" + finalStatus + "&priority=" + priority + "&search=" + search,
        success: function (html)
        {
            document.getElementById("statusReportList").style.display = "block";
            document.getElementById("statusReportList").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function searchStatusReport1(contactId)
{

    var divide = document.getElementById("divideList").value;
    var matchStatus = document.getElementById("imatchStatus").value;
    var meetingStatus = document.getElementById("imeetingStatus").value;
    var finalStatus = document.getElementById("ifinalStatus").value;
    var priority = document.getElementById("ipriority").value;
    var search = document.getElementById("isearch").value;
    var statusCity = document.getElementById("statusCity").value;
    var movedStatus = document.getElementById("imovedStatus").value;

    $.ajax({
        type: "post",
        url: "searchStatusReport1",
        data: "movedStatus=" + movedStatus + "&contactId=" + contactId + "&matchStatus=" + matchStatus + "&meetingStatus=" + meetingStatus + "&finalStatus=" + finalStatus + "&priority=" + priority + "&search=" + search + "&statusCity=" + statusCity + "&divide=" + divide,
        success: function (html)
        {
            if (divide == 0)
            {
                document.getElementById("statusReportIndividualDiv").style.display = "block";
                document.getElementById("statusReportIndividualDiv").innerHTML = html;
            } else
            {
                document.getElementById("subinay2").style.display = "block";
                document.getElementById("subinay2").innerHTML = html;
            }
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function searchStatusReport2()
{
    var matchStatus = document.getElementById("vmatchStatus").value;
    var meetingStatus = document.getElementById("vmeetingStatus").value;
    var finalStatus = document.getElementById("vfinalStatus").value;
    var priority = document.getElementById("vpriority").value;
    var search = document.getElementById("vsearch").value;
    var contactId = document.getElementById("vsearchContactId").value;
    $.ajax({
        type: "post",
        url: "searchStatusReport",
        data: "contactId=" + contactId + "&matchStatus=" + matchStatus + "&meetingStatus=" + meetingStatus + "&finalStatus=" + finalStatus + "&priority=" + priority + "&search=" + search,
        success: function (html)
        {
            document.getElementById("statusReportIndividualVerticalDiv").style.display = "block";
            document.getElementById("statusReportIndividualVerticalDiv").innerHTML = html;
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function displaySearch()
{
    document.getElementById('sent1').style.display = "none";
    document.getElementById('search1').style.display = "block";
    document.getElementById('sub3').style.display = "block";
    document.getElementById('received1').style.display = "none";
//    document.getElementById('matchListReport').style.display = "none";
    document.getElementById('both1').style.display = "none";
    document.getElementById('rejected1').style.display = "none";
    document.getElementById('rejectedoneside1').style.display = "none";
    document.getElementById('matchReportListDivSentUnique').style.display = "none";
}
function displaySent(contactId, type)
{
//    document.getElementById('searchDivMatchList').style.display = "none";

    if (type === 1)
    {
        document.getElementById('sent1').style.display = "block";
        document.getElementById('search1').style.display = "none";
        document.getElementById('received1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('both1').style.display = "none";
        document.getElementById('rejected1').style.display = "none";
        document.getElementById('rejectedoneside1').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "none";
    }
    if (type === 2)
    {
        document.getElementById('received1').style.display = "block";
        document.getElementById('search1').style.display = "none";
        document.getElementById('sent1').style.display = "none";
        document.getElementById('both1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('rejected1').style.display = "none";
        document.getElementById('rejectedoneside1').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "none";
    }
    if (type === 3)
    {
        document.getElementById('both1').style.display = "block";
        document.getElementById('search1').style.display = "none";
        document.getElementById('sent1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('received1').style.display = "none";
        document.getElementById('rejected1').style.display = "none";
        document.getElementById('rejectedoneside1').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "none";
    }
    if (type === 4)
    {
        document.getElementById('rejected1').style.display = "block";
        document.getElementById('both1').style.display = "none";
        document.getElementById('search1').style.display = "none";
        document.getElementById('sent1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('received1').style.display = "none";
        document.getElementById('rejectedoneside1').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "none";

    }
    if (type === 5)
    {
        document.getElementById('rejectedoneside1').style.display = "block";
        document.getElementById('both1').style.display = "none";
        document.getElementById('search1').style.display = "none";
        document.getElementById('sent1').style.display = "none";
        document.getElementById('received1').style.display = "none";
        document.getElementById('rejected1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "none";
    }
    if (type === 6)
    {
        document.getElementById('rejectedoneside1').style.display = "none";
        document.getElementById('both1').style.display = "none";
        document.getElementById('search1').style.display = "none";
        document.getElementById('sent1').style.display = "none";
        document.getElementById('received1').style.display = "none";
        document.getElementById('rejected1').style.display = "none";
        document.getElementById('matchListReport').style.display = "none";
        document.getElementById('matchReportListDivSentUnique').style.display = "block";

    }
    document.getElementById("loading").style.display = "block";
    $.ajax({
        type: "post",
        url: "isBiodataSent",
        data: "contactId=" + contactId + "&type=" + type,
        success: function (html)
        {
            if (type === 1)
            {
                document.getElementById("sent1").innerHTML = html;
            } else if (type === 2)
            {
                document.getElementById("received1").innerHTML = html;
            } else if (type === 3)
            {
                document.getElementById("both1").innerHTML = html;
            } else if (type === 4)
            {
                document.getElementById("rejected1").innerHTML = html;
            } else if (type === 5)
            {
                document.getElementById("rejectedoneside1").innerHTML = html;
            } else if (type === 6)
            {
                document.getElementById("matchReportListDivSentUnique").innerHTML = html;
                $("#matchReportSentDateFrom").datepicker({
                    format: "dd/mm/yyyy"
                });
                $("#matchReportSentDateTo").datepicker({
                    format: "dd/mm/yyyy"
                });
            }
            document.getElementById("loading").style.display = "none";

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function sentBioDataUnique()
{
    var contactId = document.getElementById('contactIdForSentBioDataUnique').value;
    var fromDate = document.getElementById('matchReportSentDateFrom').value;
    var toDate = document.getElementById('matchReportSentDateTo').value;
    $.ajax({
        type: "post",
        url: "isBiodataSent",
        data: "fromDate=" + fromDate + "&toDate=" + toDate + "&contactId=" + contactId + "&type=" + 6,
        success: function (html)
        {
            document.getElementById('matchReportListDivSentUnique').style.display = "block";
            document.getElementById("matchReportListDivSentUnique").innerHTML = html;
//            document.getElementById("matchReportListDiv").innerHTML = html;
            $("#matchReportSentDateFrom").datepicker({
                format: "dd/mm/yyyy"
            });
            $("#matchReportSentDateTo").datepicker({
                format: "dd/mm/yyyy"
            });

            document.getElementById("loading").style.display = "none";

        }
    });
}

function hideSearch()
{
    document.getElementById('sub3').style.display = "none";
}

function setVisibility(id, visibility) {
    document.getElementById(id).style.display = visibility;
}
function profileExchangeData(contactId, matchId, id)
{
//                alert("contactId" + contactId);
//                alert("matchId" + matchId);
    document.getElementById("exchangeContactId").value = contactId;
    document.getElementById("exchangeMatchId").value = matchId;
    if (id === 1)
    {
        document.getElementById("Resend").style.display = "block";
        document.getElementById("Twoway").style.display = "block";
        document.getElementById("Onewy").style.display = "block";
        document.getElementById("Oneway").style.display = "none";
    }
    if (id === 2)
    {
        document.getElementById("Resend").style.display = "none";
        document.getElementById("Twoway").style.display = "none";
        document.getElementById("Onewy").style.display = "none";
        document.getElementById("Resend1").style.display = "block";
        document.getElementById("Onewy1").style.display = "block";
        document.getElementById("Oneway1").style.display = "block";

    }
}
function searchMatchList()
{
    var divide = document.getElementById("divideList").value;
    var ajaxContactId = document.getElementById("ajaxContactId").value;
    var maritalStatus = document.getElementById("maritalStatus").value;
    var gender = document.getElementById("gender").value;
    var desiredPartnersAge1 = document.getElementById("partnerage1").value;
    var desiredPartnersAge2 = document.getElementById("partnerage2").value;
    var categoryId = "";
    var communityId = "";
    var countryId = document.getElementById("countryId").value;
    var cityId = document.getElementById("tags").value;
    var education = document.getElementById("tags1").value;
    var excludeCity = document.getElementById("excludeCity").value;
    var gotra = document.getElementById("gotra").value;
    var motherTongueId = document.getElementById("motherTongueId").value;
    var heightFrom = document.getElementById("heightFrom").value;
    var heightTo = document.getElementById("heightTo").value;
    var searchBy = document.getElementById("searchBy").value;
    var manglik = document.getElementById("manglik").value;
    var rmIdForMatchSearch = document.getElementById("rmIdForMatchSearch").value;

    var allVals = [];
    var allVals1 = [];
    var allVals2 = [];
    $('#checkboxes2 :checked').each(function () {
        allVals2.push($(this).val());

    });
    if (allVals2 !== "")
    {
        countryId = allVals2;
    }
    $('#checkboxes :checked').each(function () {
        allVals.push($(this).val());
    });
    if (allVals !== "")
    {
        categoryId = allVals;
    }
    $('#checkboxes1 :checked').each(function () {
        allVals1.push($(this).val());
    });
    if (allVals1 !== "")
    {
        communityId = allVals1;
    }
    document.getElementById("loading").style.display = "block";
    $.ajax({
        type: "post",
        url: "getMatchListByNameAjax",
        data: "rmIdForMatchSearch=" + rmIdForMatchSearch + "&countryId=" + countryId + "&manglik=" + manglik + "&education=" + education + "&communityId=" + communityId + "&desiredPartnersAge2=" + desiredPartnersAge2 + "&desiredPartnersAge1=" + desiredPartnersAge1 + "&contactId=" + ajaxContactId + "&searchBy=" + searchBy + "&maritalStatus=" + maritalStatus + "&gender=" + gender + "&categoryId=" + categoryId + "&cityId=" + cityId + "&gotra=" + gotra + "&motherTongueId=" + motherTongueId + "&heightFrom=" + heightFrom + "&heightTo=" + heightTo + "&divide=" + divide + "&excludeCity=" + excludeCity,
        success: function (html)
        {
            document.getElementById("loading").style.display = "none";
            document.getElementById("hideSearchBox").click();
            if (divide == 0)
            {
                document.getElementById("usersList").style.display = "block";
                document.getElementById("usersList").innerHTML = html;
                document.getElementById("matchHeaderListSizeDuplicate").innerHTML = document.getElementById("matchHeaderListSize").innerHTML;
            } else
            {
                console.log(document.getElementById("matchHeaderListSize").innerHTML);
                document.getElementById("matchReportIndividualDiv").style.display = "block";
                document.getElementById("matchReportIndividualDiv").innerHTML = html;
                document.getElementById("matchHeaderListSizeDuplicate").innerHTML = $("#ListMatchRecords").val();//document.getElementById("ListMatchRecords").value;
            }

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function exchangeProfile(type)
{
    var contactId = document.getElementById("exchangeContactId").value;
    var matchId = document.getElementById("exchangeMatchId").value;
    if (type === 1)
    {
        $.ajax({
            type: "post",
            url: "emailStatus",
            data: "contactId=" + contactId + "&matchId=" + matchId + "&mailType=2",
            success: function (html)
            {
                alert("Generated BatchId=" + html);
                document.getElementById("statusReportTab").click();
                document.getElementById("exchangeModal").click();
            }, error: function ()
            {
//                alert("Please try later");
            }
        });
    }
    if (type === 2)
    {

        $.ajax({
            type: "post",
            url: "emailStatus",
            data: "contactId=" + contactId + "&matchId=" + matchId + "&mailType=1",
            success: function (html)
            {
                alert("Generated BatchId=" + html);
                document.getElementById("statusReportTab").click();
                document.getElementById("exchangeModal").click();
            }, error: function ()
            {
//                alert("Please try later");
            }
        });
    }
    if (type === 3)
    {
//it is viceversa
        $.ajax({
            type: "post",
            url: "emailStatus",
            data: "contactId=" + matchId + "&matchId=" + contactId + "&mailType=1",
            success: function (html)
            {
                alert("Generated BatchId=" + html);
                document.getElementById("statusReportTab").click();
                document.getElementById("exchangeModal").click();
            }, error: function ()
            {
//                alert("Please try later");
            }
        });
    }

}
function editFeedBack(subject, content, contactId, id)
{
    $('.nav-tabs a[href="#editFeedback"]').tab('show');
    document.getElementById("sffeditsubject").value = subject;
    document.getElementById("sffeditcontent").value = content;
    document.getElementById("sffeditfeedbackId").value = id;
    document.getElementById("sffeditcontactId").value = contactId;

//   
}
function feedbackNewEdit(contactId)
{
//     alert("adfasdf");
    $('#matchListReport').hide();
    $('#menus3').show();
    $('#menus2').hide();
    $('#menus5').hide();
    $.ajax({
        type: "post",
        url: "feedbackNewEdit",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedBackHistoryImportantInformation").style.display = "block";
            document.getElementById("feedBackHistoryImportantInformation").innerHTML = temp[0];
            document.getElementById("budgetDiv").innerHTML = temp[1];
            document.getElementById("preferenceDiv").innerHTML = temp[2];
            document.getElementById("familySalaryDiv").innerHTML = temp[3];
            document.getElementById("propertyOfOwnershipDiv").innerHTML = temp[4];
            document.getElementById("reasonOfDivorceDiv").innerHTML = temp[5];
            document.getElementById("divorcedOrSettledDiv").innerHTML = temp[6];
            document.getElementById("referenceGivenByDiv").innerHTML = temp[7];
            document.getElementById("familyBackgroundDiv").innerHTML = temp[8];
            document.getElementById("additionalInformationRemark").innerHTML = temp[9];
            
            ckeditor.replace('#fname'); // ADD THIS
            $('#fname').ckeditor(); // ADD THIS

//            Added by vineet on 05-04-2017 to add Feedback Heading
//            alert("temp[11]..." + temp[11]);
//            document.getElementById('feedBackHeading').innerHTML = "FeedBack Of " + temp[11];
        }
    });
}
function saveEditFeedBackNew()
{
    var subject = document.getElementById("asubject").value;
    var content = document.getElementById("acontent").value;
    var feedbackId = document.getElementById("afeedbackid").value;
    var contactId = document.getElementById("acontactId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }
//    alert("here");
    $.ajax({
        type: "post",
        url: "saveEditFeedBackNew",
        data: "contactId=" + contactId + "&feedbackId=" + feedbackId + "&subject=" + subject + "&content=" + content,
        success: function (html) {
            var temp = html.split("___")
            document.getElementById("feedBackHistoryImportantInformation").style.display = "block";
            document.getElementById("feedBackHistoryImportantInformation").innerHTML = temp[0];

        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function editFeedBackNew(subject, content, contactId, id)
{
    $.ajax({
        type: "post",
        url: "editFeedBackNew",
        data: "contactId=" + contactId + "&content=" + content + "&subject=" + subject + "&feedbackid=" + id,
        success: function (html)
        {
            document.getElementById('editAdditionalInfoDiv' + id).style.display = "block";
            document.getElementById('editAdditionalInfoDiv' + id).innerHTML = html;


        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function saveFeedBackNew()
{
    var subject = document.getElementById("additionalSubject").value;
    subject = subject.replace("&", "###"); 
    var content = document.getElementById("additionalContent").value;
    content = content.replace("&", "###");
    var contactId = document.getElementById("additionalContactId").value;
    if (subject === '')
    {
        alert("Please enter subject");
        return false;
    }
    if (content === '')
    {
        alert("Please enter content");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveFeedBackNew",
        data: "contactId=" + contactId + "&subject=" + subject + "&content=" + content,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedBackHistoryImportantInformation").style.display = "block";
            document.getElementById("feedBackHistoryImportantInformation").innerHTML = temp[0];
        }
    });
}
function showAllActivity(contactId, type)
{
    $.ajax({
        type: "post",
        url: "fetchAuditTrailAll",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById('activityLogDiv').style.display = "block";
            document.getElementById('activityLogDiv').innerHTML = html;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("activityLogMatchReport").innerHTML = "Activity Log of" + html;
        }
    });

}
function fetchActivityLog(contactId)
{
    var deptId = document.getElementById("deptId").value;
    if (deptId !== 9 && deptId != 15 && deptId != 16 && deptId != 18)   // conditions added by vineet on 24-11-2016
    {
        document.getElementById('matchListReport').style.display = "none";
    }
    $('#menus5').show();
    $('#menus3').hide();
    $('#menus2').hide();
    $.ajax({
        type: "post",
        url: "fetchAuditTrailAll",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById('activityDiv').style.display = "block";
            document.getElementById('activityDiv').innerHTML = html;
        }
    });
}
function fetchActivityLogVertical(contactId)
{
    $.ajax({
        type: "post",
        url: "fetchAuditTrailAll",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById('profileActivityIndividualVerticalDiv').style.display = "block";
            document.getElementById('profileActivityIndividualVerticalDiv').innerHTML = html;
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("profileActivityIndividualVerticalHeading").innerHTML = "Activity Log of " + html;
        }
    });
}
function emailStatus(contactId, matchId, stid)
{

    $.ajax({
        type: "post",
        url: "getEmailStatus",
        data: "contactId=" + contactId + "&matchId=" + matchId + "&stid=" + stid,
        success: function (html) {
            document.getElementById('emailStatusDiv').style.display = "block";
            document.getElementById('emailStatusDiv').innerHTML = html;
            document.getElementById('emailStatusHeading').innerHTML = document.getElementById("cinfo").value;
        }
    });
}
function fetchCityList()
{
    $.ajax({
        type: "post",
        url: "fetchCityList",
        success: function (html) {
            document.getElementById('cityAuto').innerHTML = html;

        }
    });

}
function resetSearch()
{
    $('#checkboxes1').find('input[type=checkbox]:checked').removeAttr('checked');
    $('#checkboxes').find('input[type=checkbox]:checked').removeAttr('checked');
    $('#checkboxes2').find('input[type=checkbox]:checked').removeAttr('checked');


    document.getElementById("partnerage1").value = "";
    document.getElementById("partnerage2").value = "";
    document.getElementById("heightFrom").value = "";
    document.getElementById("heightTo").value = "";
    document.getElementById("countryId").value = "";
    document.getElementById("tags").value = "";
    document.getElementById("gotra").value = "";
    document.getElementById("searchBy").value = "";
    document.getElementById("tags1").value = "";
    document.getElementById("manglik").value = "";
}
function changePriority(matchId, contactId)
{
    document.getElementById("pmatchId").value = matchId;
    document.getElementById("pcontactId").value = contactId;
}
function setPriority(value)
{
    var matchId = document.getElementById("pmatchId").value;
    var contactId = document.getElementById("pcontactId").value;
    $.ajax({
        type: "post",
        url: "updatePriority",
        data: "contactId=" + contactId + "&matchId=" + matchId + "&value=" + value,
        success: function (html) {
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = html;
        }
    });
}

function contactexchange(contactId, matchId)
{
    var boyName = document.getElementById("boyName").value;
    var girlName = document.getElementById("girlName").value;
    var boyNumber = document.getElementById("boyNumber").value;
    var girlNumber = document.getElementById("girlNumber").value;
    var note = document.getElementById("xnote").value;
    var createdBy1 = document.getElementById("createdBy1").value;
    var createdBy2 = document.getElementById("createdBy2").value;
//    if (createdBy1 === "0")
//    {
//        alert("Please Select Boy Relation");
//        return false;
//    }
//    if (createdBy2 === "0")
//    {
//        alert("Please Select Girl Relation");
//        return false;
//    }


    var txt;
    var r = confirm("Are you sure you want to exchange data.");
    if (r == true) {
        txt = "You pressed OK!";
    } else {
        txt = "You pressed Cancel!";
        return false;
    }
    document.getElementById('loading').style.display = "block";
    $.ajax({
        type: "post",
        url: "contactExchange",
        data: "girlName=" + girlName + "&boyName=" + boyName + "&createdBy2=" + createdBy2 + "&createdBy1=" + createdBy1 + "&note=" + note + "&boyNumber=" + boyNumber + "&girlNumber=" + girlNumber + "&contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('loading').style.display = "none";
            document.getElementById("statusReportIndividualDiv").style.display = "block";
            document.getElementById("statusReportIndividualDiv").innerHTML = html;
            document.getElementById("xchangeCloseButton").click()
        }
    });
}
function fetchActivityList(type, contactId)
{
    $.ajax({
        type: "post",
        url: "fetchActivityList",
        data: "contactId=" + contactId + "&type=" + type,
        success: function (html) {
            document.getElementById("activityDiv").style.display = "block";
            document.getElementById("activityDiv").innerHTML = html;
        }
    });
}

function fetchEducationListAuto()
{
    $.ajax({
        type: "post",
        url: "fetchEducationListAuto",
        data: "contactId=" + 1,
        success: function (html) {
            document.getElementById('educationAuto').value = html;
        }
    });
}
function fetchCityListAuto()
{
    $.ajax({
        type: "post",
        url: "fetchCityListAuto",
        data: "contactId=" + 1,
        success: function (html) {
            document.getElementById('cityAuto').value = html;
        }
    });
}

function closeMeeting(meetingId, contactId, matchId, stid)
{

    var description = document.getElementById('description' + meetingId).value;

    $.ajax({
        type: "post",
        url: "closeMeeting",
        data: "stid=" + stid + "&matchId=" + matchId + "&contactId=" + contactId + "&meetingId=" + meetingId + "&description=" + description,
        success: function (html) {
            document.getElementById('emailStatusDiv').style.display = "block";
            document.getElementById('emailStatusDiv').innerHTML = html;
        }
    });

}
function profileFollowup(matchId, contactId)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!

    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var today = dd + '/' + mm + '/' + yyyy;
    var x = new Date();
    var x1 = x.getMonth() + "/" + x.getDate() + "/" + x.getYear();
    var hrs = x.getHours();
    if (hrs < 10)
    {
        hrs = '0' + hrs;
    }
    var min = x.getMinutes();
    if (min < 10)
    {
        min = '0' + min;
    }
    x1 = x1 + " - " + hrs + ":" + min;
    var time = x1.split("-");
    document.getElementById('displayContactVertical1').style.display = "none";
    $.ajax({
        type: "post",
        url: "fetchProfileFollowupData",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('profileFollowupDiv').style.display = "block";
            document.getElementById('profileFollowupDiv').innerHTML = html;

            document.getElementById("profileFollowupcontactId").value = contactId;
            document.getElementById("profileFollowupmatchId").value = matchId;
            document.getElementById("profileFollowupDate").value = today;
            document.getElementById("profileFollowupTime").value = time[1];
            $('#profileFollowupDateDivFrom').hide();
            $('#profileFollowupDateDivTo').hide();
            $('#batchListDiv').hide();
            $('#profileFollowupRemarkSearchButton').hide();
            $('#profileFollowupBatchSaveButton').hide();


            $("#profileFollowupDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $('#profileFollowupTime').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});

        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + matchId,
        success: function (html) {
            document.getElementById("profileHeader").innerHTML = "Profile Follow-Up of " + html;
            document.getElementById("profileHeader").style.display = "block";
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function changeReasonSelectBox()
{
    var value = "";
    value = document.getElementById("mainStatusSelectBox").value;
    if (value !== "7")
    {
        $('#reasonSelectBoxDivParent').show();
        $('#profileFollowupDateDiv').show();
        $('#profileFollowupTimeDiv').show();
        $('#profileFollowupContactNumberDiv').show();
//        $('#profileFollowupRemarkDiv').show();
        $('#profileFollowupTable').show();
        $('#profileFollowupRemarkSaveButton').show();
        $('#profileFollowupDateDivFrom').hide();
        $('#profileFollowupDateDivTo').hide();
        $('#batchListDiv').hide();

        $.ajax({
            type: "post",
            url: "fetchReasonList",
            data: "mainStatusId=" + value,
            success: function (html) {
                document.getElementById('reasonSelectBoxDiv').style.display = "block";
                document.getElementById('reasonSelectBoxDiv').innerHTML = html;
            }
        });
    } else {
        $('#profileFollowupRemarkSearchButton').show();
        $('#profileFollowupBatchSaveButton').show();
        $('#batchListDiv').show();
//        $('#reasonSelectBoxDivParent').hide();
        $('#profileFollowupDateDiv').hide();
        $('#profileFollowupTimeDiv').hide();
        $('#profileFollowupContactNumberDiv').hide();
//        $('#profileFollowupRemarkDiv').hide();
        $('#profileFollowupTable').hide();
        $('#profileFollowupRemarkSaveButton').hide();
        $('#profileFollowupDateDivFrom').show();
        $('#profileFollowupDateDivTo').show();
        $("#profileFollowupDateTo").datepicker({
            format: "dd/mm/yyyy"
        });
        $("#profileFollowupDateFrom").datepicker({
            format: "dd/mm/yyyy"
        });
        var contactId = $('#profileFollowupcontactId').val();
        $.ajax({
            type: "post",
            url: "fetchBatchList",
            data: "contactId=" + contactId,
            success: function (html) {
                document.getElementById('batchListSelectDiv').style.display = "block";
                document.getElementById('batchListSelectDiv').innerHTML = html;
            }
        });
        $.ajax({
            type: "post",
            url: "fetchReasonList",
            data: "mainStatusId=" + value,
            success: function (html) {
                document.getElementById('reasonSelectBoxDiv').style.display = "block";
                document.getElementById('reasonSelectBoxDiv').innerHTML = html;
            }
        });
    }
}

function displayprofileFollowupSentList(value)
{
    var contactId = $('#profileFollowupcontactId').val();
    var dateFrom = $('#profileFollowupDateFrom').val();
    var dateTo = $('#profileFollowupDateTo').val();
    $.ajax({
        type: "post",
        url: "fetchEmailSentList",
        data: "dateTo=" + dateTo + "&dateFrom=" + dateFrom + "&batchId=" + value + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById('profileFollowupSentTable').style.display = "block";
            document.getElementById('profileFollowupSentTable').innerHTML = html;
        }
    });
}
function changeReasonSelectBox1()
{
    var value = "";
    value = document.getElementById("emainStatusSelectBox").value;
    $.ajax({
        type: "post",
        url: "fetchReasonList1",
        data: "mainStatusId=" + value,
        success: function (html) {
            document.getElementById('ereasonSelectBoxDiv').style.display = "block";
            document.getElementById('ereasonSelectBoxDiv').innerHTML = html;


        }
    });
}
function saveProfileFollowup()
{
    var mainStatusId = document.getElementById("mainStatusSelectBox").value;
    var reasonId = document.getElementById("reasonSelectBox").value;
    var profileFollowupDate = document.getElementById("profileFollowupDate").value;
    var profileFollowupTime = document.getElementById("profileFollowupTime").value;
    var profileFollowupRemark = document.getElementById("profileFollowupRemark").value;
    var contactId = document.getElementById("profileFollowupcontactId").value;
    var matchId = document.getElementById("profileFollowupmatchId").value;
    var profileFollowupContactNumber = document.getElementById("profileFollowupContactNumber").value;


    if (mainStatusId === "0")
    {
        alert("Please select main status");
        return false;
    }
    if (reasonId === "0")
    {
        alert("Please select reason");
        return false;
    }
    if (profileFollowupRemark === "")
    {
        alert("Please enter remark");
        return false;
    }
    if (mainStatusId === "3")
    {
        var profileFollowupDate = document.getElementById("profileFollowupDate").value;
        var profileFollowupTime = document.getElementById("profileFollowupTime").value;
        if (profileFollowupDate === "")
        {
            alert("Please select date");
            return false;
        }
        if (profileFollowupTime === "")
        {
            alert("Please select time");
            return false;
        }
    }
    if (profileFollowupContactNumber === "")
    {
        alert("Please select Contact Number");
        return false;
    }

    $.ajax({
        type: "post",
        url: "saveProfileFollowup",
        data: "profileFollowupContactNumber=" + profileFollowupContactNumber + "&contactId=" + contactId + "&matchId=" + matchId + "&profileFollowupRemark=" + profileFollowupRemark + "&mainStatusId=" + mainStatusId + "&reasonId=" + reasonId + "&profileFollowupDate=" + profileFollowupDate + "&profileFollowupTime=" + profileFollowupTime,
        success: function (html) {
            document.getElementById('profileFollowupDiv').style.display = "block";
            document.getElementById('profileFollowupDiv').innerHTML = html;
            document.getElementById("profileFollowupcontactId").value = contactId;
            document.getElementById("profileFollowupmatchId").value = matchId;
            $("#profileFollowupDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $('#profileFollowupTime').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});
            $('#profileFollowupDateDivFrom').hide();
            $('#profileFollowupDateDivTo').hide();
            $('#batchListDiv').hide();
            $('#profileFollowupRemarkSearchButton').hide();
            $('#profileFollowupBatchSaveButton').hide();
        }
    });
}
function searchProfileFollowupBatchWise()
{
    var contactId = $('#profileFollowupcontactId').val();
    var dateFrom = $('#profileFollowupDateFrom').val();
    var dateTo = $('#profileFollowupDateTo').val();
    var batchId = $('#batchSelectBoxSent').val();
    var reasonId = $('#reasonSelectBox').val();
    $.ajax({
        type: "post",
        url: "fetchEmailSentList",
        data: "reasonId=" + reasonId + "&dateTo=" + dateTo + "&dateFrom=" + dateFrom + "&batchId=" + batchId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById('profileFollowupSentTable').style.display = "block";
            document.getElementById('profileFollowupSentTable').innerHTML = html;
        }
    });
}

function saveProfileFollowupBatchWise()
{
    var contactId = $('#profileFollowupcontactId').val();
    var matchId = $('#profileFollowupmatchId').val();
    var profileFollowupRemark = $('#profileFollowupRemark').val();
    var reasonId = $('#reasonSelectBox').val();
    var batchSelectBoxSent = $('#batchSelectBoxSent').val();

    if (reasonId === "0")
    {
        alert("Please select reason");
        return false;
    }

    var id = "";
    $("input:checkbox[class=chkBoxFollowup]").each(function () {
        if ($(this).is(":checked") === true)
        {
            id = id + ',' + $(this).val();
        }
    });
    if (id === "")
    {
        alert("Please select atleast one contact");
        return false;
    }
    if (profileFollowupRemark === "")
    {
        alert("Please enter remark");
        return false;
    }
    $.ajax({
        type: "post",
        url: "saveBatch",
        data: "reasonId=" + reasonId + "&profileFollowupRemark=" + profileFollowupRemark + "&matchIds=" + id + "&contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            $('#profileFollowupDiv').show();
            document.getElementById('profileFollowupDiv').style.display = "block";
            document.getElementById('profileFollowupDiv').innerHTML = html;
            $('#profileFollowupDateDivFrom').hide();
            $('#profileFollowupDateDivTo').hide();
            $('#batchListDiv').hide();
            $('#profileFollowupRemarkSearchButton').hide();
            $('#profileFollowupBatchSaveButton').hide();
            document.getElementById("profileFollowupcontactId").value = contactId;
            document.getElementById("profileFollowupmatchId").value = matchId;
            $("#profileFollowupDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $('#profileFollowupTime').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});

        }
    });
}
function editProfileFollowup(profileFollowupId)
{
    var contactId = document.getElementById("profileFollowupcontactId").value;
    var matchId = document.getElementById("profileFollowupmatchId").value;
    $.ajax({
        type: "post",
        url: "editProfileFollowup",
        data: "profileFollowupId=" + profileFollowupId,
        success: function (html) {
            $("#profileFollowupTable").find("section").css("display", "none");
            document.getElementById('editProfileFollowupDiv' + profileFollowupId).style.display = "block";
            document.getElementById('editProfileFollowupDiv' + profileFollowupId).innerHTML = html;
            $("#eprofileFollowupDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $('#eprofileFollowupTime').timepicki({show_meridian: false, min_hour_value: 0, max_hour_value: 23});
        }
    });

}
function updateProfileFollowup()
{

    var mainStatusId = document.getElementById("emainStatusSelectBox").value;
    var reasonId = document.getElementById("ereasonSelectBox").value;
    var profileFollowupDate = document.getElementById("eprofileFollowupDate").value;
    var profileFollowupTime = document.getElementById("eprofileFollowupTime").value;
    var profileFollowupRemark = document.getElementById("eprofileFollowupRemark").value;
    var contactId = document.getElementById("profileFollowupcontactId").value;
    var matchId = document.getElementById("profileFollowupmatchId").value;
    var profileFollowupId = document.getElementById("profileFollowupIdHidden").value;
    var profileFollowupContactNumber = document.getElementById("eprofileFollowupContactNumber").value;

    if (mainStatusId === "0")
    {
        alert("Please select main status");
        return false;
    }
    if (reasonId === "0")
    {
        alert("Please select reason");
        return false;
    }
    if (profileFollowupRemark === "")
    {
        alert("Please enter remark");
        return false;
    }
    if (mainStatusId === "3")
    {
        var profileFollowupDate = document.getElementById("eprofileFollowupDate").value;
        var profileFollowupTime = document.getElementById("eprofileFollowupTime").value;
        if (profileFollowupDate === "")
        {
            alert("Please select date");
            return false;
        }
        if (profileFollowupTime === "")
        {
            alert("Please select time");
            return false;
        }
    }

    $.ajax({
        type: "post",
        url: "updateProfileFollowup",
        data: "profileFollowupContactNumber=" + profileFollowupContactNumber + "&profileFollowupId=" + profileFollowupId + "&contactId=" + contactId + "&matchId=" + matchId + "&profileFollowupRemark=" + profileFollowupRemark + "&mainStatusId=" + mainStatusId + "&reasonId=" + reasonId + "&profileFollowupDate=" + profileFollowupDate + "&profileFollowupTime=" + profileFollowupTime,
        success: function (html) {
            document.getElementById('profileFollowupDiv').style.display = "block";
            document.getElementById('profileFollowupDiv').innerHTML = html;
            document.getElementById("profileFollowupcontactId").value = contactId;
            document.getElementById("profileFollowupmatchId").value = matchId;
            $("#profileFollowupDate").datepicker({
                format: "dd/mm/yyyy"
            });
            $('#profileFollowupTime').timepicki();
        }
    });
}
function getContactInfoKundali(matchId)
{
    var contactId = document.getElementById('kundaliContactId').value;
    document.getElementById('contactDetailsDiv').style.display = "none";
    $.ajax({
        type: "post",
        url: "getContactInfoKundali",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('kundaliReportDiv').style.display = "block";
            document.getElementById('kundaliReportDiv').innerHTML = html;
        }
    });
}

function getContactInfoKundaliVertical(contactId, matchId)
{
//    document.getElementById('displayContactVertical1').style.display = "none";
    $.ajax({
        type: "post",
        url: "getContactInfoKundaliVertical",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('kundaliVerticalDiv').style.display = "block";
            document.getElementById('kundaliVerticalDiv').innerHTML = html;
        }
    });
}

function calculateKundali(contactId, matchId)
{
    document.getElementById('loading').style.display = "block";
    $.ajax({
        type: "post",
        url: "calculateKundali",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('loading').style.display = "none";
            document.getElementById('kundaliReportDiv').style.display = "block";
            document.getElementById('kundaliReportDiv').innerHTML = html;
        }
    });
}
function calculateKundaliVertical(contactId, matchId)
{
    document.getElementById('loading').style.display = "block";
    $.ajax({
        type: "post",
        url: "calculateKundaliVertical",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('loading').style.display = "none";
            document.getElementById('kundaliVerticalDiv').style.display = "block";
            document.getElementById('kundaliVerticalDiv').innerHTML = html;
        }
    });
}

function sentKundaliMail(boyContactId, girlContactId, mType)
{
    var txt;
    var r = confirm("Are you sure you want to send kundali.");
    if (r == true) {
        txt = "You pressed OK!";
    } else {
        txt = "You pressed Cancel!";
        return false;
    }
    document.getElementById('loading').style.display = "block";
    $.ajax({
        type: "post",
        url: "sentKundaliMail",
        data: "boyContactId=" + boyContactId + "&girlContactId=" + girlContactId + "&mType=" + mType,
        success: function (html) {
            document.getElementById('loading').style.display = "none";
        }
    });
}

function fetchDataForContactExchange(matchId, contactId)
{
    document.getElementById('xmatchId').value = matchId;
    document.getElementById('xmatchId').value = contactId;
    document.getElementById('loading').style.display = "block";
    $.ajax({
        type: "post",
        url: "fetchDataForContactExchange",
        data: "matchId=" + matchId + "&contactId=" + contactId,
        success: function (html) {
            document.getElementById('loading').style.display = "none";
            document.getElementById('contactExchangeDiv').style.display = "block";
            document.getElementById('contactExchangeDiv').innerHTML = html;

        }
    });
}

function selectAll(id)
{
    var all = document.getElementById(id).checked;
    if (all === true)
    {
        $('.chk').each(function () { //loop through each checkbox
            this.checked = true;  //select all checkboxes with class "checkbox1"               
        });
    } else {
        $('.chk').each(function () { //loop through each checkbox
            this.checked = false; //deselect all checkboxes with class "checkbox1"                       
        });
    }
}
function matchreportKundali(contactId)
{
    document.getElementById('gridViewMatch').click();
    document.getElementById('kundaliMatch' + contactId).click();
}
function additionalInfoListIndividual(contactId)
{
    $.ajax({
        type: "post",
        url: "feedbackNewHorizontal",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("additionalInfoListHorizontalDiv").innerHTML = temp[0];
            document.getElementById("budgetDivHorizontal").innerHTML = temp[1];
            document.getElementById("preferenceDivHorizontal").innerHTML = temp[2];
            document.getElementById("familySalaryDivHorizontal").innerHTML = temp[3];
            document.getElementById("propertyOfOwnershipDivHorizontal").innerHTML = temp[4];
            document.getElementById("reasonOfDivorceDivHorizontal").innerHTML = temp[5];
            document.getElementById("divorcedOrSettledDivHorizontal").innerHTML = temp[6];
            document.getElementById("referenceGivenByDivHorizontal").innerHTML = temp[7];
            document.getElementById("familyBackgroundDivHorizontal").innerHTML = temp[8];
        }
    });
    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("additionalInfoListHorizontalHeading").innerHTML = "Additional Information " + html;
        }
    });

}
function additionalInfoListVertical(contactId)
{
    $.ajax({
        type: "post",
        url: "feedbackNewHorizontal",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("additionalInfoListVerticalHomeDiv").innerHTML = temp[0];
            document.getElementById("budgetDivVertical").innerHTML = temp[1];
            document.getElementById("preferenceDivVertical").innerHTML = temp[2];
            document.getElementById("familySalaryDivVertical").innerHTML = temp[3];
            document.getElementById("propertyOfOwnershipDivVertical").innerHTML = temp[4];
            document.getElementById("reasonOfDivorceDivVertical").innerHTML = temp[5];
            document.getElementById("divorcedOrSettledDivVertical").innerHTML = temp[6];
            document.getElementById("referenceGivenByDivVertical").innerHTML = temp[7];
            document.getElementById("familyBackgroundDivVertical").innerHTML = temp[8];
        }
    });

    $.ajax({
        type: "post",
        url: "getHeading",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("additionalInfoListVerticalHeading").innerHTML = "Additional Information of " + html;
        }
    });
    document.getElementById("additionalInfoListVerticalHomeLi").click();
}
function refreshMatchReport()
{
    $('#refreshMatchReport').click();
}
function moveToOutBoxColor(id) {
    $("#" + id).addClass("highlightYellow");
}

//Added by vineet for moved member status followUp
function profileFollowupFromMoved(matchId, contactId)
{
    $.ajax({
        type: "post",
        url: "fetchProfileFollowupDataForMoved",
        data: "contactId=" + contactId + "&matchId=" + matchId,
        success: function (html) {
            document.getElementById('profileFollowupDiv').style.display = "block";
            document.getElementById('profileFollowupDiv').innerHTML = html;
        }
    });
}


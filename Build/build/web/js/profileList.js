

function feedback(contactId)
{
    $.ajax({
        type: "post",
        url: "feedbackListIndividual1",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedBackHistory").style.display = "block";
            document.getElementById("feedBackHistory").innerHTML = temp[0];
            document.getElementById("fcontactId").value = contactId;
            $('.nav-tabs a[href="#homeFeedBack"]').tab('show');
            document.getElementById("questionsList").innerHTML = temp[1];
        }
    });
}
function feedbackNewEdit(contactId)
{
//     var deptId = document.getElementById("deptId").value;
//    if (deptId !== 9)
//    {
//        document.getElementById('matchListReport').style.display = "none";
//    }
    $('#matchListReport').hide();
    $('#menus3').show();
    $.ajax({
        type: "post",
        url: "feedbackNewEdit",
        data: "contactId=" + contactId,
        success: function (html) {
            var temp = html.split("___");
            document.getElementById("feedBackHistoryImportantInformation").style.display = "block";
            document.getElementById("feedBackHistoryImportantInformation").innerHTML = temp[0];
            document.getElementById("questionContactId").value = contactId;
            document.getElementById("budgetDiv").innerHTML = temp[1];
            document.getElementById("preferenceDiv").innerHTML = temp[2];
            document.getElementById("familySalaryDiv").innerHTML = temp[3];
            document.getElementById("propertyOfOwnershipDiv").innerHTML = temp[4];
            document.getElementById("referenceGivenByDiv").innerHTML = temp[7];
            document.getElementById("familyBackgroundDiv").innerHTML = temp[8];
            //Change done by vineet to hide two questions on profile list additional ino Question on 26-11-2016
            if (temp[9] == 'Divorced') {
                $('#div1').show();
                $('#div2').show();
                document.getElementById("reasonOfDivorceDiv").innerHTML = temp[5];
                document.getElementById("divorcedOrSettledDiv").innerHTML = temp[6];
            } else
            {
                $('#div1').hide();
                $('#div2').hide();
            }
            //Done
            document.getElementById("additionalInformationRemark").innerHTML = temp[10];
            //            Added by vineet on 05-04-2017 to add Feedback Heading
            document.getElementById('feedBackHeading').innerHTML = "FeedBack Of " + temp[11];
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
            $('.nav-tabs a[href="#homeFeedBack"]').tab('show');
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

function saveEditFeedBack()
{
    var subject = document.getElementById("esubject").value;
    var content = document.getElementById("econtent").value;
    var feedbackId = document.getElementById("efeedBackId").value;
    var contactId = document.getElementById("econtactId").value;
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
        data: "contactId=" + contactId + "&feedbackId=" + feedbackId + "&subject=" + subject + "&content=" + content,
        success: function (html) {
            document.getElementById("feedBackHistory").style.display = "block";
            document.getElementById("feedBackHistory").innerHTML = html;
            document.getElementById("fcontent").value = "";
            document.getElementById("fsubject").value = "";
            $('.nav-tabs a[href="#homeFeedBack"]').tab('show');
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
    $.ajax({
        type: "post",
        url: "saveEditFeedBackNew",
        data: "contactId=" + contactId + "&feedbackId=" + feedbackId + "&subject=" + subject + "&content=" + content,
        success: function (html) {
            var temp = html.split("___")
            document.getElementById("feedBackHistoryImportantInformation").style.display = "block";
            document.getElementById("feedBackHistoryImportantInformation").innerHTML = temp[0];

        }
    });
}

function fetchAuthenticationData(contactId)
{


    $.ajax({
        type: "post",
        url: "fetchAuthenticationData",
        data: "contactId=" + contactId,
        success: function (html) {
//            document.getElementById("authenticationTable").style.display = "inline-block";
            document.getElementById("authenticationTable").innerHTML = html;
            var armId = document.getElementById("armIdHidden").value;
            var officeId = document.getElementById("officeIdHidden").value;
            var userId = document.getElementById("auserIdHidden").value;
            var categoryId = document.getElementById("categoryIdHidden").value;
            var categoryPermissionId = document.getElementById("categoryPermissionString").value;
            document.getElementById("officeId").value = officeId;
            document.getElementById("auserId").value = userId;
            document.getElementById("acategoryId").value = categoryId;
            document.getElementById("armId").value = armId;

            var arrayOfValues = categoryPermissionId.split(",");
            for (var i = 0; i < arrayOfValues.length; i++)
            {
                document.getElementById(arrayOfValues[i].trim()).checked = true;
            }
            return false;



        }
    });
}

//function fetchCityListAutoP()
//{
//    alert("here Auto");
//    $.ajax({
//        type: "post",
//        url: "fetchCityListAuto",
//        data: "contactId=" + 1,
//        success: function (html) {
//            alert(html);
//            document.getElementById('cityAuto').value = html;
//        }
//    });
//}

function showAdvanceSearch()
{
//    alert("Here");
    document.getElementById('advanceSearchDiv').style.display = "block";
    document.getElementById('advanceSearch').style.display = "none";
    document.getElementById('advanceSearch1').style.display = "inline-block";
    return false;
}
function hideAdvanceSearch()
{
    document.getElementById('advanceSearchDiv').style.display = "none";
    document.getElementById('advanceSearch1').style.display = "none";
    document.getElementById('advanceSearch').style.display = "inline-block";
    return false;
}
function updateExpiry()
{
    var packagePrice = document.getElementById('packagepriceId').value; //Added by vineet on 5-12-2016 for package and packagePrice;
    var packageId = document.getElementById('packageId').value;
    var contactId = document.getElementById('aContactId').value;
    var officeId = document.getElementById('officeId').value;
    var userId = document.getElementById('auserId').value;
    var armId = document.getElementById('armId').value;
    var sendMailFlag = "";
    var idValue = "";
    var categoryId = document.getElementById('acategoryId').value;
    if (armId === "")
    {
        armId = "0";
    }
//    $('#authenticationTable').find("input[type=checkbox]:checked").each(function () { //commented by vineet to solve enavalop issue and remove send mail vakue issue
//        idValue = idValue + "," + $(this).val();
//       alert("idValue.."+idValue);
//    });
    $('#checkBoxCategoryId').find("input[type=checkbox]:checked").each(function () {
        idValue = idValue + "," + $(this).val();
    });

    if (officeId === '0')
    {
        alert("Please select office");
        return false;
    }
    if (userId === '0')
    {
        alert("Please select user");
        return false;
    }
    if (categoryId === '')
    {
        alert("Please select category");
        return false;
    }
    if (idValue === '')
    {
        alert("Please select category permission");
        return false;
    }
    if ($('input.checkbox_checkRmArmAssign').prop('checked')) {
        sendMailFlag = 1;
    } else {
        sendMailFlag = 0;
    }
    if (confirm("Are you sure you want to set category?"))
    {
        $.ajax({
            type: "post",
            url: "updateExpiry",
            data: "sendMailFlag=" + sendMailFlag + "&armId=" + armId + "&contactId=" + contactId + "&officeId=" + officeId + "&userId=" + userId + "&categoryId=" + categoryId + "&categoryPermissionId=" + idValue + "&packageId=" + packageId + "&packagePrice=" + packagePrice,
            success: function (html) {
                document.getElementById('profileList').click();
            }
        });
    } else {
        return false;
    }


}
function saveAnswers()
{
    var id = "";
    var value = "";
    var contactId = document.getElementById("fcontactId").value;
    $('#questionsList').find("input").each(function () {
        id = id + "," + $(this).attr("id");
        if ($(this).val() === "")
        {
            value = value + ",-";
        } else {
            value = value + "," + $(this).val();
        }

    });
    $.ajax({
        type: "post",
        url: "enterFBAnswers",
        data: "questions=" + id + "&answers=" + value + "&contactId=" + contactId,
        success: function (html) {
            alert("Data updated");
        }, error: function ()
        {
//            alert("Please try later");
        }
    });

}

function check(id)
{
//                   alert("Inside");
    $('input:checkbox').on('click', function (e) {

        // prevents the event from bubbling up the DOM tree
        // eg the modal from cancelling the event
//                    alert("Inside1");
        e.stopImmediatePropagation();

        var checked = (e.currentTarget.checked) ? false : true;
        e.currentTarget.checked = (checked) ? false : checked.toString();
    });
}

function checkDates() {
    var d1 = new Date();
    var example1 = document.getElementById('example1').value;
    var example2 = document.getElementById('example2').value;
    if (example1 === "" || example2 === "")
    {
        alert("Please enter both dates");
        return false;
    }
    var dateFirst = example1.split('/');
    var dateSecond = example2.split('/');
    var date1 = new Date(dateFirst[2], dateFirst[1] - 1, dateFirst[0]);
    var date2 = new Date(dateSecond[2], dateSecond[1] - 1, dateSecond[0]);
    if (d1.getTime() < date1.getTime())
    {
        alert("Date cannot me more than todays date");
        return false;
    }
    if (d1.getTime() < date2.getTime())
    {
        alert("Date cannot me more than todays date");
        return false;
    }
    var date1 = example1;
    var date2 = example2;
    $.ajax({
        type: "post",
        url: "searchContact",
        data: "date1=" + date1 + "&date2=" + date2,
        success: function (html)
        {
            document.getElementById('displayDiv').innerHTML = html;
            document.getElementById('displayDiv').style.display = "block";


        }, error: function ()
        {
//            alert("Please try later");
        }
    });

}

function email(contactId) {
//    alert(contactId);
    document.getElementById('emailcontactId').value = contactId;
    var disableEmail = $('#disableEmail').val();                    //Below four Lines added by vineet to disable email add on profile list if profile not active on 01-02-2017
    document.getElementById("addMailNewForm").disabled = false;
    if (disableEmail != 0)
    {
        document.getElementById("addMailNewForm").disabled = true;
    }
    $.ajax({
        type: "post",
        url: "fetchEmailList",
        data: "contactId=" + contactId,
        success: function (html) {
            var attr = $('#homeEmails').attr('attremail', contactId);
            document.getElementById("emailHistory").style.display = "block";
            document.getElementById("emailHistory").innerHTML = html;
            fetchGeneralContactDetail(contactId);
        }
    });
}

function fetchGeneralContactDetail(contactId)
{
    $.ajax({
        type: "post",
        url: "fetchGeneralContactDetail",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("recepientIds").value = html;
        }
    });
}

function saveEmail()
{
    var recepient = document.getElementById('recepientIds').value;
    var subject = document.getElementById('emailSubject').value;
    var mailNote = CKEDITOR.instances.emailContent.getData();
    document.getElementById('emailContent1').value = mailNote;
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
        return false;
    } else {
        document.getElementById('emailSubjectValidate').style.display = "none";
    }

    return true;
}

function followUp(contactId)
{
    document.getElementById('followupContactId').value = contactId;
    $.ajax({
        type: "post",
        url: "fetchFollowupList",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
        }
    });
}

function saveFollowUp()
{
    var projectId = document.getElementById('projectId').value;
    var timepicker = document.getElementById('timepicker1').value;
    var content = document.getElementById('content').value;
    var nextDate = document.getElementById('nextDate').value;
    var contactId = document.getElementById('followupContactId').value;
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
        data: "time=" + timepicker + "&contactId=" + contactId + "&nextDate=" + nextDate + "&content=" + content + "&projectId=" + projectId,
        success: function (html)
        {
            alert("Followup saved");
            document.getElementById("followupHistory").style.display = "block";
            document.getElementById("followupHistory").innerHTML = html;
            document.getElementById('projectId').value = "0";
            document.getElementById('timepicker1').value = "";
            document.getElementById('content').value = "";
            document.getElementById('nextDate').value = "";
//            document.getElementById('followupContactId').value = "";
            $('.nav-tabs a[href="#homeFollowup"]').tab('show');

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
            $('#timepicker2').timepicki();

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
    var timepicker = document.getElementById('timepicker2').value;
    var followupId = document.getElementById("rfollowupId").value;
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
        data: "time=" + timepicker + "&followupId=" + followupId + "&content=" + content + "&example4=" + example4 + "&projectId=" + projectId + "&contactId=" + contactId + "&nextDate=" + example4,
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
function showCloseFollowup(followupId, contactId)
{
    $.ajax({
        type: "post",
        url: "showCloseFollowup",
        data: "followupId=" + followupId + "&contactId=" + contactId,
        success: function (html)
        {
//                        alert("nside"+html);
            document.getElementById("rescheduleSectiontr" + followupId).style.display = "block";
            document.getElementById("rescheduleSectiontd" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).style.display = "block";
            document.getElementById("rescheduleSection" + followupId).innerHTML = html;
//                        alert("nside1");


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


        }, error: function ()
        {
//            alert("Please try later");
        }
    });

}
function sendPassword(contactId)
{
    //alert();
    var html = '';
   
    html = "Are you sure ,you want to send password?"
    if (confirm(html))
    {

        $.ajax({
            type: "post",
            url: "sendPassword",
            data: "contactId=" + contactId,
            success: function (html)
            {
                alert("Mail sent successfully");

            }, error: function ()
            {
//                alert("Please try later");
            }
        });

    }
}

function saveQuestionRemark() {
    var additionalInformation = document.getElementById("additionalInformation").value;
    var questionContactId = document.getElementById("questionContactId").value;
    $.ajax({
        type: "post",
        url: "saveQuestionRemark",
        data: "contactId=" + questionContactId + "&additionalInformation=" + additionalInformation,
        success: function (html)
        {
            document.getElementById("additionalInformationRemark").innerHTML = html;
            document.getElementById("additionalInformation").value = "";
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}

function getShortSummary(contactId)
{
    $.ajax({
        type: "post",
        url: "getShortSummary",
        data: "contactId=" + contactId,
        success: function (html)
        {
            var tempArray = html.split("______");
            document.getElementById("shortListData").style.display = "block";
            document.getElementById("shortListData").innerHTML = tempArray[0];
            $('#ocontactId').val(contactId);
            $('#mailTo').val(tempArray[1]);
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
            CKEDITOR.instances.mailNote.setData(html);
        }, error: function ()
        {
//            alert("Please try later");
        }
    });
}
function showInactiveAlert(approvedFlag, lockFlag)
{
    if (parseInt(approvedFlag) === 0) {
        alert("This contact is not authorized to search match");
        return false;
    } else if (parseInt(lockFlag) === 1) {
        alert("This contact is not authorized to search match");
        return false;
    } else {
        return true;
    }
}
function showInactiveAlert1()
{
    alert("This contact is not authorized to edit profile");
}
function lockProfile(contactId)
{
    $('#lockProfileContactId').val(contactId);
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
    document.getElementById("lockFromDate").value = today;


//     var d=Date();
//     alert(d);
////           alert(Date());
//      var n=d.('%d-%m-%Y');
//      alert(n);
//      document.getElementById('lockFromDate').value;

}
function pauseProfile(contactId)
{
    $('#pauseProfileContactId').val(contactId);
}
function openProfile(contactId)
{
    $('#openProfileContactId').val(contactId);
}
function sendRegistrationForm(contactId)
{
   // alert(contactId);
    var html = '';
    html = "Are you sure ,you want to send Registration Form?";
    if (confirm(html))
    {
         $.ajax({
        type: "post",
        url: "sendRegistrationForm",
        data: "contactId=" + contactId,
        success: function (html)
        {
           // alert();
            alert("Registration form sent successfully");

        }
//        , error: function ()
//        {
//            alert("Please try later");
//        }
         });
    }
}
function editFeedBack(subject, content, contactId, id)
{
    document.getElementById("esubject").value = subject;
    document.getElementById("econtent").value = content;
    document.getElementById("efeedBackId").value = id;
    document.getElementById("econtactId").value = contactId;

    $('.nav-tabs a[href="#editFeedback1"]').tab('show');
}
function editFeedBackNew(subject, content, contactId, id)
{
    
    subject = subject.replace(/!!!/g, "'");
     subject = subject.replace(/#@/g, '"');
   // alert("convert------------------"+subject);
    
    content = content.replace(/!!!/g, "'");
    content = content.replace(/#@/g, '"');
//    alert(content);
    $.ajax({
        type: "post",
        url: "editFeedBackNew",
        data: "contactId=" + contactId + "&content=" + content + "&subject=" + subject + "&feedbackid=" + id,
        success: function (html)
        {
            var temp = html.split("___");
            document.getElementById('editAdditionalInfoDiv' + id).style.display = "block";
            document.getElementById('editAdditionalInfoDiv' + id).innerHTML = temp[0];


        }, error: function ()
        {
            alert("Please try later");
        }
    });
}
function payment(contactId)
{
//    alert("Inside");
    $.ajax({
        type: "post",
        url: "paymentData",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById('paymentDiv').style.display = "block";
            document.getElementById('paymentDiv').innerHTML = html;
            $("#paymentDate").datepicker({
                format: "dd/mm/yyyy",
            });
//            alert(html);
        }
    });
}
function savePayment() {

    var paymentTypeHidden = document.getElementById('paymentTypeHidden').value;
    var paymentType = "";
    if (document.getElementById('paymentType1').checked) {
        paymentType = document.getElementById('paymentType1').value;
    }
    if (paymentTypeHidden !== "1")
    {
        if (document.getElementById('paymentType2').checked) {
            paymentType = document.getElementById('paymentType2').value;
        }
    }
    if (paymentTypeHidden !== "1")
    {
        if (document.getElementById('paymentType3').checked) {
            paymentType = document.getElementById('paymentType3').value;
        }
    }
    var mode = "";
    if (document.getElementById('mode1').checked) {
        mode = document.getElementById('mode1').value;
    }
    if (document.getElementById('mode2').checked) {
        mode = document.getElementById('mode2').value;
    }
    if (document.getElementById('mode3').checked) {
        mode = document.getElementById('mode3').value;
    }
    if (document.getElementById('mode4').checked) {
        mode = document.getElementById('mode4').value;
    }
    if (document.getElementById('mode5').checked) {
        mode = document.getElementById('mode5').value;
    }
    if (document.getElementById('mode6').checked) {
        mode = document.getElementById('mode6').value;
    }
    if (document.getElementById('mode7').checked) {
        mode = document.getElementById('mode7').value;
    }
    var category = document.getElementById("category").value;
    var registrationCharges = document.getElementById("registrationCharges").value;
    var taxapplied = document.getElementById("taxapplied").value;
    var total = document.getElementById("total").value;
    var inWords = document.getElementById("inWords").value;
    var inWordsAmount = document.getElementById("inWordsAmount").value;
    var transactionNo = document.getElementById("transactionNo").value;
   
    var bankName = document.getElementById("bankName").value;
    var paid = document.getElementById("paid").value;
    var discountValue = document.getElementById("discountValue").value;
    var balance = document.getElementById("balance").value;
    var remarks = document.getElementById("remarks").value;
    var contactId = document.getElementById("contactId").value;
    var paymentDate = document.getElementById("paymentDate").value;
    var location = document.getElementById("location").value;
    var receivedByWhom = document.getElementById("receivedByWhom").value;
    //Added by vineet For Package on 5-12-2016
    var packageId = document.getElementById("packageId").value;
    var packagePrice = document.getElementById("packagepriceId").value;

    //Added by vineet For Mail on 21-02-2017
    var sendRegistrationMail = document.getElementById("sendRegistrationMailFlag").value;
    var sendBillingMailFlag = document.getElementById("sendBillingMailFlag").value;
    if ($('input#sendRegistrationMailFlag').prop('checked')) {
        sendRegistrationMail = 1;
    } else {
        sendRegistrationMail = 0;
    }
    if ($('input#sendBillingMailFlag').prop('checked')) {
        sendBillingMailFlag = 1;
    } else {
        sendBillingMailFlag = 0;
    }

    if (document.getElementById("discountType").value !== null && document.getElementById("discountType").value !== '') {
        var discountType = document.getElementById("discountType").value;
    }
    else {
        var discountType = null;
    }

 //alert(transactionNo);
    //End
    
    var reg = /^[0-9]*$/;
    var reg1 = /^[0-9a-zA-z]*$/;
    if (paymentType !== '3')
    {
        if (mode === '1')
        {
            if (!reg.test(transactionNo) || transactionNo === "")
            {
                alert("Please enter transaction number/cheque number");
                return false;
            }
            if (bankName === '')
            {
                alert("Please enter bank name");
                return false;
            }
        }
        if (mode === '2')
        {
            if (!reg.test(transactionNo) || transactionNo === "")
            {
                alert("Please enter transaction number/cheque number");
                return false;
            }
            if (bankName === '')
            {
                alert("Please enter bank name");
                return false;
            }
        }
//        Changes for Credit card and Debit card option - Sagar as on 23/1/2108
         if (mode === '5')
        {
            if (!reg.test(transactionNo) || transactionNo === "")
            {
                alert("Please enter card number");
                return false;
            }
        }
        
            if (mode === '6')
        {
            if (!reg.test(transactionNo) || transactionNo === "")
            {
                alert("Please enter card number");
                return false;
            }
        }

        if (paymentDate === '')
        {
            alert("Please select payment date");
            return false;
        }
        
        if(mode !== '7')
        {
            if (paid === '')
            {
                alert("Please enter amount");
                return false;
            }
        }

        if (balance === '')
        {
            alert("Please enter paid for balance");
            return false;
        }

    }
    
    $.ajax({
        type: "post",
        url: "savePayment",
        data: "receivedByWhom=" + receivedByWhom + "&location=" + location + "&paymentDate=" + paymentDate + "&contactId=" + contactId + "&transactionNo=" + transactionNo + "&remarks=" + remarks + "&total=" + total + "&inWords=" + inWords + "&bankName=" + bankName + "&paid=" + paid + "&balance=" + balance + "&paymentType=" + paymentType + "&mode=" + mode + "&category=" + category + "&registrationCharges=" + registrationCharges + "&taxapplied=" + taxapplied + "&packageId=" + packageId + "&packagePrice=" + packagePrice + "&discountType=" + discountType + "&discountValue=" + discountValue + "&sendBillingMailFlag=" + sendBillingMailFlag + "&sendRegistrationMail=" + sendRegistrationMail + "&inWordsAmount=" + inWordsAmount,
        success: function (html) {
            document.getElementById('paymentDiv').style.display = "block";
            document.getElementById('paymentDiv').innerHTML = html;
//           document.getElementById('submitButton').style.display = "none";
            document.getElementById('historyTabId').click();  //    added by vineet to solve multiple payment Entry on 23-09-2017
            $("#paymentDate").datepicker({
                format: "dd/mm/yyyy",
            });
        }, error: function ()
        {
            alert("Please try later");
        }
    });




}
function calculateTotal()
{
//    var taxapplied = document.getElementById("taxapplied").value;
//    var registrationCharges = document.getElementById("registrationCharges").value;
//    var total = document.getElementById("total").value;
//    var total = (15 * registrationCharges) / 100 + registrationCharges;
//    alert(total);
}

function calculateBalanceInWords(value)
{
    var words = new Array();
    words[0] = '';
    words[1] = 'One';
    words[2] = 'Two';
    words[3] = 'Three';
    words[4] = 'Four';
    words[5] = 'Five';
    words[6] = 'Six';
    words[7] = 'Seven';
    words[8] = 'Eight';
    words[9] = 'Nine';
    words[10] = 'Ten';
    words[11] = 'Eleven';
    words[12] = 'Twelve';
    words[13] = 'Thirteen';
    words[14] = 'Fourteen';
    words[15] = 'Fifteen';
    words[16] = 'Sixteen';
    words[17] = 'Seventeen';
    words[18] = 'Eighteen';
    words[19] = 'Nineteen';
    words[20] = 'Twenty';
    words[30] = 'Thirty';
    words[40] = 'Forty';
    words[50] = 'Fifty';
    words[60] = 'Sixty';
    words[70] = 'Seventy';
    words[80] = 'Eighty';
    words[90] = 'Ninety';
    value = value.toString();
    if (value > 0)
    {
        var atemp = value.split(".");
        var number = atemp[0].split(",").join("");
        var n_length = number.length;
        var words_string = "";
        if (n_length <= 9) {
            var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
            var received_n_array = new Array();
            for (var i = 0; i < n_length; i++) {
                received_n_array[i] = number.substr(i, 1);
            }
            for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
                n_array[i] = received_n_array[j];
            }
            for (var i = 0, j = 1; i < 9; i++, j++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    if (n_array[i] == 1) {
                        n_array[j] = 10 + parseInt(n_array[j]);
                        n_array[i] = 0;
                    }
                }
            }
            var value = "";
            for (var i = 0; i < 9; i++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    value = n_array[i] * 10;
                } else {
                    value = n_array[i];
                }
                if (value != 0) {
                    words_string += words[value] + " ";
                }
                if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Crores ";
                }
                if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Lakhs ";
                }
                if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Thousand ";
                }
                if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                    words_string += "Hundred and ";
                } else if (i == 6 && value != 0) {
                    words_string += "Hundred ";
                }
            }
            words_string = words_string.split("  ").join(" ");
        }
        document.getElementById('inWordsAmount').value = words_string;
    }
}

function showPaymentDetails(value)
{
    if (value === "3")
    {
        document.getElementById('modeDiv').style.display = "none";
        document.getElementById('transactionNoDiv').style.display = "none";
        document.getElementById('bankNameDiv').style.display = "none";
        document.getElementById('bankNameDiv').style.display = "none";
        document.getElementById('paymentDateDiv').style.display = "none";
        document.getElementById('paidDiv').style.display = "none";
        document.getElementById("balance").value = document.getElementById("total").value;
        document.getElementById('paid').value = "";

    }
    if (value === "2")
    {
        document.getElementById('modeDiv').style.display = "block";
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('paymentDateDiv').style.display = "block";
        document.getElementById('paidDiv').style.display = "block";
        var total = document.getElementById('total').value;
        document.getElementById('paid').value = total;
//        document.getElementById('transactionCheque').style.display = "inline-block";
//        document.getElementById('transactionLabel').style.display = "none";

    }
    if (value === "1")
    {
        document.getElementById('modeDiv').style.display = "block";
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('paymentDateDiv').style.display = "block";
        document.getElementById('paidDiv').style.display = "block";
        document.getElementById('paid').value = "";
//        document.getElementById('transactionLabel').style.display = "inline-block";
//        document.getElementById('transactionCheque').style.display = "none";
    }
}
function showModeDetails(value)
{
    if (value === '1')
    {
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('transactionCheque').style.display = "none";
        document.getElementById('transactionCard').style.display = "none";
        document.getElementById('transactionLabel').style.display = "inline-block";
        document.getElementById('cardNum').style.display = "none";
        document.getElementById('transactionNum').style.display = "inline-block";
    }
    if (value === '2')
    {
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('transactionCheque').style.display = "inline-block";
        document.getElementById('transactionLabel').style.display = "none";
         document.getElementById('transactionCard').style.display = "none";
    }
    if (value === '3')
    {
        document.getElementById('transactionNoDiv').style.display = "none";
        document.getElementById('bankNameDiv').style.display = "block";
    }
    if (value === '4' || value === '7')
    {
        document.getElementById('transactionNoDiv').style.display = "none";
        document.getElementById('bankNameDiv').style.display = "none";
        document.getElementById('transactionCheque').style.display = "none";
        document.getElementById('transactionLabel').style.display = "none";
    }
     if (value === '5')
    {
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('transactionCheque').style.display = "none";
        document.getElementById('transactionCard').style.display = "inline-block";
        document.getElementById('transactionLabel').style.display = "none";
         document.getElementById('cardNum').style.display = "inline-block";
          document.getElementById('transactionNum').style.display = "none";
    }
     if (value === '6')
    {
        document.getElementById('transactionNoDiv').style.display = "block";
        document.getElementById('bankNameDiv').style.display = "block";
        document.getElementById('transactionCheque').style.display = "none";
        //document.getElementById('transactionCheque').style.display = "inline-block";
        document.getElementById('transactionCard').style.display = "inline-block";
        document.getElementById('transactionLabel').style.display = "none";
         document.getElementById('cardNum').style.display = "inline-block";
          document.getElementById('transactionNum').style.display = "none";
    }
    
}



function closeShortListBox(type)
{

    var id = "";
    var intMailBy = document.getElementById('intMailBy').value;
    var mailTo = document.getElementById('mailTo').value;
    var emails = document.getElementById('emails').value;
//    var mailNote = CKEDITOR.instances.mailNote.getData();
    var contactId = document.getElementById('ocontactId').value;
    var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (emails.indexOf(',') > -1)
    {
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
    var shortListedContactIds = "";
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
            shortListedContactIds = document.getElementById('shortListedContactIds').value = id;
            alert("This will mail biodata of selected contact");
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=2&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + shortListedContactIds,
                success: function (html)
                {
                    document.getElementById('shortListClose').click();
                    document.getElementById("shortListData").style.display = "block";
                    alert("Generated Batch Id=" + html);
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
            shortListedContactIds = document.getElementById('shortListedContactIds').value = id;
            alert("This will mail biodata of selected contact");
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=2&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + shortListedContactIds,
                success: function (html)
                {
                    document.getElementById('shortListClose').click();
                    document.getElementById("shortListData").style.display = "block";
                    alert("Generated Batch Id=" + html);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }
//    Added by vineet for profileList shortList OtherWay on 7-12-2016
    if (type === 5)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            shortListedContactIds = document.getElementById('shortListedContactIds').value = id;
            alert("This will mail biodata of selected contact");
            $('#mailType').val(type);
            $('#emailForShortList').val(intMailBy);
//            document.getElementById("loading").style.display = "block";
            $.ajax({
                type: "post",
                url: "emailBioData",
                data: "page=2&intMailBy=" + intMailBy + "&contactId=" + contactId + "&mailType=" + type + "&mailTo=" + mailTo + "&mailNote=" + mailNote + "&emails=" + emails + "&outBoxContactIds=" + shortListedContactIds,
                success: function (html)
                {
                    document.getElementById('shortListClose').click();
                    document.getElementById("shortListData").style.display = "block";
                    alert("Generated Batch Id=" + html);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }//End 7-12-2016

    if (type === 3)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            shortListedContactIds = document.getElementById('shortListedContactIds').value = id;
            alert("This will clear mail outbox");
            $.ajax({
                type: "post",
                url: "deleteFromShortlisted",
                data: "contactId=" + contactId + "&outBoxContactIds=" + shortListedContactIds,
                success: function (html)
                {
                    document.getElementById('shortListClose').click();
                    document.getElementById("shortListData").style.display = "block";
                    alert("Generated Batch Id=" + html);
                }, error: function ()
                {
                    alert("Please try later");
                }
            });
        }
    }
}

function changeUser(value)
{
    $.ajax({
        type: "post",
        url: "changeUser",
        data: "officeId=" + value,
        success: function (html)
        {
            document.getElementById('auserId').innerHTML = html;
        }, error: function ()
        {
            alert("Please try later");
        }
    });
}
function changeArm(value)
{
    $.ajax({
        type: "post",
        url: "changeArm",
        data: "userId=" + value,
        success: function (html)
        {
            document.getElementById('armId').innerHTML = html;
        }, error: function ()
        {

        }
    });
}

function searchContacts()
{

    var untouchedDate = document.getElementById("untouchedDate").value;                        //Added by vineet For untouchedDate on 6-12-2016
    var fromDate = document.getElementById("example1").value;
    var toDate = document.getElementById("example2").value;
    var photo = document.getElementById("photo").value;
    var status = document.getElementById("Status").value;
    var userId = document.getElementById("userId").value;
    var armId = document.getElementById("armIds").value;
    var emailIdForSearch = document.getElementById("emailIdForSearch").value;
    var cityId = document.getElementById("tags").value;
    var educationId = document.getElementById("tags1").value;
    var countryId = document.getElementById("countryId").value;
//    var educationId = document.getElementById("educationId").value;
    var communityId = document.getElementById("communityId").value;
    var categoryId = document.getElementById("categoryId").value;
    var mobileId = document.getElementById("mobileId").value;
    var from = document.getElementById("from").value;
    var authorityId = document.getElementById("authorityId").value;
    var untouchedId = document.getElementById("untouchedId").checked;
    var officeIdForSearch = document.getElementById("officeIdForSearch").value;
    var d1 = new Date();
    var example1 = document.getElementById('example1').value;
    var example2 = document.getElementById('example2').value;
    
    var paymentStatus = document.getElementById("paymentStatus").value;

    if (untouchedDate === "0") {                     // added by vineet to differentiate for untouched date
        if (example1 !== "" && example2 === "")
        {
            alert("Please enter both dates");
            return false;
        }
        if (example1 === "" && example2 !== "")
        {
            alert("Please enter both dates");
            return false;
        }
    }
    var dateFirst = example1.split('/');
    var dateSecond = example2.split('/');
    var date1 = new Date(dateFirst[2], dateFirst[1] - 1, dateFirst[0]);
    var date2 = new Date(dateSecond[2], dateSecond[1] - 1, dateSecond[0]);
    if (d1.getTime() < date1.getTime())
    {
        alert("Date cannot me more than todays date");
        return false;
    }
    if (d1.getTime() < date2.getTime())
    {
        alert("Date cannot me more than todays date");
        return false;
    }
    var date1 = example1;
    var date2 = example2;
    if (untouchedId === true)
    {
        untouchedId = "1";
    } else {
        untouchedId = "";
    }
    document.getElementById('loading1').style.display = "block";
    $.ajax({
        type: "post",
        url: "searchContact",
        data: "officeIdForSearch=" + officeIdForSearch + "&photo=" + photo + "&categoryId=" + categoryId + "&communityId=" + communityId + "&status=" + status + "&date2=" + date2 + "&date1=" + date1 + "&untouchedFlag=" + untouchedId + "&educationId=" + educationId + "&countryId=" + countryId + "&cityId=" + cityId + "&mobileId=" + mobileId + "&emailIdForSearch=" + emailIdForSearch + "&userId=" + userId + "&armId=" + armId + "&authorityId=" + authorityId + "&from=" + from + "&untouchedDate=" + untouchedDate+"&paymentStatus="+paymentStatus,
        success: function (html)
        {
            document.getElementById('displayDiv').innerHTML = html;
            document.getElementById('displayDiv').style.display = "block";
            document.getElementById('loading1').style.display = "none";


        }, error: function ()
        {
            alert("Please try later");
        }
    });

}
function searchAutocomplete()
{

    var txtAutoComplete = document.getElementById("txtAutoComplete").value;
    $.ajax({
        type: "post",
        url: "searchContact",
        data: "txtAutoComplete=" + txtAutoComplete,
        success: function (html)
        {

            document.getElementById('displayDiv').innerHTML = html;
            document.getElementById('displayDiv').style.display = "block";


        }, error: function ()
        {
            alert("Please try later");
        }
    });

}
function resetFilters()
{
    var authorityId = document.getElementById("authorityId").value;
    if (authorityId !== 0) {
        document.getElementById("authorityId").value = "0";
    }
    var communityId = document.getElementById("communityId").value;
    if (communityId !== 0) {
        document.getElementById("communityId").value = "0";
    }
    var categoryId = document.getElementById("categoryId").value;
    if (categoryId !== 0) {
        document.getElementById("categoryId").value = "0";
    }
    var countryId = document.getElementById("countryId").value;
    if (countryId !== 0) {
        document.getElementById("countryId").value = "0";
    }
    var cityId = document.getElementById("tags").value;
    if (cityId !== null && cityId !== "") {
        document.getElementById("tags").value = "";
    }
    var education = document.getElementById("tags1").value;
    if (education !== null && education !== "") {
        document.getElementById("tags1").value = "";
    }
    var status = document.getElementById("Status").value;
    if (status !== 0)
    {
        document.getElementById("Status").value = "0";
    }
    var photo = document.getElementById("photo").value;
    if (photo !== 0)
    {
        document.getElementById("photo").value = "0";
    }
    var userId = document.getElementById("userId").value;
    if (userId !== 0) {
        document.getElementById("userId").value = "0";
    }

    var mobileId = document.getElementById("mobileId").value;
    if (mobileId !== null && mobileId !== "")
    {
        document.getElementById("mobileId").value = "";
    }
    var emailId = document.getElementById("emailIdForSearch").value;
    if (emailId !== "" && emailId !== null) {
        document.getElementById("emailIdForSearch").value = "";
    }
    var from = document.getElementById("from").value;
    if (from !== 0)
    {
        document.getElementById("from").value = "0";
    }
//    var motherTongue = document.getElementById("motherTongueId").value;
//    if (motherTongue !== 0) {
//        document.getElementById("motherTongueId").value = "0";
//    }
//    var priority = document.getElementById("Priority").value;
//    if (priority !== 0)
//    {
//        document.getElementById("Priority").value = "0";
//    }

}

function ClaculateTotal(attr) { //alert($(attr).val())
    // console.log($(attr).val()+" | "+$('#taxapplied').val()+" | "+($(attr).val()*$('#taxapplied').val())/100);
    var Total = parseInt(attr) + (parseInt((attr) * $('#taxapplied').val()) / 100);
//    var Total = parseInt($(attr).val()) + parseInt(($(attr).val() * $('#taxapplied').val()) / 100); commented by vineet on 23-03-2017
    $('#total').val(Total);
    var words = new Array();
    words[0] = '';
    words[1] = 'One';
    words[2] = 'Two';
    words[3] = 'Three';
    words[4] = 'Four';
    words[5] = 'Five';
    words[6] = 'Six';
    words[7] = 'Seven';
    words[8] = 'Eight';
    words[9] = 'Nine';
    words[10] = 'Ten';
    words[11] = 'Eleven';
    words[12] = 'Twelve';
    words[13] = 'Thirteen';
    words[14] = 'Fourteen';
    words[15] = 'Fifteen';
    words[16] = 'Sixteen';
    words[17] = 'Seventeen';
    words[18] = 'Eighteen';
    words[19] = 'Nineteen';
    words[20] = 'Twenty';
    words[30] = 'Thirty';
    words[40] = 'Forty';
    words[50] = 'Fifty';
    words[60] = 'Sixty';
    words[70] = 'Seventy';
    words[80] = 'Eighty';
    words[90] = 'Ninety';
    Total = Total.toString();
    if (Total > 0)
    {
        var atemp = Total.split(".");
        var number = atemp[0].split(",").join("");
        var n_length = number.length;
        var words_string = "";
        if (n_length <= 9) {
            var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
            var received_n_array = new Array();
            for (var i = 0; i < n_length; i++) {
                received_n_array[i] = number.substr(i, 1);
            }
            for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
                n_array[i] = received_n_array[j];
            }
            for (var i = 0, j = 1; i < 9; i++, j++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    if (n_array[i] == 1) {
                        n_array[j] = 10 + parseInt(n_array[j]);
                        n_array[i] = 0;
                    }
                }
            }
            var value = "";
            for (var i = 0; i < 9; i++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    value = n_array[i] * 10;
                } else {
                    value = n_array[i];
                }
                if (value != 0) {
                    words_string += words[value] + " ";
                }
                if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Crores ";
                }
                if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Lakhs ";
                }
                if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Thousand ";
                }
                if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                    words_string += "Hundred and ";
                } else if (i == 6 && value != 0) {
                    words_string += "Hundred ";
                }
            }
            words_string = words_string.split("  ").join(" ");
        }
        document.getElementById('inWords').value = words_string;
    } else {
        document.getElementById('inWords').value = "";
        $('#total').val("0");
    }


}

function getProfileListAutocomplete()
{
    $.ajax({
        type: "post",
        url: "getProfileListAutocomplete",
        data: "txtAutoComplete=" + 1,
        success: function (html)
        {
            document.getElementById('contactListAll').value = html;
            alert(html);
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



//Added by vineet on 02-12-2016
function fetchPackagePrice(packageId)
{
    var tax = $('#taxapplied').val();
    $.ajax({
        type: "post",
        url: "fetchPackagePrice",
        data: "packageId=" + packageId,
        success: function (html) {
            document.getElementById('packagepriceId').value = html;
            document.getElementById('registrationCharges').value = html;
            document.getElementById('total').value = parseFloat(html) * (parseFloat(tax) / 100) + parseFloat(html);
            var reg = html;
            ClaculateTotal(reg);
        }
    });

}

////Added by vineet on 18-01-2017
//
function calculateBalanceBefore()
{
    var regChargBefore = $('#total').val();
    $('#toCalBalance').val(regChargBefore);
}

function calculateReg()
{
    var tax = $('#taxapplied').val();
    var price = $('#packagepriceId').val();
    document.getElementById('registrationCharges').value = price;
    document.getElementById('total').value = parseFloat(price) * (parseFloat(tax) / 100) + parseFloat(price);
}

//Added by vineet on 5-12-2016

function discountValueForPayment(type)
{

    if (type == 'flat')
    {

        $('.changeInput').html("<input type='text' id='discountValue' onblur='return calculateRegFlat(this.value)'>");
    } else
    {
        $('.changeInput').html("<input type='text' id='discountValue' onblur='return calculateRegPercent(this.value)'>" + "%");
    }
}

function calculateRegFlat(value)
{
    var packagePrice = $('#packagepriceId').val();
    var regValue = parseFloat(packagePrice) - parseFloat(value);
    $('#registrationCharges').val(regValue);
    var serviceTax = $('#taxapplied').val();
    var totalCharge = regValue + (regValue * serviceTax / 100);
    $('#total').val(totalCharge);
    calculateIWords(totalCharge);
}

function calculateRegPercent(value)
{
    var discountValue = $('#discountValue').val();

    if (discountValue > 0 && discountValue <= 100) {
        var packagePrice = $('#packagepriceId').val();
        var regValue = (packagePrice) - (packagePrice * value / 100);
        $('#registrationCharges').val(regValue);
        var serviceTax = $('#taxapplied').val();
        var totalCharge = regValue + (regValue * serviceTax / 100);
        $('#total').val(totalCharge);
        calculateIWords(totalCharge);
    } else {
        alert("Discount should between 0-100 %");
        $('#discountValue').val("");
    }
}

function calculateIWords(Total)
{
    var words = new Array();
    words[0] = '';
    words[1] = 'One';
    words[2] = 'Two';
    words[3] = 'Three';
    words[4] = 'Four';
    words[5] = 'Five';
    words[6] = 'Six';
    words[7] = 'Seven';
    words[8] = 'Eight';
    words[9] = 'Nine';
    words[10] = 'Ten';
    words[11] = 'Eleven';
    words[12] = 'Twelve';
    words[13] = 'Thirteen';
    words[14] = 'Fourteen';
    words[15] = 'Fifteen';
    words[16] = 'Sixteen';
    words[17] = 'Seventeen';
    words[18] = 'Eighteen';
    words[19] = 'Nineteen';
    words[20] = 'Twenty';
    words[30] = 'Thirty';
    words[40] = 'Forty';
    words[50] = 'Fifty';
    words[60] = 'Sixty';
    words[70] = 'Seventy';
    words[80] = 'Eighty';
    words[90] = 'Ninety';
    Total = Total.toString();
    if (Total > 0)
    {
        var atemp = Total.split(".");
        var number = atemp[0].split(",").join("");
        var n_length = number.length;
        var words_string = "";
        if (n_length <= 9) {
            var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
            var received_n_array = new Array();
            for (var i = 0; i < n_length; i++) {
                received_n_array[i] = number.substr(i, 1);
            }
            for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
                n_array[i] = received_n_array[j];
            }
            for (var i = 0, j = 1; i < 9; i++, j++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    if (n_array[i] == 1) {
                        n_array[j] = 10 + parseInt(n_array[j]);
                        n_array[i] = 0;
                    }
                }
            }
            var value = "";
            for (var i = 0; i < 9; i++) {
                if (i == 0 || i == 2 || i == 4 || i == 7) {
                    value = n_array[i] * 10;
                } else {
                    value = n_array[i];
                }
                if (value != 0) {
                    words_string += words[value] + " ";
                }
                if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Crores ";
                }
                if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Lakhs ";
                }
                if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                    words_string += "Thousand ";
                }
                if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                    words_string += "Hundred and ";
                } else if (i == 6 && value != 0) {
                    words_string += "Hundred ";
                }
            }
            words_string = words_string.split("  ").join(" ");
        }
        document.getElementById('inWords').value = words_string;
    } else {
        document.getElementById('inWords').value = "";
//        $('#total').val("0");
    }

}




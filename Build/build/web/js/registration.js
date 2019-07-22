function showDivyangSection(id)
{
    var value = document.getElementById(id).checked;
    if (value === true)
    {
        document.getElementById("displayDivyang").style.display = "block";
    } else {
        document.getElementById("displayDivyang").style.display = "none";
    }
}
function showAboutFamilyDiv()
{
    document.getElementById("aboutFamilyDivEdit").style.display = "block";
    document.getElementById("aboutFamilyDiv").style.display = "none";
}
function editFamily()
{
    document.getElementById('editFamilyDiv').style.display = "block";
    document.getElementById('displayFamilyDiv').style.display = "none";
//    $('#addBrotherLink').click();
//    $('#addSisterLink').click();

}

function addBrother()
{
    var t = $("#brotherTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/family.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#brotherTable tr:last").after('<tr><td  id="name' + id + '">' + temp[0] + '</td>\n\
                        <td  id="elder' + id + '">' + temp[1] + '</td>\n\
<td  id="education' + id + '">' + temp[2] + '</td>\n\
<td  id="occupation' + id + '">' + temp[3] + '</td>\n\
<td  id="marriedTo' + id + '">' + temp[4] + '</td>\n\
<td  id="dob' + id + '"><div class="controlsData controlWidth"><input id="siblingDob' + id + '" name="contact.siblingDobArray" type="text" ></div></td>\n\
<td  id="place' + id + '">' + temp[5] + '</td>\n\
<td id="brotherDetail' + id + '"><div class="controlsData controlWidth"><textarea name="contact.businessDescriptions"></textarea></div></td> \n\
<td  id="delete' + id + '"><div class="controlsData controlWidth"><a href="#!" onclick="removeBrother(' + id + ')">Delete</a></div></td></tr>');
//                    $("#siblingDob" + id).datepicker({
//                        dateFormat: 'dd/mm/yyyy'
//                    });

        }
    });
}

function addSister()
{
    var t = $("#sisterTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/sister.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#sisterTable tr:last").after('<tr><td id="sname' + id + '">' + temp[0] + '</td>\n\
                        <td  id="selder' + id + '">' + temp[1] + '</td>\n\
<td  id="seducation' + id + '">' + temp[2] + '</td>\n\
<td  id="soccupation' + id + '">' + temp[3] + '</td>\n\
<td  id="smarriedTo' + id + '">' + temp[4] + '</td>\n\
<td  id="sdob' + id + '"><div class="controlsData controlWidth"><input id="ssiblingDob' + id + '" name="contact.siblingDobArray1" type="text" ></div></td>\n\
<td  id="splace' + id + '">' + temp[5] + '</td>\n\
<td id="sisterDetail' + id + '"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions1"></textarea></div></td>\n\
<td  id="delete' + id + '"><div class="controlsData controlWidth"><a href="#!" onclick="removeSister(' + id + ')">Delete</a></div></td></tr>');
//                    $("#ssiblingDob" + id).datepicker({
//                        dateFormat: 'dd/mm/yyyy'
//                    });
        }
    });
}

function addChacha()
{
    var t = $("#chachaTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/chacha.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#chachaTable tr:last").after('<tr><td id="cname' + id + '">' + temp[0] + '</td>\n\
<td  id="clocation' + id + '">' + temp[1] + '</td>\n\
<td  id="coccupation' + id + '">' + temp[2] + '</td>\n\
<td  id="cmarriedTo' + id + '">' + temp[3] + '</td>\n\
<td  id="cdob' + id + '"><div class="controlsData controlWidth"><input id="csiblingDob' + id + '" name="contact.siblingDobArray" type="text" ></div></td>\n\
<td  id="cplace' + id + '">' + temp[4] + '</td>\n\
<td id="chachaDetail' + id + '"><div class="controlsData controlWidth"><textarea name="contact.businessDescriptions"></textarea></div></td>\n\
<td><a href="#!" onclick="removeChacha(' + id + ')">Delete</a></td></tr>');
        }
    });
}
function checkPaternalDetails()
{

    var grandFatherName = document.getElementById("grandFatherName").value;
    var grandMotherName = document.getElementById("grandMotherName").value;
    var reg = /^[a-zA-Z ]*$/;
    var reg1 = /([%\$@#\*]+)/;
    var status = 'true';
    if (grandFatherName !== "")
    {
        if (reg1.test(grandFatherName))
        {
            document.getElementById("validategrandFatherName").style.display = "block";
            status = 'false';
        } else {
            document.getElementById("validategrandFatherName").style.display = "none";
        }
    } else {
        document.getElementById("validategrandFatherName").style.display = "none";
    }
    if (grandMotherName !== "")
    {
        if (reg1.test(grandMotherName))
        {
            document.getElementById("validategrandMotherName").style.display = "block";
            status = 'false';
        } else {
            document.getElementById("validategrandMotherName").style.display = "none";
        }
    } else {
        document.getElementById("validategrandMotherName").style.display = "none";
    }

    if (status === 'false') {
        return false;
    }
    var t = $("#chachaTable tr").length;
    var st = $("#buaTable tr").length;
    for (var i = 0; i < t - 1; i++) {
        var SiblingName = $("#cname" + i + " input").val();
        var location = $("#clocation" + i + " input").val();
        var SiblingWork = $("#coccupation" + i + " input").val();
        var marriedTo = $("#cmarriedTo" + i + " input").val();
        var dob = $("#cdob" + i + " input").val();
        var place = $("#cplace" + i + " input").val();
        if (SiblingName === '')
        {
            alert("Chacha name is mandatory or else remove the row.");
            return false;
        }
        if (reg1.test(SiblingName) || reg1.test(SiblingWork) || reg1.test(marriedTo) || reg1.test(dob) || reg1.test(place) || reg1.test(dob) || reg1.test(location) || reg1.test(place))
        {
            alert("Special characters are not allowed");
            return false;
        }
    }
    for (var i = 0; i < st - 1; i++) {
        var SiblingName = $("#bname" + i + " input").val();
        var location = $("#blocation" + i + " input").val();
        var SiblingWork = $("#boccupation" + i + " input").val();
        var marriedTo = $("#bmarriedTo" + i + " input").val();
        var dob = $("#bdob" + i + " input").val();
        var place = $("#bplace" + i + " input").val();
        if (SiblingName === '')
        {
            alert("Bua name is mandatory or else remove the row");
            return false;
        }
        if (reg1.test(SiblingName) || reg1.test(SiblingWork) || reg1.test(marriedTo) || reg1.test(dob) || reg1.test(place) || reg1.test(dob) || reg1.test(location) || reg1.test(place))
        {
            alert("Special characters are not allowed");
            return false;
        }
    }
    return true;
}
function checkMaternalDetails()
{

    var grandFatherName = document.getElementById("grandFatherNana").value;
    var grandMotherName = document.getElementById("grandMotherNani").value;
//            var reg = /^[a-zA-Z ]*$/;
    var reg1 = /([%\$@#\*]+)/;
    var status = 'true';
    if (grandFatherName !== "")
    {
        if (reg1.test(grandFatherName))
        {
            document.getElementById("validategrandFatherNameNana").style.display = "block";
            status = 'false';
        } else {
            document.getElementById("validategrandFatherNameNana").style.display = "none";
        }
    } else {
        document.getElementById("validategrandFatherNameNana").style.display = "none";
    }
    if (grandMotherName !== "")
    {
        if (reg1.test(grandMotherName))
        {
            document.getElementById("validategrandMotherNameNani").style.display = "block";
            status = 'false';
        } else {
            document.getElementById("validategrandMotherNameNani").style.display = "none";
        }
    } else {
        document.getElementById("validategrandMotherNameNani").style.display = "none";
    }

    if (status === 'false') {
        return false;
    }

    var t = $("#mamaTable tr").length;
    var st = $("#mausiTable tr").length;
//            var reg = /^[a-zA-Z ]*$/;
    for (var i = 0; i < t - 1; i++) {
        var SiblingName = $("#mname" + i + " input").val();
        var location = $("#mlocation" + i + " input").val();
        var SiblingWork = $("#moccupation" + i + " input").val();
        var marriedTo = $("#mmarriedTo" + i + " input").val();
        var dob = $("#mdob" + i + " input").val();
        var place = $("#mplace" + i + " input").val();
        if (SiblingName === '')
        {
            alert("Mama name is mandatory or else delete row");
            return false;
        }
        if (reg1.test(SiblingName) || reg1.test(SiblingWork) || reg1.test(marriedTo) || reg1.test(place) || reg1.test(dob) || reg1.test(location) || reg1.test(place))
        {
            alert("Special characters are not allowed");
            return false;
        }
    }
    for (var i = 0; i < st - 1; i++) {
        var SiblingName = $("#maname" + i + " input").val();
        var location = $("#malocation" + i + " input").val();
        var SiblingWork = $("#maoccupation" + i + " input").val();
        var marriedTo = $("#mamarriedTo" + i + " input").val();
        var dob = $("#madob" + i + " input").val();
        var place = $("#maplace" + i + " input").val();
        if (SiblingName === '')
        {
            alert("Mausi name is  mandatory or else delete row.");
            return false;
        }
        if (reg1.test(SiblingName) || reg1.test(SiblingWork) || reg1.test(marriedTo) || reg1.test(dob) || reg1.test(place) || reg1.test(location) || reg1.test(place))
        {
            alert("Special characters are not allowed");
            return false;
        }
    }
    return true;
}
function checkEducation()
{
    var st = $("#contactEducationTable tr").length;
    for (var i = 0; i < st - 1; i++) {
        var graduation = $("#graduation" + i + " input").val();
//                alert("adfasd" + typeof (graduation));
        if (typeof (graduation) !== "undefined")
        {
            var college = $("#college" + i + " input").val();
            var location = $("#location" + i + " input").val();
            var year = $("#year" + i + " input").val();
            var re = /^[-+]?(\d*[.])?\d+$/;
            var reg = /^[0-9a-zA-Z ]*$/;
            if (graduation === '')
            {
                alert("Please enter degree");
                return false;
            }
        }

    }

}
function displayIntro()
{

    document.getElementById('introductoryDivDisplay').style.display = "none";
    document.getElementById('introductoryDivEdit').style.display = "block";
}
function displayPaternal()
{

    document.getElementById('paternalDivDisplay').style.display = "none";
    document.getElementById('paternalDivEdit').style.display = "block";
}
function hidePaternal()
{

    document.getElementById('paternalDivDisplay').style.display = "none";
    document.getElementById('paternalDivEdit').style.display = "block";
}
function hideIntro()
{
    var reg = /^[0-9a-zA-Z ]*$/;
    var reg1 = /([%\$@#\*]+)/;
    var reg2 = /[%\$@#\*]+/;
    var birthcity = document.getElementById('birthcity').value;
    var nativeData = document.getElementById('nativeData').value;
    if (birthcity !== "")
    {
        if (reg2.test(birthcity))
        {
            document.getElementById('validatebirthcity').style.display = "block";
            return false;
        } else {
            document.getElementById('validatebirthcity').style.display = "none";
        }
    }
    if (nativeData !== "")
    {
        if (reg1.test(nativeData))
        {
            document.getElementById('validatenativeData').style.display = "block";
            return false;
        } else {
            document.getElementById('validatenativeData').style.display = "none";
        }
    }






}
function showMaternalEdit()
{
    document.getElementById('maternalDivDisplay').style.display = "none";
    document.getElementById('maternalDivEdit').style.display = "block";
}
function displayPreferencesEdit()
{
    document.getElementById('preferencesEdit').style.display = "block";
    document.getElementById('preferencesDisplay').style.display = "none";
}
function displayMedicalHistory()
{
    document.getElementById('displayMedicalHistory').style.display = "none";
    document.getElementById('editMedicalHistory').style.display = "block";
}
function uploadImage(number)
{

    document.getElementById('imageNumber').value = number;
}
function deleteImage(number)
{

    document.getElementById('imageNumber1').value = number;
}
function addChildren()
{
    var t = $("#childTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/children.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#childTable tr:last").after('<tr>\n\
            <td id="childName' + id + '">' + temp[0] + '</td>\n\
<td  id="childGender' + id + '">' + temp[1] + '</td>\n\
<td  id="childAge' + id + '">' + temp[2] + '</td>\n\
<td  id="childLivingWith' + id + '">' + temp[3] + '</td></tr>');
        }
    });
}

function checkDivorcee()
{
    var reg = /^[0-9a-zA-Z ]*$/;
    var reg1 = /([%\$@#\*]+)/;
    var aboutwidow = document.getElementById('aboutwidow').value;
//            var livingalonewidow = document.getElementById('livingalonewidow').value;
    var specialpreferencew = document.getElementById('specialpreferencew').value;
    if (aboutwidow !== "")
    {
        if (reg1.test(aboutwidow))
        {
            document.getElementById("validateaboutwidow").style.display = "block";
            return false;
        } else {
            document.getElementById("validateaboutwidow").style.display = "none";
        }
    }
//            if (livingalonewidow !== "")
//            {
//                if (!reg.test(livingalonewidow))
//                {
//                    document.getElementById("validatelivingalonewidow").style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById("validatelivingalonewidow").style.display = "none";
//                }
//            }
    if (specialpreferencew !== "")
    {
        if (!reg.test(specialpreferencew))
        {
            document.getElementById("validatespecialpreferencew").style.display = "block";
            return false;
        } else {
            document.getElementById("validatespecialpreferencew").style.display = "none";
        }
    }
    var t = $("#childTable tr").length;
    for (var i = 0; i < t - 1; i++) {
        var childName = $("#childName" + i + " input").val();
        var childGender = $("#childGender" + i + " select").val();
        var childAge = $("#childAge" + i + " input").val();
        var childLivingWith = $("#childLivingWith" + i + " input").val();
        var reg = /^[0-9a-zA-Z ]*$/;
        var re = /^[-+]?(\d*[.])?\d+$/;
        if (childGender === '')
        {
            alert("Please select gender");
            return false;
        }
        if (!re.test(childAge))
        {
            alert("Age can only be in number");
            return false;
        }
//                if (childName === '' || childGender === '' || childAge === '' || childLivingWith === '')
//                {
//                    alert("All fields are mandatory");
//                    return false;
//                }
        if (!reg.test(childName) || !reg.test(childGender) || !reg.test(childAge) || !reg.test(childLivingWith))
        {
            alert("Special characters are not allowed");
            return false;
        }

    }
}
function editEducation()
{
//            alert("Inside");
    document.getElementById('editEducation').style.display = "block";
    document.getElementById('displayEducation').style.display = "none";
}
function addEducation()
{
    var t = $("#contactEducationTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/education/education.jsp",
        success: function (html)
        {

            var temp = html.split("___");
//                    alert(temp[0]);




            $("#contactEducationTable tr:last").after('<tr>\n\
            <td id="graduation' + id + '">' + temp[0] + '</td>\n\
<td  id="college' + id + '">' + temp[1] + '</td>\n\
<td  id="location' + id + '">' + temp[2] + '</td>\n\
<td  id="year' + id + '">' + temp[3] + '</td>\n\
<td  id="delete' + id + '"><div class="controlsData controlWidth"><a href="#!" onclick="removeEducation(' + id + ')">Delete</a></div></td></tr>');
        }
    });
}

function editDivorce()
{
    document.getElementById('editDivorce').style.display = "block";
    document.getElementById('displayDivorce').style.display = "none";
}
function displayDivyang()
{
    document.getElementById('displayDivyang').style.display = "none";
    document.getElementById('editDivyang').style.display = "block";
}
function officeUseOnly() {
    document.getElementById('officeUse').style.display = "none";
    document.getElementById('officeUseEdit').style.display = "block";
}
function editBusiness()
{
    document.getElementById('editBusinessForm').style.display = "block";
    document.getElementById('displayBusinessForm').style.display = "none";
}

function editFamilyBusiness()
{
    document.getElementById('editFamilyBusinessForm').style.display = "block";
    document.getElementById('displayFamilyBusinessForm').style.display = "none";
}

function displayContactdetails()
{
    document.getElementById('editContactdetails').style.display = "block";
    document.getElementById('displayContactdetails').style.display = "none";
}
function removeEducation(id) {
    document.getElementById("contactEducationTable").deleteRow(id + 1);
}
function removeBrother(id) {

    document.getElementById("brotherTable").deleteRow(id + 1);
}
function removeSister(id) {

    document.getElementById("sisterTable").deleteRow(id + 1);
}
function removeChacha(id)
{
    document.getElementById("chachaTable").deleteRow(id + 1);
}
function removeBua(id)
{
    document.getElementById("buaTable").deleteRow(id + 1);
}
function removeMama(id)
{
    document.getElementById("mamaTable").deleteRow(id + 1);
}
function removeMausi(id)
{
    document.getElementById("mausiTable").deleteRow(id + 1);
}

/**
 * createPdfPresentationNewFormat - created by Pradeep [30-8-2018]
 * 
 * @param {type} contactId
 * @returns
 */
function createPdfPresentationNewFormat(contactId)
{
    $.ajax({
        type: "post",
        url: "createPdfPresentationNewFormat",
        data: "contactId=" + contactId,
        success: function (html) {
//                    alert(html);
//                    document.getElementById('pdfDiv').style.display = "block";
//                    document.getElementById('pdfDiv').innerHTML = html;
            document.getElementById('viewpdf2').innerHTML = html;
        }
    });
    document.getElementById('fetchRegistrationButton').click();
}


function createPdfPresentation(contactId)
{
    $.ajax({
        type: "post",
        url: "createPdfPresentation",
        data: "contactId=" + contactId,
        success: function (html) {
//                    alert(html);
//                    document.getElementById('pdfDiv').style.display = "block";
//                    document.getElementById('pdfDiv').innerHTML = html;
            document.getElementById('viewpdf1').innerHTML = html;
        }
    });
    document.getElementById('fetchRegistrationButton').click();
}
function showpdf()
{
//            alert("Inside");
    document.getElementById('fetchRegistrationButton1').click();
}

function showAllActivity(contactId, type)
{
    $('.loader').show();
    $.ajax({
        type: "post",
        url: "fetchAuditTrailAll",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById('all').style.display = "block";
            document.getElementById('all').innerHTML = html;
            $('.loader').hide();
        }
    });
}


function fetchActivityList(type, contactId)
{
    $('.loader').show();
    $.ajax({
        type: "post",
        url: "fetchActivityList",
        data: "contactId=" + contactId + "&type=" + type,
        success: function (html) {
            document.getElementById("all").style.display = "block";
            document.getElementById("all").innerHTML = html;
            $('.loader').hide();
        }
    });
}
function fetchLockUnlockRemark(contactId)
{
    $('.loader').show();
    $.ajax({
        type: "post",
        url: "fetchLockUnlockRemark",
        data: "contactId=" + contactId,
        success: function (html) {
            document.getElementById("all").style.display = "block";
            document.getElementById("all").innerHTML = html;
            $('.loader').hide();
        }
    });
}

function saveBusiness()
{
    var income = document.getElementById('income').value;
    var telForBusiness = document.getElementById('telForBusiness').value;
    var emailForBusiness = document.getElementById('emailForBusiness').value;
    var re = /^[-+]?(\d*[.])?\d+$/;
    var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    if (!re.test(income) && income !== "")
    {
        document.getElementById('validateIncome').style.display = "block";
        return false;
    } else {
        document.getElementById('validateIncome').style.display = "none";
    }

    if (telForBusiness) {
        if (!re.test(telForBusiness) && income !== "")
        {
            document.getElementById('validateTelForBis').style.display = "block";
            return false;
        } else {
            document.getElementById('validateTelForBis').style.display = "none";
        }
    }
//            if (telForBusiness) {
//                if (!regEmail.test(emailForBusiness) && income !== "")
//                {
//                    document.getElementById('validateEmailForBus').style.display = "block";
//                    return false;
//                } else {
//                    document.getElementById('validateEmailForBus').style.display = "none";
//                }
//            }
    return true;
}


function saveFamilyBusiness()
{
    var familyIncome = document.getElementById('familyincome').value;
    var telForFamilyBusiness = document.getElementById('telForFamilyBusiness').value;
    var re = /^[-+]?(\d*[.])?\d+$/;
    if (!re.test(familyIncome) && familyIncome !== "")
    {
        document.getElementById('validateFamilyIncome').style.display = "block";
        return false;
    } else {
        document.getElementById('validateFamilyIncome').style.display = "none";
    }

    if (telForFamilyBusiness) {
        if (!re.test(telForFamilyBusiness) && familyIncome !== "")
        {
            document.getElementById('validateTelForFamilyBis').style.display = "block";
            return false;
        } else {
            document.getElementById('validateTelForFamilyBis').style.display = "none";
        }
    }

    return true;
}



function saveContactDetails()
{
    var telephone = document.getElementById('telephone').value;
    var contactEmail = document.getElementById('contactEmail').value;
    var tel = document.getElementById('tel').value;
    var tel2 = document.getElementById('tel2').value;
    var tel3 = document.getElementById('tel3').value;
    var emailSubhlagan = document.getElementById('emailSubhlagan').value;
    var emailSubhlagan2 = document.getElementById('emailSubhlagan2').value;
    var emailSubhlagan3 = document.getElementById('emailSubhlagan3').value;
    var regEmail = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    var re = /^[-+]?(\d*[.])?\d+$/;
//                if (telephone !== "")
//        {
//        if (!re.test(telephone))
//        {
//        document.getElementById('validateTelephone').style.display = "block";
//                return false;
//        } else {
//        document.getElementById('validateTelephone').style.display = "none";
//        }
//        } validation removed for contact because they dont want right now
    if (contactEmail !== "")
    {
        if (!regEmail.test(contactEmail))
        {
            document.getElementById('validateEmail').style.display = "block";
            return false;
        } else {
            document.getElementById('validateEmail').style.display = "none";
        }
    }
//        if (tel !== "")
//        {
//        if (!re.test(tel))
//        {
//        document.getElementById('validateTel').style.display = "block";
//                return false;
//        } else {
//        document.getElementById('validateTel').style.display = "none";
//        }
//        }
//        if (tel2 !== "")
//        {
//        if (!re.test(tel2))
//        {
//        document.getElementById('validateTel2').style.display = "block";
//                return false;
//        } else {
//        document.getElementById('validateTel2').style.display = "none";
//        }
//        }
//        if (tel3 !== "")
//        {
//        if (!re.test(tel3))
//        {
//        document.getElementById('validateTel3').style.display = "block";
//                return false;
//        } else {
//        document.getElementById('validateTel3').style.display = "none";
//        }
//        }
    if (emailSubhlagan !== "")
    {
        if (!regEmail.test(emailSubhlagan))
        {
            document.getElementById('validateEmailSubhlagan').style.display = "block";
            return false;
        } else {
            document.getElementById('validateEmailSubhlagan').style.display = "none";
        }
    }
    if (emailSubhlagan2 !== "")
    {
        if (!regEmail.test(emailSubhlagan2))
        {
            document.getElementById('validateEmailSubhlagan2').style.display = "block";
            return false;
        } else {
            document.getElementById('validateEmailSubhlagan2').style.display = "none";
        }
    }
    if (emailSubhlagan3 !== "")
    {
        if (!regEmail.test(emailSubhlagan3))
        {
            document.getElementById('validateEmailSubhlagan3').style.display = "block";
            return false;
        } else {
            document.getElementById('validateEmailSubhlagan3').style.display = "none";
        }
    }



    return true;
}
function saveDivyang()
{
    var aboutdivyang = document.getElementById('aboutdivyang').value;
    var disability = document.getElementById('disability').value;
//            var divyangsince = document.getElementById('divyangsince').value;
    var specialpreferencediv = document.getElementById('specialpreferencediv').value;
    var reg = /^[0-9a-zA-Z ]*$/;
    var reg1 = /([%\$@#\*]+)/;
    if (aboutdivyang !== "")
    {
        if (reg1.test(aboutdivyang))
        {
            document.getElementById('validateaboutdivyang').style.display = "block";
            return false;
        } else {
            document.getElementById('validateaboutdivyang').style.display = "none";
        }
    }
    if (disability !== "")
    {
        if (!reg.test(disability))
        {
            document.getElementById('validatedisability').style.display = "block";
            return false;
        } else {
            document.getElementById('validatedisability').style.display = "none";
        }
    }

    if (specialpreferencediv !== "")
    {
        if (!reg.test(specialpreferencediv))
        {
            document.getElementById('validatespecialpreferencediv').style.display = "block";
            return false;
        } else {
            document.getElementById('validatespecialpreferencediv').style.display = "none";
        }
    }


}
function saveMedicalHistory()
{
    var powerDetails = document.getElementById('powerDetails').value;
    var otherIssues = document.getElementById('otherIssues').value;
    var reg = /^[0-9a-zA-Z ]*$/;
    var reg1 = /([%,&\$@#\*])/;
    if (powerDetails !== "")
    {
        if (reg1.test(powerDetails))
        {
            document.getElementById('validatepowerDetails').style.display = "block";
            return false;
        } else {
            document.getElementById('validatepowerDetails').style.display = "none";
        }
    }
    if (otherIssues !== "")
    {
        if (!reg.test(otherIssues))
        {
            document.getElementById('validateotherIssues').style.display = "block";
            return false;
        } else {
            document.getElementById('validateotherIssues').style.display = "none";
        }
    }
}

function restrictUpload() {
    var uploadedDocument = document.getElementById("documentUploadForBioData").value;
    if (!uploadedDocument) {
        alert("Please select attachement.");
        return false;
    } else {
        var uploadExt = uploadedDocument.split(".");
        if (uploadExt[1] !== 'doc' && uploadExt[1] !== 'docx' && uploadExt[1] !== 'DOC' && uploadExt[1] !== 'DOCX') {
            alert("Please select only word file");
            return false;
        } else {
            return true;
        }
    }
}

function displayRestrictedProfileEdit() {
    document.getElementById('restrictedProfileEdit').style.display = "block";
    document.getElementById('restrictedProfleDisplay').style.display = "none";
}

function check()
{
    var contact = document.getElementById('restrictedProfileAutoComplete').value;
    var contactList = document.getElementById('contactList').value;
    if (contactList === "")
    {
        contactList = contact;
    } else {
        contactList = contactList + "," + contact;
    }
    document.getElementById('contactList').value = contactList;
    document.getElementById('restrictedProfileAutoComplete').value = "";
    return false;
}
function showDivyangOrDivorce(value)
{
    if (value === "Never Married")
    {
        document.getElementById("displayDivyang").style.display = "none";
        document.getElementById("displayDivorce").style.display = "none";
        document.getElementById("editDivorce").style.display = "none";
        document.getElementById("editDivyang").style.display = "none";
    }
    if (value === "Widowed")
    {
//                document.getElementById("displayDivyang").style.display = "none";
        document.getElementById("displayDivorce").style.display = "block";
    }
    if (value === "Divorced")
    {
//                document.getElementById("displayDivyang").style.display = "block";
        document.getElementById("displayDivorce").style.display = "block";
    }
}
function addBua()
{
    var t = $("#buaTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/bua.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#buaTable tr:last").after('<tr><td id="bname' + id + '">' + temp[0] + '</td>\n\
<td  id="blocation' + id + '">' + temp[1] + '</td>\n\
<td  id="boccupation' + id + '">' + temp[2] + '</td>\n\
<td  id="bmarriedTo' + id + '">' + temp[3] + '</td>\n\
<td  id="bdob' + id + '"><div class="controlsData controlWidth"><input id="bsiblingDob' + id + '" name="contact.siblingDobArray1" type="text" ></div></td>\n\
<td  id="bplace' + id + '">' + temp[4] + '</td>\n\
<td id="buaDetail' + id + '"><div class="controlsData controlWidth"><textarea name="contact.businessDescriptions1"></textarea></div></td>\n\
<td><a href="#!" onclick="removeBua(' + id + ')">Delete</a></td></tr>');
        }
    });
}
function addMama()
{
    var t = $("#mamaTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/mama.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#mamaTable tr:last").after('<tr><td id="mname' + id + '">' + temp[0] + '</td>\n\
<td  id="mlocation' + id + '">' + temp[1] + '</td>\n\
<td  id="moccupation' + id + '">' + temp[2] + '</td>\n\
<td  id="mmarriedTo' + id + '">' + temp[3] + '</td>\n\
<td  id="mdob' + id + '">' + temp[4] + '</td>\n\
<td  id="mplace' + id + '">' + temp[5] + '</td>\n\
<td id="mamaDetail' + id + '"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions"></textarea></div></td>\n\
<td><a href="#!" onclick="removeMama(' + id + ')">Delete</a></td></tr>');
        }
    });
}
function addMausi()
{
    var t = $("#mausiTable tr").length;
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../Ajax/family/mausi.jsp",
        success: function (html)
        {

            var temp = html.split("___");
            $("#mausiTable tr:last").after('<tr><td id="maname' + id + '">' + temp[0] + '</td>\n\
<td  id="malocation' + id + '">' + temp[1] + '</td>\n\
<td  id="maoccupation' + id + '">' + temp[2] + '</td>\n\
<td  id="mamarriedTo' + id + '">' + temp[3] + '</td>\n\
<td  id="madob' + id + '">' + temp[4] + '</td>\n\
<td  id="maplace' + id + '">' + temp[5] + '</td>\n\
<td id="mausiDetail' + id + '"><div class="controlsData controlWidth"><textarea  name="contact.businessDescriptions1"></textarea></div></td>\n\
<td><a href="#!" onclick="removeMausi(' + id + ')">Delete</a></td></tr>');
        }
    });
}

function checkFamilyDetails()
{
    var father = document.getElementById('father').value;
    var mother = document.getElementById('mother').value;
    var fatherEducation = document.getElementById('fatherEducation').value;
    var motherEducation = document.getElementById('motherEducation').value;
    var reg = /^[a-zA-Z ]+$/;
    var reg1 = /([%\$@#\*]+)/;
//        if (father !== "")
//        {
//        if (!reg.test(father))
//        {
//        document.getElementById('validatefather').style.display = "block";
//                return false;
//        } else {
//        document.getElementById('validatefather').style.display = "none";
//        }
//        }

    if (father == "")
    {
        document.getElementById('validatefather').style.display = "block";
        return false;
    } else {
        document.getElementById('validatefather').style.display = "none";
    }


    if (mother == "")
    {
//if (!reg.test(mother))
//{
        document.getElementById('validatemother').style.display = "block";
        return false;
    } else {
        document.getElementById('validatemother').style.display = "none";
    }
//}
    if (fatherEducation !== "")
    {
        if (reg1.test(fatherEducation))
        {
            document.getElementById('validatefatherEducation').style.display = "block";
            return false;
        } else {
            document.getElementById('validatefatherEducation').style.display = "none";
        }
    }
    if (motherEducation !== "")
    {
        if (reg1.test(motherEducation))
        {
            document.getElementById('validatemotherEducation').style.display = "block";
            return false;
        } else {
            document.getElementById('validatemotherEducation').style.display = "none";
        }
    }


    var t = $("#brotherTable tr").length;
    var st = $("#sisterTable tr").length;
    for (var i = 0; i < t - 1; i++) {
        var SiblingName = $("#name" + i + " input").val();
        if (typeof (SiblingName) !== "undefined")
        {
//                    var elder = $("#elder" + i + " select").val();
            var ToWhom = $("#education" + i + " input").val();
            var SiblingWork = $("#occupation" + i + " input").val();
//                    var BusinessDescription = $("#marriedTo" + i + " input").val();
//                    var dob = $("#dob" + i + " input").val();
//                    var place = $("#place" + i + " input").val();
            if (SiblingName === '')
            {
                alert("Brother name is mandatory or else delete row.");
                return false;
            }
            if (reg1.test(SiblingName) || reg1.test(ToWhom) || reg1.test(SiblingWork))
            {
                alert("Special characters are not allowed");
                return false;
            }
        }

    }
    for (var i = 0; i < st - 1; i++) {
        var SiblingName = $("#sname" + i + " input").val();
        if (typeof (SiblingName) !== "undefined")
        {
//                    var elder = $("#selder" + i + " select").val();
            var ToWhom = $("#seducation" + i + " input").val();
            var SiblingWork = $("#soccupation" + i + " input").val();
//                    var BusinessDescription = $("#smarriedTo" + i + " input").val();
//                    var dob = $("#sdob" + i + " input").val();
//                    var place = $("#splace" + i + " input").val();
            if (SiblingName === '')
            {
                alert("Sister name is mandatory or else delete row. ");
                return false;
            }
            if (reg1.test(SiblingName) || reg1.test(ToWhom) || reg1.test(SiblingWork))
            {
                alert("Special characters are not allowed except married to,S/O");
                return false;
            }
        }
    }
    return true;
}
function confirmLost()
{
//                var r=confirm("Are You Sure to Lost");
    if (confirm('Are you sure you want to mark this profile as lost ?')) {
        var lost = $('#lostOp').attr('href');
        window.location = lost;
    }
}

function confirmDelete()
{
    if (confirm('Are you sure you want to delete this profile')) {
        var delet = $('#deleteC').attr('href');
        window.location = delet;
    }
}
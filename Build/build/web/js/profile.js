/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addRowMovement() {
    document.getElementById('edit9').style.display = "none";
    document.getElementById('brotherForm:save9').style.display = "block";
    var t = $("#textTableMovement tr").length;
//    alert(t);
    var id = t - 1;
    $.ajax({
        type: "post",
        url: "../addNewRowPage.xhtml",
        success: function (html)
        {
            var temp = html.split("___");
//            alert("+ temp[1]Name +" + temp[1]);
//            alert("+ temp[2] relationid+" + temp[2]);
//            alert("+ temp[3]Elder +" + temp[3]);
//            alert("+ temp[4]Work +" + temp[4]);
//            alert("+ temp[5]description +" + temp[5]);
//            alert("+ temp[6]income +" + temp[6]);
//            alert("+ temp[7]Married +" + temp[7]);
            $("#textTableMovement tr:last").after('<tr><td id="SiblingNameTd' + id + '" style="width:90%!important;">' + temp[1] + '</td>\n\
<td  id="RelationIdTd' + id + '" style="width:90%!important;">' + temp[2] + '</td>\n\
<td  id="ElderTd' + id + '" style="width:90%!important;">' + temp[3] + '</td>\n\
<td  id="SiblingWorkTd' + id + '" style="width:90%!important;">' + temp[4] + '</td>\n\
<td  id="BusinessDescriptionTd' + id + '" style="width:90%!important;">' + temp[5] + '</td>\n\
<td  id="SiblingIncomeTd' + id + '" style="width:90%!important;">' + temp[6] + '</td>\n\\n\\n\
<td  id="SiblingMarriedTd' + id + '" style="width:90%!important;">' + temp[7] + '</td>\n\
<td  id="ToWhomTd' + id + '" style="width:90%!important;">' + temp[8] + '</td>\n\
</tr>');
        }
    });
}
function removeRowMovement() {
    var tableLength = $("#textTableMovement tr").length;
    var formSize = document.getElementById("brotherForm:size").value;
    var formSize1 = formSize.toString();
    var tableLength1 = tableLength - 1;
    if (formSize1 === tableLength1.toString())
    {
        alert("Cannot delete last row");
    } else {
        document.getElementById("textTableMovement").deleteRow(-1);
    }
}

function showSiblingDetails()
{
//            execute="siblingNameArr relationNameArr siblingWorkArr businessDescriptionArr siblingIncomeArr siblingMarriedArr toWhomArr relationIdArr elderArr"                                                    >

    var SiblingNameTdArr = "";
    var RelationIdTdArr = "";
    var ElderTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var SiblingIncomeTdArr = "";
    var SiblingMarriedTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#textTableMovement tr").length;
//    alert(t);
    document.getElementById('edit9').style.display = "none";
    document.getElementById('brotherForm:save9').style.display = "block";
//    document.getElementById('brotherForm:addRow').style.display = "block";
//    document.getElementById('brotherForm:deleteRow').style.display = "block";

    for (var i = 0; i < t - 1; i++) {
//      
        document.getElementById('brotherForm:siblingNameArr').value = SiblingNameTdArr;
        document.getElementById('brotherForm:relationIdArr').value = RelationIdTdArr;
        document.getElementById('brotherForm:elderArr').value = ElderTdArr;
        document.getElementById('brotherForm:siblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('brotherForm:businessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('brotherForm:siblingIncomeArr').value = SiblingIncomeTdArr;
        document.getElementById('brotherForm:siblingMarriedArr').value = SiblingMarriedTdArr;
        document.getElementById('brotherForm:toWhomArr').value = ToWhomTdArr;

        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingNameLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':relationIdLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':elderLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingWorkLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':businessDescriptionLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingIncomeLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingMarriedLabel').style.display = "none";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':toWhomLabel').style.display = "none";

        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingNameInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':relationIdInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':elderInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingWorkInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':businessDescriptionInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingIncomeInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingMarriedInput').style.display = "block";
        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':toWhomInput').style.display = "block";

    }
}
function hideFathersFamilyForm()
{
    document.getElementById('fathersFamilyForm:fatherLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:motherLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:motherWorkLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:fatherWorkLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:grandFatherNameLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:grandFatherWorkLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:grandMotherNameLabel').style.display = "block";
    document.getElementById('fathersFamilyForm:grandMotherWorkLabel').style.display = "block";

    document.getElementById('fathersFamilyForm:fatherInput').style.display = "none";
    document.getElementById('fathersFamilyForm:fatherWorkId').style.display = "none";
    document.getElementById('fathersFamilyForm:motherInput').style.display = "none";
    document.getElementById('fathersFamilyForm:motherWorkId').style.display = "none";
    document.getElementById('fathersFamilyForm:grandFatherNameInput').style.display = "none";
    document.getElementById('fathersFamilyForm:grandFatherWorkId').style.display = "none";
    document.getElementById('fathersFamilyForm:grandMotherNameInput').style.display = "none";
    document.getElementById('fathersFamilyForm:grandMotherWorkId').style.display = "none";
    document.getElementById('edit3').style.display = "block";
    document.getElementById('fathersFamilyForm:save3').style.display = "none";
}
function showMotherFamilyDetails()
{
    document.getElementById('motherFamilyDetails:mGrandFatherLabel').style.display = "none";
    document.getElementById('motherFamilyDetails:mGrandFatherWorkLabel').style.display = "none";
    document.getElementById('motherFamilyDetails:mgrandMotherNameLabel').style.display = "none";
    document.getElementById('motherFamilyDetails:mgrandMotherWorkLabel').style.display = "none";

    document.getElementById('motherFamilyDetails:mGrandFatherInput').style.display = "block";
    document.getElementById('motherFamilyDetails:mGrandFatherWorkInput').style.display = "block";
    document.getElementById('motherFamilyDetails:mgrandMotherNameInput').style.display = "block";
    document.getElementById('motherFamilyDetails:mgrandMotherWorkInput').style.display = "block";
    document.getElementById('edit4').style.display = "none";
    document.getElementById('motherFamilyDetails:save4').style.display = "block";

}
function hideMotherFamilyDetails()
{
    document.getElementById('motherFamilyDetails:mGrandFatherLabel').style.display = "block";
    document.getElementById('motherFamilyDetails:mGrandFatherWorkLabel').style.display = "block";
    document.getElementById('motherFamilyDetails:mgrandMotherNameLabel').style.display = "block";
    document.getElementById('motherFamilyDetails:mgrandMotherWorkLabel').style.display = "block";

    document.getElementById('motherFamilyDetails:mGrandFatherInput').style.display = "none";
    document.getElementById('motherFamilyDetails:mGrandFatherWorkInput').style.display = "none";
    document.getElementById('motherFamilyDetails:mgrandMotherNameInput').style.display = "none";
    document.getElementById('motherFamilyDetails:mgrandMotherWorkInput').style.display = "none";
    document.getElementById('edit4').style.display = "block";
    document.getElementById('motherFamilyDetails:save4').style.display = "none";
}

function showaboutMeForm()
{
    document.getElementById('aboutMeForm:complexionLabel').style.display = "none";
    document.getElementById('aboutMeForm:bodyTypeLabel').style.display = "none";
    document.getElementById('aboutMeForm:bodyWeightLabel').style.display = "none";
    document.getElementById('aboutMeForm:dietLabel').style.display = "none";
    document.getElementById('aboutMeForm:drinkLabel').style.display = "none";
    document.getElementById('aboutMeForm:smokeLabel').style.display = "none";
    document.getElementById('aboutMeForm:bloodGroupLabel').style.display = "none";
    document.getElementById('aboutMeForm:migrateLabel').style.display = "none";

    document.getElementById('aboutMeForm:complexionId').style.display = "block";
    document.getElementById('aboutMeForm:bodyTypeId').style.display = "block";
    document.getElementById('aboutMeForm:bodyWeightInput').style.display = "block";
    document.getElementById('aboutMeForm:dietId').style.display = "block";
    document.getElementById('aboutMeForm:drinkId').style.display = "block";
    document.getElementById('aboutMeForm:smokeId').style.display = "block";
    document.getElementById('aboutMeForm:bloodGroupId').style.display = "block";
    document.getElementById('edit5').style.display = "none";
    document.getElementById('aboutMeForm:save5').style.display = "block";
    document.getElementById('aboutMeForm:migrateId').style.display = "block";

}
function hideaboutMeForm()
{
    document.getElementById('aboutMeForm:complexionLabel').style.display = "block";
    document.getElementById('aboutMeForm:bodyTypeLabel').style.display = "block";
    document.getElementById('aboutMeForm:bodyWeightLabel').style.display = "block";
    document.getElementById('aboutMeForm:dietLabel').style.display = "block";
    document.getElementById('aboutMeForm:drinkLabel').style.display = "block";
    document.getElementById('aboutMeForm:smokeLabel').style.display = "block";
    document.getElementById('aboutMeForm:bloodGroupLabel').style.display = "block";
    document.getElementById('aboutMeForm:migrateLabel').style.display = "block";


    document.getElementById('aboutMeForm:complexionId').style.display = "none";
    document.getElementById('aboutMeForm:bodyTypeId').style.display = "none";
    document.getElementById('aboutMeForm:bodyWeightInput').style.display = "none";
    document.getElementById('aboutMeForm:dietId').style.display = "none";
    document.getElementById('aboutMeForm:drinkId').style.display = "none";
    document.getElementById('aboutMeForm:smokeId').style.display = "none";
    document.getElementById('aboutMeForm:bloodGroupId').style.display = "none";
    document.getElementById('edit5').style.display = "block";
    document.getElementById('aboutMeForm:save5').style.display = "none";
    document.getElementById('aboutMeForm:migrateId').style.display = "none";
}

function showPartnersBasicDetailsForm()
{
    document.getElementById('partnersBasicDetailsForm:age1Label').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:age2Label').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:height1Label').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:height2Label').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersMaritalStatusLabel').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersCummunityLabel').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:age1Input').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:age2Input').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:heightInput1').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:heightInput2').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersMaritalStatus').style.display = "inline-table";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersCummunityIds').style.display = "inline-table";
    document.getElementById('edit6').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:save6').style.display = "block";
}
function hidePartnersBasicDetailsForm()
{
    document.getElementById('partnersBasicDetailsForm:age1Label').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:age2Label').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:height1Label').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:height2Label').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersMaritalStatusLabel').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersCummunityLabel').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:age1Input').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:age2Input').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:heightInput1').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:heightInput2').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersMaritalStatus').style.display = "none";
    document.getElementById('partnersBasicDetailsForm:desiredPartnersCummunityIds').style.display = "none";
    document.getElementById('edit6').style.display = "block";
    document.getElementById('partnersBasicDetailsForm:save6').style.display = "none";
}
function showHoroscopeForm()
{
    document.getElementById('horoscopeForm:dobLabel').style.display = "none";
    document.getElementById('horoscopeForm:birtCountryLabel').style.display = "none";
    document.getElementById('horoscopeForm:birthcityLabel').style.display = "none";
    document.getElementById('horoscopeForm:birthHours').style.display = "none";
    document.getElementById('horoscopeForm:birthMins').style.display = "none";
    document.getElementById('horoscopeForm:birthSecs').style.display = "none";
    document.getElementById('horoscopeForm:matchNeededLabel').style.display = "none";
    document.getElementById('horoscopeForm:manglikLabel').style.display = "none";


    document.getElementById('horoscopeForm:dobInput').style.display = "block";
    document.getElementById('horoscopeForm:birtCountryId').style.display = "block";
    document.getElementById('horoscopeForm:birthcityInput').style.display = "block";
    document.getElementById('horoscopeForm:birthHoursId').style.display = "block";
    document.getElementById('horoscopeForm:birthMinsId').style.display = "block";
    document.getElementById('horoscopeForm:birthSecsId').style.display = "block";
    document.getElementById('horoscopeForm:matchNeededId').style.display = "inline-table";
    document.getElementById('horoscopeForm:manglikId').style.display = "inline-table";
    document.getElementById('edit7').style.display = "none";
    document.getElementById('horoscopeForm:save7').style.display = "block";

}
function hideHoroscopeForm()
{
    document.getElementById('horoscopeForm:dobLabel').style.display = "block";
    document.getElementById('horoscopeForm:birtCountryLabel').style.display = "block";
    document.getElementById('horoscopeForm:birthcityLabel').style.display = "block";
    document.getElementById('horoscopeForm:birthHours').style.display = "block";
    document.getElementById('horoscopeForm:birthMins').style.display = "block";
    document.getElementById('horoscopeForm:birthSecs').style.display = "block";
    document.getElementById('horoscopeForm:matchNeededLabel').style.display = "block";
    document.getElementById('horoscopeForm:manglikLabel').style.display = "block";


    document.getElementById('horoscopeForm:dobInput').style.display = "none";
    document.getElementById('horoscopeForm:birtCountryId').style.display = "none";
    document.getElementById('horoscopeForm:birthcityInput').style.display = "none";
    document.getElementById('horoscopeForm:birthHoursId').style.display = "none";
    document.getElementById('horoscopeForm:birthMinsId').style.display = "none";
    document.getElementById('horoscopeForm:birthSecsId').style.display = "none";
    document.getElementById('horoscopeForm:matchNeededId').style.display = "none";
    document.getElementById('horoscopeForm:manglikId').style.display = "none";
    document.getElementById('edit7').style.display = "block";
    document.getElementById('horoscopeForm:save7').style.display = "none";
}


function showHobbies()
{
    document.getElementById('hobbies0Div').style.display = "none";
    document.getElementById('hobbies1Div').style.display = "block";
    document.getElementById('hobbies2Div').style.display = "block";
    document.getElementById('hobbies3Div').style.display = "block";
    document.getElementById('hobbiesForm:save10').style.display = "block";
    document.getElementById('edit10').style.display = "none";

}

function hideHobbies()
{
    document.getElementById('hobbies0Div').style.display = "block";
    document.getElementById('hobbies1Div').style.display = "none";
    document.getElementById('hobbies2Div').style.display = "none";
    document.getElementById('hobbies3Div').style.display = "none";
    document.getElementById('hobbiesForm:save10').style.display = "none";
    document.getElementById('edit10').style.display = "block";
}
function showOtherRelatives()
{
    document.getElementById('ContactDetails:name1Label').style.display = "none";
    document.getElementById('ContactDetails:mobile1Label').style.display = "none";
    document.getElementById('ContactDetails:email1Label').style.display = "none";
    document.getElementById('ContactDetails:relation1Label').style.display = "none";
    document.getElementById('ContactDetails:name2Label').style.display = "none";
    document.getElementById('ContactDetails:mobile2Label').style.display = "none";
    document.getElementById('ContactDetails:email2Label').style.display = "none";
    document.getElementById('ContactDetails:relation2Label').style.display = "none";
    document.getElementById('ContactDetails:name3Label').style.display = "none";
    document.getElementById('ContactDetails:mobile3Label').style.display = "none";
    document.getElementById('ContactDetails:email3Label').style.display = "none";
    document.getElementById('ContactDetails:relation3Label').style.display = "none";

    document.getElementById('ContactDetails:name1Input').style.display = "block";
    document.getElementById('ContactDetails:mobile1Input').style.display = "block";
    document.getElementById('ContactDetails:email1Input').style.display = "block";
    document.getElementById('ContactDetails:relation1Input').style.display = "block";
    document.getElementById('ContactDetails:name2Input').style.display = "block";
    document.getElementById('ContactDetails:mobile2Input').style.display = "block";
    document.getElementById('ContactDetails:email2Input').style.display = "block";
    document.getElementById('ContactDetails:relation2Input').style.display = "block";
    document.getElementById('ContactDetails:name3Input').style.display = "block";
    document.getElementById('ContactDetails:mobile3Input').style.display = "block";
    document.getElementById('ContactDetails:email3Input').style.display = "block";
    document.getElementById('ContactDetails:relation3Input').style.display = "block";
    document.getElementById('edit8').style.display = "none";
    document.getElementById('ContactDetails:save8').style.display = "block";



}
function hideOtherRelatives()
{
    document.getElementById('ContactDetails:name1Label').style.display = "block";
    document.getElementById('ContactDetails:mobile1Label').style.display = "block";
    document.getElementById('ContactDetails:email1Label').style.display = "block";
    document.getElementById('ContactDetails:relation1Label').style.display = "block";
    document.getElementById('ContactDetails:name2Label').style.display = "block";
    document.getElementById('ContactDetails:mobile2Label').style.display = "block";
    document.getElementById('ContactDetails:email2Label').style.display = "block";
    document.getElementById('ContactDetails:relation2Label').style.display = "block";
    document.getElementById('ContactDetails:name3Label').style.display = "block";
    document.getElementById('ContactDetails:mobile3Label').style.display = "block";
    document.getElementById('ContactDetails:email3Label').style.display = "block";
    document.getElementById('ContactDetails:relation3Label').style.display = "block";

    document.getElementById('ContactDetails:name1Input').style.display = "none";
    document.getElementById('ContactDetails:mobile1Input').style.display = "none";
    document.getElementById('ContactDetails:email1Input').style.display = "none";
    document.getElementById('ContactDetails:relation1Input').style.display = "none";
    document.getElementById('ContactDetails:name2Input').style.display = "none";
    document.getElementById('ContactDetails:mobile2Input').style.display = "none";
    document.getElementById('ContactDetails:email2Input').style.display = "none";
    document.getElementById('ContactDetails:relation2Input').style.display = "none";
    document.getElementById('ContactDetails:name3Input').style.display = "none";
    document.getElementById('ContactDetails:mobile3Input').style.display = "none";
    document.getElementById('ContactDetails:email3Input').style.display = "none";
    document.getElementById('ContactDetails:relation3Input').style.display = "none";
    document.getElementById('edit8').style.display = "block";
    document.getElementById('ContactDetails:save8').style.display = "none";
}
function showEducation()
{
    var x = document.getElementById('ContactDetails:description').value;
    document.getElementById('edit11').style.display = "none";
    document.getElementById('ContactDetails:save11').style.display = "block";
    document.getElementById('tr2').style.display = "none";
    document.getElementById('tr1').style.display = "block";

}
function hideEducation()
{
    var nicInstance = nicEditors.findEditor('ContactDetails:description');
    var notes = nicInstance.getContent();
    document.getElementById("ContactDetails:descriptionHidden").value = notes;
    document.getElementById('tr2').style.display = "block";
    document.getElementById('tr1').style.display = "none";
    document.getElementById('edit11').style.display = "block";
    document.getElementById('ContactDetails:save11').style.display = "none";
}


function showBusiness()
{

    document.getElementById('edit12').style.display = "none";
    document.getElementById('businessForm:save12').style.display = "block";
    document.getElementById('familyBusinessEditor').style.display = "block";
    document.getElementById('familyBusinessDivLabel').style.display = "none";



}
function hideBusiness()
{
    document.getElementById('edit12').style.display = "block";
    document.getElementById('businessForm:save12').style.display = "none";
    document.getElementById('familyBusinessEditor').style.display = "none";
    document.getElementById('familyBusinessDivLabel').style.display = "block";
    var nicInstance = nicEditors.findEditor('businessForm:familyBusinessInput');
    var notes = nicInstance.getContent();
    document.getElementById('businessForm:familyBusinessInputHidden').value = notes;
}

function showdesiredPartnersLifeStyleForm()
{
    document.getElementById('desiredPartnersLifeStyleForm:save13').style.display = "inline-table";
    document.getElementById('desiredPartnersLifeStyleForm:dietId').style.display = "inline-table";
    document.getElementById('desiredPartnersLifeStyleForm:drinkId').style.display = "inline-table";
    document.getElementById('desiredPartnersLifeStyleForm:smokeId').style.display = "inline-table";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeId').style.display = "inline-table";
    document.getElementById('desiredPartnersLifeStyleForm:complexionId').style.display = "inline-table";

    document.getElementById('desiredPartnersLifeStyleForm:dietIdLabel').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:drinkLabel').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:smokeLabel').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeLabel').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeLabel').style.display = "none";
    document.getElementById('edit13').style.display = "none";


}
function hidedesiredPartnersLifeStyleForm()
{
    document.getElementById('desiredPartnersLifeStyleForm:save13').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:dietId').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:drinkId').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:smokeId').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeId').style.display = "none";
    document.getElementById('desiredPartnersLifeStyleForm:complexionId').style.display = "none";

    document.getElementById('desiredPartnersLifeStyleForm:dietIdLabel').style.display = "block";
    document.getElementById('desiredPartnersLifeStyleForm:drinkLabel').style.display = "block";
    document.getElementById('desiredPartnersLifeStyleForm:smokeLabel').style.display = "block";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeLabel').style.display = "block";
    document.getElementById('desiredPartnersLifeStyleForm:bodyTypeLabel').style.display = "block";
    document.getElementById('edit13').style.display = "block";
}
function hideSiblingDetails()
{
    document.getElementById('edit9').style.display = "block";
    document.getElementById('brotherForm:save9').style.display = "none";
    var SiblingNameTdArr = "";
    var RelationIdTdArr = "";
    var ElderTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var SiblingIncomeTdArr = "";
    var SiblingMarriedTdArr = "";
    var ToWhomTdArr = "";

    var t = $("#textTableMovement tr").length;


//    alert(t);


    for (var i = 0; i < t - 1; i++) {

        var SiblingNameTd = $("#SiblingNameTd" + i + " input").val();
        var RelationIdTd = $("#RelationIdTd" + i + " select").val();
        var ElderTd = $("#ElderTd" + i + " select").val();
        var SiblingWorkTd = $("#SiblingWorkTd" + i + " select").val();
        var BusinessDescriptionTd = $("#BusinessDescriptionTd" + i + " input").val();
        var SiblingIncomeTd = $("#SiblingIncomeTd" + i + " input").val();
        var SiblingMarriedTd = $("#SiblingMarriedTd" + i + " select").val();
        var ToWhomTd = $("#ToWhomTd" + i + " input").val();
        SiblingNameTdArr = SiblingNameTdArr + "," + SiblingNameTd;
        RelationIdTdArr = RelationIdTdArr + "," + RelationIdTd;
        ElderTdArr = ElderTdArr + "," + ElderTd;
        SiblingWorkTdArr = SiblingWorkTdArr + "," + SiblingWorkTd;
        BusinessDescriptionTdArr = BusinessDescriptionTdArr + "," + BusinessDescriptionTd;
        SiblingIncomeTdArr = SiblingIncomeTdArr + "," + SiblingIncomeTd;
        SiblingMarriedTdArr = SiblingMarriedTdArr + "," + SiblingMarriedTd;
        ToWhomTdArr = ToWhomTdArr + "," + ToWhomTd;

        document.getElementById('brotherForm:siblingNameArr').value = SiblingNameTdArr;
        document.getElementById('brotherForm:relationIdArr').value = RelationIdTdArr;
        document.getElementById('brotherForm:elderArr').value = ElderTdArr;
        document.getElementById('brotherForm:siblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('brotherForm:businessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('brotherForm:siblingIncomeArr').value = SiblingIncomeTdArr;
        document.getElementById('brotherForm:siblingMarriedArr').value = SiblingMarriedTdArr;
        document.getElementById('brotherForm:toWhomArr').value = ToWhomTdArr;

//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingNameLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':relationIdLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':elderLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingWorkLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':businessDescriptionLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingIncomeLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingMarriedLabel').style.display = "block";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':toWhomLabel').style.display = "block";
//
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingNameInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':relationIdInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':elderInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingWorkInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':businessDescriptionInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingIncomeInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':siblingMarriedInput').style.display = "none";
//        document.getElementById('brotherForm:uiRepeatSiblingList:' + i + ':toWhomInput').style.display = "none";


    }
}
function findPos(id)
{
    var x = "#" + id;
    var afterComma = id.substr(id.indexOf("u") + 1);
    var y = "#menu" + afterComma;
//           alert(y);

//            document.getElementById(y).style.background = "red";
    var dist_ho = Math.abs($(x).offset().top);
//    $(y).addClass("redColor");
//            alert(dist_ho);
//        document.getElementById('divcontent').scrollTop += dist_ho-50;
    for (var i = 0; i < 100; i++)
    {
        var z = "#menu" + i;
        $(z).removeClass("redColor");
    }
    $(y).addClass("redColor");
}


function change()
{
    document.getElementById('ContactDetails:addressLabel').style.display = "none";
    document.getElementById('ContactDetails:stateLabel').style.display = "none";
    document.getElementById('ContactDetails:cityLabel').style.display = "none";
    document.getElementById('ContactDetails:countryLabel').style.display = "none";
    document.getElementById('ContactDetails:telephoneLabel').style.display = "none";
    document.getElementById('ContactDetails:mobileLabel').style.display = "none";
    document.getElementById('ContactDetails:lwlabel').style.display = "none";
    document.getElementById('ContactDetails:lwparents').style.display = "block";

    document.getElementById('ContactDetails:pAddressLabel').style.display = "none";
    document.getElementById('ContactDetails:countryId').style.display = "block";
    document.getElementById('ContactDetails:stateId').style.display = "block";
    document.getElementById('ContactDetails:cityId').style.display = "block";
    document.getElementById('ContactDetails:pAddressInput').style.display = "block";
    document.getElementById('ContactDetails:telephoneInput').style.display = "block";
    document.getElementById('ContactDetails:mobileInput').style.display = "block";
    document.getElementById('ContactDetails:addressInput').style.display = "block";
    document.getElementById('edit1').style.display = "none";
    document.getElementById('ContactDetails:save1').style.display = "block";

}
function changeTextBox()
{
    document.getElementById('ContactDetails:addressLabel').style.display = "block";
    document.getElementById('ContactDetails:stateLabel').style.display = "block";
    document.getElementById('ContactDetails:cityLabel').style.display = "block";
    document.getElementById('ContactDetails:countryLabel').style.display = "block";
    document.getElementById('ContactDetails:telephoneLabel').style.display = "block";
    document.getElementById('ContactDetails:mobileLabel').style.display = "block";
    document.getElementById('ContactDetails:pAddressLabel').style.display = "block";
    document.getElementById('ContactDetails:countryId').style.display = "none";
    document.getElementById('ContactDetails:stateId').style.display = "none";
    document.getElementById('ContactDetails:cityId').style.display = "none";
    document.getElementById('ContactDetails:pAddressInput').style.display = "none";
    document.getElementById('ContactDetails:telephoneInput').style.display = "none";
    document.getElementById('ContactDetails:mobileInput').style.display = "none";
    document.getElementById('ContactDetails:addressInput').style.display = "none";
    document.getElementById('ContactDetails:save1').style.display = "none";
    document.getElementById('edit1').style.display = "block";
    document.getElementById('ContactDetails:lwlabel').style.display = "block";
    document.getElementById('ContactDetails:lwparents').style.display = "none";
}
function editProfileForm()
{
    document.getElementById('profileForm:heightLabel').style.display = "none";
    document.getElementById('profileForm:dobLabel').style.display = "none";
    document.getElementById('profileForm:educationLabel').style.display = "none";
    document.getElementById('profileForm:occupationLabel').style.display = "none";
    document.getElementById('profileForm:fatherLabel').style.display = "none";
    document.getElementById('profileForm:motherLabel').style.display = "none";
    document.getElementById('profileForm:contactAddressLabel').style.display = "none";
    document.getElementById('profileForm:years').style.display = "none";
    document.getElementById('profileForm:gotraLabel').style.display = "none";
    document.getElementById('profileForm:nativeplaceLabel').style.display = "none";
    document.getElementById('profileForm:dietLabel').style.display = "none";

    document.getElementById('profileForm:dietId').style.display = "block";
    document.getElementById('profileForm:heightInput').style.display = "block";
    document.getElementById('profileForm:dobInput').style.display = "block";
    document.getElementById('profileForm:educationInput').style.display = "block";
    document.getElementById('profileForm:occupationInput').style.display = "block";
    document.getElementById('profileForm:fatherInput').style.display = "block";
    document.getElementById('profileForm:motherInput').style.display = "block";
    document.getElementById('profileForm:contactAddressInput').style.display = "block";
    document.getElementById('profileForm:nativeplaceInput').style.display = "block";

    document.getElementById('edit').style.display = "none";
    document.getElementById('profileForm:save').style.display = "block";
    document.getElementById('profileForm:gotraInput').style.display = "block";

}
function saveProfileForm()
{

//            var dob = document.getElementById('dobInput').value;
//            if (dob === "")
//            {
//                alert("Please enter proper date of birth");
//                return false;
//            } else {
//                document.getElementById('profileForm:dobInputHidden').value = dob;
//            }

    document.getElementById('profileForm:heightLabel').style.display = "block";
    document.getElementById('profileForm:dobLabel').style.display = "block";
    document.getElementById('profileForm:educationLabel').style.display = "block";
    document.getElementById('profileForm:occupationLabel').style.display = "block";
    document.getElementById('profileForm:fatherLabel').style.display = "block";
    document.getElementById('profileForm:motherLabel').style.display = "block";
    document.getElementById('profileForm:contactAddressLabel').style.display = "block";
    document.getElementById('profileForm:years').style.display = "block";
    document.getElementById('profileForm:gotraLabel').style.display = "block";
    document.getElementById('profileForm:nativeplaceLabel').style.display = "block";
    document.getElementById('profileForm:dietLabel').style.display = "block";

    document.getElementById('profileForm:dietId').style.display = "none";
    document.getElementById('profileForm:nativeplaceInput').style.display = "none";
    document.getElementById('profileForm:heightInput').style.display = "none";
    document.getElementById('profileForm:dobInput').style.display = "none";
    document.getElementById('profileForm:educationInput').style.display = "none";
    document.getElementById('profileForm:occupationInput').style.display = "none";
    document.getElementById('profileForm:fatherInput').style.display = "none";
    document.getElementById('profileForm:motherInput').style.display = "none";
    document.getElementById('profileForm:contactAddressInput').style.display = "none";
    document.getElementById('profileForm:save').style.display = "none";
    document.getElementById('edit').style.display = "block";
    document.getElementById('profileForm:gotraInput').style.display = "none";



}

function hideCommunityForm()
{
    document.getElementById('communityForm:communityLabel').style.display = "none";
    document.getElementById('communityForm:gotraLabel').style.display = "none";
    document.getElementById('communityForm:motherTongueLabel').style.display = "none";
    document.getElementById('communityForm:nativeplaceLabel').style.display = "none";
    document.getElementById('communityForm:communityId').style.display = "block";
    document.getElementById('communityForm:motherTongueId').style.display = "block";
    document.getElementById('communityForm:gotraId').style.display = "block";
    document.getElementById('communityForm:nativeplaceInput').style.display = "block";
    document.getElementById('communityForm:save2').style.display = "block";
    document.getElementById('edit2').style.display = "none";
}

function showCommunityForm()
{
    document.getElementById('communityForm:communityLabel').style.display = "block";
    document.getElementById('communityForm:gotraLabel').style.display = "block";
    document.getElementById('communityForm:motherTongueLabel').style.display = "block";
    document.getElementById('communityForm:nativeplaceLabel').style.display = "block";
    document.getElementById('communityForm:communityId').style.display = "none";
    document.getElementById('communityForm:motherTongueId').style.display = "none";
    document.getElementById('communityForm:gotraId').style.display = "none";
    document.getElementById('communityForm:nativeplaceInput').style.display = "none";
    document.getElementById('communityForm:save2').style.display = "none";
    document.getElementById('edit2').style.display = "block";
}

function showFathersFamilyForm()
{
    document.getElementById('fathersFamilyForm:fatherLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:motherLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:motherWorkLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:fatherWorkLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:grandFatherNameLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:grandFatherWorkLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:grandMotherNameLabel').style.display = "none";
    document.getElementById('fathersFamilyForm:grandMotherWorkLabel').style.display = "none";
    document.getElementById('edit3').style.display = "none";
    document.getElementById('fathersFamilyForm:save3').style.display = "block";

    document.getElementById('fathersFamilyForm:fatherInput').style.display = "block";
    document.getElementById('fathersFamilyForm:fatherWorkId').style.display = "block";
    document.getElementById('fathersFamilyForm:motherInput').style.display = "block";
    document.getElementById('fathersFamilyForm:motherWorkId').style.display = "block";
    document.getElementById('fathersFamilyForm:grandFatherNameInput').style.display = "block";
    document.getElementById('fathersFamilyForm:grandFatherWorkId').style.display = "block";
    document.getElementById('fathersFamilyForm:grandMotherNameInput').style.display = "block";
    document.getElementById('fathersFamilyForm:grandMotherWorkId').style.display = "block";

}
function addMama()
{
    var t = $("#addMamaTable tr").length;
    document.getElementById('edit15').style.display = "none";
    document.getElementById('mamaForm:save15').style.display = "block";
    var id = t - 1;

    $.ajax({
        type: "post",
        url: "../Profile/addRelative.xhtml",
        success: function (html)
        {
            var temp = html.split("___");
            $("#addMamaTable tr:last").after('<tr><td id="mSiblingNameTd' + id + '" style="width:90%!important;">' + temp[1] + '</td>\n\
<td  id="mToWhomTd' + id + '" style="width:90%!important;">' + temp[2] + '</td>\n\
<td  id="msiblingWorkTd' + id + '" style="width:90%!important;">' + temp[3] + '</td>\n\
<td  id="mbusinessDescriptionTd' + id + '" style="width:90%!important;">' + temp[4] + '</td>\n\
</tr>');
        }

    });
}
function deleteMama() {


    document.getElementById("addMamaTable").deleteRow(-1);

}
function addChacha()
{
    document.getElementById('edit14').style.display = "none";
    document.getElementById('uncleForm:save14').style.display = "block";
    var t = $("#addChachaTable tr").length;
    var id = t - 1;

    $.ajax({
        type: "post",
        url: "../Profile/addRelative.xhtml",
        success: function (html)
        {
            var temp = html.split("___");
            $("#addChachaTable tr:last").after('<tr><td id="cSiblingNameTd' + id + '" style="width:90%!important;">' + temp[1] + '</td>\n\
<td  id="cToWhomTd' + id + '" style="width:90%!important;">' + temp[2] + '</td>\n\
<td  id="csiblingWorkTd' + id + '" style="width:90%!important;">' + temp[3] + '</td>\n\
<td  id="cbusinessDescriptionTd' + id + '" style="width:90%!important;">' + temp[4] + '</td>\n\
</tr>');
        }

    });
}
function deleteChacha() {

    var tableLength = $("#addChachaTable tr").length;
//    var realLength=tableLength-1;
//    alert(realLength);


//    var formSize = document.getElementById("brotherForm:size").value;
//    var formSize1 = formSize.toString();
//    var tableLength1 = tableLength - 1;
//    if (formSize1 === tableLength1.toString())
//    {
//        alert("Cannot delete last row");
//    } else {
//        document.getElementById("textTableMovement").deleteRow(-1);
//    }
    document.getElementById("addChachaTable").deleteRow(-1);

}
function addBuaji()
{
    var t = $("#buajiTable tr").length;
    var id = t - 1;
    document.getElementById('edit16').style.display = "none";
    document.getElementById('buaForm:save16').style.display = "block";
    $.ajax({
        type: "post",
        url: "../Profile/addRelative.xhtml",
        success: function (html)
        {
            var temp = html.split("___");
            $("#buajiTable tr:last").after('<tr><td id="bSiblingNameTd' + id + '" style="width:90%!important;">' + temp[1] + '</td>\n\
<td  id="bToWhomTd' + id + '" style="width:90%!important;">' + temp[2] + '</td>\n\
<td  id="bsiblingWorkTd' + id + '" style="width:90%!important;">' + temp[3] + '</td>\n\
<td  id="bbusinessDescriptionTd' + id + '" style="width:90%!important;">' + temp[4] + '</td>\n\
</tr>');
        }

    });
}
function deleteBuaji() {


    document.getElementById("addChachaTable").deleteRow(-1);

}
function addMasiji()
{
    document.getElementById('edit17').style.display = "none";
    document.getElementById('masiForm:save17').style.display = "block";

    var t = $("#masijiTable tr").length;
    var id = t - 1;

    $.ajax({
        type: "post",
        url: "../Profile/addRelative.xhtml",
        success: function (html)
        {
            var temp = html.split("___");
            $("#masijiTable tr:last").after('<tr><td id="maSiblingNameTd' + id + '" style="width:90%!important;">' + temp[1] + '</td>\n\
<td  id="maToWhomTd' + id + '" style="width:90%!important;">' + temp[2] + '</td>\n\
<td  id="masiblingWorkTd' + id + '" style="width:90%!important;">' + temp[3] + '</td>\n\
<td  id="mabusinessDescriptionTd' + id + '" style="width:90%!important;">' + temp[4] + '</td>\n\
</tr>');
        }

    });
}
function deleteMasiji() {


    document.getElementById("masijiTable").deleteRow(-1);

}


function showChacha()
{
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#addChachaTable tr").length;

    document.getElementById('uncleForm:save14').style.display = "block";
    document.getElementById('edit14').style.display = "none";
    for (var i = 0; i < t - 1; i++) {

        document.getElementById('uncleForm:csiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('uncleForm:csiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('uncleForm:cbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('uncleForm:ctoWhomArr').value = ToWhomTdArr;

        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingNameLabel').style.display = "none";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':toWhomLabel').style.display = "none";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingWorkLabel').style.display = "none";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':businessDescriptionLabel').style.display = "none";

        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingNameInput').style.display = "block";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':toWhomInput').style.display = "block";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingWorkInput').style.display = "block";
        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':businessDescriptionInput').style.display = "block";




    }
    return false;
}
function hideChacha()
{
    document.getElementById('uncleForm:save14').style.display = "none";
    document.getElementById('edit14').style.display = "block";
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#addChachaTable tr").length;
//    alert(t);
    for (var i = 0; i < t - 1; i++) {
        var SiblingNameTd = $("#cSiblingNameTd" + i + " input").val();
        var ToWhomTd = $("#cToWhomTd" + i + " input").val();
        var SiblingWorkTd = $("#csiblingWorkTd" + i + " select").val();
        var BusinessDescriptionTd = $("#cbusinessDescriptionTd" + i + " input").val();
//        alert(SiblingNameTd);
//        alert(ToWhomTd);
//        alert(SiblingWorkTd);
//        alert(BusinessDescriptionTd);
        SiblingNameTdArr = SiblingNameTdArr + "," + SiblingNameTd;
        SiblingWorkTdArr = SiblingWorkTdArr + "," + SiblingWorkTd;
        BusinessDescriptionTdArr = BusinessDescriptionTdArr + "," + BusinessDescriptionTd;
        ToWhomTdArr = ToWhomTdArr + "," + ToWhomTd;

        document.getElementById('uncleForm:csiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('uncleForm:csiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('uncleForm:cbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('uncleForm:ctoWhomArr').value = ToWhomTdArr;

//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingNameLabel').style.display = "block";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':toWhomLabel').style.display = "block";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingWorkLabel').style.display = "block";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':businessDescriptionLabel').style.display = "block";
//
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingNameInput').style.display = "none";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':toWhomInput').style.display = "none";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':siblingWorkInput').style.display = "none";
//        document.getElementById('uncleForm:uiRepeatChacha:' + i + ':businessDescriptionInput').style.display = "none";

    }
}

function showMama()
{
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#addMamaTable tr").length;

    document.getElementById('mamaForm:save15').style.display = "block";
    document.getElementById('edit15').style.display = "none";
    for (var i = 0; i < t - 1; i++) {

        document.getElementById('mamaForm:msiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('mamaForm:msiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('mamaForm:mbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('mamaForm:mtoWhomArr').value = ToWhomTdArr;

        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingNameLabel').style.display = "none";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':toWhomLabel').style.display = "none";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingWorkLabel').style.display = "none";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':businessDescriptionLabel').style.display = "none";

        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingNameInput').style.display = "block";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':toWhomInput').style.display = "block";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingWorkInput').style.display = "block";
        document.getElementById('mamaForm:uiRepeatMama:' + i + ':businessDescriptionInput').style.display = "block";




    }
}
function hideMama()
{
    document.getElementById('mamaForm:save15').style.display = "none";
    document.getElementById('edit15').style.display = "block";
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#addMamaTable tr").length;
//    alert(t);
    for (var i = 0; i < t - 1; i++) {
        var SiblingNameTd = $("#mSiblingNameTd" + i + " input").val();
        var ToWhomTd = $("#mToWhomTd" + i + " input").val();
        var SiblingWorkTd = $("#msiblingWorkTd" + i + " select").val();
        var BusinessDescriptionTd = $("#mbusinessDescriptionTd" + i + " input").val();
//        alert(SiblingNameTd);
//        alert(ToWhomTd);
//        alert(SiblingWorkTd);
//        alert(BusinessDescriptionTd);
        SiblingNameTdArr = SiblingNameTdArr + "," + SiblingNameTd;
        SiblingWorkTdArr = SiblingWorkTdArr + "," + SiblingWorkTd;
        BusinessDescriptionTdArr = BusinessDescriptionTdArr + "," + BusinessDescriptionTd;
        ToWhomTdArr = ToWhomTdArr + "," + ToWhomTd;

        document.getElementById('mamaForm:msiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('mamaForm:msiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('mamaForm:mbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('mamaForm:mtoWhomArr').value = ToWhomTdArr;

//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingNameLabel').style.display = "block";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':toWhomLabel').style.display = "block";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingWorkLabel').style.display = "block";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':businessDescriptionLabel').style.display = "block";
//
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingNameInput').style.display = "none";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':toWhomInput').style.display = "none";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':siblingWorkInput').style.display = "none";
//        document.getElementById('mamaForm:uiRepeatMama:' + i + ':businessDescriptionInput').style.display = "none";

    }
}


function showBua()
{
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#buajiTable tr").length;

    document.getElementById('buaForm:save16').style.display = "block";
    document.getElementById('edit16').style.display = "none";
    for (var i = 0; i < t - 1; i++) {

        document.getElementById('buaForm:bsiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('buaForm:bsiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('buaForm:bbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('buaForm:btoWhomArr').value = ToWhomTdArr;

        document.getElementById('buaForm:uiRepeatBua:' + i + ':siblingNameLabel').style.display = "none";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':toWhomLabel').style.display = "none";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':siblingWorkLabel').style.display = "none";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':businessDescriptionLabel').style.display = "none";

        document.getElementById('buaForm:uiRepeatBua:' + i + ':siblingNameInput').style.display = "block";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':toWhomInput').style.display = "block";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':siblingWorkInput').style.display = "block";
        document.getElementById('buaForm:uiRepeatBua:' + i + ':businessDescriptionInput').style.display = "block";




    }
}
function hideBua()
{
    document.getElementById('buaForm:save16').style.display = "none";
    document.getElementById('edit16').style.display = "block";
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#buajiTable tr").length;
//    alert(t);
    for (var i = 0; i < t - 1; i++) {
        var SiblingNameTd = $("#bSiblingNameTd" + i + " input").val();
        var ToWhomTd = $("#bToWhomTd" + i + " input").val();
        var SiblingWorkTd = $("#bsiblingWorkTd" + i + " select").val();
        var BusinessDescriptionTd = $("#bbusinessDescriptionTd" + i + " input").val();
//        alert(SiblingNameTd);
//        alert(ToWhomTd);
//        alert(SiblingWorkTd);
//        alert(BusinessDescriptionTd);
        SiblingNameTdArr = SiblingNameTdArr + "," + SiblingNameTd;
        SiblingWorkTdArr = SiblingWorkTdArr + "," + SiblingWorkTd;
        BusinessDescriptionTdArr = BusinessDescriptionTdArr + "," + BusinessDescriptionTd;
        ToWhomTdArr = ToWhomTdArr + "," + ToWhomTd;

        document.getElementById('buaForm:bsiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('buaForm:bsiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('buaForm:bbusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('buaForm:btoWhomArr').value = ToWhomTdArr;


    }
}
function showMasi()
{
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#masijiTable tr").length;

    document.getElementById('masiForm:save17').style.display = "block";
    document.getElementById('edit17').style.display = "none";
    for (var i = 0; i < t - 1; i++) {

        document.getElementById('masiForm:masiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('masiForm:masiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('masiForm:mabusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('masiForm:matoWhomArr').value = ToWhomTdArr;

        document.getElementById('masiForm:uiRepeatMasi:' + i + ':siblingNameLabel').style.display = "none";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':toWhomLabel').style.display = "none";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':siblingWorkLabel').style.display = "none";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':businessDescriptionLabel').style.display = "none";

        document.getElementById('masiForm:uiRepeatMasi:' + i + ':siblingNameInput').style.display = "block";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':toWhomInput').style.display = "block";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':siblingWorkInput').style.display = "block";
        document.getElementById('masiForm:uiRepeatMasi:' + i + ':businessDescriptionInput').style.display = "block";




    }
}
function hideMasi()
{
    document.getElementById('masiForm:save17').style.display = "none";
    document.getElementById('edit17').style.display = "block";
    var SiblingNameTdArr = "";
    var SiblingWorkTdArr = "";
    var BusinessDescriptionTdArr = "";
    var ToWhomTdArr = "";
    var t = $("#masijiTable tr").length;
//    alert(t);
    for (var i = 0; i < t - 1; i++) {
        var SiblingNameTd = $("#maSiblingNameTd" + i + " input").val();
        var ToWhomTd = $("#maToWhomTd" + i + " input").val();
        var SiblingWorkTd = $("#masiblingWorkTd" + i + " select").val();
        var BusinessDescriptionTd = $("#mabusinessDescriptionTd" + i + " input").val();
//        alert(SiblingNameTd);
//        alert(ToWhomTd);
//        alert(SiblingWorkTd);
//        alert(BusinessDescriptionTd);
        SiblingNameTdArr = SiblingNameTdArr + "," + SiblingNameTd;
        SiblingWorkTdArr = SiblingWorkTdArr + "," + SiblingWorkTd;
        BusinessDescriptionTdArr = BusinessDescriptionTdArr + "," + BusinessDescriptionTd;
        ToWhomTdArr = ToWhomTdArr + "," + ToWhomTd;

        document.getElementById('masiForm:masiblingNameArr').value = SiblingNameTdArr;
        document.getElementById('masiForm:masiblingWorkArr').value = SiblingWorkTdArr;
        document.getElementById('masiForm:mabusinessDescriptionArr').value = BusinessDescriptionTdArr;
        document.getElementById('masiForm:matoWhomArr').value = ToWhomTdArr;


    }
}

function saveAnswers()
{

    var question = "";
    var answer = "";
    var a = "";
    var q = "";
    for (var i = 0; i < 7; i++)
    {
        q = document.getElementById('feedbackForm:questionsUiRepeat:' + i + ':questionIdHidden').value;
        a = document.getElementById('feedbackForm:questionsUiRepeat:' + i + ':answers').value;
        if (a === "")
        {
            a = " ";
        }
        question = question + "," + q;
        answer = answer + "," + a;
    }
    document.getElementById('feedbackForm:finalAnswer').value = answer.slice(1, -1);
    document.getElementById('feedbackForm:finalQuestion').value = question.slice(1, -1);

}
function saveContactId(contactId)
{
    document.getElementById('feedbackForm:contactId').value = contactId;
}

function saveMatchFollowup()
{
//    alert("1");
    var projectId = document.getElementById('followupForm:projectId').value;
    var nextDate = document.getElementById('example1').value;
    var content = document.getElementById('followupForm:content').value;

    if (projectId === '0')
    {
        document.getElementById('followupForm:validateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm:validateProject').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('followupForm:validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm:validateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('followupForm:validateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm:nextDate').value = nextDate;
        document.getElementById('followupForm:validateDate').style.display = "none";
    }
    $('.nav-tabs a[href="#home1"]').tab('show');
    return true;
}

function saveMatchFollowupIndividual()
{
//    alert("1");
    var projectId = document.getElementById('followupForm1:projectId').value;
    var nextDate = document.getElementById('example9').value;
    var content = document.getElementById('followupForm1:content').value;

    if (projectId === '0')
    {
        document.getElementById('followupForm1:validateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm1:validateProject').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('followupForm1:validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm1:validateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('followupForm1:validateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('followupForm1:nextDate').value = nextDate;
        document.getElementById('followupForm1:validateDate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeFollowupIndividual"]').tab('show');
    return true;
}

function saveMatchFollowupStatus()
{
//    alert("1");
    var projectId = document.getElementById('statusStatusReportForm:projectId').value;
    var nextDate = document.getElementById('example7').value;
    var content = document.getElementById('statusStatusReportForm:content').value;

    if (projectId === '0')
    {
        document.getElementById('statusStatusReportForm:validateProject').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:validateProject').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('statusStatusReportForm:validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:validateContent').style.display = "none";
    }
    if (nextDate === '')
    {
        document.getElementById('statusStatusReportForm:validateDate').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:nextDate').value = nextDate;
        document.getElementById('statusStatusReportForm:validateDate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeFollowup"]').tab('show');
    return true;
}

function saveMatchId(matchId)
{
    document.getElementById('matchForm:matchId').value = matchId;
    document.getElementById('matchForm:kundaliButton').click();
}
function saveMatchIdmoveToOutBox(matchId)
{
    document.getElementById('matchForm:matchIdMTO').value = matchId;
    document.getElementById('matchForm:moveToOutBox').click();
}

function checkScheduleMeetingForm()
{
    var venue = document.getElementById('setMeeting:venue').value;
    var date = document.getElementById('example3').value;
    var description = document.getElementById('setMeeting:description').value;
    var fromGroomSide = document.getElementById('setMeeting:fromGroomSide').value;
    var fromBrideSide = document.getElementById('setMeeting:fromBrideSide').value;
//    var meetingType = document.getElementById('setMeeting:meetingType').value;
//    var sendMail = document.getElementById('setMeeting:sendMail').value;
    if (venue === '')
    {
        document.getElementById('setMeeting:validateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting:validateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('setMeeting:validatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting:scheduleDate').value = date;
        document.getElementById('setMeeting:validatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('setMeeting:validateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting:validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('setMeeting:validatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting:validatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('setMeeting:validatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting:validatefromBrideSide').style.display = "none";
    }
    document.getElementById('closeModal1').click();

    return true;
}
function checkScheduleMeetingForm1()
{
    var venue = document.getElementById('setMeeting1:venue').value;
    var date = document.getElementById('example13').value;
    var description = document.getElementById('setMeeting1:description').value;
    var fromGroomSide = document.getElementById('setMeeting1:fromGroomSide').value;
    var fromBrideSide = document.getElementById('setMeeting1:fromBrideSide').value;
//    var meetingType = document.getElementById('setMeeting:meetingType').value;
//    var sendMail = document.getElementById('setMeeting:sendMail').value;
    if (venue === '')
    {
        document.getElementById('setMeeting1:validateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting1:validateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('setMeeting1:validatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting1:scheduleDate').value = date;
        document.getElementById('setMeeting1:validatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('setMeeting1:validateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting1:validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('setMeeting1:validatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting1:validatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('setMeeting1:validatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeeting1:validatefromBrideSide').style.display = "none";
    }
    document.getElementById('closeModal1').click();

    return true;
}
function checkScheduleMeetingFormEdit()
{
    var venue = document.getElementById('setMeetingEdit:venue').value;
    var date = document.getElementById('example4').value;
    var description = document.getElementById('setMeetingEdit:description').value;
    var fromGroomSide = document.getElementById('setMeetingEdit:fromGroomSide').value;
    var fromBrideSide = document.getElementById('setMeetingEdit:fromBrideSide').value;
    if (venue === '')
    {
        document.getElementById('setMeetingEdit:validateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit:validateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('setMeeting:validatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit:scheduleDate').value = date;
        document.getElementById('setMeetingEdit:validatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('setMeetingEdit:validateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit:validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('setMeetingEdit:validatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit:validatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('setMeetingEdit:validatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit:validatefromBrideSide').style.display = "none";
    }
    document.getElementById('closeModal3').click();

    return true;
}
function checkScheduleMeetingFormEdit1()
{
    var venue = document.getElementById('setMeetingEdit1:venue').value;
    var date = document.getElementById('example14').value;
    var description = document.getElementById('setMeetingEdit1:description').value;
    var fromGroomSide = document.getElementById('setMeetingEdit1:fromGroomSide').value;
    var fromBrideSide = document.getElementById('setMeetingEdit1:fromBrideSide').value;
    if (venue === '')
    {
        document.getElementById('setMeetingEdit1:validateVenue').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit1:validateVenue').style.display = "none";
    }

    if (date === '')
    {
        document.getElementById('setMeeting1:validatescheduleDate').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit1:scheduleDate').value = date;
        document.getElementById('setMeetingEdit1:validatescheduleDate').style.display = "none";
    }
    if (description === '')
    {
        document.getElementById('setMeetingEdit1:validateDescription').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit1:validateDescription').style.display = "none";
    }
    if (fromGroomSide === '')
    {
        document.getElementById('setMeetingEdit1:validatefromGroomSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit1:validatefromGroomSide').style.display = "none";
    }
    if (fromBrideSide === '')
    {
        document.getElementById('setMeetingEdit1:validatefromBrideSide').style.display = "block";
        return false;
    } else {
        document.getElementById('setMeetingEdit1:validatefromBrideSide').style.display = "none";
    }
    document.getElementById('closeModal3').click();

    return true;
}


function saveMeetingIds(stid, contactId)
{
//    alert(stid);
    document.getElementById('setMeeting:statusid').value = stid;
    document.getElementById('setMeeting:contactId').value = contactId;
}
function saveMeetingIds1(stid, contactId)
{
//    alert(stid);
    document.getElementById('setMeeting1:statusid').value = stid;
    document.getElementById('setMeeting1:contactId').value = contactId;
}

function editMeeting(statusId, meetingId, contactId)
{

    document.getElementById('statusReport:meetingId').value = meetingId;
    document.getElementById('statusReport:statusId').value = statusId;
    document.getElementById('statusReport:contactId').value = contactId;
    document.getElementById('statusReport:meetingEditButton').click();
}
function editMeeting1(statusId, meetingId, contactId)
{

    document.getElementById('statusReportForm:meetingId').value = meetingId;
    document.getElementById('statusReportForm:statusId').value = statusId;
    document.getElementById('statusReportForm:contactId').value = contactId;
    document.getElementById('statusReportForm:meetingEditButton1').click();
}

function checkStatus()
{
    var remark = document.getElementById('AcceptForm:remark').value;
    if (remark === '')
    {
        document.getElementById('AcceptForm:validateremark').style.display = "block";
        return false;
    } else {
        document.getElementById('AcceptForm:validateremark').style.display = "none";
    }
    document.getElementById('closeModal2').click();

    return true;
}
function checkStatus1()
{
    var remark = document.getElementById('AcceptForm1:remark').value;
    if (remark === '')
    {
        document.getElementById('AcceptForm1:validateremark').style.display = "block";
        return false;
    } else {
        document.getElementById('AcceptForm1:validateremark').style.display = "none";
    }
    document.getElementById('closeModal2').click();

    return true;
}


function emailHeader(n)
{

    var x = document.getElementById('matchForm:matchList:' + n + ':header').value;
    document.getElementById('emailForm:firstName').textContent = x;
    document.getElementById('emailForm:firstName1').textContent = x;

}

function validateEmail()
{
    var recepient = document.getElementById('emailForm:recepientIds').value;
    var subject = document.getElementById('emailForm:emailSubject').value;
    var content = document.getElementById('emailForm:emailContent').value;
    if (recepient === '')
    {
        document.getElementById('emailForm:recepientIdsValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('emailForm:recepientIdsValidate').style.display = "none";
    }
    if (subject === '')
    {
        document.getElementById('emailForm:emailSubjectValidate').style.display = "block";
    } else {
        document.getElementById('emailForm:emailSubjectValidate').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('emailForm:emailContentValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('emailForm:emailContentValidate').style.display = "none";
    }
    $('.nav-tabs a[href="#home2"]').tab('show');
    return true;

}
function validateEmailIndividual()
{
    var recepient = document.getElementById('emailForm1:recepientIds').value;
    var subject = document.getElementById('emailForm1:emailSubject').value;
    var content = document.getElementById('emailForm1:emailContent').value;
    if (recepient === '')
    {
        document.getElementById('emailForm1:recepientIdsValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('emailForm:recepientIdsValidate').style.display = "none";
    }
    if (subject === '')
    {
        document.getElementById('emailForm1:emailSubjectValidate').style.display = "block";
    } else {
        document.getElementById('emailForm1:emailSubjectValidate').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('emailForm1:emailContentValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('emailForm1:emailContentValidate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeEmail"]').tab('show');
    return true;

}

function followupHeader(n)
{
    var x = document.getElementById('matchForm:matchList:' + n + ':header').value;
    document.getElementById('followupForm:firstName').textContent = x;
    document.getElementById('followupForm:firstName1').textContent = x;
}
function feedbackHeader(n)
{
    var x = document.getElementById('matchForm:matchList:' + n + ':header').value;
    document.getElementById('feedBackForm:firstName').textContent = x;
    document.getElementById('feedBackForm:firstName1').textContent = x;
}
function saveFeedBack()
{
    var feedback = document.getElementById('feedBackForm:ffeedack').value;
    var fsubject = document.getElementById('feedBackForm:fsubject').value;
    if (feedback === '')
    {
        document.getElementById('feedBackForm:ffeedackValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('feedBackForm:ffeedackValidate').style.display = "none";
    }
    if (fsubject === '')
    {
        document.getElementById('feedBackForm:fsubjectValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('feedBackForm:fsubjectValidate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeFeedBack"]').tab('show');
    return true;
}

function saveFeedBackIndividual()
{
    var feedback = document.getElementById('feedBackForm1:ffeedack').value;
    var fsubject = document.getElementById('feedBackForm1:fsubject').value;
    if (feedback === '')
    {
        document.getElementById('feedBackForm1:ffeedackValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('feedBackForm1:ffeedackValidate').style.display = "none";
    }
    if (fsubject === '')
    {
        document.getElementById('feedBackForm1:fsubjectValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('feedBackForm1:fsubjectValidate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeFeedBack1"]').tab('show');
    return true;
}

function saveFeedBackStatus()
{
    var feedback = document.getElementById('statusStatusReportForm:ffeedack').value;
    var fsubject = document.getElementById('statusStatusReportForm:fsubject').value;
    if (feedback === '')
    {
        document.getElementById('statusStatusReportForm:ffeedackValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:ffeedackValidate').style.display = "none";
    }
    if (fsubject === '')
    {
        document.getElementById('statusStatusReportForm:fsubjectValidate').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:fsubjectValidate').style.display = "none";
    }
    $('.nav-tabs a[href="#homeFeedBackStatus"]').tab('show');
    return true;
}
function statusReportHeader(size, n, id)
{
    var x = document.getElementById('matchForm:matchList:' + n + ':header').value;
    document.getElementById('statusReport:firstName').textContent = x;
    document.getElementById('statusReport:contactId1').value = id;
    var y = "matchListLi" + n;

//     alert(size);

    for (var i = 0; i < size - 1; i++)
    {
        var z = "matchListLi" + i;
        document.getElementById(z).style.border = "none";
    }
    var y = "matchListLi" + n;
    document.getElementById(y).style.border = "1px solid red";
}

function closeMoveToOutBox(type)
{
    var id = "";
    $("#OutBoxForm input:checkbox:checked").each(function () {
//        alert($(this).val());
        id = id + ',' + $(this).val();
        // do your staff with each checkbox
    });
    if (type === 1)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            document.getElementById('OutBoxForm:outBoxContactIds').value = id;
            alert("This will mail biodata of selected contact");
        }
    }
    if (type === 2)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            document.getElementById('OutBoxForm:outBoxContactIds').value = id;
            alert("This will mail biodata of selected contact");
        }
    }
    
    if (type === 4)
    {
        if (id === '')
        {
            alert("Please select atleast one contact");
            return false;
        } else {
            document.getElementById('OutBoxForm:outBoxContactIds').value = id;
            alert("This will mail biodata of selected contact");
        }
    }
    var id = document.getElementById('OutBoxForm:contactIdHidden').value;
    document.getElementById('OutBoxForm:contactId').value = id;
    if (type === 3)
    {
        alert("This will clear mail outbox");
    }

    document.getElementById('closeModal4').click();
}

function validateRescheduleFollowup()
{
    var projectId = document.getElementById('rescheduleForm:projectId').value;
    var content = document.getElementById('rescheduleForm:content').value;
    var example5 = document.getElementById('example5').value;

    if (projectId === '0')
    {

        document.getElementById('rescheduleForm:validateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('rescheduleForm:validateProjectId').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('rescheduleForm:validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('rescheduleForm:validateContent').style.display = "none";
    }
    if (example5 === '')
    {
        document.getElementById('rescheduleForm:validatenextDate').style.display = "block";
        return false;
    }
    else {
        document.getElementById('rescheduleForm:nextDate').value = example5;
        document.getElementById('rescheduleForm:validatenextDate').style.display = "none";
    }
//  $('.nav-tabs a[href="#insertFollowup1"]').tab('show');
//
    document.getElementById('rescheduleClick').click();
    return true;



}

function validateRescheduleFollowupIndividual()
{
    var projectId = document.getElementById('rescheduleFormIndividual:projectId').value;
    var content = document.getElementById('rescheduleFormIndividual:content').value;
    var example5 = document.getElementById('example11').value;

    if (projectId === '0')
    {

        document.getElementById('rescheduleFormIndividual:validateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('rescheduleFormIndividual:validateProjectId').style.display = "none";
    }
    if (content === '')
    {
        document.getElementById('rescheduleFormIndividual:validateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('rescheduleFormIndividual:validateContent').style.display = "none";
    }
    if (example5 === '')
    {
        document.getElementById('rescheduleFormIndividual:validatenextDate').style.display = "block";
        return false;
    }
    else {
        document.getElementById('rescheduleFormIndividual:nextDate').value = example5;
        document.getElementById('rescheduleFormIndividual:validatenextDate').style.display = "none";
    }
    $('.nav-tabs a[href="#menus4"]').tab('show');

    return true;



}
function validateRescheduleFollowupStatus()
{

    var projectId = document.getElementById('statusStatusReportForm:sprojectId').value;

    var content = document.getElementById('statusStatusReportForm:scontent').value;

    var example5 = document.getElementById('example6').value;

    if (projectId === '0')
    {

        document.getElementById('statusStatusReportForm:svalidateProjectId').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:svalidateProjectId').style.display = "none";
    }
    if (content === '')
    {

        document.getElementById('statusStatusReportForm:svalidateContent').style.display = "block";
        return false;
    } else {
        document.getElementById('statusStatusReportForm:svalidateContent').style.display = "none";
    }
    if (example5 === '')
    {

        document.getElementById('statusStatusReportForm:svalidatenextDate').style.display = "block";
        return false;
    }
    else {

        document.getElementById('statusStatusReportForm:snextDate').value = example5;
        document.getElementById('statusStatusReportForm:svalidatenextDate').style.display = "none";
    }
//  $('.nav-tabs a[href="#followupStatus"]').tab('show');

    document.getElementById('statusRescheduleClick').click();
    return true;



}

function changeDate()
{
    var d1 = new Date();
    var example1 = document.getElementById('example1').value;
    var example2 = document.getElementById('example2').value;
    if(example1==="" || example2==="")
    {
        alert("Please enter both dates")
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
    document.getElementById('regDateForm:regDateFrom').value = example1;
    document.getElementById('regDateForm:regDateTo').value = example2;
    return true;
}
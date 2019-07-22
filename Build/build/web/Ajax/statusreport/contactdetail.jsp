<%-- 
    Document   : shortList
    Created on : 28 Mar, 2016, 6:30:45 PM
    Author     : OpenSpace004
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  
<div class="col-lg-12 profiledetailText">
    <h3 class="profileactivedetail"><!--Profile Details ---> ${contact.firstName} ${contact.middleName} ${contact.lastName}</h3>
</div>

<div class="col-lg-12 matchProfileImageDiv">
    <div class="imagePlace imageWidth statusPopup">
        <!--<a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1}" title="Image 1"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image1_replica}"/></a>-->
        <a href="${profileimgPath}${contact.image1}" title="Image 1"> <img src="${profileimgPath}${contact.image1_replica}"/></a>
    </div>
    <div class="imagePlace imageWidth statusPopup">
<!--       <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2}" title="Image 2"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image2_replica}"/></a>-->
        <a href="${profileimgPath}${contact.image2}" title="Image 2"> <img src="${profileimgPath}${contact.image2_replica}"/></a>
    </div>
    <div class="imagePlace imageWidth statusPopup">
<!--      <a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3}" title="Image 3">  <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image3_replica}"/></a>-->
        <a href="${profileimgPath}${contact.image3}" title="Image 3">  <img src="${profileimgPath}${contact.image3_replica}"/></a>
    </div>
    <div class="imagePlace imageWidth statusPopup">
       <!--<a href="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4}" title="Image 4"> <img src="http://52.36.146.110:8080/sl_data/sl_data/profileimg/${contact.image4_replica}"/></a>-->
        <a href="${profileimgPath}${contact.image4}" title="Image 4"> <img src="${profileimgPath}${contact.image4_replica}"/></a>
    </div>

</div>
<div class="col-lg-12 paddingNone" style="float: left">
    <div class="formHEADDiv whiteBG">
        <div class="formHead"> <img src="../img/icons/userIcon.png" alt="Icon"/> <span>Introductory</span></div>
        <div class="formEdit"><a href="#"></a></div>
    </div> 
    <section class="formHalf" style="width:47%">
        <div class="formDATA">
            <label>Name</label>
            <div class="controlsData">${contact.firstName} ${contact.middleName} ${contact.lastName}</div>
        </div> 
        <div class="formDATA">
            <label>Birth</label>
            <div class="controlsData">Date : (${contact.dobString}) Time : ${contact.hour}:${contact.minute} Place : ${contact.birthcity}</div>
        </div> 
        <div class="formDATA">
            <label>Country</label>
            <div class="controlsData">${contact.birthCountryName}</div>
        </div> 
        <div class="formDATA">
            <label>Native Place</label>
            <div class="controlsData">${contact.nativeData}</div>
        </div> 
        <div class="formDATA">
            <label>Caste </label>
            <div class="controlsData"> ${contact.communityName}</div>
        </div>
        <div class="formDATA">
            <label>Gotra </label>
            <div class="controlsData"> ${contact.gotraName}</div>
        </div>

        <div class="formDATA">
            <label>Grew up in</label>
            <div class="controlsData">  ${contact.countryName},
                ${contact.city}</div>
        </div>
        <div class="formDATA">
            <label>Occupation</label>
            <div class="controlsData">${contact.occupationName}</div>
        </div>
        <div class="formDATA">
            <label>Location</label>
            <div class="controlsData">${contact.locationForWork}</div>
        </div>



    </section>

    <section class="formHalf" style="width:47%">
        <div class="formDATA">
            <label>Hobbies</label>
            <div class="controlsData"> ${contact.hobbies}</div>
        </div> 
        <div class="formDATA">
            <label>Body Type</label>
            <div class="controlsData"> ${contact.bodytype} </div>
        </div>
        <div class="formDATA">
            <label>Skin Tone</label>
            <div class="controlsData">${contact.complexion}</div>
        </div>
        <div class="formDATA">
            <label>Height</label>
            <div class="controlsData"> ${contact.heightString} </div>
        </div>
        <div class="formDATA">
            <label>Weight</label>
            <div class="controlsData"> ${contact.bodyWeight} </div>
        </div>
        <div class="formDATA">
            <label>Food Habits</label>
            <a href="statusReportIndividual.jsp"></a>
            <div class="controlsData">Vegetarian</div>
        </div>
        <div class="formDATA">
            <label>Zodiac Sign</label>
            <div class="controlsData"> ${contact.zodiacName}</div>
        </div>
        <div class="formDATA">
            <label>Manglik</label>
            <div class="controlsData">
                ${contact.manglik}
            </div>
        </div>
        <div class="formDATA">
            <label>Education</label>
            <div class="controlsData">
                ${contact.educationIntro}
            </div>
        </div>
        <div class="formDATA">
            <label>About Me</label>
            <div class="controlsData">
                ${contact.aboutMeHtml}
            </div>
        </div>

    </section>
    <section>
        <div class="formHEADDiv whiteBG">
            <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/educationIcon.png" alt="Icon"/><span>Education</span></div>
        </div>
        <table cellpadding="0" cellspacing="0" border="" class="commonTable">
            <tr>
                <th> Degree
                </th>
                <th>   Location
                </th>
                <th>College
                </th>
                <th> year
                </th>
            </tr>
            <c:forEach items="${contactEducationList}" var="contactEducationListId">
                <tr>
                    <td>${contactEducationListId.graduation}</td>
                    <td>${contactEducationListId.location}</td>
                    <td>${contactEducationListId.college}</td>
                    <td>${contactEducationListId.year}</td>

                </tr>
            </c:forEach>
        </table>
        <div class="formDATA">
            <label>Additional Information</label>
            <div class="controlsData">
                ${contact.education}
            </div>
        </div>

    </section>
    <section>
        <div class="formHEADDiv whiteBG"  >
            <div class="formHead"><img src="${pageContext.request.contextPath}/img/icons/familyIcon.png" alt="Icon"/><span>Family</span></div>

        </div>
        <section class="formHalf">
            <div class="formDATA">
                <!--<h:outputLabel value="Father's Name" />-->
                <label>Father's Name</label>
                <div class="controlsData">
                    ${contact.father}
                </div>
            </div>
            <div class="formDATA">

                <label>Father's Work</label>
                <div class="controlsData">
                    ${contact.fatherWork}

                </div>
            </div>

            <div class="formDATA">

                <label>Father's Education</label>
                <div class="controlsData">
                    ${contact.fatherEducation}
                </div>
            </div>
            <div class="formDATA">

                <label>Father's Detail</label>
                <div class="controlsData">
                    ${contact.fatherDetail}
                </div>
            </div>

        </section>
        <section class="formHalf">
            <div class="formDATA">

                <label>Mother's Name</label>
                <div class="controlsData">
                    ${contact.mother}

                </div>
            </div>
            <div class="formDATA">


                <label>Mother's Work</label>
                <div class="controlsData">

                    ${contact.motherWork}


                </div>
            </div>
            <div class="formDATA">

                <label>Mother's Education</label>
                <div class="controlsData">
                    ${contact.motherEducation}
                </div>
            </div>
            <div class="formDATA">

                <label>Mother Detail</label>
                <div class="controlsData">
                    ${contact.motherDetail}
                </div>
            </div>

        </section>
        <section class="formFull">
            <div class="formDATA">
                <label>Brother (Sibling)</label>
                <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                    <tr>
                        <th>Name</th>
                        <th>Elder / Younger</th>
                        <th>Education</th>
                        <th>Occupation</th>
                        <th>Married To</th>
                        <th>D/O.</th>
                        <th>Place</th>
                        <th>Detail</th>
                    </tr>
                    <c:forEach items="${brotherList}" var="contact">
                        <tr>
                            <td>${contact.siblingName}</td>
                            <td>${contact.elder}</td>
                            <td>${contact.relationEducation}</td>
                            <td>${contact.siblingWork}</td>
                            <td>${contact.toWhom}</td>
                            <td>${contact.relationDob}</td>
                            <td>${contact.relationPlace}</td>  
                            <th>${contact.businessDescription}</th>
                        </tr>
                    </c:forEach>
                </table>

            </div>

            <div class="formDATA">
                <label>Sister (Sibling)</label>
                <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                    <tr>
                        <th>Name</th>
                        <th>Elder / Younger</th>
                        <th>Education</th>
                        <th>Occupation</th>
                        <th>Married To</th>
                        <th>S/O.</th>
                        <th>Place</th>
                        <th>Detail</th>
                    </tr>
                    <c:forEach items="${sisterList}" var="contact">
                        <tr>

                            <td>${contact.siblingName}</td>
                            <td>${contact.elder}</td>
                            <td>${contact.relationEducation}</td>
                            <td>${contact.siblingWork}</td>
                            <td>${contact.toWhom}</td>
                            <td>${contact.relationDob}</td>
                            <td>${contact.relationPlace}</td>                                                                                                                                                                       
                            <th>${contact.businessDescription}</th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </section>
    </section>
    <section><!--Paternal Side Starts-->
        <div class="col-lg-12" id="paternalDivDisplay">
            <div class="formHEADDiv whiteBG">
                <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Paternal Side</span></div>
            </div>
            <section class="formHalf">
                <div class="formDATA">
                    <label>Grandfather's Name (Dadaji) </label>
                    <div class="controlsData">
                        <span id="grandFatherNameLabel">${contact.grandFatherName}</span>

                    </div>
                </div>
                <div class="formDATA">
                    <label>Grandfather Detail (Dadaji) </label>
                    <div class="controlsData">
                        <span>${contact.grandFatherPDetail}</span>
                    </div>
                </div>
            </section>
            <section class="formHalf">
                <div class="formDATA">
                    <label>Grandmother's Name(Dadiji)</label>
                    <div class="controlsData">
                        <span id="grandMotherNameLabel">${contact.grandMotherName}</span>

                    </div>
                </div>
                <div class="formDATA">
                    <label>Grandmother Detail (Dadiji)</label>
                    <div class="controlsData">
                        <span>${contact.grandMotherPDetail}</span>
                    </div>
                </div>
            </section>

            <section class="formFull">
                <div class="formHEADDiv whiteBG">
                    <div class="formHead"><span class="smsubHEAD">Uncle (Chacha)</span></div>
                    <!--                                            <div class="formEdit"><a href="#!">Edit</a>
                    
                                                                </div>-->
                </div>
                <div >
                    <section class="formFull">
                        <div class="formDATA">
                            <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Occupation</th>
                                    <th>Married To</th>
                                    <th>D/O.</th>
                                    <th>Place</th>
                                </tr>

                                <c:forEach items="${uncleList}" var="contact">
                                    <tr>

                                        <td>${contact.siblingName}</td>                                                       
                                        <td>${contact.location}</td>
                                        <td>${contact.siblingWork}</td>
                                        <td>${contact.toWhom}</td>
                                        <td>${contact.relationDob}</td>
                                        <td>${contact.relationPlace}</td>                                                                                                                                                                       

                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                    </section>
                </div>
            </section>

            <section class="formFull">
                <div class="formHEADDiv whiteBG">
                    <div class="formHead"><span class="smsubHEAD">Aunty (Bua)</span></div>
                    <!--                                            <div class="formEdit"><a href="#!">Edit</a>
                    
                                                                </div>-->
                </div>
                <div >
                    <section class="formFull">
                        <div class="formDATA">
                            <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Occupation</th>
                                    <th>Married To</th>
                                    <th>S/O.</th>
                                    <th>Place</th>
                                </tr>
                                <c:forEach items="${buaList}" var="contact">
                                    <tr>

                                        <td>${contact.siblingName}</td>
                                        <td>${contact.location}</td>                                                 
                                        <td>${contact.siblingWork}</td>
                                        <td>${contact.toWhom}</td>
                                        <td>${contact.relationDob}</td>
                                        <td>${contact.relationPlace}</td>                                                                                                                                                                       

                                    </tr>
                                </c:forEach>

                            </table>
                        </div>

                    </section>
                </div>
            </section>
        </div><!--PATERNAL SIDE ENDS--></section>
    <section>
        <!-- Maternal SIDE Starts-->
        <div class="col-lg-12">
            <div class="formHEADDiv whiteBG">
                <div class="formHead"><img src="../img/icons/familyIcon.png" alt="Icon"/><span>Maternal Side</span></div>
            </div>
            <section class="formHalf">
                <div class="formDATA">
                    <label >Grandfather's Name (Nanaji)</label>
                    <div class="controlsData"> 
                        <label>${contact.mgrandFatherName}</label>
                    </div>
                </div>
                <div class="formDATA">
                    <label >Grandfather Detail (Nanaji)</label>
                    <div class="controlsData"> 
                        <label>${contact.grandFatherMDetail}</label>
                    </div>
                </div>
            </section>
            <section class="formHalf">
                <div class="formDATA">
                    <label >Grandmother's Name (Naniji)</label>
                    <div class="controlsData">
                        <label>${contact.mgrandMotherName}</label>
                    </div>
                </div>
                <div class="formDATA">
                    <label >Grandmother Detail (Naniji)</label>
                    <div class="controlsData"> 
                        <label>${contact.grandMotherMDetail}</label>
                    </div>
                </div>
            </section>

            <section class="formFull">
                <div class="formHEADDiv whiteBG">
                    <div class="formHead"><span class="smsubHEAD">Uncle (Mama)</span></div>
                    <div class="formEdit"><a href="#!"></a>

                    </div>
                </div>
                <div >
                    <section class="formFull">
                        <div class="formDATA">
                            <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Occupation</th>
                                    <th>Married To</th>
                                    <th>D/O.</th>
                                    <th>Place</th>

                                </tr>

                                <c:forEach items="${mamaList}" var="contact">
                                    <tr>

                                        <td>${contact.siblingName}</td>
                                        <td>${contact.location}</td>                                                 
                                        <td>${contact.siblingWork}</td>
                                        <td>${contact.toWhom}</td>
                                        <td>${contact.relationDob}</td>
                                        <td>${contact.relationPlace}</td>                                                                                                                                                                       

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </section>
                </div>
            </section>
            <section class="formFull">
                <div class="formHEADDiv whiteBG">
                    <div class="formHead"><span class="smsubHEAD">Aunty (Mausi)</span></div>
                    <div class="formEdit"><a href="#!"></a>

                    </div>
                </div>
                <div >
                    <section class="formFull">
                        <div class="formDATA">
                            <table cellpadding="0" cellspacing="0" border="" class="commonTable">
                                <tr>
                                    <th>Name</th>
                                    <th>Location</th>
                                    <th>Occupation</th>
                                    <th>Married To</th>
                                    <th>S/O.</th>
                                    <th>Place</th>
                                </tr>
                                <c:forEach items="${mausiList}" var="contact">
                                    <tr>

                                        <td>${contact.siblingName}</td>
                                        <td>${contact.location}</td>                                                 
                                        <td>${contact.siblingWork}</td>
                                        <td>${contact.toWhom}</td>
                                        <td>${contact.relationDob}</td>
                                        <td>${contact.relationPlace}</td>                                                                                                                                                                       

                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </section>
                </div>
            </section>
        </div><!--MATERNAL SIDE ENDS-->
    </section>
    <section>
        <!--EDIT BUSINESS / PROFESSION STARTS-->

        <div class="formHEADDiv whiteBG">
            <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Business / Profession</span></div>

        </div>

        <section class="formFull">
            <div class="formDATA">
                <label >Firm Name</label>

                <div class="controlsData">
                    ${contact.firmName}
                </div>
            </div>
            <div class="formDATA">
                <label >Nature Of Business</label>
                <div class="controlsData">
                    ${contact.natureOfBusiness}
                </div>
            </div>
            <div class="formDATA">
                <label >Occupation</label>
                <div class="controlsData">
                    ${contact.occupationName}
                </div>
            </div>
            <div class="formDATA">
                <label >Business Details</label>
                <div class="controlsData">
                    ${contact.businessDescription}
                </div>
            </div>
            <div class="formDATA">
                <label >Business Turnover</label>

                <div class="controlsData">
                    ${contact.income}
                </div>
            </div>
            <div class="formDATA">
                <label >Address & Contact Detail</label>

                <div class="controlsData">
                    ${contact.contactDetail}
                </div>
            </div>
            <div class="formDATA">
                <label >Tel</label>

                <div class="controlsData">
                    ${contact.telForBusiness}
                </div>
            </div>
            <div class="formDATA">
                <label>Email/Website</label>

                <div class="controlsData">
                    ${contact.emailForBusiness}
                </div>
            </div>
            <div class="formDATA">
                <label >Family Business</label>

                <div class="controlsData">
                    ${contact.aboutFamilyBisinessHtml}
                </div>
            </div>
        </section><!--form half left - family business ends-->

        <section class="formHalf">

        </section>

        <!--BUSINESS / PROFESSION ENDS-->
    </section>
    <section>
        <div class="col-lg-12">
            <div class="formHEADDiv whiteBG">
                <div class="formHead"> <img src="../img/icons/familyBusinessIcon.png" alt="Icon"/> <span>Medical History</span></div>

            </div>
            <section class="formHalf">
                <div class="formDATA">
                    <label >Using Spectacles</label>
                    <div class="controlsData">
                        ${contact.usingSpectacles}
                    </div>
                </div>
                <div class="formDATA">

                    <label >If yes, Power Detail</label>
                    <div class="controlsData">
                        ${contact.powerDetails}
                    </div>
                </div>
                <div class="formDATA">
                    <label >Blood Group</label>
                    <div class="controlsData">
                        ${contact.bloodBank}</div>
                </div>
                <div class="formDATA">

                    <label >Any Other Issues</label>
                    <div class="controlsData">
                        ${contact.otherIssues}
                    </div>
                </div>
            </section>
        </div> <!-- MEDICAL HISTORY ENDS-->
    </section>
    <section>
        <div class="col-lg-12">


            <div class="formHEADDiv whiteBG">
                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Contact Details</span></div>

            </div>
            <section class="formHalf">

                <div class="formDATA">
                    <label>Address</label>

                    <div class="controlsData"> 
                        ${contact.contactAddress}
                    </div>
                </div>


                <div class="formDATA">
                    <label>Telephone</label>
                    <div class="controlsData"> 
                        ${contact.telephone}
                    </div>
                </div>


                <div class="formDATA">
                    <label>Email</label>
                    <div class="controlsData"> 
                        ${contact.email}
                    </div>
                </div>


                <div class="formDATA">
                    <label>Location</label>
                    <div class="controlsData"> 
                        ${contact.contactPersonSlLocation}
                    </div>
                </div>

            </section>
            <table>
                <th>
                    Name
                </th>
                <th>
                    Relation
                </th>
                <th>
                    Telephone
                </th>
                <th>
                    Email
                </th>
                <tr>
                    <td>  ${contact.contactPersonSl}</td>
                    <td> ${contact.contactPersonSlRelation}</td>
                    <td>  ${contact.telephoneSubhlagan}</td>
                    <td>       ${contact.emailSubhlagan}</td>
                </tr>
                <tr>
                    <td>  ${contact.contactPersonS2}</td>
                    <td> ${contact.contactPersonS2Relation}</td>
                    <td>    ${contact.telephoneSubhlagan2}</td>
                    <td>        ${contact.emailSubhlagan2}</td>
                </tr>
                <tr>
                    <td>  ${contact.contactPersonS3}</td>
                    <td> ${contact.contactPersonS3Relation}</td>
                    <td>  ${contact.telephoneSubhlagan3}</td>
                    <td>      ${contact.emailSubhlagan3}</td>
                </tr>
            </table>

        </div>
        <!--CONTACT DETAIL ENDS-->
    </section>
    <section>
        <div class="col-lg-12">

            <div class="formHEADDiv whiteBG">
                <div class="formHead"> <img src="../img/icons/userDetailIcon.png" alt="Icon"/> <span>Preferences <span class="smSpantext">(What you are looking for - about the prospective match)</span> </span></div>

            </div>
            <section class="formHalf">
                <div class="formDATA">
                    <label>Height</label>
                    <div class="controlsData">

                        <span> ${contact.desPartnersHeight1} TO  ${contact.desPartnersHeight2}</span>


                    </div>
                </div>

                <div class="formDATA">
                    <label> Education</label>
                    <div class="controlsData"> ${contact.desiredPartnersEducation}


                    </div>
                </div>
                <div class="formDATA">
                    <label>Please mention, if international academic exposure is preferred</label>
                    <div class="controlsData"> 
                        ${contact.internationalExposure}

                    </div>
                </div>
                <div class="formDATA">
                    <label>Working</label>
                    <div class="controlsData">
                        ${contact.desiredPartnersWorkString}

                    </div>
                </div>
                <div class="formDATA">
                    <label>Same Gotra</label>
                    <div class="controlsData">
                        ${contact.gotra}

                    </div>
                </div>
            </section>
            <section class="formHalf">
                <div class="formDATA">
                    <label>Age</label>
                    <div class="controlsData">
                        <span>${contact.desiredPartnersAge1} TO ${contact.desiredPartnersAge2}</span>
                    </div>
                </div>
                <div class="formDATA">
                    <label>                                                    
                        Complexion
                    </label>
                    <div class="controlsData">
                        ${contact.desiredPartnersComplexionString}

                    </div>
                </div>
                <div class="formDATA">
                    <label>Community</label>
                    <div class="controlsData">     
                        ${contact.community}


                    </div>
                </div>
                <div class="formDATA">
                    <label>Kundali Matter </label>
                    <div class="controlsData"> 
                        ${contact.kundaliMatter}

                    </div>
                </div>
                <div class="formDATA">
                    <label>Mangalik</label>
                    <div class="controlsData"> 
                        ${contact.pmanglik}

                    </div>
                </div>
                <div class="formDATA">
                    <label>Food Habits</label>
                    <div class="controlsData">
                        ${contact.desiredPartnersDietString}

                    </div>
                </div>
                <div class="formDATA">
                    <label/>Location</label>
                    <div class="controlsData"> 
                        ${contact.desiredPartnersLocationString}

                    </div>
                </div>
            </section>

        </div><!--PREFERENCES ENDS-->
    </section>

</div>
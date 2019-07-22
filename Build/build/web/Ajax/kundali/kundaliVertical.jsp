<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<div class="kundaliHead">Kundali Milan of <span>${boyName}</span> and <span>${girlName}</span></div>

<div class="formHalf">
    <s:iterator value="boyList" id="boyListId">
        <div class="formDATA">
            <div class="infoHead">Boy Info</div>
        </div>
        <div class="formDATA">
            <label>Name</label>
            <div class="controlsData">
                ${boyListId.firstName}  ${boyListId.middleName}  ${boyListId.lastName}
            </div>
        </div>
        <div class="formDATA">
            <label>DOB</label>
            <div class="controlsData">
                ${boyListId.dobString}    
            </div>
        </div>
        <div class="formDATA">
            <label>Time</label>
            <div class="controlsData">
                ${boyListId.time}  
            </div>
        </div>
        <div class="formDATA">
            <label>Country</label>
            <div class="controlsData">
                ${boyListId.countryName}
            </div>
        </div>
        <div class="formDATA">
            <label>City</label>
            <div class="controlsData">
                ${boyListId.cityName}
            </div>
        </div>
        <div class="formDATA">
            <div class="locationdetails">
                <span>Longitude  ${boyListId.longitude} </span> 
                <span>Latitude  ${boyListId.latitude}</span> 
                <span>GMT Diff ${boyListId.gmtDiff}</span>  
            </div>

        </div>
    </s:iterator>
</div>
<div class="formHalf">
    <div class="formDATA">
        <div class="infoHead">Girl Info</div>
    </div>
    <s:iterator value="girlList" id="girlListId">
        <div class="formDATA">
            <label>Name</label>
            <div class="controlsData">
                ${girlListId.firstName}    ${girlListId.middleName}    ${girlListId.lastName}

            </div>
        </div>
        <div class="formDATA">
            <label>DOB</label>
            <div class="controlsData">
                ${girlListId.dobString}    
            </div>
        </div>
        <div class="formDATA">
            <label>Time</label>
            <div class="controlsData">
                ${girlListId.time}    
            </div>
        </div>
        <div class="formDATA">
            <label>Country</label>
            <div class="controlsData">
                ${girlListId.countryName}
            </div>
        </div>
        <div class="formDATA">
            <label>City</label>
            <div class="controlsData">
                ${girlListId.cityName}
            </div>
        </div>
        <div class="formDATA">
            <div class="locationdetails">
                <span>Longitude  ${girlListId.longitude} </span> 
                <span>Latitude  ${girlListId.latitude}</span> 
                <span>GMT Diff ${girlListId.gmtDiff}</span>  
            </div>

        </div>
    </s:iterator>
    <c:if test="${kundali.resultId==0}">

        <c:if test="${ch==0}">
            <div class="formEdit">
                <input type="submit" class="btn btn-primary saveBtn" value="Calculate" onclick="calculateKundaliVertical(${boyContactId},${girlContactId})">

            </div>
        </c:if>
        <c:if test="${ch==1}">
            <div class="kundaliHead" style="color: red;"> Please check details</div>
           
        </c:if>

    </c:if>

</div><br/><br/>
<c:if test="${kundali.resultId>0}">
    <div class="kundaliHead">
        Guna Milan
    </div>
    <div class="totalnumber">Total Guna Milan <span>${kundali.matchTotal}:</span> &nbsp;  of 36</div>
    <div class="formDATA">
        <div class="text-center"> <label>${boyName}  :</label>  ${kundali.boyManglikString}</div>
        <div class="text-center"><label>${girlName}  :</label> ${kundali.girlManglikString}</div><br/>
        <br/>
        <div class="totalnumber">Click <a href="${kundali.downloadPath}" target="_blank">here </a> to download details in a PDF file.</div>

    </div>

    <div class="kundaliHead">
        Mail
    </div>
    <div class="text-center"> <a href="#!" onclick="sentKundaliMail(${boyContactId},${girlContactId}, 1)"> Mail To</a>:<label>${boyName}  </label>  </div>
    <div class="text-center"> <a href="#!" onclick="sentKundaliMail(${boyContactId},${girlContactId}, 2)">Mail To</a>:<label>${girlName}  </label>  </div>
    <div class="text-center"><a href="#!" onclick="sentKundaliMail(${boyContactId},${girlContactId}, 3)"> Mail To</a>:<label>${boyName} & ${girlName}  </label>  </div>
    <div class="text-center"> <input type="submit" class="btn btn-primary saveBtn" value="Recalculate" onclick="calculateKundaliVertical(${boyContactId},${girlContactId})"></div>
    </c:if>

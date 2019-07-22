
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<div class="col-lg-12">
    <s:iterator value="feedBackListIndividual" var="feedBackListIndividualId">
        <div class="feedbackdetails" style="float:left; width:100%">
            ${feedBackListIndividualId.subject}<br/>
            ${feedBackListIndividualId.content}<br/>
            ${feedBackListIndividualId.postedBy} | ${feedBackListIndividualId.regDate}  
          
        </div>
       

    </s:iterator>
</div>___${contact.budget}___${contact.preference}___${contact.familySalary}___${contact.propertyOfOwnership}___${contact.reasonOfDivorce}___${contact.divorcedOrSettled}___${contact.referenceGivenBy}___${contact.familyBackground}___



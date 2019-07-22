
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>--%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

 <!--<script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>-->
        <!--<script type="text/javascript" src="../../ckeditor/adapters/jquery.js"></script>-->   

<div class="feedbacktopmargin"></div>
<div class="col-lg-12">
    <input type="hidden" id="additionalContactId" value="<%=request.getParameter("contactId")%>">
    <div class="col-lg-12 no-pad">
        <div class="formDATA">
            <label>Subject</label>
            <div class="controlsData">
                <input type="text" id="additionalSubject" >
            </div>
        </div>
    </div>
    <div class="col-lg-12 no-pad">
        <div class="formDATA">
            <label>Content</label>
            <div class="controlsData">
                <!--<input type="text" style="width :270px; height: 100px;" id="additionalContent" >-->
                 
               
                 <textarea id="additionalContent" style="height:150px !important" rows="50" ></textarea>
                   <!--<ckeditor:replace replace="additionalContent" basePath="E:/sagar/ckeditor/" />-->
                <!--<textarea rows="3" id="additionalContent"></textarea>-->
            </div>
        </div>
    </div>
    <div class="col-lg-2">
        <input style="margin-top:9px;" type="submit" value="submit" class="btn btn-primary" onclick="saveFeedBackNew()">
    </div> 
</div>


<div class="col-lg-12">
    <s:iterator value="feedBackListIndividual" var="feedBackListIndividualId">
        <div class="feedbackdetails" style="float:left; width:100%">
            ${feedBackListIndividualId.subject}<br/>
          <!--Editing for space in view of Additional Information by Sagar as on 8/3/2018-->  
            <% pageContext.setAttribute("newLineChar", "\n"); %>
            ${fn:replace(feedBackListIndividualId.content, newLineChar, '<br>')}
            <!--{feedBackListIndividualId.content}-->
            <br/>
            ${feedBackListIndividualId.postedBy} | ${feedBackListIndividualId.regDate} 
            
            <!--code added for enter or space to be seen in text area by sagar as on 21/2/2018-->
            <% pageContext.setAttribute("newLineChar", "\n"); %> 
  <a class="pull-right editIcon" title="Edit" href="#!" onclick="editFeedBackNew('${feedBackListIndividualId.subjectReplaceApostrophe}', '${fn:replace(feedBackListIndividualId.contentReplaceApostrophe, newLineChar, '\\n')}',${feedBackListIndividualId.contactId},${feedBackListIndividualId.feedbackId})"><i class="fa fa-edit"></i></a><br/>


        </div>
        <div id="editAdditionalInfoDiv${feedBackListIndividualId.feedbackId}" style="display:none;">

        </div>

    </s:iterator>
</div>___${contact.budget}___${contact.preference}___${contact.familySalary}___${contact.propertyOfOwnership}___${contact.reasonOfDivorce}___${contact.divorcedOrSettled}___${contact.referenceGivenBy}___${contact.familyBackground}___${contact.maritalStatus}___
<table>
    <s:iterator value="remarkList" id="remarkListId" var="remarkListVar">
        <tr>
            <td>
                ${remarkListVar.remark}
            </td>
        </tr>
    </s:iterator>
</table>___${contact.name}

<!--
 <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>-->
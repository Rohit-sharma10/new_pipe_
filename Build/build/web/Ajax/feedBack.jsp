<%-- 
    Document   : feedBack
    Created on : 15 Mar, 2016, 12:31:05 PM
    Author     : OpenSpace004
--%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  

<s:iterator value="feedBackListIndividual" var="feedBackListIndividualId">
    <div class="feedbackdetails">
        ${feedBackListIndividualId.subject}<br/>
        ${feedBackListIndividualId.content}<br/>
        ${feedBackListIndividualId.postedBy} | ${feedBackListIndividualId.regDate}   
        <a href="#!"  onclick="editFeedBack('${feedBackListIndividualId.subject}', '${feedBackListIndividualId.content}',${feedBackListIndividualId.contactId},${feedBackListIndividualId.feedbackId})">Edit</a>
    </div>
</s:iterator>___

<c:forEach items="${questionList}" var="question" >

    <tr>
        <td>${question.questions}</td>
        <td>
            <input  id="${question.questionId}" style="width: 100%;" type="text" value="${question.answers}"/></td>

    </tr>

</c:forEach>

<html>

</html>

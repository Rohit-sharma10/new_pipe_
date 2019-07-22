
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table>
    <tr>
        <td>
            Boy Name:${boy.name}
        </td>
     
        <td>
            <input type="text" id="createdBy1" placeholder="Relative Name"/>
<!--            <select name="contact.createdBy" id="createdBy1" value="{contact.createdBy}">
                <option value="0" >Select Relation</option>
                <option value="Self" >Self</option>
                <option value="Parent/Guardian" >Parent/Guardian</option>
                <option value="Sibling" >Sibling</option>
                <option value="Friend" >Friend</option>
                <option value="Other" >Other</option>
            </select>-->
        </td>
        <td>
            Number:${status.gender}
        </td>
        <td>
            <input type="text" value="${boy.mobile}" id="boyNumber"/>
        </td>
    </tr>
    <tr>
        <td>
            Girl Name: ${girl.name}
        </td>
       
        <td>
            <input type="text" id="createdBy2" placeholder="Relative Name"/>
<!--            <select  id="createdBy2" value="{contact.createdBy}">
                <option value="0" >Select Relation</option>
                <option value="Self" >Self</option>
                <option value="Parent/Guardian" >Parent/Guardian</option>
                <option value="Sibling" >Sibling</option>
                <option value="Friend" >Friend</option>
                <option value="Other" >Other</option>
            </select>-->
        </td>
        <td>
            Number: 
        </td>
        <td>
            <input type="text" value="${girl.mobile}" id="girlNumber"/>
             <input type="hidden" value="${boy.name}" id="girlName"/>
              <input type="hidden" value="${girl.name}" id="boyName"/>
        </td>
    </tr>
    <tr>
        <td>
            Note:
        </td>
        <td colspan="3">
            <input type="text" id="xnote" style="width:100%"/>
        </td>
    </tr>
    <tr>
        <td colspan="4">
               <c:if test="${gender == 'M'}">
            <input type="submit" class="btn btn-primary"  onclick="contactexchange(${boy.contactId},${girl.contactId})">
               </c:if>
               <c:if test="${gender == 'F'}">
            <input type="submit" class="btn btn-primary"  onclick="contactexchange(${girl.contactId},${boy.contactId})">
               </c:if>
    
        </td>
    </tr>
</table>
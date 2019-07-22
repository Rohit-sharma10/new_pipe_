
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="addfollowup addfollowupbg editpadding">
    <h3 class="popuphead">Edit Additional Information </h3>
    <div class="formDATA controlWidth">

        <div class="controlsData controlWidth">
            <input type="hidden" id="acontactId" value="<%=request.getParameter("contactId")%>"/>
            <input type="hidden" id="afeedbackid" value="<%=request.getParameter("feedbackid")%>"/>
            <div class="col-lg-12 no-pad"> Subject<input type="text" id="asubject" value="<%=request.getParameter("subject")%>"/></div><br>
         
<!--            <div class="col-lg-12 no-pad"> Subject 2
                <input type="text" id="acontent" value="<%--<%=request.getParameter("content")%>--%>"/>
                code edited by sagar as on 21-2-2018 for textarea needed in additional info
           <textarea id="" style="height:150px !important" rows="50" ><=request.getParameter("subject")%></textarea> -->
            
            <div class="col-lg-12 no-pad"> Content
                <!--<input type="text" id="acontent" value="<%--<%=request.getParameter("content")%>--%>"/>-->
                <!--code edited by sagar as on 21-2-2018 for textarea needed in additional info-->
           <textarea id="acontent" style="height:150px !important" rows="50" ><%=request.getParameter("content")%></textarea> 
            </div>
            <!--<input type="text" id="closeFollowupContent" class="closeinputwidth"/>-->
            <div class="col-lg-4"><div class="pull-left">
                    <input type="submit"  onclick="return saveEditFeedBackNew()" value="Go" class="btn btn-go">
                </div>
            </div>
        </div>
    </div>
</div>


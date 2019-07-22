<%@ taglib prefix="s" uri="/struts-tags" %>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
                                                <td><s:select headerKey="" headerValue="--- Select ---" cssClass="input_box" id="rmListId"
                                                          list="rmList" listKey="rmId"  listValue="rmName" 
                                                          name="userMaster.rmId" value="%{rmId}" cssStyle="width:190px;"/>
                                                    <!--<label id="validateDeptListId" style="color:red!important;display:none!important; width:100%!important;">Please Select One</label>-->                                

                                                </td>

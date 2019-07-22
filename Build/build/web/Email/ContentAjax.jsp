<%@ taglib prefix="s" uri="/struts-tags" %>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<div class="col-lg-12">
    <!--<div><h3></h3></div>-->

    <section>
        <div class="formDATA formDataWidth">
            <label >Posted To : </label>
            <div class="controlsData">
                <label style="width:100%!important;">${emailBean.postedTo} </label>
                <!--<input type="text" name="emailBean.postedTo" value="${emailBean.postedTo}" >-->               
            </div>
        </div>
        <div class="formDATA formDataWidth">
            <label >Posted By : </label>
            <div class="controlsData">
                <label style="width:100%!important;">${emailBean.postedTo} </label>
                <!--<input  style="display:inline-block!important;width:95%!important"  type="text" name="emailBean.postedBy" value="${emailBean.postedBy}" />-->
            </div>
        </div>
        <div class="formDATA formDataWidth">
            <label >Subject : </label>
            <div class="controlsData">
                <label style="width:100%!important;">${emailBean.subject} </label>
            </div>
        </div>

        <div class="formDATA formDataWidth">
            <label >Receipient : </label>
            <div class="controlsData">
                <label style="width:100%!important;">${emailBean.recepientIds} </label>
            </div>
        </div>

        <div class="formDATA formDataWidth">
            <label >Date : </label>
            <div class="controlsData">
                <label style="width:100%!important;">${emailBean.date} </label>
            </div>
        </div>

        <div class="acHead"><span>Email Content</span></div>
        <div class="formDATA formDataWidth">
            <div class="emailerdataDiv">
                <div style="width:100%!important;">${emailBean.content} </div>
            </div>
        </div>
    </section>
</div>




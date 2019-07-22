
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#tabpayment"  class="tabHeadSM tabPaddLeft">Payment</a></li>
    <li><a data-toggle="tab" href="#tabhistory" id="historyTabId" class="tabHeadSM tabPaddLeft">History</a></li>

</ul>
<div class="tab-content">
    <div id="tabpayment" class="tab-pane fade in active">

        <section>
            <c:if test="${(userSession.deptId==12) || (userSession.deptId==2) || (userSession.deptId==4) }">  <!-- added by vineet on 21-11-2016 to restrict RM -->
                <input type="hidden" value="${payment.contactId}" id="contactId">
                <!--                <div class="formDATA">
                                    <label>Priority(Budget)</label>
                                    <div class="controlsData">
                                        {payment.priority}
                                    </div>
                                </div>-->
                <div class="formDATA">
                    <label>Category</label>
                    <div class="controlsData">
                        <input type="hidden" value="${payment.category}" id="category" >
                        <input type="text" value="${payment.categoryName}" id="categoryName" readonly="true" >

                    </div>
                </div>
                <!--//Added by vineet on 5-12-2016-->
                <div class="formDATA">
                    <label>Package </label>
                    <div class="controlsData"> 
                        <s:select headerKey="0" headerValue="--- Select Package ---" class="select_box" id="packageId" onchange="fetchPackagePrice(this.value),calculateBalanceBefore()"
                                  list="packageList" listKey="packageId"  listValue="packageName" 
                                  name="contact.packageId"  value="payment.packageId" /> 
                        <!--                        <input type="text" value="{payment.packageName}" id="packageName" readonly="true" >
                                                <input type="hidden" value="{payment.packageId}" id="packageId" readonly="true" >-->
                    </div>
                </div>

                <div class="formDATA">
                    <label>Package Price</label>
                    <div class="controlsData"> 
                        <input type="text" value="${payment.packagePrice}" id="packagepriceId" onkeyup="calculateReg()">
                    </div>
                </div>

                <div class="formDATA">
                    <label>Discount </label>
                    <div class="controlsData"> 
                        <select id="discountType" onchange=" return discountValueForPayment(this.value)">
                            <option value="">--SELECT--</option>
                            <option value="flat">Flat</option>
                            <option value="percent">Percent</option>
                        </select>
                    </div>
                </div>
                <div class="formDATA">
                    <label>Discount Value </label>
                    <div class="controlsData changeInput"> 
                        <input type="text" id='discountValue' onblur="return calculateRegFlat(this.value)">
                    </div>
                </div>
                <!--//End--> 

                <div class="formDATA">
                    <label>Registration charges</label>
                    <div class="controlsData">
                        <input type="text" id="registrationCharges" value="${payment.registrationCharges}" onkeyup= "return ClaculateTotal(this.value)" />

                    </div>
                </div>
                <div class="formDATA">
                    <label>Tax applied %</label>
                    <div class="controlsData">
                        <input type="text" id="taxapplied" value="${payment.taxapplied}" readonly="true"/>

                    </div>
                </div>
                <div class="formDATA">
                    <label>Total  </label>
                    <div class="controlsData">
                        <input type="text" id="total" value="${payment.total}" readonly="true"/>     

                    </div>
                </div>




                <div class="formDATA">
                    <label>In Words </label>
                    <div class="controlsData">
                        <input type="text" id="inWords" value="${payment.inWords}" readonly="true"/>

                    </div>
                </div>
                <div class="formDATA">
                    <label>Location </label>
                    <div class="controlsData">
                        <input type="text" id="location"  />

                    </div>
                </div>
                <div class="formDATA">
                    <label>Received By Whom </label>
                    <div class="controlsData">
                        <input type="text" id="receivedByWhom" />

                    </div>
                </div>


                <div class="formDATA">
                    <label>Payment Type</label>
                    <div class="controlsData">
                        <input type="hidden" value="${payment.paymentType}" id="paymentTypeHidden"/>
                        <input type="radio" name="paymentType" id="paymentType1" value="1"  onclick="showPaymentDetails(this.value)"/>Partial
                        <c:if test="${payment.paymentType!=1}">
                            <input type="radio" name="paymentType" id="paymentType2"  value="2" onclick="showPaymentDetails(this.value)" />Full
                        </c:if>              
                        <c:if test="${payment.paymentType!=1}">
                            <input type="radio" name="paymentType" id="paymentType3" value="3" checked="true" onclick="showPaymentDetails(this.value)"/>No Payment
                        </c:if>

                    </div>
                </div>
                <div class="formDATA" id="modeDiv" style="display:none">
                    <label>Mode</label>
                    <div class="controlsData">
                        <input type="radio" name="radio1" id="mode1" value="1" checked="true" onclick="showModeDetails(this.value)" />NEFT 
                        <input type="radio" name="radio1" id="mode2" value="2" onclick="showModeDetails(this.value)"/>Cheque /DD
                        <input type="radio" name="radio1" id="mode3" value="3" onclick="showModeDetails(this.value)"/>Cash Deposit
                        <input type="radio" name="radio1" id="mode4" value="4" onclick="showModeDetails(this.value)"/>Cash Received
                        <input type="radio" name="radio1" id="mode5" value="5" onclick="showModeDetails(this.value)"/>Debit Card
                       <br> <input type="radio" name="radio1" id="mode6" value="6" onclick="showModeDetails(this.value)"/>Credit Card
                       <input type="radio" name="radio1" id="mode7" value="7" onclick="showModeDetails(this.value)"/>Other
                    </div>

                </div>
                <!-- if NEFT selected-->
                <div class="col-lg-12 followuprow  no-pad" >
                    <div class="col-lg-3 no-pad" style="display:none" id="transactionNoDiv">
                        <div class="formDATA">
                            <label id="transactionLabel" >Transaction No </label>
                            <label id="transactionCheque" style="display:none;">Cheque No </label>
                            <label id="transactionCard" style="display:none;">Card No </label>
                            <div class="controlsData" id ="transactionNum"  >
                                <input type="text" id="transactionNo" maxlength="16"/>

                            </div>
<!--                             <div class="controlsData" id="cardNum" style="display: none">
                                <input type="text" id="transactionNo" maxlength="16"/>
                            </div>-->

                        </div>
                    </div>
                    <div class="col-lg-3" style="display:none" id="bankNameDiv">
                        <div class="formDATA">
                            <label>Bank Name</label>
                            <div class="controlsData">
                                <input type="text" id="bankName"/>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-3" style="display:none" id="paymentDateDiv">
                        <div class="formDATA">
                            <label>Date</label>
                            <div class="controlsData">
                                <input type="text" class="form-control" id="paymentDate"/>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-3" style="display:none" id="paidDiv">
                        <div class="formDATA">
                            <label>Amount</label>
                            <div class="controlsData">
                                <input type="text"  id="paid" onkeyup="calculateBalanceInWords(this.value)"/>
                                <input type="hidden" id="inWordsAmount" value=""/>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="formDATA">
                    <label>Balance</label>
                    <div class="controlsData">
                        <input type="hidden" id="toCalBalance"/><!-- to calculate balance when package is changed by vineet on 18-01-2017 -->
                        <input type="text" value="${payment.balance}" id="balance" readonly="true"/>
                        <input type="hidden" value="${payment.balance}" id="balanceHidden" readonly="true"/>
                    </div>

                </div>
                <div class="formDATA">
                    <label>Remarks</label>
                    <div class="controlsData">
                        <input type="text" id="remarks"/>
                    </div>

                </div>
                <input type="hidden" value="${payment.balance}" id="paymentBalance"/>
                <!--<div class="pull-right"><a href="#!" class="btn btn-primary" onclick="calculateTotal()"/>Calculate</a></div>-->
                <table style="border: 0;width:50%" cellpadding="0" cellspacing="0" border="0"><tr>
                <td style="border:0">                   
                  <input type="checkbox" value="1"  id="sendRegistrationMailFlag"/>
                     Send Registration Mail 
                </td>
                <td style="border:0">
                   <input type="checkbox" value="1"  id="sendBillingMailFlag" />
                    Send Billing Mail 
                </td></tr></table>
                <div class="pull-right"><a href="#!" class="btn btn-primary" id="submitButton" onclick="return savePayment()"/>submit</a></div>
            </c:if>

        </section>


    </div>
    <div id="tabhistory" class="tab-pane fade">
        <!-- History table start-->
        <div class="historyDiv">
            <table>
                <tr>
                    <!--<th>Sr No </th>-->
                    <th>Payment Type </th>
                    <th>Mode</th>
                    <th>Details</th>
                    <th>Bank Name </th>
                    <th>Paid </th>
                    <th>Received By</th>
                    <th>Transaction No</th>
                    <th>Date </th>
                </tr>
                <s:iterator value="paymentList" id="paymentListId" >
                    <tr>
                        <!--<td>${paymentListId.paymentId}</td>-->
                        <c:if test="${paymentListId.paymentTypeString != 'No Payment'}">
                        <td>${paymentListId.paymentTypeString}</td>
                        <td>${paymentListId.paymentModeString}</td>
                        <td>${paymentListId.remarks}</td>
                        <td>${paymentListId.bankName}</td>
                        <td>${paymentListId.paid}</td>
                        <td>${paymentListId.receivedBy}</td>
                        <td>${paymentListId.transactionNo}</td>
                        <td>${paymentListId.paymentDate}</td>
                        </c:if>
                    </tr>
                </s:iterator>
            </table>


        </div>
        <!-- History table ends-->
    </div>
</div>





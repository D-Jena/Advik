<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="sec"uri="http://www.springframework.org/security/tags"%> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
<script src="${contextPath}/assets/appJs/validation/AadharVaidator.js"></script> 
<style>
  #apnd-btn-plus {
    color: green;
  }
</style>
<div class="content">
                <div class="panel-header bg-primary-gradient">
                    <div class="page-inner py-5">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                            <div>
                                <h2 class="text-white pb-2 fw-bold">Manage Product</h2>
                            </div>
                            <div class="ml-md-auto py-2 py-md-0">
                                <a href="stateInit_dashboard.html" class="btn btn-white btn-border btn-round mr-2"><i
                                        class="fa fa-home"></i></a>
                                <a href="#" class="btn btn-secondary btn-round">/ Manage Product</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-inner mt--5 pb-0">
                
                <form class="form-horizontal" action="${contextPath}/product/saveTypeConfig" method="post" id="prodTypeCnfgForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="pTypeId" value="${prodTypeCnfg.pTypeId}"/>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Product Type Configuration</h4>
                                </div>
                                <div class="card-body">
                                    <div class="col-md-12">
                                            <div class="col-md-12">
                                              <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Product Type Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="prodType" name="prodType" value="${prodTypeCnfg.prodType}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
                                            <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Code :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="prodCode" name="prodCode" value="${prodTypeCnfg.prodCode}"  onchange="checkSpaces(this)" maxlength="15">
													</div>
												</div>
											</div>
											<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${prodTypeCnfg.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${prodTypeCnfg.isActive eq false ?'checked':''} required="required"> Inactive 
														</div> 
													</div>
												</div>
										</div>
											<div class="row col-md-12" >
                                            <div class="col-md-12 text-center">
                                                <div class="btn_wrapper col-sm-12">
                                                    <input  class="btn btn-sm btn-primary" type="button" onclick="saveProdType()" value="${not empty beneficiaryData ? 'Update':'Save' }">
                                                    <a class="btn btn-danger btn-sm" href="${contextPath}/" role="button">Back</a>
                                                </div>
                                            </div>
											</div>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</form>
			<form class="form-horizontal" action="${contextPath}/bnf/beneficiary/add" method="post" enctype="multipart/form-data" id="beneficiaryForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<!--TODO:  Customer -->
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Product Details</h4>
                                </div>

                                <div class="card-body">
                                    <div class="col-md-12">
                                    		<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Product Type :</label>
													<div class="col-sm-12">
													<select>
														<option value="">Existing Product Type</option>
														<option>New Categories</option>
													</select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Go:</label>
													<div class="col-sm-12">
														<button></button>
													</div>
												</div>
											</div>
                                           
                                            <div class="col-md-12">
                                              <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Product Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control AlphaNumericOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
                                            <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Code :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control NumbersOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Reference Mobile No :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control NumbersOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Reward Score :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control AlphaNumericOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
										</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Village :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control AlphaNumericOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Block :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control AlphaNumericOnly" id="villageName" name="villageName" value="${vm.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="row col-md-12" >
                                            <div class="col-md-12 text-center">
                                                <div class="btn_wrapper col-sm-12">
                                                    <input  class="btn btn-sm btn-primary" type="button" onclick="saveBeneficiary()" value="${not empty beneficiaryData ? 'Update':'Save' }">
                                                    <a class="btn btn-danger btn-sm" href="${contextPath}/" role="button">Back</a>
                                                </div>
                                            </div>
											</div>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
					 <!--TODO:  Purchase Items -->
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">New Purchase</h4>
                                </div>

                                <div class="card-body">
                                    <div class="col-md-12">
                                    <table class="table table-bordered mt-2 mb-4">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th style="width: 55px;">Sl No.</th>
                                                    <th>Product Type</th>
                                                    <th>Product Name</th>
                                                    <th>Product Id</th>
                                                    <th>Price</th>
                                                    <th>Qty.</th>
                                                    <th>Total Price</th>
                                                    <th>Discount</th>
                                                    <th>Final Price</th>
                                                    <th><i class="fa fa-plus float:right" id="apnd-btn-plus"></i></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<tr>
                                            		<td>1</td>
                                            		<td>
                                            			<select>
                                            				<option value="">Select item</option>
                                            			</select>
                                            		</td>
                                            		<td></td>
                                            		<td></td>
                                            		<td></td>
                                            		<td></td>
                                            		<td></td>
                                            		<td></td>
                                            		<td></td>
                                            		<td><i class="fa fa-minus remove-occ" id="minus0"></i></td>
                                            	</tr>
                                    		</tbody>
                                    </table>
                                    </div>
                                </div>
                           </div>
                       </div>
                   </div>
					
			 </form>               
                    <!--TODO:  List table -->
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Purchase History</h4>
                                </div>

                                <div class="card-body">
                                    <div class="col-md-12">

                                        <table class="table table-bordered DataTable mt-2 mb-4">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th style="width: 55px;">Sl No.</th>
                                                    <th>District</th>
                                                    <th> Name of the Institution</th>
                                                    <th>Disbursed to A/c Number</th>
                                                    <th>Bank Name</th>
                                                    <th> Branch</th>
                                                    <th> IFSC Code </th>
                                                    <th>Status</th>
                                                    <th style="min-width: 70px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
											<c:forEach items="${beneficiaryList}" var="beneficiary" varStatus="count">
												<tr>
													<td>${count.count}</td>
													<td>${beneficiary.district.districtName}</td>
													<td>${beneficiary.instuteName}</td>
													<td>${beneficiary.accountNo}</td>
													<td>${beneficiary.bankMaster.bankName}</td>
													<td>${beneficiary.bankMaster.branchName}</td>
													<td>${beneficiary.bankMaster.ifsccode}</td>
													<c:if test="${beneficiary.isActive eq true }">
														<td>Active</td>
													</c:if>
													<c:if test="${beneficiary.isActive eq false }">
														<td>InActive</td>
													</c:if>
		
													<td>
														<button class="btn btn-warning btn-sm"
															onclick="editBeneficiaryById('${beneficiary.beneficiaryId}')">
															<i class="fas fa-edit"></i>
														</button>
														<button class="btn btn-primary btn-sm"
															onclick="viewBeneficiaryById('${beneficiary.beneficiaryId}')">
															<i class="fas fa-eye"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
								       </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
<form method="GET" id="formId"></form>
<script>
	function editBeneficiaryById(id) {
		$("#formId").attr('action','${contextPath}/bnf/beneficiary/edit/' + id + '');
		$("#formId").submit();
	}
	
	function viewBeneficiaryById(id) {
		$("#formId").attr('action','${contextPath}/bnf/beneficiary/view/' + id + '');
		$("#formId").submit();
	}
	
	
	/* for Append */
	$(document)
			.ready(
					function() {
// 						$("#minus0").addClass("frezz");
						var count = 1;
						var cont = 2;

						$("#apnd-btn-plus").click(function() {
											$(".append-box")
													.append('<tr class="append-box-inr" id="ocpId'+count+'">'
																	+'<td>'+cont+'</td>'
																	+'<td><select id="schemeId'+count+'" name="anualActionPlanSchemeMappings['+count+'].scheme.schemeId" required="required" onchange="getSchemeHead(this.value,'+count+')"><option value="0">-- Select Scheme --</option>'
																	+'<c:forEach items="${scheme}" var="shm">'
																	+'<option value="${shm.schemeId}">${shm.schemeName}</option>'
																	+'</c:forEach></select></td>'
																	+'<td><select id="head'+count+'" name="anualActionPlanSchemeMappings['+count+'].mstHead.headId" required="required"></select></td>'
																	+'<td><input type="text" id="amount'+count+'" name="anualActionPlanSchemeMappings['+count+'].aapAmount"  class="NumbersOnly" autocomplete="off" required="required" value="" maxLength="20"></td>'
																	+'<td><i class="fa fa-minus remove-occ" id="minus'+count+'"></i></td></tr>');
// 											$("#minus'+count+'").addClass("frezz"); 
											count++;
											cont++;
											$.getScript("${contextPath}/assets/appJs/validation/common-utils.js");
											
						});
						$("body").on("click", ".remove-occ", function() {
							var $row = $(this).closest("tr"); // Get the .closest Row
							var rs = $row.index()+1;
							var rowCount = $('#myTable tr').length-1;
							if(rowCount > 1 && rs == rowCount){
								$(this).closest(".append-box-inr").remove();
								count--;
								cont--;
							}
							
						});
					});
</script>
<script>
	function getSchemeHead(scmId,cnt){
		$.ajax({
			type : "GET",
			url : "${contextPath}/aap/getSchemeHead",
			dataType : "json",
			data : {
				"schemeId" : scmId,
			},
			success : function(response) {
				var html = "<option value=''>-Select-</option>";
				var data = response;
				
				if (data != "" && data != null && data.length > 0) {
					$.each(data, function(index, value) {
						html = html + "<option value="+value.headId+">"+ value.headName+"</option>";
					});
				}
				$("#head"+cnt).empty().append(html);
			},
			error : function(error) {
				//bootbox.alert("Failure"); 
			}
		});
	}
	
	
</script>
 <script>
        var count11 = 1;
        function addmoreRow1() {
        	if($("#instuteName"+count11).val()==""){
    			bootbox.alert("Please Enter Instute Name.");
    			$("#instuteName"+count11).focus();
    			return false;
    		}
        	if($("#instuteAdd"+count11).val()==""){
    			bootbox.alert("Please Enter Instute Address.");
    			$("#instuteAdd"+count11).focus();
    			return false;
    		}
        	if($("#contactNo"+count11).val()==""){
    			bootbox.alert("Please enter mobile number.");
    			$("#contactNo"+count11).focus();
    			return false;
    		}
    		var mobNum = $("#contactNo"+count11).val();
    		if(mobNum!=""){
    			var filter = /^\d*(?:\.\d{1,2})?$/;
    			if (filter.test(mobNum) && mobNum.length != 10) {
    				bootbox.alert("Invalid phone no");
    				return false;
    			}
    		}
    		if($("#emailId"+count11).val()==""){
    			bootbox.alert("Please Enter email id.");
    			$("#emailId"+count11).focus();
    			return false;
    		}
    		var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

    		if (!$("#emailId"+count11).val().match(validRegex)) {
    			bootbox.alert("Please provide valid email id.");
    			$("#emailId"+count11).focus();
    			return false;
    		}
    		
    		if($("#accountNo"+count11).val()==""){
    			bootbox.alert("Please enter A/C number.");
    			$("#accountNo"+count11).focus();
    			return false;
    		}
    		var accountNo = $("#accountNo"+count11).val();
    		var hdnAccountNo = $("#hdnAccountNo").val();
    		if(accountNo != "" && accountNo != hdnAccountNo){
	    		$.ajax({
	    			type : "GET",
	    			url : "${contextPath}/bnf/beneficiary/checkDuplicateAccountNo",
	    			data : {
	    				"accountNo" : accountNo,
	    			},
	    			success : function(response) {
	    				var val = JSON.parse(response);
	    				if (val.duplicate == true) {
	    					bootbox.alert("Duplicate Account Number Not Allowed");
	    					$("#accountNo"+count11).val("");
	    					return false;	
	    				}else{
	    					return true;	
	    				}
	    			},
	    			error : function(error) {
	    				//bootbox.alert("Failure"); 
	    			}
	    		});
    		
            }
    		if($("#accountNo"+count11).val().length <= 5){
				bootbox.alert("Please enter meximum 6 letter in AC No .");
				$("#accountNo"+count11).focus();
				return false;
			}
    		
    		if($("#acHolderName"+count11).val()==""){
    			bootbox.alert("Please enter A/C holder name.");
    			$("#acHolderName"+count11).focus();
    			return false;
    		}
    		
    		if($("#banknameList"+count11).val()=="0"){
    			bootbox.alert("Please select Bank Name.");
    			$("#banknameList"+count11).focus();
    			return false;
    		}
    		
    		if($("#branchnameList"+count11).val()=="0"){
    			bootbox.alert("Please select Branch Name.");
    			$("#branchnameList"+count11).focus();
    			return false;
    		}else{
    			    count11++;
    	            var collectData11 = '';
    	            collectData11 = collectData11
    	                + '<tr id="deleteRowDetails1' + count11 + '"><td> <input type="text" class="form-control form-control-sm" name="beneficiary['+count11+'].instuteName" maxlength="100" id="instuteName'+count11+'"></td><td> <input type="text" class="form-control form-control-sm" maxlength="150" name="beneficiary['+count11+'].instuteAdd" id="instuteAdd'+count11+'"></td><td> <input type="text" class="form-control form-control-sm" maxlength="10" name="beneficiary['+count11+'].contactNo" id="contactNo'+count11+'" ></td><td> <input type="text" class="form-control form-control-sm email-id" onchange="validateEmailId(this);checkDuplicateEmailId(this);" maxlength="50" name="beneficiary['+count11+'].emailId" id="emailId'+count11+'"></td><td> <input type="text" class="form-control form-control-sm NumbersOnly account-no" onchange="checkDuplicateAccNo(this)" maxlength="20" name="beneficiary['+count11+'].accountNo" id="accountNo'+count11+'"></td><td> <input type="text" class="form-control form-control-sm" maxlength="100" name="beneficiary['+count11+'].acHolderName" id="acHolderName'+count11+'"></td><td><select class="form-control form-control-sm" id="banknameList'+count11+'" name="banknameList" onchange="findBankBranchByBankName(this.value,'+count11+');"><option value="0">Select</option> <c:forEach items="${bankList}" var="bankName"><option value="${bankName}">${bankName}</option> </c:forEach> </select></td><td> <select class="form-control form-control-sm" name="beneficiary['+count11+'].bankBranch.bankBranchId" id="branchnameList'+count11+'" onchange="findIfscCodeByBranchName(this,'+count11+');" ><option value="0">Select</option> </select></td><td> <input type="text" class="form-control form-control-sm" name="ifscCode" id="ifscCode'+count11+'" readonly></td><td><button type="button" class="btn btn-danger btn-sm" onclick="deletethisRow1(' + count11 + ')"><i class="fa fa-minus"></i></button></td></tr>';
    	            $("#insertrow").append(collectData11);
    		}
    		
          
        }
        function deletethisRow1(val) {
            $($("#deleteRowDetails1" + val).closest("tr")).remove();
            count11--;
        }
        
        function findBankBranchByBankName(bankName,count){
			 $.ajax({
					type : "GET",
					url : '${contextPath}/bnf/beneficiary/findBankBranchByBankName',
					dataType : "json",
					data : {
						"bankName" : bankName,
					},
					success : function(response) {
						var html = "<option value='0' selected>-Select-</option>";
						var data = response.data;
						if (data != "" && data != null && data.length > 0) {
							$.each(data, function(index, value) {
								html = html + "<option value="+value.branchId+">"+ value.adress+" ("
										+ value.ifsccode +")"+ "</option>";
							});
						}
						$('#branchnameList'+count).empty().append(html);
					},
					error : function(error) {
						bootbox.alert("Branch list not found");
					}
				});
		 }
       function findIfscCodeByBranchName(value,count){
    	   var selectedText = $("#"+value.id+" option:selected").html();
    	   var matches = /\((.*?)\)/g.exec(selectedText);
    	   $("#ifscCode"+count).val(matches[1]);
       }
       
       
       function validateMobileNumber(fieldId,mobNum){
           var filter = /^\d*(?:\.\d{1,2})?$/;
             if (filter.test(mobNum)) {
               if(mobNum.length==10){
                    bootbox.alert();
                } else {
               	 bootbox.alert('Please put 10  digit mobile number');
               	// $("#"+fieldId).val("");
                   return false;
                 }
               }
               else {
               	bootbox.alert('Not a valid mobile number');
                 //$("#"+fieldId).val("");
                 
                 return false;
              }
       	}
       
       function validateEmailId(value){
    	    var fieldId = value.id;
	        var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	
			if (!$("#"+fieldId).val().match(validRegex)) {
				bootbox.alert("Please provide valid email id.");
				//$("#"+fieldId).val("");
				$("#"+fieldId).focus();
				return false;
			}
			
       }
       function checkDuplicateEmailId(that){
   		var currentText = $(that).val();
   		var currentId = that.id;
   		if(currentText !="0"){
   			var existingValues = $('.email-id');
   			$.each(existingValues, function(idx,elem){
   				if ($(elem).val().toLowerCase() == currentText.toLowerCase() && elem.id != currentId && ($(elem).val()!= "0" && currentText != "0"))
   				{
   					bootbox.alert("EmailId can't be duplicate.");
   					$("#"+currentId).val("");
   					return false;
   				}
   			});
   		}
   		
   		var emailId = $(that).val();
		var hdnEmailId = $("#hdnEmailId").val();
		if(emailId != "" && emailId != hdnEmailId){
	    		$.ajax({
	    			type : "GET",
	    			url : "${contextPath}/bnf/beneficiary/checkDuplicateEmailId",
	    			data : {
	    				"emailId" : emailId,
	    			},
	    			success : function(response) {
	    				var val = JSON.parse(response);
	    				if (val.duplicate == true) {
	    					bootbox.alert("Duplicate Email Id Not Allowed");
	    					$("#"+currentId).val("");
	    					return false;	
	    				}else{
	    					return true;	
	    				}
	    			},
	    			error : function(error) {
	    				//bootbox.alert("Failure"); 
	    			}
	    		});
  		
          } 
       }
       
       function checkDuplicateAccNo(that){
    		var currentText = $(that).val();
    		var currentId = that.id;
    		if(currentText !="0"){
    			var existingValues = $('.account-no');
    			$.each(existingValues, function(idx,elem){
    				if ($(elem).val().toLowerCase() == currentText.toLowerCase() && elem.id != currentId && ($(elem).val()!= "0" && currentText != "0"))
    				{
    					bootbox.alert("Account number can't be duplicate.");
    					$("#"+currentId).val("");
    					return false;
    				}
    			});
    		}
    	   
    		var accountNo = $(that).val();
    		var hdnAccountNo = $("#hdnAccountNo").val();
    		if(accountNo != "" && accountNo != hdnAccountNo){
  	    		$.ajax({
  	    			type : "GET",
  	    			url : "${contextPath}/bnf/beneficiary/checkDuplicateAccountNo",
  	    			data : {
  	    				"accountNo" : accountNo,
  	    			},
  	    			success : function(response) {
  	    				var val = JSON.parse(response);
  	    				if (val.duplicate == true) {
  	    					bootbox.alert("Duplicate Account Number Not Allowed");
  	    					$("#"+currentId).val("");
  	    					return false;	
  	    				}else{
  	    					return true;	
  	    				}
  	    			},
  	    			error : function(error) {
  	    				//bootbox.alert("Failure"); 
  	    			}
  	    		});
      		
              }
    		return true;	
    	}
       
       function saveProdType(){
    	  if($("#prodType").val()==""){
    		  bootbox.alert("Please Enter Product Type.");
			  return false;
    	  }
    	 
    	var flag = window.confirm("Do you want to continue ?");
  		if (flag == true) {
//   			$('#beneficiaryForm select').prop('disabled', false);
  			$("#prodTypeCnfgForm").submit();
  		}else{
  			//e.preventDefault();
  		} 
    	  
       }
    </script>
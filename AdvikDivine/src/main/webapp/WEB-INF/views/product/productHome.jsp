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
 .box-size{
 	width:100px;
 }
 .box-size-50{
  	width:70px;
 }
  
</style>
<div class="content">
                <div class="panel-header bg-primary-gradient">
                    <div class="page-inner py-5">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                            <div>
                                <h2 class="text-white pb-2 fw-bold">Manage Product Purchase</h2>
                            </div>
                            <div class="ml-md-auto py-2 py-md-0">
                                <a href="stateInit_dashboard.html" class="btn btn-white btn-border btn-round mr-2"><i
                                        class="fa fa-home"></i></a>
                                <a href="#" class="btn btn-secondary btn-round">/ Manage Product Purchase</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-inner mt--5 pb-0">
				<form class="form-horizontal" method="post" enctype="multipart/form-data" id="purchaseEntryForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					 <!--TODO:  Purchase Items -->
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Purchase Entry</h4>
                                </div>
                                <div class="card-body">
                                    <div class="col-md-12">
                                    <table class="table table-bordered mt-2 mb-4" id="myTable">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th style="width:55px;">Sl No.</th>
                                                    <th>Product Type</th>
                                                    <th>Brand Name</th>
                                                    <th>Type</th>
                                                    <th>Product Name/Code</th>
                                                    <th>Color</th>
                                                    <th>Size</th>
                                                    <th>Price</th>
                                                    <th>Qty.</th>
                                                    <th>Total Price</th>
                                                    <th>Discount(%)</th>
                                                    <th>Final Price</th>
                                                    <th>Vendor</th>
                                                    <th>Purchase Date</th>
                                                    <th><i class="fa fa-plus float:right form-control-sm" id="apnd-btn-plus"></i></th>
                                                </tr>
                                            </thead>
                                            <tbody class="append-box" id="apndBoxId">
                                            	<tr class="append-box-inr" id="ocpId">
                                            		<td>1</td>
                                            		<td>
                                            			<select class="form-control-sm AlphaNumericOnly" name="PurchaseEntryModelList[0].prodTypeId" id="prodTypeId0">
                                            				<option value="">Select Product</option>
                                            				<c:forEach items="${prodTypeList}" var="types">
																<option value="${types.prodTypeId}">${types.prodType}</option>
															</c:forEach>
                                            			</select>
                                            		</td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].brandName" id="brandName0" class="form-control-sm" ></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].type" id="type0" class="form-control-sm box-size" maxlength="15"></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].productCode" id="productCode0" class="form-control-sm AlphaNumericOnly" ></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].color" id="color0" class="form-control-sm box-size AlphabetsOnly" ></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].size" id="size0" class="form-control-sm box-size-50 AlphaNumericOnly" maxlength="4"></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].price" id="price0" onkeyup="calculateTotalPrice(0)" class="form-control-sm box-size NumbersOnlyForAmount" ></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].quantity" id="quantity0" onkeyup="calculateTotalPrice(0)" class="form-control-sm box-size NumbersOnly" maxlength="4"></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].totalPrice" id="totalPrice0" class="form-control-sm NumbersOnlyForAmount" readonly></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].discount" id="discount0" onkeyup="calculateFinalPrice(0)" class="form-control-sm box-size-50 NumbersOnly" maxlength="3"></td>
                                            		<td><input type="text" name="PurchaseEntryModelList[0].finalPrice" id="finalPrice0" class="form-control-sm NumbersOnlyForAmount" readonly></td>
                                            		<td>
                                            			<select class="form-control-sm AlphaNumericOnly" name="PurchaseEntryModelList[0].vendorId" id="vendorId0">
                                            				<option value="">Select Vendor</option>
                                            				<c:forEach items="${vendorList}" var="vend">
																<option value=""></option>
															</c:forEach>
                                            			</select>
                                            		</td>
                                            		<td><input type="date" name="PurchaseEntryModelList[0].purchaseDate" id="purchaseDate0" class="form-control-sm"></td>
                                            		<td><i class="fa fa-minus remove-occ form-control-sm " id="minus0"></i></td>
                                            	</tr>
                                    		</tbody>
                                    </table>
                                    </div>
                                    <div class="row">
										<div class="col text-center mt-3">
											<c:choose>
											<c:when test="${not empty districtData}">
												<input type="button"  value="Update" id="" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
												<a href="${contextPath}/" type="button" class="btn btn-danger btn-sm">Back</a>
												<button type="reset" class="btn btn-warning btn-sm">Reset</button>
											</c:when>
											<c:otherwise>
												<input type="button"  value="Submit" id="" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
												<a href="${contextPath}/home" type="button" class="btn btn-danger btn-sm">Back</a>
												<button type="reset" class="btn btn-warning btn-sm">Reset</button>
											</c:otherwise>
											</c:choose>
										</div>
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
                                                    <th style="width:55px;">Sl No.</th>
                                                    <th>Product Type</th>
                                                    <th>Brand Name</th>
                                                    <th>Type</th>
                                                    <th>Product Name/Code</th>
                                                    <th>Color</th>
                                                    <th>Size</th>
                                                    <th>Price</th>
                                                    <th>Qty.</th>
                                                    <th>Total Price</th>
                                                    <th>Discount(%)</th>
                                                    <th>Final Price</th>
                                                    <th>Vendor</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
<%-- 											<c:forEach items="" var="" varStatus="count"> --%>
												<tr>
													<td>${count.count}</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td>
														<button class="btn btn-warning btn-sm"
															onclick="editBeneficiaryById('')">
															<i class="fas fa-edit"></i>
														</button>
														<button class="btn btn-primary btn-sm"
															onclick="viewBeneficiaryById('')">
															<i class="fas fa-eye"></i>
														</button>
													</td>
												</tr>
<%-- 											</c:forEach> --%>
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
		$("#formId").attr('action','${contextPath}/' + id + '');
		$("#formId").submit();
	}
	
	function viewBeneficiaryById(id) {
		$("#formId").attr('action','${contextPath}/' + id + '');
		$("#formId").submit();
	}
	
	
	/* for Append */
	$(document)
			.ready(
					function() {
						var count = 1;
						var cont = 2;
						$("#apnd-btn-plus").click(function() {
											$(".append-box")
													.append('<tr class="append-box-inr" id="ocpId'+count+'">'
																	+'<td>'+cont+'</td>'
																	+'<td>'
			                                            			+'<select class="form-control-sm AlphaNumericOnly" name="PurchaseEntryModelList['+count+'].prodTypeId" id="prodTypeId'+count+'">'
			                                            			+'<option value="">Select Product</option>'
			                                            			+'<c:forEach items="${prodTypeList}" var="types">'
			                                            			+'<option value="${types.prodTypeId}">${types.prodType}</option>'
			                                            			+'</c:forEach>'
			                                            			+'</select>'
			                                            			+'</td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].brandName" id="brandName'+count+'" class="form-control-sm" ></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].type" id="type'+count+'" class="form-control-sm box-size" maxlength="15"></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].productCode" id="productCode'+count+'" class="form-control-sm AlphaNumericOnly" ></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].color" id="color'+count+'" class="form-control-sm box-size AlphabetsOnly" ></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].size" id="size'+count+'" class="form-control-sm box-size-50 AlphaNumericOnly" maxlength="4"></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].price" id="price'+count+'" onkeyup="calculateTotalPrice('+count+')" class="form-control-sm box-size NumbersOnlyForAmount" ></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].quantity" id="quantity'+count+'" onkeyup="calculateTotalPrice('+count+')" class="form-control-sm box-size NumbersOnly" maxlength="4"></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].totalPrice" id="totalPrice'+count+'" class="form-control-sm NumbersOnlyForAmount" readonly></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].discount" id="discount'+count+'" onkeyup="calculateFinalPrice('+count+')" class="form-control-sm box-size-50 NumbersOnly" maxlength="3"></td>'
			                                            			+'<td><input type="text" name="PurchaseEntryModelList['+count+'].finalPrice" id="finalPrice'+count+'" class="form-control-sm NumbersOnlyForAmount" readonly></td>'
			                                            			+'<td>'
			                                            			+'<select class="form-control-sm AlphaNumericOnly" name="vendorId" id="vendorId'+count+'">'
			                                            			+'<option value="">Select Vendor</option>'
			                                            			+'<c:forEach items="${vendorList}" var="vend">'
			                                            			+'<option value=""></option>'
			                                            			+'</c:forEach>'
			                                            			+'</select>'
			                                            			+'</td>'
			                                            			+'<td><input type="date" name="purchaseDate" id="purchaseDate'+count+'" class="form-control-sm"></td>'
																	+'<td><i class="fa fa-minus remove-occ form-control-sm" id="minus'+count+'"></i></td></tr>');
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
      
		function calculateTotalPrice(index){
			var price =$("#price"+index).val();
			var qty = $("#quantity"+index).val();
			var totPrice = price * qty ;
			$("#totalPrice"+index).val(totPrice);
			$("#discount"+index).val("");
			$("#finalPrice"+index).val("");
		}
 
		function calculateFinalPrice(index){
			var totPrice = $("#totalPrice"+index).val();
			var disc = $("#discount"+index).val();
			var finalAmount = totPrice-(totPrice/100)*disc;
			$("#finalPrice"+index).val(finalAmount);
		}
 
 		debugger;
       function submitFormData(){
    	   var rowCount = $('#myTable tr').length-1;
    	   var flag = false;
    	   var tdData = true;
    	   
    	   
    	   for (var i = 0; i < rowCount; i++) {
    		   var sl=i+1;
    		   if($("#prodTypeId"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please select product type in seriel No:"+sl);
    			   return false;
    		   }else if($("#brandName"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter brand name in serial No:"+sl);
    			   return false;
    		   }else if($("#color"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter color in serial No:"+sl);
    			   return false;
    		   }else if($("#size"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter size in serial No:"+sl);
    			   return false;
    		   }else if($("#price"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter price in serial No:"+sl);
    			   return false;
    		   }else if($("#quantity"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter quantity in serial No:"+sl);
    			   return false;
    		   }else if($("#discount"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please enter discount in serial No:"+sl);
    			   return false;
    		   }else if($("#vendorId"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please select vendor in serial No:"+sl);
    			   return false;
    		   }else if($("#purchaseDate"+i).val() == ""){
    			   flag = false;
    			   bootbox.alert("Please choose date in serial No:"+sl);
    			   return false;
    		   }
    		   else{
    			   flag = true;
    		   }
    	    }
    	   if(flag){
    		   if (window.confirm("Are you sure you want to submit ?")) {
                   document.getElementById("purchaseEntryForm").submit();
               }
    	   }
       }
    	 
//     	var flag = window.confirm("Do you want to continue ?");
  		
    </script>
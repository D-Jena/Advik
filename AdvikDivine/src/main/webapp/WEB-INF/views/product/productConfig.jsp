<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="sec"uri="http://www.springframework.org/security/tags"%> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
<script src="${contextPath}/assets/appJs/validation/AadharVaidator.js"></script> 
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/text.font.css">

<style>
  #apnd-btn-plus {
    color: green;
  }
  .my-div {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>
<div class="content">
                <div class="panel-header bg-primary-gradient">
                    <div class="page-inner py-5">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                            <div>
                                <h2 class="text-white pb-2 fw-bold">Manage Product Configuration</h2>
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
                
                <form class="form-horizontal" action="${contextPath}/prodConfig/saveTypeConfig" method="post" id="prodTypeCnfgForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="prodTypeId" value="${prodTypeCnfg.prodTypeId}"/>
                    <div class="row mt-4">
                        <div class="col-md-12">
                        <%@ include file="/WEB-INF/views/message.jsp"%>
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
													<label class="col-sm-12 required medium-text" for="text">Product Categories Name:</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="prodType" name="prodType" value="${prodTypeCnfg.prodType}"  onchange="checkProdType()" required maxlength="50">
													</div>
												</div>
											</div>
                                            <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12" for="text">Code :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control" id="prodCode" name="prodCode" value="${prodTypeCnfg.prodCode}" maxlength="15">
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
										<div class="row col-md-12" ><br></div>
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
			              
                    <!--TODO:  List table -->
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Product Category List</h4>
                                </div>

                                <div class="card-body">
                                    <div class=" col-md-12">
                                        <table class="table table-bordered mt-2 mb-4">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th style="width: 55px;">Sl No.</th>
                                                    <th>Product Type</th>
                                                    <th>Product Code</th>
                                                    <th>Status</th>
                                                    <th style="min-width: 50px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
											<c:forEach items="${prodTypeList}" var="ptl" varStatus="count">
												<tr>
													<td>${count.count}</td>
													<td>${ptl.prodType}</td>
													<td>${ptl.prodCode}</td>
													<c:if test="${ptl.isActive eq true }">
														<td>Active</td>
													</c:if>
													<c:if test="${ptl.isActive eq false }">
														<td>InActive</td>
													</c:if>
													<td>
														<button class="btn btn-warning btn-sm" value="${ptl.prodTypeId}"
															onclick="editProdType(this.value)">
															<i class="fas fa-edit"></i>
														</button>
														<button class="btn btn-danger btn-sm" value="${ptl.prodTypeId}"
															onclick="deleteProdType(this.value)">
															<i class="fas fa-trash"></i>
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
	function editProdType(id) {
		$("#formId").attr('action','${contextPath}/prodConfig/editProductType/' + id);
		$("#formId").submit();
	}
	
	function checkProdType(){
		debugger;
		var ptype = $("#prodType").val();
		$.ajax({
			type : "GET",
			url : "${contextPath}/prodConfig/checkDuplicateProdType",
// 			dataType : "json",
			data : {
				"type" : ptype,
			},
			success : function(response) {
				if (response == "Yes") {
					bootbox.alert("Given Product Type alredy exist.");
					$("#prodType").val("");
					$("#prodCode").val("");
				}
			},
			error : function(error) {
				//bootbox.alert("Failure"); 
			}
		});
	}
	
       function saveProdType(){
    	  if($("#prodType").val()==""){
    		  bootbox.alert("Please Enter Product Type.");
			  return false;
    	  }
    	  if ($('input[name="isActive"]:checked').val() == undefined) {
  			bootbox.alert("Select Active Or InActive");
  			return false;
  		}
    	var flag = window.confirm("Do you want to continue ?");
  		if (flag == true) {
  			$("#prodTypeCnfgForm").submit();
  		}
    	  
       }
    </script>
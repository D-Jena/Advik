	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
	<script src="${contextPath}/assets/appJs/validation/copyPasteCheck.js"></script>
	<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
	<div class="content">
		<div class="panel-header bg-primary-gradient">
			<div class="page-inner py-4">
				<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
					<div>
						<h2 class="text-blue pb-2 fw-bold">District</h2>
					</div>
					<div class="ml-md-auto mb-4 py-2 py-md-0">
						<a href="${contextPath}/home" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a> 
						<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add District</a>
					</div>
				</div>
			</div>
		</div>
		<div class="page-inner">
					<div class="row mt-2">
					 <%@ include file="/WEB-INF/views/message.jsp"%>
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-header">
									 <c:choose>
										<c:when test="${not empty districtData.districtId}">
										<h4 class="card-title">Update District</h4></c:when>
										<c:otherwise>
										<h4 class="card-title">Add District</h4>
										</c:otherwise>
									</c:choose> 
								</div>
								<div class="card-body">
									<form action="${contextPath}/mst/addNupdate" id="addDistFrm"	method="post" >
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											<input type="hidden" name="distId" value="${dm.distId}">
									<div class="row">
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">State :</label>
															<div class="col-sm-12">
																<input type="text" class="form-control AlphaNumericOnly" id="stateName" name="stateName" value="Odisha" readonly>
																<input type="hidden" class="form-control AlphaNumericOnly" id="stateId" name="StateId" value="1">
															</div>
														</div>
												</div>
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">District Name:</label>
															<div class="col-sm-12">
																<input type="text" class="form-control AlphaNumericOnly" id="distName" name="distName"  onchange="checkDuplicateDist()" required maxlength="15" value="${dm.distName}">
															</div>
														</div>
												</div>
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">District Code :</label>
															<div class="col-sm-4">
																<input type="text" class="form-control AlphaNumericOnly" id="distCode" name="distCode"  onchange="checkCodeDuplicate()" required maxlength="5" value="${dm.distCode}" >
															</div>
														</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${dm.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${dm.isActive eq false ?'checked':''} required="required"> Inactive 
														</div> 
													</div>
												</div> 
										</div>
												<div class="row">
												<div class="col text-center mt-3">
														<c:choose>
															<c:when test="${not empty districtData}">
																<input type="button" name="add&ManageApplicationScheme" value="Update" id="addManageApplicationSchemes" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
																<a href="${contextPath}/mst/demography/district" type="button" class="btn btn-danger btn-sm">Back</a>
																
															</c:when>
														<c:otherwise>
															<input type="button" name="add&ManageApplicationScheme" value="Submit" id="addManageApplicationSchemes" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
																<a href="${contextPath}/home" type="button" class="btn btn-danger btn-sm">Back</a>
																<button type="reset" class="btn btn-warning btn-sm">Reset</button>
																
														</c:otherwise>
													</c:choose>
													</div>
												</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					<c:if test="${empty  districtData}">
					<div class="row mt-2">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-header">
									<h4 class="card-title">District List</h4>
								</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="basic-datatables" class="display table table-bordered table-hover DataTable" >
												<thead>
													<tr>
													    <th>Sl.No</th>
													    <th>State Name</th>
													    <th>District Name</th>
													    <th>District Code</th>
													    <th>Satus</th>
														<th style="width: 30px">Action</th> 													
													</tr>
												</thead>
												<tbody>
											 		<c:forEach items="${distlst}" var="dist" varStatus="count">
														<tr>
														    <td>${count.count}</td>
														    <td>${dist.stateName}</td>
														    <td>${dist.distName}</td>
														    <td>${dist.distCode}</td>
														    <td>${dist.isActive eq true ? 'Active': 'InActive'}</td>
															<td>
															<button class="btn btn-warning btn-xs" data-toggle="tooltip" title="Edit"
														    	onclick="editById(${dist.distId})">
																	<i class="fas fa-edit"></i>
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
					</c:if>
					</div>
					
				</div>
		  <!-- Modal End -->
<form method="GET" id="formId">
	<input type="hidden" name="id" id="id">
</form>
<script>
	function submitFormData(){
		
		if ($("#distName").val() == "") {
			bootbox.alert("Enter dist name .");
			return false;
		}
		if ($("#distCode").val() == "") {
			bootbox.alert("Enter dist code .");
			return false;
		}
		if ($('input[name="isActive"]:checked').val() == undefined) {
			bootbox.alert("Select Active Or InActive");
			return false;
		}else{	
			bootbox.confirm("Do You  Want To Continue?", function(result) {
						if (result) {
							$("#addDistFrm").submit();
						}
					});
				}
		} 
	
	function checkDuplicateDist(){
		var distName = $("#distName").val();
		$.ajax({
			  url: '${contextPath}/mst/checkDistNameAndCode',
			  method: 'GET', 
			  data : {
				"distNameAndCode" : distName,
			  },
			  success: function(response) {
			      if(response == 'Present'){
			    	  bootbox.alert("Dist name already present");
			    	  $("#distName").val("");
			      }
			  },
			  error: function(xhr, status, error) {
			    bootbox.alert("Something went wrong while checking duplicate dist name ");
			  }
			});

	}
	
	function checkCodeDuplicate(){
		var code = $("#distCode").val();
		$.ajax({
			  url: '${contextPath}/mst/checkDistNameAndCode',
			  method: 'GET', 
			  data : {
				"distNameAndCode" : code,
			  },
			  success: function(response) {
			      if(response == 'Present'){
			    	  bootbox.alert("Dist Code already present");
			    	  $("#distCode").val("");
			      }
			  },
			  error: function(xhr, status, error) {
			    bootbox.alert("Something went wrong while checking duplicate dist code ");
			  }
			});
	}
	
	function editById(id){
		$("#id").val(id)
	    $("#formId").attr('action','${contextPath}/mst/distEdit');
	    $("#formId").submit();
	}
	</script>
	
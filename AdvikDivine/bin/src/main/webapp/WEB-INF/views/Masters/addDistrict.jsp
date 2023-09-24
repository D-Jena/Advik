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
									<form action="${contextPath}/mst/demography/district/addNupdate" id="addDistrictFrm"	method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
												<input type="hidden" name="districtId" value="${districtData.districtId}"  />
									<div class="row">
												<div class="col-md-3">
													<div class="form-group">
														<label class="col-sm-12 required" for="text">State :</label>
														<div class="col-sm-12">
															<select name="state.stateId" id="stateId" class="form-control form-control-sm" required="required">
								                                 <option value="" >Select</option>
							                                    <c:forEach items="${stateList}" var="state">
																	<option value="${state.stateId}" ${state.stateId eq districtData.state.stateId?'selected':''}>${state.stateNameEN}</option>
																</c:forEach> 
								                              </select>
														</div> 
													</div>
												</div>
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">District :</label>
															<div class="col-sm-12">
																<input type="text" class="form-control AlphaNumericOnly" id="distIdTxt" name="districtName" value="${districtData.districtName} "  onchange="checkSpaces(this)" required maxlength="50">
															</div>
														</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${districtData.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${districtData.isActive eq false ?'checked':''} required="required"> Inactive 
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
														<th>Action</th> 													
													</tr>
												</thead>
												<tbody>
											 		<c:forEach items="${distlst}" var="dist" varStatus="count">
														<tr>
														    <td>${count.count}</td>
														    <td>${dist.state.stateNameEN}</td>
														    <td>${dist.districtName}</td>
														    <td>${dist.districtCode}</td>
														    <td>${dist.isActive eq true ? 'Active': 'InActive'}</td>
															<td>
															<button class="btn btn-warning btn-xs" data-toggle="tooltip" title="Edit"
														    	onclick="editById(${dist.districtId})">
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
		
	var districtName=$("#distIdTxt").val();
	
	var stateName=$("#stateId" ).val();

	if(stateName=="" || stateName=="0"){
		bootbox.alert("Select State Name");
		return false;
	}
	if(districtName==" "){
		bootbox.alert("Enter District Name");
		return false;
	}
	if ($('input[name="isActive"]:checked').val() == undefined) {
		bootbox.alert("Select Active Or InActive");
		return false;
	}else{	
		bootbox.confirm("Do You  Want To Continue?", function(result) {
					if (result) {
						$("#addManageApplicationSchemes").prop('disabled', true);
						$("#addDistrictFrm").submit();
					}
				});
			}
	} 
	
	function editById(id){
		debugger;
		$("#id").val(id)
	    $("#formId").attr('action','${contextPath}/mst/demography/district');
	    $("#formId").submit();
	}
	</script>
	
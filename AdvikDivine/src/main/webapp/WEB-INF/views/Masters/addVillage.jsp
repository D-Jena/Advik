	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
	<script src="${contextPath}/assets/appJs/validation/copyPasteCheck.js"></script>
	<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
	<script src="${contextPath}/assets/appJs/applicationSpecific/commonApis.js"></script>
	<div class="content">
		<div class="panel-header bg-primary-gradient">
			<div class="page-inner py-4">
				<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
					<div>
						<h2 class="text-blue pb-2 fw-bold">Village</h2>
					</div>
					<div class="ml-md-auto mb-4 py-2 py-md-0">
						<a href="${contextPath}/home" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a> 
						<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add Village</a>
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
										<c:when test="${not empty villageData.villageId}">
										<h4 class="card-title">Update Village</h4></c:when>
										<c:otherwise>
										<h4 class="card-title">Add New Village</h4>
										</c:otherwise>
									</c:choose> 
								</div>
								<div class="card-body">
									<form action="${contextPath}/mst/saveNupdateVillage" id="addVillageFrm"	method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
												<input type="hidden" name="villageId" value="${villageData.villageId }"  />
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="col-sm-12 required" for="text">District :</label>
												<div class="col-sm-12">
													<select name="distId" id="distId" class="form-control form-control-sm" required="required" onchange="getBlockByDistrictId(this.value)">
													<option value="" >Select district</option>
													<c:forEach items="${distlist}" var="dist">
														<option value="${dist.distId}" ${dist.distId eq villageData.distId ?'selected':'' }>${dist.distName}</option>
													</c:forEach>
						                            </select>
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="col-sm-12 required" for="text">Block :</label>
												<div class="col-sm-12">
													<c:choose>
													    <c:when test="${not empty blockList}">
													        <select name="blockId" id="blockId" class="form-control form-control-sm" required="required">
													            <option value="0">Select</option>
													            <c:forEach items="${blockList}" var="blc">
													                <option value="${blc.blockId}" ${blc.blockId eq villageData.blockId ? 'selected' : ''}>${blc.blockName}</option>
													            </c:forEach>
													        </select>
													    </c:when>
													    <c:otherwise>
													        <select name="blockId" id="blockId" class="form-control form-control-sm" required="required">
													            <option value="0">Select</option>
													        </select>
													    </c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
										<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Village :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control AlphaNumericOnly" id="villageName" name="villageName" value="${villageData.villageName}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="col-md-10 required" for="isActive">Status</label>
												<div class="col-md-10">
													<input type="radio" value="true" id="isActive1" name="isActive" ${villageData.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
													<input type="radio" value="false" id="isActive2"  name="isActive" ${villageData.isActive eq false ?'checked':''} required="required"> Inactive 
												</div> 
											</div>
										</div> 
									</div>
									<div class="row">
									<div class="col text-center mt-3">
											<c:choose>
												<c:when test="${not empty villageData}">
													<input type="button" name="add&ManageApplicationScheme" value="Update" id="addManageApplicationSchemes" class="btn btn-success btn-sm" onclick="submitFormData()">&nbsp;&nbsp;
													<a href="${contextPath}/mst/demography/village" type="button" class="btn btn-danger btn-sm">Back</a>
													
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
					<div class="row mt-3">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-header">
									<h4 class="card-title">Village List</h4>
								</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="basic-datatables" class="display table table-bordered table-hover DataTable" >
												<thead>
													<tr>
													    <th>Sl.No</th>
													    <th>District Name</th>
													    <th>Block Name</th>
													    <th>Village Name</th>
													    <th>Status</th>
														<th>Action</th> 													
													</tr>
												</thead>
												<tbody>
											 		<c:forEach items="${villageList}" var="vil" varStatus="count">
														<tr>
														    <td>${count.count}</td>
														    <td>${vil.blockModel.districtModel.distName}</td>
														    <td>${vil.blockModel.blockName}</td>
														    <td>${vil.villageName}</td>
														    <td>${vil.isActive eq true ? 'Active': 'InActive'}</td>
															<td>
															<button class="btn btn-warning btn-xs" data-toggle="tooltip" title="Edit"
														    	onclick="editById(${vil.villageId})">
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
					</div>
					
				</div>
		  <!-- Modal End -->
<form method="GET" id="formId">
	<input type="hidden" name="id" id="id">
</form>
	<script>
	function submitFormData(){
		
		
		var districtName=$("#distId").val();
		
		var blockName=$("#blockId").val();
		
		var villageName=$("#villageName").val();
		

		if(districtName==""|| districtName=="0"){
			bootbox.alert("Select District ");
			return false;
		}
		if(blockName=="" || blockName=="0" ){
			bootbox.alert("Select Block ");
			return false;
			}
		if(villageName==""){
			bootbox.alert("Enter Village Name");
			return false;
			}
		if ($('input[name="isActive"]:checked').val() == undefined) {
			bootbox.alert("Select Active Or InActive");
			return false;
		}else{	
		bootbox.confirm("Do You  Want To Continue?", function(result) {
					if (result) {
// 						$("#addManageApplicationSchemes").prop('disabled', true);
						$("#addVillageFrm").submit();
					}
				});
			}
	} 
	
	function editById(id){
		$("#id").val(id)
	    $("#formId").attr('action','${contextPath}/mst/villageEdit');
	    $("#formId").submit();
	}

	function getBlockByDistrictId(id){
		var districtId=$("#distId").val();
		debugger;
		 $.ajax({
				type : "GET",
				url : '${contextPath}/mst/blockList',
// 				dataType : "json",
				data : {
					"distId" : districtId,
				},
				success : function(response) {
					var html = "<option value='0' selected>-Select-</option>";
					var data = response;
					if (data != "" && data != null && data.length > 0) {
						$.each(data, function(index, value) {
							html = html + "<option value="+value.blockId+">"+ value.blockName+"</option>";
						});
					}
					$('#blockId').empty().append(html);
				},
				error : function(error) {
					bootbox.alert("Block list not found");
				}
			});
	}

	
	</script>
	
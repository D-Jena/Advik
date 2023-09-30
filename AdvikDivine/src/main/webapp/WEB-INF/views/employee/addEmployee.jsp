<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%-- 	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
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
						<h2 class="text-blue pb-2 fw-bold">Employee</h2>
					</div>
					<div class="ml-md-auto mb-4 py-2 py-md-0">
						<a href="${contextPath}/home" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a> 
						<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add Employee</a>
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
										<c:when test="${false}">
										<h4 class="card-title">Update Employee</h4>
										</c:when>
										<c:otherwise>
										<h4 class="card-title">Add Employee</h4>
										</c:otherwise>
									</c:choose> 
								</div>
								<div class="card-body">
									<form action="${contextPath}/common/addNupdateEmployee" id="addEmployeeFrm"	method="post" >
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
												<input type="hidden" name="employeeId" value="${employee.employeeId}" />
									<div class="row">
										<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Employee Name :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control form-control-sm" id="employeeName" name="employeeName" value="${employee.employeeName}"  required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Mobile No. :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control form-control-sm" id="vMobile" name="mobile" value="${employee.mobile}" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${employee.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${employee.isActive eq false ?'checked':''} required="required"> Inactive 
														</div> 
													</div>
											</div> 
										</div>
										<div class="row">
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">State :</label>
													<div class="col-sm-12">
														<select name="stateId" id="stateId" class="form-control form-control-sm" required="required" onchange="getDistrictsByStateId(this.value)">
							                                 <option value="" >Select</option>
						                                    <c:forEach items="${stateList}" var="state">
																<option value="${state.stateId}" ${state.stateId eq employee.stateId?'selected':''}>${state.stateName}</option>
															</c:forEach> 
							                              </select>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">District :</label>
													<div class="col-sm-12">
													<c:choose>
													    <c:when test="${not empty distList}">
													        <select name="distId" id="distId" class="form-control form-control-sm" required="required">
													            <option value="0">Select</option>
													            <c:forEach items="${distList}" var="dist">
													                <option value="${dist.distId}" ${dist.distId eq employee.distId ? 'selected' : ''}>${dist.distName}</option>
													            </c:forEach>
													        </select>
													    </c:when>
													    <c:otherwise>
													         <select name="distId" id="distId" class="form-control form-control-sm" required="required" >
																<option value="" >Select</option>
						                            		</select>
													    </c:otherwise>
													</c:choose>	
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Area :</label>
													<div class="col-sm-12">
													<input type="text" class="form-control form-control-sm AlphaNumericOnly" id="vArea" name="area" value="${employee.area}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required" for="text">Pin :</label>
													<div class="col-sm-12">
														<input type="text" class="form-control form-control-sm NumbersOnly" id="vPin" name="pin" value="${employee.pin}"  onchange="checkSpaces(this)" required maxlength="50">
													</div>
												</div>
											</div>
											<div class="col-md-3">
													<div class="form-group">
														<label class="col-sm-12 required" for="text">Landmark :</label>
														<div class="col-sm-12">
															<input type="text" class="form-control form-control-sm AlphaNumericOnly" id="vLandmark" name="landmark" value="${employee.landmark}"  onchange="checkSpaces(this)" required maxlength="50">
														</div>
													</div>
											</div>
											<div class="col-md-3">
													<div class="form-group">
														<label class="col-sm-12 required" for="text">Employee type :</label>
														<div class="col-sm-12">
															<input type="text" class="form-control form-control-sm AlphaNumericOnly" id="vType" name="employeeType" value="${employee.employeeType}"  onchange="checkSpaces(this)" required maxlength="50">
														</div>
													</div>
											</div>
										</div>
										<div class="row">
											<div class="col text-center mt-3">
												<c:choose>
													<c:when test="${not empty employee}">
														<input type="button" name="add&ManageEmployee" value="Update" id="add&ManageEmployee" class="btn btn-success btn-sm" onclick="submitFormData()">&nbsp;&nbsp;
														<a href="${contextPath}/home/" type="button" class="btn btn-danger btn-sm">Back</a>
														
													</c:when>
												<c:otherwise>
													<input type="button" name="add&ManageEmployee" value="Submit" id="add&ManageEmployee" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
														<a href="${contextPath}/home/" type="button" class="btn btn-danger btn-sm">Back</a>
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
					<c:if test="${empty employee}">
					<div class="row mt-3">
						<div class="col-md-12">
							<div class="card full-height">
								<div class="card-header">
									<h4 class="card-title">Employee List</h4>
								</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="basic-datatables" class="display table table-bordered table-hover DataTable" >
												<thead>
													<tr>
													    <th style="width: 30px">Sl.No</th>
													    <th>Employee Name</th>
													    <th>Employee Type</th>
													    <th>Mobile No.</th>
													    <th>State</th>
													    <th>District</th>
													    <th>Area</th>
													    <th>Pin</th>
													    <th>Landmark</th>
													    <th>Status</th>
														<th style="width: 30px">Action</th> 													
													</tr>
												</thead>
												<tbody>
											 		<c:forEach items="${employeeList}" var="ven" varStatus="count">
														<tr>
														    <td>${count.count}</td>
														    <td>${ven.employeeName}</td>
														    <td>${ven.employeeType}</td>
														    <td>${ven.mobile}</td>
														    <td>${ven.state.stateName}</td>
														    <td>${ven.district.distName}</td>
														    <td>${ven.area}</td>
														    <td>${ven.pin}</td>
														    <td>${ven.landmark}</td>
														    <td>${ven.isActive eq true ? 'Active': 'InActive'}</td>
															<td>
															<button class="btn btn-warning btn-xs" data-toggle="tooltip" title="Edit"
														    	onclick="editById(${ven.employeeId})">
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
		
		var stateId=$("#stateId").val();
		var districId=$("#distId").val();
		var mobile=$("#vMobile").val();
		var employee=$("#employeeName").val();
		var area=$("#vArea").val();
		var pin=$("#vPin").val();
		var landmark=$("#vLandmark").val();
		var type=$("#vType").val();
		
		if(stateId==""|| stateId=="0"){
			bootbox.alert("Select State ");
			return false;
		}

		if(districId==""|| districId=="0"){
			bootbox.alert("Select District ");
			return false;
		}
		if(mobile=="" || mobile=="0" ){
			bootbox.alert("Select Mobile ");
			return false;
			}
		if(employee=="" || employee=="0" ){
			bootbox.alert("Select employee name ");
			return false;
			}
		if(area==""){
			bootbox.alert("Enter Location");
			return false;
			}
		if(pin==""){
			bootbox.alert("Enter pin");
			return false;
			}
		if(landmark==""){
			bootbox.alert("Enter landmark");
			return false;
			}
		if(type==""){
			bootbox.alert("Enter employee type");
			return false;
			}
		if ($('input[name="isActive"]:checked').val() == undefined) {
			bootbox.alert("Select Active Or InActive");
			return false;
		}else{	
		bootbox.confirm("Do You  Want To Continue?", function(result) {
					if (result) {
						$("#addEmployeeFrm").submit();
					}
				});
			}
	}  
	
	function editById(id){
		debugger;
		$("#id").val(id)
	    $("#formId").attr('action','${contextPath}/common/employeeEdit');
	    $("#formId").submit();
	}


	
	
	function getDistrictsByStateId(stateId) {
		debugger;
		$("#distId").empty();
	    $('<option>').val('').text('-Select-').appendTo("#distId");
	    var html = '<option>'
		if (stateId != '') {
			$.ajax({
				type: "GET",
			    url: "${contextPath}/common/distsByStateId",
			    data: {
			    	"stateId" : stateId,	
			    },
			    success: function(data) {
			        $.each(data, function (distId, distName) {
			        $('<option>').val(distId).text(distName).appendTo("#distId");
				});
			    },
				error : function(error) {
					bootbox.alert("Something went wrong.");
				}
			});
		}
	}
	</script>
	
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
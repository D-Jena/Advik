	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
		<div class="content">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-4">
			<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-blue pb-2 fw-bold"><spring:message code="site.admin.mst.manage.role"></spring:message></h2>
				</div>
				<div class="ml-md-auto mb-4 py-2 py-md-0">
					<a href="${contextPath}" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a>
					<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/ <spring:message code="site.admin.mst.manage.role"></spring:message></a>
				</div>
			</div>
		</div>
	</div>
	<div class="page-inner mt-5 pb-0">
		<div class="row mt-2">
			<div class="col-md-12">
				<div class="card full-height">
					<div class="card-header">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
						<h4 class="card-title"><spring:message code="site.admin.mst.add.role"></spring:message></h4>
					</div>
					<div class="card-body">
						<div class="row">
						<%@ include file="/WEB-INF/views/message.jsp"%>
								<div class="col-md-12">
								<form class="form-horizontal" action="${contextPath}/admin/role/addNupdate" method="POST">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
									<input type="hidden" name="roleId" value="${userDetails.roleId}"/>
									<div class="row">
										<div class="col-md-12">
											<%-- <div class="col-md-3">
												<div class="form-group">
													<label class="col-md-12 required" for="complaintName"><spring:message code="site.admin.mst.role.name"></spring:message></label>
													<div class="col-md-12">
														<input type="text" id="roleName" name="roleName" value="${userDetails.displayName}" class="form-control form-control-sm" required="required">
													</div>
												</div>
											</div> --%>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-md-12 required" for="complaintName"><spring:message code="site.admin.mst.role.code"></spring:message></label>
													<div class="col-md-12">
														<input type="text" id="roleCode" name="roleCode" value="${userDetails.roleCode}" class="form-control form-control-sm" maxlength="30" required="required" onchange="roleCodeValidation();">
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-md-12 required" for="complaintAge"><spring:message code="site.admin.mst.role.display.name"></spring:message></label>
													<div class="col-md-12">
														<input type="text" id="displayName" name="displayName" value="${userDetails.displayName}" maxlength="30" class="form-control form-control-sm" required="required">
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class="col-md-12 required" for="Email"><spring:message code="site.admin.mst.role.description"></spring:message></label>
													<div class="col-md-12">
														<input type="text" name="description" id="description" class="form-control form-control-sm"  maxlength="30" value="${userDetails.description}" required="required">  
													</div>
												</div>
											</div> 
											<div class="col-md-2">
												<div class="form-group">
													<label class="col-md-12 required" for="maxAssignments"><spring:message code="site.admin.mst.role.maxassignments"></spring:message></label>
													<div class="col-md-12">
														<input type="number" min="-1" name="maxAssignments" id="maxAssignments" class="form-control form-control-sm" maxlength="30"  value="${userDetails.maxAssignments}" required="required">  
													</div>
												</div>
											</div> 
										</div>
									</div>
									<div class="card-footer text-center mt-2">
											<input type="submit" value="<spring:message code="site.common.submit"></spring:message>"
										 class="btn btn-success btn-xs">
										 <a href="${contextPath}/admin/role/list" class="btn btn-warning btn-sm">Cancel</a>
									</div>
								</form>
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-12">
				<div class="card full-height">
					<div class="card-header">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
						<h4 class="card-title"><spring:message code="site.admin.mst.role.list"></spring:message></h4>
					</div>
					<div class="card-body">
						<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
										<table id="basic-datatables" class="DataTable display table table-bordered table-hover" >
											<thead>
												<tr>
													<th>Sl no.</th>
													<th><spring:message code="site.admin.mst.role.code"></spring:message></th>
													<%-- <th><spring:message code="site.admin.mst.role.name"></spring:message></th> --%>
													<th><spring:message code="site.admin.mst.role.display.name"></spring:message></th>
													<th><spring:message code="site.admin.mst.role.description"></spring:message></th>
													<th style="width: 190px;"><spring:message code="site.common.action"></spring:message></th> 													
												</tr>
											</thead>
											<tbody id="tbd">
										 	   <c:forEach items="${roleList}" var="role" varStatus="roleCount"> 
													<tr>
														<td>${roleCount.count}</td>
														<td>${role.roleCode}</td>
<%-- 														<td>${role.displayName}</td> --%>
														<td>${role.displayName}</td>
														<td>${role.description}</td>
														<td>
														<button class="btn btn-warning btn-xs" onclick="editApplicationById('${role.roleId}')" title="Edit Role">
															<i class="fa fa-edit" ></i>
														</button>
														<button class="btn btn-primary btn-xs" onclick="viewApplicationById('${role.roleId}')" title="View Role">
															<i class="fa fa-eye" ></i>
														</button>
														<c:if test="${role.isActive eq true}">
															<button class="btn btn-danger btn-xs" onclick="lockUser('${role.roleId}')" title="Lock Role" >
																<i class="fa fa-lock" aria-hidden="true" ></i>
															</button>
														</c:if>
														<c:if test="${role.isActive eq false}">
															<button class="btn btn-success btn-xs" onclick="unlockUser('${role.roleId}')" title="Unlock Role">
																<i class="fa fa-unlock-alt" aria-hidden="true"></i>
															</button> 
														</c:if>
														<button class="btn btn-info btn-xs" onclick="mapRoleLevel('${role.roleId}')" title="Link Role To Level">
															<i class="fa fa-link" ></i>
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
	</div>
	</div>
		<form  method="GET" id="formId">
</form>
<form action="${contextPath}/admin/role/isActive" method="POST" id="lockNunlockForm">
		<input type="hidden" name="roleId" id="roleId" />
		<input type="hidden" name="isActive" id="isActive" /> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
	
	<script >
	function roleCodeValidation(){
		var roleCode = $("#roleCode").val();  
		$.ajax({
			type : "GET",
			url : "${contextPath}/admin/role/validate-role-code",
			data : {
				"roleCode" : roleCode,
			}, 
			success : function(response) {
				var val = JSON.parse(response); 
				if (val.isDuplicate == true) {
					bootbox.alert("Duplicate role code not allowed"); 
					$("#roleCode").val("");
				}  
			}, 
			error : function(error) {
				//bootbox.alert("Failure"); 
			}
		});
	} 
		function editApplicationById(id){
				    $("#formId").attr('action','${contextPath}/admin/role/edit/'+ id +'');
				    $("#formId").submit();
		}

		function viewApplicationById(id){
			         $("#formId").attr('action','${contextPath}/admin/role/view/'+ id +'');
					    $("#formId").submit();
		 }

		function unlockUser(roleId){
			 $("#isActive").val(true);
			 $("#roleId").val(roleId);
			    bootbox.confirm("Do you want to unlock this role?",
			            function(result) {
			                    if (result == true) {
			                            $("#lockNunlockForm").submit();
			                    }
			            });
				 }
		function lockUser(roleId){
			 $("#isActive").val(false);
			 $("#roleId").val(roleId);
			    bootbox.confirm("Do you want to lock this role?",
			            function(result) {
			                    if (result == true) {
			                            $("#lockNunlockForm").submit();
			                    }
			            });
				 }
		
		function mapRoleLevel(roleId){
			window.location = "${contextPath}/admin/role/roleLevelMap/" + roleId;
		}
	</script>
	

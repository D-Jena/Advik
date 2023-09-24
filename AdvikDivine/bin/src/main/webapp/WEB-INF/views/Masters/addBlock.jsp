
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/assets/appJs/validation/copyPasteCheck.js"></script>
<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
<script
	src="${contextPath}/assets/appJs/applicationSpecific/commonApis.js"></script>
<style>
.form-control {
	padding: 4px 8px;
}
</style>
<div class="content">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-4">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<!-- <h2 class="text-blue pb-2 fw-bold">Component</h2> -->
				</div>
				<div class="ml-md-auto mb-4 py-2 py-md-0">
					<a href="${contextPath}/home"
						class="btn btn-sm btn-border btn-blue btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add
						Component</a>
				</div>
			</div>
		</div>
	</div>
	<div class="page-inner mt-5 pb-0">
		<div class="row mt-2">
			<%@ include file="/WEB-INF/views/message.jsp"%>
			<div class="col-md-12">
				<div class="card full-height">
					<div class="card-header">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
						<h4 class="card-title">Component</h4></div>
					<div class="card-body">
						<form action="${contextPath}/mst/add" id="submitcomponent"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"> <input type="hidden"
								name="componentId" value="${componentData.componentId }" />
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">Scheme
											Name</label>
										<div class="col-sm-12">
											<c:if test="${not empty componentData.schemeId.schemeId}">
												<select name="schemeId.schemeId" id="schemeId"
													class="form-control form-control-sm" required="required"
													readOnly="">
													<option value="">Select</option>
													<c:forEach items="${scheme}" var="scheme">
														<option value="${scheme.schemeId}"
															${scheme.schemeId eq componentData.schemeId.schemeId?'selected':''}>${scheme.schemeName}</option>
													</c:forEach>
												</select>
											</c:if>
											<c:if test="${empty componentData.schemeId.schemeId  }">
												<select name="schemeId.schemeId" id="schemeId"
													class="form-control form-control-sm" required="required">
													<option value="">Select</option>
													<c:forEach items="${scheme}" var="scheme">
														<option value="${scheme.schemeId}"
															${scheme.schemeId eq componentData.schemeId.schemeId?'selected':''}>${scheme.schemeName}</option>
													</c:forEach>
												</select>
											</c:if>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">Component Name:</label>
										<div class="col-sm-12">
											<input type="text" class="form-control AlphaNumericOnly"
												id="compNameId"  name="componentName"
												value="${componentData.componentName}" maxlength="150">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">Component Code:</label>
										<div class="col-sm-12">
											<input type="text" class="form-control AlphaNumericOnly"
												id="componentCodeId" name="componentCode"
												value="${componentData.componentCode}" required
												maxlength="10"
												onchange="componentCodeValidation(this.value);">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-md-10 required" for="isActive">Status</label>
										<div class="col-md-10">
										<%-- 	<input type="radio" value="true" id="isActive1"
												name="isActive"
												${componentData.isActive eq true ?'checked':''} checked>
											Active &nbsp;&nbsp; <input type="radio" value="false"
												id="isActive2" name="isActive"
												${componentData.isActive eq false ?'checked':''}>
											Inactive --%>
											  <input type="radio" value="true" id="isActive1"
												name="isActive" ${componentData.isActive eq true ?'checked':''}
												checked> Active &nbsp;&nbsp;
												 <input type="radio"
												value="false" id="isActive2" name="isActive"
												${componentData.isActive eq false ?'checked':''}>
											Inactive
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col text-center mt-3">
									  <button type="button" class="btn btn-sm btn-success" onclick="saveComponentForm();">${not empty componentData ? 'Update' : 'Submit'}</button>									
									<%-- <a href="${contextPath}/home" type="button" class="btn btn-danger btn-sm"><spring:message code="mst.back.name"></spring:message></a> --%>
									<%-- <button type="reset" class="btn btn-warning btn-sm"><spring:message code="mst.reset.name"></spring:message></button> --%>
									<button type="button" value="Go back!"
										class="btn btn-danger btn-sm" onclick="history.back()">Back</button>
									<!-- 		<button type="button" type="reset" value="Reset"
										class="btn btn-info btn-sm" onclick="resetForm()">Reset</button> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
<c:if test="${empty componentData.schemeId}">
	<div class="row mt-2">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
				<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
					<h4 class="card-title">ComponentList</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="basic-datatables"
							class="display table table-bordered table-hover DataTable">
							<thead>
								<tr>
									<th><spring:message code="mst.serialNo.name"></spring:message></th>
									<th>Scheme Name</th>
									<th>Component Name</th>
									<th>Component Code</th>
									<th><spring:message code="mst.status.name"></spring:message></th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ComponentList}" var="cmp" varStatus="count">
									<tr>
										<td>${count.count}</td>
										<td>${cmp.schemeId.schemeName}</td>
										<td>${cmp.componentName}</td>
										<td>${cmp.componentCode}</td>
										<td>${cmp.isActive eq true ? 'Active': 'InActive'}</td>
										<%--  <td>${cmp.isActive eq true ? 'Active': 'InActive'}</td> --%>
										<td><a
											href="${contextPath}/mst/addNupdate/${cmp.componentId}"
											class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a></td>
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
<script>
	function componentCodeValidation() {
		var componentCode = $("#componentCodeId").val();
		console.log(componentCode)
		if (componentCode != '') {
			$.ajax({
				type : "GET",
				url : "${contextPath}/mst/validatecomponentCode",
				data : {
					"componentCode" : componentCode,
				},
				success : function(response) {
					//bootbox.alert(response.isDuplicate);
					if (response.isDuplicate == 'yes') {
						bootbox.alert("Duplicate project Code not allowed");
						$("#componentCodeId").val('');
						return false;
					}
				},
				error : function(error) {
					bootbox.alert("Something went wrong.");
				}
			});
		}
	}
	function saveComponentForm() {
		if ($("#schemeId").val() == "" /* || $("#schemeId").val() == "0" */) {
			bootbox.alert("Please Select Scheme....");
			return false;
		}
		else if($("#compNameId").val() == "") {
			bootbox.alert("Please Select Component ");
			return false;
		}

		else if( $("#componentCodeId").val() == "") {
			bootbox.alert("Please Select ComponentCode");
			return false;
		} else {
			var flag = window.confirm("Do you want Submit ?");
			if (flag == true) {
				$("#submitcomponent").submit();
			}
		}
	}
		</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="content">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-white mt-2 fw-bold">Add & Manage Grampanchayat</h2>
				</div>
				<div class="ml-md-auto py-2 py-md-0">
					<a href="${contextPath}/"
						class="btn btn-white btn-border btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-white btn-border btn-round"> Manage
						Grampanchayat</a>
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
							<c:when test="${not empty grampanchayatData.gpId}">
								<h4 class="card-title">Update Grampanchayat</h4>
							</c:when>
							<c:otherwise>
								<h4 class="card-title">Add Grampanchayat</h4>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="card-body">
						<div class="row">
							<form action="${contextPath}/admin/gramapanchayat/save"
								id="addManageId" method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="gpId"
									value="${grampanchayatData.gpId}" id="gpId" />
								<div class="col-md-12">
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="state">State</label>
											<div class="col-md-12">
												<select name="state.stateId" id="stateId"
													class="form-control form-control-sm AlphaNumericWithLimitedSpecialChars"
													required="required"
													onchange="findDistrictListByStateId(this.value,0)">
													<option value="">--Select--</option>
													<c:forEach items="${stateList}" var="state">
														<option value="${state.stateId}"
															${state.stateId eq grampanchayatData.block.district.state.stateId?'selected':''}>${state.stateName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="state">District</label>
											<div class="col-md-12">
												<select name="districtId" id="districtId"
													class="form-control form-control-sm" required="required"
													onchange="findBlockListByDistrictId(this.value)">
													<option value="">--Select--</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="state">Block </label>
											<div class="col-md-12">
												<select name="block.blockId" id="blockId"
													class="form-control form-control-sm" required="required">
													<option value="">--Select--</option>
													<c:if test="${not empty grampanchayatData}">
														<option value="${grampanchayatData.block.blockId}"
															selected>${grampanchayatData.block.blockName}</option>
													</c:if>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="blockNameEN">GP
												Name</label>
											<div class="col-md-12">
												<input type="text"
													class="form-control form-control-sm AlphaNumericWithLimitedSpecialChars"
													id="gpNameEn" name="gpNameEn"
													value="${grampanchayatData.gpName}" required="required"
													maxlength="100">
											</div>
										</div>
									</div>

									<c:choose>
										<c:when test="${not empty grampanchayatData.gpId}">
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-md-12 required" for="schemeCode">GP
														Code</label>
													<div id="hideCodeId">
														<div class="col-md-12">
															<input type="text"
																class="form-control form-control-sm AlphaNumericWithLimitedSpecialChars"
																id="gpCode" value="${grampanchayatData.gpCode}"
																maxlength="64" name="gpCode" required="required">
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-md-3">
												<div class="form-group">
													<label class="col-md-12 required" for="schemeCode">GP
														Code</label>
													<div id="hideCodeId">
														<div class="col-md-12">
															<input type="text"
																class="form-control form-control-sm AlphaNumericWithLimitedSpecialChars"
																id="gpCode" value="${grampanchayatData.gpCode}"
																maxlength="150" name="gpCode" required="required">
														</div>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>

									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="isActive">Status</label>
											<div class="col-md-12">
												<input type="radio" value="true" id="isActive1"
													name="isActive"
													${grampanchayatData.isActive eq true ?'checked':''}
													required="required"> Active &nbsp;&nbsp; <input
													type="radio" value="false" id="isActive2" name="isActive"
													${grampanchayatData.isActive eq false ?'checked':''}
													required="required"> Inactive
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="text-center" style="margin-top: 20px;">
										<c:choose>
											<c:when test="${not empty grampanchayatData}">
												<input type="button" name="add&ManageApplicationScheme"
													value="Update" id="add&ManageApplicationSchemes"
													class="btn btn-success btn-sm" onclick="submitFormData()">&nbsp;&nbsp;
														<a href="${contextPath}/admin/gramapanchayat/list"
													type="button" class="btn btn-warning btn-sm">Back</a>
											</c:when>
											<c:otherwise>
												<input type="button" name="add&ManageApplicationScheme"
													value="Submit" id="add&ManageApplicationSchemes"
													class="btn btn-success btn-sm" onclick="submitFormData()">&nbsp;&nbsp;
														<a href="${contextPath}/home" type="button"
													class="btn btn-warning btn-sm">Back</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


<!-- Modal End -->

<script>
	function findDistrictListByStateId(stateId,districtId) {
		if(stateId==""){
			var html = "<option value='' selected>--Select--</option>";
			$('#districtId').empty().append(html);
			$('#blockId').empty().append(html);
		}else{
				$.ajax({
				type : "GET",
				url : '${contextPath}/common/findDistrictListByStateId',
				dataType : "json",
				data : {
					"stateId" : stateId,
				},
				success : function(response) {
					var html = "<option value='' selected>-Select-</option>";
					var data = response;
					if (data != "" && data != null && data.length > 0) {
						$.each(data, function(index, value) {
							html = html + "<option value="+value.districtId+">"
									+ value.districtName + "</option>";
						});
					}
					$('#districtId').empty().append(html);
					if(districtId!=0){
						$('#districtId').val(districtId);
					}
				},
				error : function(error) {
					bootbox.alert("<spring:message code="site.common.msg.district"></spring:message>");
				}
			});
		}
	}
	
	function findBlockListByDistrictId(districtId,blockId) {
		$.ajax({
			type : "GET",
			url : '${contextPath}/common/findBlockListByDistrictId',
			dataType : "json",
			data : {
				"districtId" : districtId,
			},
			success : function(response) {
				var html = "<option value='' selected>-Select-</option>";
				var data = response;
				if (data != "" && data != null && data.length > 0) {
					$.each(data, function(index, value) {
						html = html + "<option value="+value.blockId+">"
								+ value.blockName + "</option>";
					});
				}
				$('#blockId').empty().append(html);
				if(blockId!=0){
					$('#blockId').val(blockId);
				}
				
			},
			error : function(error) {
				bootbox.alert("<spring:message code="site.common.msg.block"></spring:message>");
			}
		});
	}
	
	function submitFormData(){
		var gpCode = $("#gpCode").val();  
		var gpId = $("#gpId").val();
		var gpName = $("#gpNameEn").val();

		if($("#stateId").val()==""){
			bootbox.alert("Select State");
			return false;
		}
		if($("#districtId").val()==""){
			bootbox.alert("Select District");
			return false;
		}
		if($("#blockId").val()==""){
			bootbox.alert("Select Block");
			return false;
		}
		if($("#gpNameEn").val()==""){
			bootbox.alert("Enter gp Name");
			return false;
		}
		if($("#gpCode").val()==""){
			bootbox.alert("Select gp Code");
			return false;
		}
		if($('input[name="isActive"]:checked').val()==undefined){
			bootbox.alert("Select Active Or InActive");
			return false;
		}
		else{
			$.ajax({
				type : "GET",
				url : "${contextPath}/admin/gramapanchayat/validateGpName",
				data : {
					"gramapanchayatName" : gpName,
					"grampanchayatId" :gpId,
					"type" :"Grampanchayat"
				}, 
				success : function(response) {
					if (response.isDuplicate == 'true') {
						bootbox.alert("Duplicate Gp Name Not Allowed"); 
						$("#gpNameEn").val("");
					}else{
						$.ajax({
							type : "GET",
							url : "${contextPath}/admin/gramapanchayat/validateGpCode",
							data : {
								"grampanchayatCode" : gpCode,
								"grampanchayatId" :gpId,
								"type" :"Grampanchayat"
							}, 
							success : function(response) {
								if (response.isDuplicate == 'true') {
									bootbox.alert("Duplicate Gp Code Not Allowed"); 
									$("#gpCode").val("");
								}else{
									$("#addManageId").submit();
								} 
							}, 
							error : function(error) {
							}
						});
					} 
				}, 
				error : function(error) {
				}
			});
		}
		
}
	
	
	$(function(){
		var districtId = '${grampanchayatData.block.district.districtId}';
		var blockId = '${grampanchayatData.block.blockId}';
		var stateId = '${grampanchayatData.block.district.state.stateId}';
		
		findDistrictListByStateId(stateId,districtId);
		findBlockListByDistrictId(districtId,blockId);
	});
	</script>

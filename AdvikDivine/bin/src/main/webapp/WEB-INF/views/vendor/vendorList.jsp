
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
					<h2 class="text-white mt-2 fw-bold">Add & Manage Village</h2>
				</div>
				<div class="ml-md-auto py-2 py-md-0">
					<a href="${contextPath}/"
						class="btn btn-white btn-border btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-white btn-border btn-round">View
						Village</a>
				</div>
			</div>
		</div>
	</div>
		<div class="page-inner">
		<div class="row mt-5">
			<%@ include file="/WEB-INF/views/message.jsp"%>
			<div class="col-md-12">
				<div class="card full-height">
					<div class="card-header">
					<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row">
								<div class="col-md-12">
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 required" for="state">District</label>
											<div class="col-md-12">
												<select name="districtId" id="districtId"
													class="form-control form-control-sm" required="required">
													<option value="">--Select--</option>
													<c:forEach items="${districtList}" var="districtList">
														<option value="${districtList.districtId}"
															${districtList.districtId eq districtId  ?'selected':''}>${districtList.districtName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="Fillter" style="margin-top:23px;">
									<button type="button" onclick="villageListByDistrictId()"
											class="btn btn-primary btn-sm">Filter </button>
									<button type="button" value="Go back!"
										class="btn btn-danger btn-sm" onclick="history.back()">Back</button>
									</div>
								</div>
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
	

		<div class="row mt-2">
			<%@ include file="/WEB-INF/views/message.jsp"%>
			<div class="col-md-12">
				<div class="card full-height">
				<div class="card-header">
					<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
					</div>
					<div class="card-header">
						<h4 class="card-title">Village List</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="basic-datatables"
								class="display table table-bordered table-hover DataTable">
								<thead>
									<tr>
										<th>Sl.No</th>
										<th>District Name</th>
										<th>Block Name</th>
										<th>Gp Name</th>
										<th>Village Name</th>
										<th>Village Code</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="tbd">
									<c:forEach items="${villageList}" var="village"
										varStatus="count">
										<tr>
											<td>${count.count}</td>
											<td>${village.panchayat.block.district.districtName}</td>
											<td>${village.panchayat.block.blockName}</td>
											<td>${village.panchayat.gpName}</td>
											<td>${village.villageName}</td>
											<td>${village.villageCode}</td>
											<c:if test="${village.isActive eq true }">
												<td>Active</td>
											</c:if>
											<c:if test="${village.isActive eq false }">
												<td>InActive</td>
											</c:if>

											<td>
												<button class="btn btn-warning btn-sm"
													onclick="editVillageById('${village.villageId}')">
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
<form method="GET" id="formId"></form>
<!-- Atlantis JS -->
<script src="../assets/js/atlantis.min.js"></script>
<script>
		
	function editVillageById(id){
	    $("#formId").attr('action','${contextPath}/admin/village/edit/'+ id +'');
	    $("#formId").submit();
   }
	
	function villageListByDistrictId(){
		var districtId=$("#districtId").val();
		console.log(districtId)
		if(districtId==""){
					bootbox.alert("Please Distrct");
					return false;
		}
			window.location='${contextPath}/admin/village/fetchVillageList?districtId='+districtId ;
		}
	</script>


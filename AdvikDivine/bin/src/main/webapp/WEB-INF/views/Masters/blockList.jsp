
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
					<h2 class="text-white mt-2 fw-bold">View Block</h2>
				</div>
				<div class="ml-md-auto py-2 py-md-0">
					<a href="${contextPath}/"
						class="btn btn-white btn-border btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-white btn-border btn-round"> View Block</a>
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
						<h4 class="card-title">Block List</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="basic-datatables"
								class="display table table-bordered table-hover DataTable">
								<thead>
									<tr>
										<th>Sl.No</th>
										<th>District</th>
										<th>Block Name</th>
										<th>Block Code</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="tbd">
									<c:forEach items="${blockList}" var="block" varStatus="count">
										<tr>
											<td>${count.count}</td>
											<td>${block.district.districtName}</td>
											<td>${block.blockName}</td>
											<td>${block.blockCode}</td>
											<c:if test="${block.isActive eq true }">
												<td>Active</td>
											</c:if>
											<c:if test="${block.isActive eq false }">
												<td>InActive</td>
											</c:if>

											<td>
												<button class="btn btn-warning btn-sm"
													onclick="editBlockById('${block.blockId}')">
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
<script>
	function editBlockById(id) {
		$("#formId").attr('action',
				'${contextPath}/admin/block/edit/' + id + '');
		$("#formId").submit();
	}
</script>



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
.hidden-cell {
  display: none;
}
</style>
<div class="content">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-4">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<!-- <h2 class="text-blue pb-2 fw-bold">Block</h2> -->
				</div>
				<div class="ml-md-auto mb-4 py-2 py-md-0">
					<a href="${contextPath}/home"
						class="btn btn-sm btn-border btn-blue btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add
						Block</a>
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
						<h4 class="card-title">Add or update Block</h4>
					</div>
					<div class="card-body">
						<form action="${contextPath}/mst/addNupdateBlock" id="submitBlock"
							method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"> <input type="hidden"
								name="blockId" id="blockId" value="" />
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">District
											Name</label>
										<div class="col-sm-12">
											<select name="distId" id="districtId"
												class="form-control form-control-sm" required="required" onchange="resetBlock()">
												<option value="">Select</option>
												<c:forEach items="${distList}" var="district">
													<option value="${district.distId}">${district.distName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">Block
											Name:</label>
										<div class="col-sm-12">
											<input type="text" class="form-control AlphaNumericOnly"
												id="blockName" name="blockName" value="" maxlength="15"
												onchange="blockNameValidation()">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-sm-12 required" for="text">Block
											Code:</label>
										<div class="col-sm-12">
											<input type="text" class="form-control AlphaNumericOnly"
												id="blockCode" name="blockCode" value="" required
												onchange="blockCodeValidation()">
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label class="col-md-10 required" for="isActive">Status</label>
										<div class="col-md-10">
											<input type="radio" value="true" id="isActive1"
												name="isActive" ${blockData.isActive eq true ?'checked':''}
												checked> Active &nbsp;&nbsp; 
											<input type="radio"
												value="false" id="isActive2" name="isActive"
												${blockData.isActive eq false ?'checked':''}>
											Inactive
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col text-center mt-3">
									<button type="button" class="btn btn-sm btn-success" id="submitUpdateBtn"
										onclick="saveBlockForm();">Submit</button>
									<button type="button" value="Go back!"
										class="btn btn-danger btn-sm" onclick="history.back()">Back</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${empty block}">
			<div class="row mt-2">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="panel-actions">
								<a href="#" class="fa fa-caret-down"></a>
							</div>
							<h4 class="card-title">BlockList</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="myTable"
									class="display table table-bordered table-hover DataTable">
									<thead>
										<tr>
											<th>Sl No.</th>
											<th>District Name</th>
											<th>Block Name</th>
											<th>Block Code</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${blockList}" var="block" varStatus="count">
											<tr>
												<td>${count.count}</td>
												<td id="dName${count.count}">${block.districtModel.distName}</td>
												<td id="bName${count.count}">${block.blockName}</td>
												<td id="bCode${count.count}">${block.blockCode}</td>
												<td id="status${count.count}">${block.isActive eq true ? 'Active': 'InActive'}</td>
												<%--  <td>${block.isActive eq true ? 'Active': 'InActive'}</td> --%>
												<td>
<%-- 												<a href="${contextPath}/mst/updateBlock/${block.blockId}" --%>
<!-- 													class="btn btn-xs btn-primary"><i class="fa fa-edit"></i></a> -->
													<button class="btn btn-warning btn-xs editById" title="Edit"
														    	id="editBtn" value="${block.blockId}">
																<i class="fas fa-edit"></i>
													</button>
												</td>
												<td class = "hidden-cell">${block.districtModel.distId}</td>
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

debugger
	$(document).ready(function () {
		debugger
	    $(".editById").on("click", function () {
	      const currentRow = $(this).closest("tr");
// 	      const cellData1 = currentRow.find("td:nth-child(1)").text();
	      const cellData2 = currentRow.find("td:nth-child(2)").text();
	      const cellData3 = currentRow.find("td:nth-child(3)").text();
	      const cellData4 = currentRow.find("td:nth-child(4)").text();
	      const cellData5 = currentRow.find("td:nth-child(5)").text();
	      const cellData7 = currentRow.find("td:nth-child(7)").text();
	      const button = document.getElementById("submitUpdateBtn");
		  button.textContent="Update";
		  const buttonValue = $(this).val();
	      $("#districtId").val(cellData7);
	      $("#blockName").val(cellData3);
	      $("#blockCode").val(cellData4);
	      $("#blockId").val(buttonValue);
	      if(cellData5 == 'Active'){
	    	  $("#isActive1").prop("checked", true);
	      }else{
	    	  $("#isActive2").prop("checked", true);
	      }
	      
	    });
	  });


	function blockCodeValidation() {
		var blockCode = $("#blockCode").val();
		if (blockCode != '') {
			$.ajax({
				type : "GET",
				url : "${contextPath}/mst/validateUniqueBlockCode",
				data : {
					"blockCode" : blockCode,
				},
				success : function(response) {
					if (response == 'yes') {
						bootbox.alert("Duplicate Block Code not allowed");
						$("#blockCode").val('');
						return false;
					}
				},
				error : function(error) {
					bootbox.alert("Something went wrong.");
				}
			});
		}
	}

	function blockNameValidation() {
		var blockName = $("#blockName").val();
		if (blockName != '') {
			$.ajax({
				type : "GET",
				url : "${contextPath}/mst/validateUniqueBlockName",
				data : {
					"blockName" : blockName,
				},
				success : function(response) {
					if (response == 'yes') {
						bootbox.alert("Duplicate Block Name not allowed");
						$("#blockName").val('');
						return false;
					}
				},
				error : function(error) {
					bootbox.alert("Something went wrong.");
				}
			});
		}
	}
	function saveBlockForm() {
		debugger;
		if ($("#districtId").val() == "") {
			bootbox.alert("Please Select District....");
			return false;
		} else if ($("#blockName").val() == "") {
			bootbox.alert("Enter Block name. ");
			return false;
		}

		else if ($("#blockCode").val() == "") {
			bootbox.alert("Please enter BlockCode");
			return false;
		} else {
			bootbox.confirm("Do you want Submit or not ?", function(result) {
				if (result) {
					$("#submitBlock").submit();
				}
			});
		}
	}
	
	function resetBlock(){
		$("#blockName").val("");
		$("#blockCode").val("");
	}
</script>

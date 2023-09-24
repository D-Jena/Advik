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
						<h2 class="text-blue pb-2 fw-bold">Financial Year</h2>
					</div>
					<div class="ml-md-auto mb-4 py-2 py-md-0">
						<a href="${contextPath}/home" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a> 
						<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add Financial Year</a>
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
										<h4 class="card-title">Add Financial Year</h4>
								</div>
								<div class="card-body">
									<form action="${contextPath}/common/finYrSaveNupdate" id="addFinYrFrm"	method="post" >
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
											<input type="hidden" name="financialYearId" value="${finYrMdl.financialYearId}">
									<div class="row">
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">Financial Year:</label>
															<div class="col-sm-12">
																<input type="text" class="form-control form-control-sm" id="financialYear" name="financialYear"  onchange="checkDuplicateDist()" required maxlength="15" value="${finYrMdl.financialYear}">
															</div>
														</div>
												</div>
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">Start Date :</label>
															<div class="col-md-12 datepicker_con">
																<input type="text" class="form-control form-control-sm" id="startDate" name="startDate"  onchange="checkCodeDuplicate()" required maxlength="5" value="${finYrMdl.startDate}" >
															</div>
														</div>
												</div>
												<div class="col-md-3">
														<div class="form-group">
															<label class="col-sm-12 required" for="text">End Date :</label>
															<div class="col-md-12 datepicker_con">
																<input type="text" class="form-control form-control-sm" id="endDate" name="endDate"  onchange="checkCodeDuplicate()" required maxlength="5" value="${finYrMdl.endDate}" >
															</div>
														</div>
												</div>
												<div class="col-md-3">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${finYrMdl.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${finYrMdl.isActive eq false ?'checked':''} required="required"> Inactive 
														</div> 
													</div>
												</div> 
										</div>
												<div class="row">
												<div class="col text-center mt-3">
														<c:choose>
															<c:when test="${not empty finYrMdl}">
																<input type="button" name="add&ManageApplicationScheme" value="Update" id="addManageApplicationSchemes" class="btn btn-success btn-sm" onclick="submitFormData()" >&nbsp;&nbsp;
																<a href="${contextPath}/" type="button" class="btn btn-danger btn-sm">Back</a>
																
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
									<h4 class="card-title">Financial Year List</h4>
								</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="basic-datatables" class="display table table-bordered table-hover DataTable" >
												<thead>
													<tr>
													    <th>Sl.No</th>
													    <th>Financial Year</th>
													    <th>Start Date</th>
													    <th>End Date</th>
													    <th>Satus</th>
														<th style="width: 30px">Action</th> 													
													</tr>
												</thead>
												<tbody>
											 		<c:forEach items="${finList}" var="fin" varStatus="count">
														<tr> 
														    <td>${count.count}</td>
														    <td>${fin.financialYear}</td>
														    <td>${fin.startDate}</td>
														    <td>${fin.endDate}</td>
														    <td>${fin.isActive eq true ? 'Active': 'InActive'}</td>
															<td>
															<button class="btn btn-warning btn-xs" data-toggle="tooltip" title="Edit"
														    	onclick="editById(${fin.financialYearId})">
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
		
		if ($("#financialYear").val() == "") {
			bootbox.alert("Enter financial year .");
			return false;
		}
		if ($("#startDate").val() == "") {
			bootbox.alert("Enter start date .");
			return false;
		}
		if ($("#endDate").val() == "") {
			bootbox.alert("Enter end date .");
			return false;
		}
		if ($('input[name="isActive"]:checked').val() == undefined) {
			bootbox.alert("Select Active Or InActive");
			return false;
		}else{	
			bootbox.confirm("Do You  Want To Continue?", function(result) {
						if (result) {
							$("#addFinYrFrm").submit();
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
	    $("#formId").attr('action','${contextPath}/common/finYrEdit');
	    $("#formId").submit();
	}
	
	$(function() {
		$('.datepicker_con>input').datepick(
				{
					onShow : $.datepick.monthOnly,
					dateFormat : 'dd-mm-yyyy',
					yearRange : 'c-100:c+5',
					showOnFocus : true,
					showTrigger : '<button type="button" class="trigger">'
							+ '<i class="fa fa-calendar"></i></button>'
				});
	   }); 
	
	$('.datepicker_con1>input').datepick({
	    onShow: $.datepick.monthOnly, dateFormat: 'dd-mm-yyyy', yearRange: 'c-100:c+5', maxDate: '0', showOnFocus: true,
	    showTrigger: '<button type="button" class="trigger">' +
	        '<i class="fa fa-calendar"></i></button>', 
	        onClose: function (date) {
	        	checkDate(date,this.id);
	        }
	  });
	
	function checkDate(date,id){
		var finYear=$("#finyearId option:selected").text();
		var fi = finYear.split("-");
		var Date_1 = "01/04/"+fi[0];
		var Date_2 = "30/03/"+fi[1];
		
	    D_1 = Date_1.split("/");
	    D_2 = Date_2.split("/");
	     
	    var d1 = new Date(D_1[2], parseInt(D_1[1]) - 1, D_1[0]);
	    var d2 = new Date(D_2[2], parseInt(D_2[1]) - 1, D_2[0]);
	    var cd = date[0];
	    if (cd > d1 && cd < d2) {
	    }else{
	    	bootbox.alert("Please select date between the financial year");
	    	$("#"+id).val("");
	    	return false;
	    }
	}
	</script>
	
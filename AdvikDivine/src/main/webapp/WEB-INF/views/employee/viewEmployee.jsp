<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="sec"uri="http://www.springframework.org/security/tags"%> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
<script src="${contextPath}/assets/appJs/validation/AadharVaidator.js"></script>
	<div class="content">
                <div class="panel-header bg-primary-gradient">
					<div class="page-inner py-4">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
 							<div>
								<h2 class="text-blue pb-2 fw-bold">Manage Beneficiary</h2>
							</div> 
							<div class="ml-md-auto mb-4 py-2 py-md-0">
								<a href="${contextPath}" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i class="fa fa-home"></i></a>
								<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/ Manage Beneficiary</a>
							</div>
						</div>
					</div>
				</div>
	<div class="page-inner mt--5 pb-0">
		<div class="row mt-2 db_filter">
			<div class="col-md-12">
				<div class="card full-height">
					<div class="card-header">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
						<h4 class="card-title">View Beneficiary</h4>
					</div>
					<div class="card-body">
						<%@ include file="/WEB-INF/views/message.jsp"%>
						<div class="col-md-12">
							<form class="form-horizontal"
								action="${contextPath}/bnf/beneficiary/add" method="post"
								enctype="multipart/form-data" id="beneficiaryForm">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="col-md-12">
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												District :</label>
											<div class="col-md-12 box-height">
												<select name="district.districtId" id="districtId"
													class="form-control form-control-sm" required="required">
													<option value="">Select</option>
													<c:forEach items="${districtList}" var="district">
														<option value="${district.districtId}"
															${district.districtId eq beneficiaryData.district.districtId ?'selected':'' }>${district.districtName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Name of the Institution :</label>
											<div class="col-md-12 box-height">
												<input type="text" class="form-control form-control-sm"
													name="beneficiary[1].instuteName"
													value="${beneficiaryData.instuteName}" id="instuteName1"
													maxlength="100">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Address of the Institute :</label>
											<div class="col-md-12 box-height">
												<input type="text" class="form-control form-control-sm"
													name="beneficiary[1].instuteAdd"
													value="${beneficiaryData.instuteAdd}" id="instuteAdd1"
													maxlength="150">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Contact Number :</label>
											<div class="col-md-12 box-height">
												<input type="text"
													class="form-control form-control-sm NumbersOnly"
													name="beneficiary[1].contactNo"
													value="${beneficiaryData.contactNo}" id="contactNo1"
													onchange="validateMobileNumber('mobileNo1',this.value)"
													maxlength="10">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Email ID :</label>
											<div class="col-md-12 box-height">
												<input type="text" class="form-control form-control-sm"
													name="beneficiary[1].emailId" id="emailId1"
													value="${beneficiaryData.emailId}" maxlength="50"
													onchange="validateEmailId(this);">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Disbursed to A/c Number :</label>
											<div class="col-md-12 box-height">
												<input type="hidden" id="hdnAccountNo"
													value="${beneficiaryData.accountNo}"> <input
													type="text"
													class="form-control form-control-sm NumbersOnly account-no"
													name="beneficiary[1].accountNo"
													value="${beneficiaryData.accountNo}" id="accountNo1"
													maxlength="20" onchange="checkDuplicateAccNo(this)">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												A/c Holder Name :</label>
											<div class="col-md-12 box-height">
												<input type="text" class="form-control form-control-sm"
													name="beneficiary[1].acHolderName" id="acHolderName1"
													maxlength="100" value="${beneficiaryData.acHolderName}">
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Bank Name :</label>
											<div class="col-md-12 box-height">
												<select class="form-control form-control-sm"
													id="banknameList1" name="banknameList"
													onchange="findBankBranchByBankName(this.value,1);">
													<option value="0">Select</option>
													<c:forEach items="${bankList}" var="bankName">
														<option value="${bankName}"
															${bankName eq beneficiaryData.bankBranch.bankName ? 'selected':'' }>${bankName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												Branch :</label>
											<div class="col-md-12 box-height">
												<select class="form-control form-control-sm"
													name="beneficiary[1].bankBranch.bankBranchId"
													id="branchnameList1"
													onchange="findIfscCodeByBranchName(this,1);">
													<option value="0">Select</option>
													<option value="${beneficiaryData.bankBranch.bankBranchId}"
														selected>${beneficiaryData.bankBranch.branchName}</option>

												</select>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="col-md-12 smallInput required" for="">
												IFSC Code :</label>
											<div class="col-md-12 box-height">
												<input type="text" class="form-control form-control-sm"
													value="${beneficiaryData.bankBranch.ifsc}" id="ifscCode1"
													readonly>
											</div>
										</div>
									</div>

								</div>
								<div class="col-md-12 text-center mt-4">
									<div class="btn_wrapper">
										<a class="btn btn-sm btn-danger"
											href="${contextPath}/bnf/beneficiary/add" role="button">Back</a>
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
<script>
$(document).ready(function() {
	$("#beneficiaryForm input").prop("disabled", true);
	$('#beneficiaryForm select').prop('disabled', true);
	$(".datepick-trigger").prop('disabled', true);
	//enableDisableFieldByCBO();
});
</script>
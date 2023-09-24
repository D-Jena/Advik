
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<style>
.main-panel2 .page-inner {
    padding: 15px 20px 15px 50px !important;
}
.main-panel {
    margin-top: 70px;
    }
</style>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /><div class="main-panel2">
			<div class="content">
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner py-4">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-blue pb-2 fw-bold">
									<spring:message code="mst.dashboard.dash"></spring:message> 
								</h2>
							</div>
							<div class="ml-md-auto">
								<a href="" class="btn btn-sm btn-border btn-blue btn-round mr-2"><i
										class="fa fa-home"></i></a>
								<a href="#" class="btn btn-sm btn-border btn-blue btn-round mr-2">/ <spring:message code="mst.dashboard.dash"></spring:message>
								</a>
							</div>
						</div>
					</div>

				</div>
							<div class="page-inner">
							<%-- <div class="card " style="margin-top: 43px;background-color: #d0d0fd;">
								<div class="card-header">
									<div class="col-md-12">
										<div class="col-md-2">
											<div class="form-group">
												<label class="col-md-12" for="">Financial Year: </label>
												<div class="col-md-12">
													<select class="form-control form-control-sm">
														<option value="0">--Select--</option>
															<c:forEach items="${fynYr}" var="dist">
										                		<option value="${dist.districtId}" ${commonParams.districtId eq dist.districtId ? 'selected':''}>${dist.districtName}</option>
										                	</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> --%>
							
				 	<div class="row mt-4">
						<div class="col-md-8">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.monthTransaction"></spring:message></h4>
								</div>

								<div class="card-body">
									<div id="mw_transactionStatus" style="width:100%; height:250px;"></div>
								</div>

							</div>
						</div>
						<div class="col-md-4">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.totalPaid"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="TotalBeneficiaryPayment" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>
						<c:if test="${roleLevel eq 'STATE'}">
						<div class="col-md-12 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.payStatus"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="BeneficiaryPaymentStatus" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>
						</c:if>
						<div class="col-md-6 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"> <spring:message code="mst.dashboardChart.monthBenefitiedBenif"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="mw_BenefitedBeneficiaryStatus" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>

						<div class="col-md-6 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"> <spring:message code="mst.dashboardChart.category"></spring:message></h4>
								</div>
								<div class="card-body ">
									<div class="table-responsive" style="height:250px">
										<table class="table table-bordered ">
											<thead class="bg-warning">
												<tr>
													<th><spring:message code="mst.dashboardChart.category.sc"></spring:message></th>
													<th><spring:message code="mst.dashboardChart.category.st"></spring:message></th>
													<th><spring:message code="mst.dashboardChart.category.obc"></spring:message></th>
													<th><spring:message code="mst.dashboardChart.category.general"></spring:message></th>
												</tr>
											</thead>
											<tbody id="xbeneficiaryCatogary">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.accountVerificationStatus"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="AccountVerificationStatus" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>

						<div class="col-md-6 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.adharNonAdhar"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="aVsNonAadharBeneficiaryStatus" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>
						<c:if test="${roleLevel eq 'STATE'}">
						<div class="col-md-12 mt-3">
							<div class="card ">
								<div class="card-header">
									<div class="panel-actions">
										<a href="#" class="fa fa-caret-down"></a>
									</div>
									<h4 class="card-title"><spring:message code="mst.dashboardChart.enrolledPaid"></spring:message></h4>
								</div>
								<div class="card-body">
									<div id="enrolledVsPaid" style="width:100%; height:250px;"></div>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>


			</div>
		</div>
		
		
		<!-- <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
		<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
		<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script> -->
		
	<script src="${pageContext.request.contextPath}/assets/amcharts4/core.js"></script>
	<script src="${pageContext.request.contextPath}/assets/amcharts4/charts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/amcharts4/animated.js"></script>

	<script src="${pageContext.request.contextPath}/assets/charts/mw_transactionStatus.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/TotalBeneficiaryPayment.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/mw_BenefitedBeneficiaryStatus.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/AccountVerificationStatus.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/aVsNonAadharBeneficiaryStatus.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/enrolledVsPaid.js"></script>
	<script src="${pageContext.request.contextPath}/assets/charts/BeneficiaryPaymentStatus.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var roleLevel='${roleLevel}';
			var levelId='${levelId}';
			getDashboardCatogaryWiseBenificiary(roleLevel,levelId);
			getTrasactionStatusDetails(roleLevel,levelId);
			getAdharNonAdharDetails(roleLevel,levelId);
			getAccountVerificationStatusDetails(roleLevel,levelId);
			if(roleLevel=='STATE'){
				getEnrollvsPaid(roleLevel,levelId);
				getBenifPaymentStatus(roleLevel,levelId);
				}
			getBenifciaryMonthlyStatus(roleLevel,levelId);
			getTransactionMonthlyStatus(roleLevel,levelId);
		});

		
		
		function getDashboardCatogaryWiseBenificiary(roleLevel,levelId)
		{
			$.ajax({
				type : "GET",
				url : '${contextPath}/dashboard/catogaryWiseBenificiary',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var newRowContent;
				    var	html ="";
					var catogaryWiseBenificiaryList = response.data;
								 html = html
									+ "<tr><td>"
									+ catogaryWiseBenificiaryList.sc
									+ "</td><td>"
									+ catogaryWiseBenificiaryList.st
									+ "</td><td>"
									+ catogaryWiseBenificiaryList.obc
									+ "</td><td>"
									+ catogaryWiseBenificiaryList.general
									+ "</td></tr>";

					$(html).appendTo($("#xbeneficiaryCatogary"));
					},
				error : function(error) {
					bootbox.alert("<spring:message code="mst.dashboard.wentWrong"></spring:message>.");
				}
			});
	}
		
		</script>
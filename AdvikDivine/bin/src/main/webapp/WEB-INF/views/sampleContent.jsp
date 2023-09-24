<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="content">
	<div class="panel-header bg-primary-gradient">
		<div class="page-inner py-4">
			<div
				class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
				<div>
					<h2 class="text-blue pb-2 fw-bold">Add Goatry Activity</h2>
				</div>
				<div class="ml-md-auto mb-4 py-2 py-md-0">
					<a href="${contextPath}/home"
						class="btn btn-sm btn-border btn-blue btn-round mr-2"><i
						class="fa fa-home"></i></a> <a href="#"
						class="btn btn-sm btn-border btn-blue btn-round mr-2">/Add Goatry Activity</a>
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
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div>
						<h4 class="card-title">Add Goatry Activity</h4>
					</div>
					
					<div class="card-body">
						<form action="${contextPath}/profile/save-shg-profile" id="shgform" method="post">
						<input type="hidden" name="shgDetailsId" value="${shgProfileDetailsDto.shgDetailsId }"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
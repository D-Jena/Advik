<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${contextPath}/assets/appJs/applicationSpecific/commonReportApis.js"></script>
<form action="${contextPath}/report/reportBody" method="POST" id="filterCall">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="pageCall" id="pageCall" value="${pageCall}">
	<div class="col-md-2">
		<div class="form-group">
			<label class="col-md-12" for=""><spring:message code="site.common.state"></spring:message>: </label>
    		<div class="col-md-12">
        		<select class="form-control form-control-sm ${commonParams.stateFreeze eq true ? 'frezee' : ''}" id="filterstateId" name="stateId"  onchange="getDistrictsByStateId(this.value)">
                	<option value="0">--Select--</option>
                	<c:forEach items="${commonParams.stateList}" var="state">
                		<option value="${state.stateId}" ${commonParams.stateId eq state.stateId ? 'selected':''}>${state.stateName}</option>
                	</c:forEach>
               </select>
       		</div>
		</div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
			<label class="col-md-12" for=""><spring:message code="site.common.district"></spring:message>: </label>
    		<div class="col-md-12">
        		<select class="form-control form-control-sm ${commonParams.districtFreeze eq true ? 'frezee' : ''}" id="filterdistrictId" name="districtId" onchange="onchangeDistrict(this.value)">
                	<option value="0">--Select--</option>
                	<c:forEach items="${commonParams.districtList}" var="dist">
                		<option value="${dist.districtId}" ${commonParams.districtId eq dist.districtId ? 'selected':''}>${dist.districtName}</option>
                	</c:forEach>
               </select>
       		</div>
		</div>
	</div>
	<div class="col-md-2">
    	<div class="form-group">
	    	<label class="col-md-12" for=""> <spring:message code="mst.benificiary.type"></spring:message>:</label>
	        <div class="col-md-12">
            	<input type="radio" id="urban" name="ulbRuraltype" value="urban" ${commonParams.ulbRuraltypeFreeze eq true ? 'disabled' : ''} ${commonParams.ulbRuraltype eq 'urban' ? 'checked' : ''}>
            	<label for="urban" ${commonParams.ulbRuraltypeFreeze eq true ? 'frezee' : ''}>Urban</label>
            	<input type="radio" id="Rural" name="ulbRuraltype" value="rural" ${commonParams.ulbRuraltypeFreeze eq true ? 'disabled' : ''} ${commonParams.ulbRuraltype eq 'rural' ? 'checked' : ''}>
                <label for="rural" ${commonParams.ulbRuraltypeFreeze eq true ? 'frezee' : ''}>Rural</label>
        	</div>
       	</div>
    </div>
    <div class="col-md-2 awcFiterBlock ${commonParams.ulbRuraltype eq 'rural' ? '' : 'hidden'}">
		<div class="form-group">
			<label class="col-md-12" for=""><spring:message code="site.common.block"></spring:message>: </label>
    		<div class="col-md-12">
        		<select class="form-control form-control-sm ${commonParams.entityFreeze eq true ? 'frezee' : ''}" id="filterblockId" name="blockId" onchange="getProjectsByEntityId(this.value,'rural',0)">
                	<option value="0">--Select--</option>
                	<c:forEach items="${commonParams.blockList}" var="block">
                		<option value="${block.blockId}" ${commonParams.entityId eq block.blockId ? 'selected':''}>${block.blockName}</option>
                	</c:forEach>
               </select>
       		</div>
		</div>
	</div>
	<div class="col-md-2 awcFiterMunicipality ${commonParams.ulbRuraltype eq 'urban' ? '' : 'hidden'}">
		<div class="form-group">
			<label class="col-md-12" for=""><spring:message code="site.common.municipality"></spring:message>: </label>
    		<div class="col-md-12">
        		<select class="form-control form-control-sm ${commonParams.entityFreeze eq true ? 'frezee' : ''}" id="filtermunicipalityId" name="ulbId" onchange="getProjectsByEntityId(this.value,'urban',0)">
                	<option value="0">--Select--</option>
                	<c:forEach items="${commonParams.municipalityList}" var="municipal">
                		<option value="${municipal.municipalityId}" ${commonParams.entityId eq municipal.municipalityId ? 'selected':''}>${municipal.municipalityName}</option>
                	</c:forEach>
               </select>
       		</div>
		</div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
			<label class="col-md-12" for=""><spring:message code="mst.benificiary.project"></spring:message>: </label>
    		<div class="col-md-12">
        		<select class="form-control form-control-sm  ${commonParams.projectFreeze eq true ? 'frezee' : ''}" id="filterprojectId" name="projectId" onchange="getSectorsByProjectId(this.value,0)">
                	<option value="0">--Select--</option>
                	<c:forEach items="${commonParams.projectList}" var="proj">
                		<option value="${proj.projectId}" ${commonParams.projectId eq proj.projectId ? 'selected':''}>${proj.projectName}</option>
                	</c:forEach>
               </select>
       		</div>
		</div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
			<label class="col-md-12 " for=""><spring:message code="mst.benificiary.sector"></spring:message> :</label>
				<div class="col-md-12">
					<select class="form-control form-control-sm" id="filterSectorId" name="sectorId"  onchange="getAnganawadiCenterBySectorId(this.value,0)">
						<option value="0">--Select--</option>
							<c:forEach items="${commonParams.sectorList}" var="sec">
                		<option value="${sec.sectorId}" ${sec.sectorId eq commonParams.sectorId ? 'selected':''}>${sec.sectorName}</option>
                	</c:forEach>
					</select>
				</div>
	 	 </div>
	</div>
	<div class="col-md-2">
	<c:choose>
		<c:when test="${pageCall ne 'PHYSICAL-REPORT'}">
		<div class="form-group">
			<label class="col-md-12 " for=""><spring:message code="mst.commonReportFilter.center"></spring:message>:</label>
				<div class="col-md-12">
					<select class="form-control form-control-sm" id="filterCenterId" name="anaganwadiId">
						<option value="0">--Select--</option>
						<c:forEach items="${commonParams.anganwadiList}" var="angan">
                		<option value="${angan.centerId}" ${angan.centerId eq commonParams.anaganwadiId ? 'selected':''}>${angan.centerName}</option>
                	</c:forEach>
					</select>
				</div>
	 	 </div>
	 	 </c:when>
	  </c:choose>
	</div>
	<div class="col-md-2">
		<button type="button" onclick="filterCollector();" class="btn btn-sm btn-primary" style="margin-top: 23px;"><spring:message code="site.common.filter"></spring:message></button>
	</div>
</form>
<script>
function filterCollector(){
	if('${pageCall}'=='PHYSICAL-REPORT'){
		var proId = $("#filterprojectId").val();
		if(proId=='' || proId==0){
			bootbox.alert("<spring:message code="mst.select.project"></spring:message>.")
			return false;
		}else{
		$("#filterCall").submit();
		}
	}else{
		$("#filterCall").submit();
	}
}
$('input:radio[name=ulbRuraltype]').change(function () {
	var districtId = $("#filterdistrictId").val();
	var dropDownHTML = "<option value='0'>Select</option>";
	var entityId = '${commonParams.entityId}';
	if(districtId > 0){
		if (this.value == 'urban') {
	        $(".awcFiterMunicipality").removeClass("hidden");
	        $(".awcFiterBlock").addClass("hidden");
	        $("#filterprojectId").empty().append(dropDownHTML);;
	        $("#filterSectorId").empty().append(dropDownHTML);;
	        $("#filterCenterId").empty().append(dropDownHTML);;
	        getMunicipalityByDistrictId(districtId,entityId);
	    }else{
	    	 $("#filterprojectId").empty().append(dropDownHTML);;
	         $("#filterSectorId").empty().append(dropDownHTML);;
	         $("#filterCenterId").empty().append(dropDownHTML);;
	    	getBlockByDistrictId(districtId,entityId);
	    	$(".awcFiterMunicipality").addClass("hidden");
	        $(".awcFiterBlock").removeClass("hidden");
	    }
	}
});

function onchangeDistrict(that){
	let checkedValue = $('input[name=ulbRuraltype]:checked').val();
	if(checkedValue!='' || checkedValue!='undefined'){
		 getMunicipalityByDistrictId(that,0);
		 getBlockByDistrictId(that,0);
	}
	
}
</script>
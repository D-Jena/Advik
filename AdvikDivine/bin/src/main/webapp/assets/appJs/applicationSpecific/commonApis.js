function getDistrictsByStateId(stateId,selectedDistrictId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/district/byState/'+stateId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.districtId == selectedDistrictId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.districtId+"' "+selectData+">"+item.districtName+"</option>";
			});
			$("#filterdistrictId").empty().append(dropDownHTML);
		}
	});
}
function getBlockByDistrictId(districtId,selectedBlockId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/block/byDistrict/'+districtId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.blockId == selectedBlockId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.blockId+"' "+selectData+">"+item.blockName+"</option>";
			});
			$("#filterblockId").empty().append(dropDownHTML);
			$("#filterprojectId").val('0');
			$("#filterSectorId").val('0');
			//$("#filterCenterId").val('0');
		}
	});
}
function getMunicipalityByDistrictId(districtId,selectedMunicipalId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/municipality/byDistrict/'+districtId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.municipalityId == selectedMunicipalId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.municipalityId+"' "+selectData+">"+item.municipalityName+"</option>";
			});
			$("#filtermunicipalityId").empty().append(dropDownHTML);
			$("#filterSectorId").val(0);
		}
	});
}
function getGrampanchayatByBlockId(blockId,selectedGpId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/gp/byBlock/'+blockId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.gpId == selectedGpId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.gpId+"' "+selectData+">"+item.gpName+"</option>";
			});
			$("#filtergpId").empty().append(dropDownHTML);
		}
	});
}
function getVillagesByPanchayatId(panchayatId,selectedVillageId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/village/byGP/'+panchayatId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.villageId == selectedVillageId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.villageId+"' "+selectData+">"+item.villageName+"</option>";
			});
			$("#filtervillageId").empty().append(dropDownHTML);
		}
	});
}
function getWardsByMunicipalityId(municipalityId,selectedWardId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/ward/byMunicipality/'+municipalityId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.wardId == selectedWardId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.wardId+"' "+selectData+">"+item.wardName+"</option>";
			});
			$("#filterwardId").empty().append(dropDownHTML);
		}
	});
}
function getProjectsByEntityId(entityId,ruralOrUrban,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/projects/byULBOrRuralEntity/'+entityId+'/'+ruralOrUrban,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var adressType="";
				var selectData = (item.projectId == selectedVal) ? "selected" : "";
				if(item.isTribal==true){
				 adressType="(T)";
				}else if(item.projectType=='urban'&& item.adressType!='true'){
				 adressType="(U)";
				}else  if(item.projectType=='rural'&& item.adressType!='true'){
				adressType="(R)";
				}
				dropDownHTML += "<option value='"+item.projectId+"' "+selectData+">"+item.projectName+""+adressType+"</option>";
			});
			$("#filterprojectId").empty().append(dropDownHTML);
			$("#filterSectorId").empty().append(dropDownHTML);
			//$("#filterCenterId").val(0);
		}
	});
}
function getSectorsByProjectId(projectId,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/sectors/byProject/'+projectId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.sectorId == selectedVal) ? "selected" : "";
				dropDownHTML += "<option value='"+item.sectorId+"' "+selectData+">"+item.sectorName+"</option>";
			});
			$("#filterSectorId").empty().append(dropDownHTML);
			//$("#filterCenterId").val(0);
		}
	});
}
function getAnganawadiCenterBySectorId(sectorId,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/anganwadiCenter/bySector/'+sectorId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.centerId == selectedVal) ? "selected" : "";
				dropDownHTML += "<option value='"+item.centerId+"' "+selectData+">"+item.centerName+"</option>";
			});
			$("#filterCenterId").empty().append(dropDownHTML);
		}
	});
}
function getBankBranchByBankName(bankName){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/mst/findBankBranchByBankName?bankName='+bankName,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				//var selectData = (item.centerId == selectedVal) ? "selected" : "";
				dropDownHTML += "<option value='"+item.branchName+"'>"+item.branchName + "("+item.ifsc+")"+"</option>";
			});
			$("#filterBranch").empty().append(dropDownHTML);
		}
	});
}
function getBankIfscDetailsByBankNameAndBankBranch(bankName,branchName){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/mst/findBankBranchByBankNameAndBankBranch?bankName='+bankName+'&branchName='+branchName,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				dropDownHTML += "<option value='"+item.ifsc+"'>"+item.ifsc+"</option>";
			});
			$("#filterBranchIfsc").empty().append(dropDownHTML);
		}
	});
}

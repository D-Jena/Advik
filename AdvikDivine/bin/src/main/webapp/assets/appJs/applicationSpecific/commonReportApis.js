function getDistrictsByStateId(stateId,selectedDistrictId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allDistrict/byState/'+stateId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			var dropDownHTML1 = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.districtId == selectedDistrictId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.districtId+"' "+selectData+">"+item.districtName+"</option>";
			});
			$("#filterdistrictId").empty().append(dropDownHTML);
			$("#filtermunicipalityId").empty().append(dropDownHTML1);
			$("#filterblockId").empty().append(dropDownHTML1);
		}
	});
}
function getBlockByDistrictId(districtId,selectedBlockId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allBlock/byDistrict/'+districtId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			var dropDownHTML1 = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.blockId == selectedBlockId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.blockId+"' "+selectData+">"+item.blockName+"</option>";
			});
			$("#filterblockId").empty().append(dropDownHTML);
			$("#filterprojectId").empty().append(dropDownHTML1);
			$("#filterSectorId").empty().append(dropDownHTML1);
			$("#filterSectorId").val(0);
			$("#filterCenterId").empty().append(dropDownHTML1);
		}
	});
}
function getMunicipalityByDistrictId(districtId,selectedMunicipalId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allMunicipality/byDistrict/'+districtId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			var dropDownHTML1 = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.municipalityId == selectedMunicipalId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.municipalityId+"' "+selectData+">"+item.municipalityName+"</option>";
			});
			$("#filtermunicipalityId").empty().append(dropDownHTML);
			$("#filterprojectId").empty().append(dropDownHTML1);
			$("#filterSectorId").empty().append(dropDownHTML1);
			$("#filterSectorId").val(0);
			$("#filterCenterId").empty().append(dropDownHTML1);
		}
	});
}
function getGrampanchayatByBlockId(blockId,selectedGpId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allGp/byBlock/'+blockId,
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
/*function getVillagesByPanchayatId(panchayatId,selectedVillageId){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allVillage/byGP/'+panchayatId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.villageId == selectedVillageId) ? "selected" : "";
				dropDownHTML += "<option value='"+item.villageId+"' "+selectData+">"+item.villageName+"</option>";
			});
			$("#filtervillageId").empty().append(dropDownHTML);
		}
	});
}*/
/*function getWardsByMunicipalityId(municipalityId,selectedWardId){
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
}*/
function getProjectsByEntityId(entityId,ruralOrUrban,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allProjects/byULBOrRuralEntity/'+entityId+'/'+ruralOrUrban,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			var dropDownHTML1 = "<option value='0'>Select</option>";
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
			$("#filterSectorId").empty().append(dropDownHTML1);
			$("#filterCenterId").empty().append(dropDownHTML1);
		}
	});
}
function getSectorsByProjectId(projectId,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allSectors/byProject/'+projectId,
		success : function(response) {
			var dropDownHTML = "<option value='0'>Select</option>";
			var dropDownHTML1 = "<option value='0'>Select</option>";
			$.each(response.data, function(i, item){
				var selectData = (item.sectorId == selectedVal) ? "selected" : "";
				dropDownHTML += "<option value='"+item.sectorId+"' "+selectData+">"+item.sectorName+"</option>";
			});
			$("#filterSectorId").empty().append(dropDownHTML);
			$("#filterCenterId").empty().append(dropDownHTML1);
		}
	});
}
function getAnganawadiCenterBySectorId(sectorId,selectedVal){
	$.ajax({
		dataType : "json",
		url : window.ctxPath + '/webapi/demography/allAnganwadiCenter/bySector/'+sectorId,
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


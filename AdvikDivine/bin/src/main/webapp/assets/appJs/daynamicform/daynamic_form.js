function tableshow1() {
			var element = document.getElementById("tableshow1");
			element.classList.remove("hidden");
		};
		function tableshow2() {
			var element = document.getElementById("tableshow2");
			element.classList.remove("hidden");
		};
		function tableshow3() {
			var element = document.getElementById("tableshow3");
			element.classList.remove("hidden");
		};
		function tableshow4() {
			var element = document.getElementById("tableshow4");
			element.classList.remove("hidden");
		};
		
		function tabClickEvent(count,hierarchyLevelName,hierarchyLevelId,hierarchyLevelCode,parameterName,token){
			$.ajax({
				type : "GET",
				url : window.ctxPath +"/mst/hierarchy/getDynamicColumnData",
				data : {
					"hierarchyLevelId" : hierarchyLevelId,
				},
				success : function(response) {
					var formData='<form class="form-horizontal" action="'+window.ctxPath +'/mst/hierarchy/addNUpdt"  method="post" enctype="multipart/form-data" id="shopForm"> <input type="hidden" name="'+parameterName+'" value="'+token+'"/><input type="hidden" name="hierarchyLevelCode" value="'+ hierarchyLevelCode +'"/><input type="hidden" name="hierarchy.hierarchyId" id="hierarchyId">' + response + '<div class="col-md-3" style="padding: 10px 5px;"><div class="form-group"><label class="col-md-12 smallInput" for="">'+ hierarchyLevelName +' Name En :<span class="req">*</span></label><div class="col-md-12"><input type="text" class="form-control form-control-sm AlphaNumericOnly" name="hierarchyNameEn" id="hierarchyNameEn" maxlength="75" required="required" ></div></div></div><div class="col-md-3" style="padding: 10px 5px;"><div class="form-group"><label class="col-md-12 smallInput" for="">'+ hierarchyLevelName +' Name Hi :<span class="req">*</span></label><div class="col-md-12"><input type="text" class="form-control form-control-sm AlphaNumericOnly" id="hierarchyNameHi" name="hierarchyNameHi" maxlength="75" required="required"></div></div></div><div class="col-md-3" style="padding: 10px 5px;"><div class="form-group"><label class="col-md-12 smallInput" for="">'+ hierarchyLevelName +' Code:<span class="req">*</span></label><div class="col-md-12"><input type="text" class="form-control form-control-sm AlphaNumericOnly" onchange="checkSubHierarchyCode(this.value)" name="hierarchyCode" id="hierarchyCode" maxlength="20" required="required"></div></div></div><div class="col-md-12 text-center mt-3"><button type="submit" class="btn btn-sm btn-primary">Submit</button><a href="'+window.ctxPath +'/home" class="btn btn-sm btn-danger">Back</a></div></form>';
					$(".tabAST").empty();
					$("#tabAST"+count).empty().append(formData); 
					count= count-1;
					$("#tabAST"+count).empty();
				},
				error : function(error) {
					alert("Something went wrong !!"); 
				}
			}); 
		}
		
		function tabClickEventFilter(count,hierarchyLevelName,hierarchyLevelId,hierarchyLevelCode,parameterName,token){
				$.ajax({
				type : "GET",
				url : window.ctxPath +"/allocation/hierarchy/getDynamicColumnData",
				data : {
					"hierarchyLevelId" : hierarchyLevelId,
				},
				success : function(response) {
					let formData='<form class="form-horizontal" onsubmit="validateFormData()"  method="post" enctype="multipart/form-data" id="filterForm"> <input type="hidden" name="'+parameterName+'" value="'+token+'"/><input type="hidden" id="hierarchyLevelCode" name="hierarchyLevelCode" value="'+ hierarchyLevelCode +'"/><input type="hidden" name="subHeadId" id="hdnSubHeadId"><input type="hidden" name="finyearId" id="hdnFinyearId"><input type="hidden" name="parentId" id="hierarchyId">' + response + '<div class="col-md-3 text-center " style="margin-top: 43px;"><button type="submit" class="btn btn-sm btn-primary" style="margin-right: 10px;">Filter</button><a href="'+window.ctxPath +'/home" class="btn btn-sm btn-danger">Back</a></div></form>';
					$(".tabAST").empty();
					$(".emptyTab").empty();
					$(".emptyFormDiv").empty();
					$("#tabAST"+count).empty().append(formData); 
//					count= count-1;
//					$("#tabAST"+count).empty();
					
				},
				error : function(error) {
					alert("Something went wrong !!"); 
				}
			}); 
		}

	function tabClickEventForDisburs(count,hierarchyLevelName,hierarchyLevelId,hierarchyLevelCode,parameterName,token){
		$.ajax({
		type : "GET",
		url : window.ctxPath +"/disbursement/getAllocationData",
		data : {
			"hierarchyLevelId" : hierarchyLevelId,
		},
		success : function(response) {
		    
			var html = '';
		    var data = response.data;
			if (data != "" && data != null && data.length > 0) {
				$.each(data, function(index, value) {
				    index = index+1;
				    let availAmt = value.allocationAmt - value.disbursementAmt;
					html = html + '<tr><td>'+ index +'</td><td>'+value.allocationNo+'</td><td>'+value.finYear+'</td><td>'+value.schemeName+'</td><td>'+value.componentName+'</td><td>'+value.headName+'</td><td>'+value.subHeadName+'</td><td><p data-toggle="modal" data-target="#remark2">'+value.accountNo+'</p></td><td>'+value.allocationAmt+'</td><td>'+value.disbursementAmt+'</td><td><input class="form-control form-control-sm"  type="text" readonly id="availAmt'+index+'" value="'+ availAmt +'" /></td><td><input type="hidden" name="allocationId" id="allocationId'+index+'" value="'+value.allocationId+'"  ><input type="text" name="amount" id="amount'+index+'"  class="form-control form-control-sm " onkeypress="return isNumberKey(event)"></td><td><input type="text" maxlength="50" id="referenceNo'+index+'" name="referenceNo" onchange="checkDuplicateReferenceNo(this)"  class="form-control form-control-sm referenceNo"></td><td><div class="col-md-12 datepicker_con1"><input type="text" id="transectionDate'+index+'" readonly="" name="transectionDate"  class="form-control form-control-sm"><button type="button" class="trigger datepick-trigger"><i class="fa fa-calendar"></i></button></div></td></tr>';
				});
			} 
			let formData='<form class="form-horizontal" action="'+window.ctxPath +'/disbursement/addNUpdt" onsubmit="validateFormData()"  method="post" enctype="multipart/form-data" id="filterForm"> <input type="hidden" name="'+parameterName+'" value="'+token+'"/><input type="hidden" id="hierarchyLevelCode" name="hierarchyLevelCode" value="'+ hierarchyLevelCode +'"/><div class="table-responsive"><table class="table table-bordered table-hover DataTable mt-2"><thead class="thead-light"><tr><th style="max-width:65px">Sl No.</th><th>Allocation No</th><th>Financial Year</th><th>Scheme Name</th><th>Component Name</th><th>Head Name</th><th>SubHead Name</th><th>Account No</th><th>Allocation Amt</th><th>Disburse Amt</th><th>Avail For Disbursement</th><th>Disbursement Amt</th><th>Reference No</th><th>Disbursement Date</th></tr></thead><tbody id="disbursBody" >' + html + '</tbody></table></div><div class="col-md-12 text-center " style="margin-top: 43px;"><button type="submit" class="btn btn-sm btn-primary" style="margin-right: 10px;">Submit</button><a href="'+window.ctxPath +'/home" class="btn btn-sm btn-danger">Back</a></div></form>';
			$(".tabAST").empty();
			$(".emptyTab").empty();
			$(".emptyFormDiv").empty();
			$("#tabAST"+count).empty().append(formData); 
//			count= count-1;
//			$("#tabAST"+count).empty();
			$('.datepicker_con1>input').datepick({
	            onShow: $.datepick.monthOnly, dateFormat: 'dd/mm/yyyy', yearRange: 'c-100:c+5', maxDate: '0', showOnFocus: true,
	            showTrigger: '<button type="button" class="trigger">' +
	                '<i class="fa fa-calendar"></i></button>', 
	                onClose: function (date) {
	                	checkDate(date,this.id);
	                }
	        });
		},
		error : function(error) {
			alert("Something went wrong !!"); 
		}
	}); 
}
		function tabClickEventFilForExpend(count,hierarchyLevelName,hierarchyLevelId,hierarchyLevelCode,parameterName,token){
				$.ajax({
				type : "GET",
				url : window.ctxPath +"/mst/hierarchy/getDynamicColumnData",
				data : {
					"hierarchyLevelId" : hierarchyLevelId,
				},
				success : function(response) {
					var formData='<form class="form-horizontal" onsubmit="validateFormData()" action="'+window.ctxPath +'/expnd/expenditure/filter"  method="post" enctype="multipart/form-data" id="filterForm"> <input type="hidden" name="'+parameterName+'" value="'+token+'"/><input type="hidden" name="hierarchyLevelCode" value="'+ hierarchyLevelCode +'"/><input type="hidden" name="districtId" id="hdnDistrictId"><input type="hidden" name="finyearId" id="hdnFinyearId"><input type="hidden" name="parentId" id="hierarchyId">' + response + '<div class="col-md-3 text-center " style="margin-top: 43px;"><button type="submit" class="btn btn-sm btn-primary" style="margin-right: 10px;">Filter</button><a  href="'+window.ctxPath +'/home" class="btn btn-sm btn-danger">Back</a></div></form>';
					$(".tabAST").empty();
					$(".emptyTab").empty();
					$(".emptyFormDiv").empty();
					$("#tabAST"+count).empty().append(formData); 
					count= count-1;
					$("#tabAST"+count).empty();
				},
				error : function(error) {
					alert("Something went wrong !!"); 
				}
			}); 
		}
		
		function getChildListByParentId(parentId,showCount){
				if (parentId != "0") {
					$.ajax({
						type : "GET",
						url : window.ctxPath + "/mst/hierarchy/getChildListByParentId",
						dataType : "json",
						data : {
							"parentId" : parentId,
							"perHierarchyMapId" : showCount,
						},
						success : function(response) {
							var html = "<option value='' selected>-Select-</option>";
							var data = response.data;
							if (data != "" && data != null&& data.length > 0) {
								$.each(data,function(index, value) {
									html = html + "<option value="+value.hierarchyId+">"+ value.hierarchyName+ "</option>";
								});
							}
							$('#hierarchy'+response.message).empty().append(html);
							$('#hierarchyId').val($('#hierarchy'+showCount).val());
						},
						error : function(error) {
							bootbox.alert("Data not found");
						}
					});
				} else {
					bootbox.alert("Please Select Parent")
					return false;
				}
		}
		
		
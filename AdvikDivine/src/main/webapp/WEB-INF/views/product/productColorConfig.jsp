<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="sec"uri="http://www.springframework.org/security/tags"%> --%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/assets/appJs/validation/common-utils.js"></script>
<script src="${contextPath}/assets/appJs/validation/AadharVaidator.js"></script> 
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/text.font.css">

<style>
  #apnd-btn-plus {
    color: green;
  }
  .my-div {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.wide-input {
    width: 400px;
}
</style>
<div class="content">
                <div class="panel-header bg-primary-gradient">
                    <div class="page-inner py-5">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                            <div>
                                <h2 class="text-white pb-2 fw-bold">Manage Product Configuration</h2>
                            </div>
                            <div class="ml-md-auto py-2 py-md-0">
                                <a href="stateInit_dashboard.html" class="btn btn-white btn-border btn-round mr-2"><i
                                        class="fa fa-home"></i></a>
                                <a href="#" class="btn btn-secondary btn-round">/ Manage Product</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-inner mt--5 pb-0">
                
                <form class="form-horizontal" action="${contextPath}/prodConfig/saveExtraConfig" method="post" id="saveExtraConfig">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="prodTypeId" value="${prodTypeCnfg.prodTypeId}"/>
                    <div class="row mt-4">
                        <div class="col-md-12">
                        <%@ include file="/WEB-INF/views/message.jsp"%>
                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Product Type Configuration</h4>
                                </div>
                                <div class="card-body">
                                    <div class="col-md-12">
                                            <div class="col-md-12">
                                              <div class="col-md-3">
												<div class="form-group">
													<label class="col-sm-12 required medium-text" for="text">Product Categories Name:</label>
													<div class="col-sm-12">
													<c:choose>
														<c:when test="${not empty prodExtCnfg}">
															<select class="form-control frezee" id="configType" name="configType" readonly>
															<option>Select Product</option>
															<c:forEach items="${prodTypeList}" var="ptl">
																<option value="${ptl.prodTypeId}"${ptl.prodTypeId eq prodExtCnfg.configType.prodTypeId?'selected':''}>${ptl.prodType}</option>
															</c:forEach>
															</select>
														</c:when>
														<c:otherwise>
															<select class="form-control" id="configType" name="configType">
															<option>Select Product</option>
															<c:forEach items="${prodTypeList}" var="ptl">
																<option value="${ptl.prodTypeId}">${ptl.prodType}</option>
															</c:forEach>
															</select>
														</c:otherwise>
													</c:choose>													
													</div>
												</div>
											</div>
											<div class="col-md-5">
												<div class="form-group">
													<label class=" " for="text">Colors : (If you enter multiple color then give space between colors)</label>
													<div class="col-sm-12">
														<textarea class="form-control " id="colorName" name="colorName" rows="5" placeholder="eg: Red   Green   Blue   White    Red-White   Black-Green   like this">${prodExtCnfg.colorName}</textarea>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group">
													<label class=" " for="text">Size : (If you enter multiple size then give space between sizes)</label>
													<div class="col-sm-12">
														<textarea class="form-control " id="productSize" name="productSize" rows="5" placeholder="eg: 8   9   10  like this">${prodExtCnfg.productSize}</textarea>
													</div>
												</div>
											</div>
											<div class="col-md-12">
													<div class="form-group">
														<label class="col-md-10 required" for="isActive">Status</label>
														<div class="col-md-10">
															<input type="radio" value="true" id="isActive1" name="isActive" ${prodExtCnfg.isActive eq true ?'checked':''} required="required"> Active &nbsp;&nbsp;
															<input type="radio" value="false" id="isActive2"  name="isActive" ${prodExtCnfg.isActive eq false ?'checked':''} required="required"> Inactive 
														</div> 
													</div>
												</div>
										</div>
										<div class="row col-md-12" ><br></div>
											<div class="row col-md-12" >
                                            <div class="col-md-12 text-center">
                                                <div class="btn_wrapper col-sm-12">
                                                    <input  class="btn btn-sm btn-primary" type="button" onclick="saveExtraConfig()" value="${not empty beneficiaryData ? 'Update':'Save' }">
                                                    <a class="btn btn-danger btn-sm" href="${contextPath}/" role="button">Back</a>
                                                </div>
                                            </div>
											</div>
                                    </div>
                                </div>
							</div>
						</div>
					</div>
				</form>
			              
                    <!--TODO:  List table -->
                    <div class="row mt-4">
                        <div class="col-md-12">

                            <div class="card full-height">
                                <div class="card-header">
                                    <div class="panel-actions">
                                        <a href="#" class="fa fa-caret-down"></a>
                                    </div>
                                    <h4 class="card-title">Product Category List</h4>
                                </div>

                                <div class="card-body">
                                    <div class=" col-md-12">
                                        <table class="table table-bordered mt-2 mb-4">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th style="width: 55px;">Sl No.</th>
                                                    <th style="width: 150px;">Product Type</th>
                                                    <th>Product Color</th>
                                                    <th>Product Size</th>
                                                    <th style="width: 100px;">Status</th>
                                                    <th style="width: 100px;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
											<c:forEach items="${prodExtColSizeConfig}" var="pecsc" varStatus="count">
												<tr>
													<td>${count.count}</td>
													<td>${pecsc.configType.prodType}</td>
													<td>${pecsc.colorName}</td>
													<td>${pecsc.productSize}</td>
													<c:if test="${pecsc.isActive eq true }">
														<td>Active</td>
													</c:if>
													<c:if test="${pecsc.isActive eq false }">
														<td>InActive</td>
													</c:if>
													<td>
														<button class="btn btn-warning btn-sm" value="${pecsc.configId}"
															onclick="editProdExtConfig(this.value)">
															<i class="fas fa-edit"></i>
														</button>
														<button class="btn btn-danger btn-sm" value="${pecsc.configId}"
															onclick="deleteProdExtConfig(this.value)">
															<i class="fas fa-trash"></i>
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
            
<form method="GET" id="formId"></form>
<script>
	function editProdExtConfig(id) {
		$("#formId").attr('action','${contextPath}/prodConfig/editProductExtConfig/' + id);
		$("#formId").submit();
	}
	
	function deleteProdExtConfig(id) {
		var flag = window.confirm("Do you want to delete parmanently?");
  		if (flag == true) {
  			$("#formId").attr('action','${contextPath}/prodConfig/deleteProductExtConfig/' + id);
  			$("#formId").submit();
  		}
		
	}
	
       function saveExtraConfig(){
    	  if($("#prodType").val()==""){
    		  bootbox.alert("Please Enter Product Type.");
			  return false;
    	  }
    	  if($("#colorName").val()==""){
    		  bootbox.alert("Please Enter Colors.");
			  return false;
    	  }
    	  if ($('input[name="isActive"]:checked').val() == undefined) {
  			bootbox.alert("Select Active Or InActive");
  			return false;
  		}
    	var flag = window.confirm("Do you want to continue ?");
  		if (flag == true) {
  			$("#saveExtraConfig").submit();
  		}
    	  
       }
       
       
    </script>
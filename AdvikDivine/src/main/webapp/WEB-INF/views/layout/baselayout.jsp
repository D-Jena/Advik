<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>Advic Devine Organization </title>
		<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
		<meta name="keywords" content="Kaushalya Matritva Yojana" />
		<meta name="description" content="Kaushalya Matritva Yojana">
		<meta name="author" content="Advic Devine">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		
		<meta http-equiv="cache-control" content="max-age=0" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="cache-control" content="no-store" />
		<meta http-equiv="cache-control" content="pre-check=0" />
		<meta http-equiv="cache-control" content="post-check=0" />
		<meta http-equiv="cache-control" content="must-revalidate" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="pragma" content="no-cache" />
		
		
		<link rel="shortcut icon" href="${contextPath}/assets/img/favicon.png">
		<!-- Fonts and icons -->
		<link rel="stylesheet" href="${contextPath}/assets/css/fonts.min.css" />
		
		<!-- CSS Files -->
		<link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}/assets/css/atlantis.css">
		<link rel="stylesheet" href="${contextPath}/assets/css/custom.css">
		<link rel="stylesheet" href="${contextPath}/assets/css/jbox.css">
		<link rel="stylesheet" type="text/css" href="${contextPath}/assets/logout/jquery-confirm.css"/>	
		<link rel="stylesheet" href="${contextPath}/assets/vendor/select2full/select2.min.css" />
		<link rel="stylesheet" href="${contextPath}/assets/vendor/select2full/select2-bootstrap.css" />
		<link href="${contextPath}/assets/vendor/jquery_datepicker/jquery.datepick.css" rel="stylesheet">
		<link href="${contextPath}/assets/vendor/datatables/datatables.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${contextPath}/assets/vendor/b4multiselect/bootstrap-select.css" >
		<link rel="stylesheet" href="${contextPath}/assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.min.css" >
      
		<script src="${contextPath}/assets/js/core/jquery-3.5.1.min.js"></script>
		<script src="${contextPath}/assets/js/parsley.min.js"></script>
		

	
		<style>
			.frezee{
			pointer-events: none;
			}
		</style>
		
		
		
		<!--   Core JS Files   -->
	    <script src="${contextPath}/assets/logout/jquery-confirm.js"></script>
		<script src="${contextPath}/assets/js/core/popper.min.js"></script>
		<script src="${contextPath}/assets/js/core/bootstrap.min.js"></script>
		<script src="${contextPath}/assets/vendor/b4multiselect/bootstrap-select.min.js"></script> 
		<script src="${contextPath}/assets/vendor/select2/select2.js"></script>
		<script src="${contextPath}/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>	
		<script src="${contextPath}/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
		<script src="${contextPath}/assets/vendor/datatables/datatables.min.js"></script>
		<script src="${contextPath}/assets/vendor/select2full/select2.full.js"></script>
		<!-- jQuery Scrollbar -->
		<script src="${contextPath}/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
		<!-- Atlantis JS -->
		<script src="${contextPath}/assets/js/atlantis.js"></script>  
		<script src="${contextPath}/assets/appJs/framework/languageSwitcher.js"></script>
		<script src="${contextPath}/assets/vendor/jquery_datepicker/jquery.plugin.js"></script>
		<script src="${contextPath}/assets/vendor/jquery_datepicker/jquery.datepick.js"></script>
		<script src="${contextPath}/assets/vendor/bootbox5/bootbox.js"></script>
		<script src="${contextPath}/assets/vendor/bootbox5/bootbox.min.js"></script> 
		<script src="${contextPath}/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script> 
		
		
		
		<script>
			window.ctxPath='${contextPath}'; 
		</script>
		<script type="text/javascript">
	  		window.contextPath = '${contextPath}'; 
			$(function() 
			{
			       var url = window.location.href;
			       var newurl = url.split('?');
			       var finala=newurl[0];
			       $(".nav-primary a").each(function() 
			       {
			              if (finala == this.href)
			              {
			                     $(this).parent().addClass("active");
			                     $(this).parent().parent().parent().addClass("show");
			                     $(this).parent().parent().parent().parent().addClass("active");
			                     $(this).parent().parent().parent().parent().parent().parent().addClass("show");
			              }
			       });
			});
		</script>
	</head>
	
	<body>
		<div class="wrapper sidebar_minimize">
			<tiles:insertAttribute name="header" />	  
			<tiles:insertAttribute name="menu" />	
			<div class="main-panel">
					<c:import url="message.jsp"></c:import>
				<tiles:insertAttribute name="body" />	
			</div>  
		</div>

		<!-- Page Specific Scripts -->
		<tiles:insertAttribute name="pageScripts" />	
	
		<script>
		$('.datepicker_con.maxdate>input').datepick({
			onShow: $.datepick.monthOnly, 
			dateFormat: 'dd/mm/yyyy',
			yearRange: 'c-100:c+5',
			maxDate: new Date(),
			showOnFocus: true,
			showTrigger: '<button type="button" class="trigger">' +    '<i class="fa fa-calendar"></i></button>'
		});
		$(function() {
		      $('.datepicker_con>input').datepick({
		      		onShow: $.datepick.monthOnly, 
		      		dateFormat: 'dd/mm/yyyy',
		      		yearRange: 'c-100:c+5',
		      		showOnFocus: true,
	    			showTrigger: '<button type="button" class="trigger">' +    '<i class="fa fa-calendar"></i></button>'
	  		  });
		      $('.DataTable').DataTable({});
		      $('.select2').select2();
		      $('.selectpicker').selectpicker();
		     
		 }); 
	  	</script>
	  	<script type="text/javascript">
				$(document).ready(function() {				 
					$('.js-example-basic-multiple').select2();
					$('form').attr("autocomplete", "off");
				});
		</script> 
		<script>
		$( ".select2-single, .select2-multiple" ).select2( {
			theme: "bootstrap",
			placeholder: "Select",
			maximumSelectionSize: 6,
			containerCssClass: ':all:'
		});
		
		function hideLoader(){
			$(".pageloader").hide();
		}
		function showLoader(){
			$(".pageloader").show();
		}
		
		document.onkeydown = function(e) {
			/* Block F12 */
			if(event.keyCode == 123) {
				return false;
			}
			/* CTRL + SHIFT + I */
			if(e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)){
				return false;
			}
			/* CTRL + SHIFT + J */
			if(e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)){
				return false;
			}
			/* CTRL + SHIFT + C 
			if(e.ctrlKey && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)){
				return false;
			}*/
			/* CTRL + U */
			if(e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)){
				return false;
			}
		}
		
		</script>
	</body>
</html>
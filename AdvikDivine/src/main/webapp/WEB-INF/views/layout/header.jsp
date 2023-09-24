<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<sec:authentication var="principal" property="principal" />
<div class="main-header">
	<!-- Logo Header -->
	<div class="logo-header" data-background-color="blue">
         <a href="#" class="logo logoinnertext">NAVIGATION </a>
         <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse"  data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
             <span class="navbar-toggler-icon">
                 <i class="fas fa-angle-double-left"></i>
             </span>
         </button>
         <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
         <div class="nav-toggle">
             <button class="btn btn-toggle toggle-sidebar">
                 <i class="fas fa-angle-double-left"></i> 
             </button>
         </div>
     </div>
	<!-- End Logo Header -->

	<!-- Navbar Header -->
	<nav class="navbar navbar-header navbar-expand-lg" data-background-color="white">
		 <div class="container-fluid centerblocktext">
            <a href="${contextPath}" class="logo">
                <img src="${contextPath}/assets/img/olm.png" alt="navbar brand" class="navbar-brand">
            </a>
            <div class="nav-item nav-text logo_label">
                <h1>my shop</h1>
                <b>Advik Divine </b>
            </div>
             <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
             	<li class="nav-item dropdown hidden-caret">
                            <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            </a>
                            <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                                <li>
                                    <div class="dropdown-title">You have 3 new notifications</div>
                                </li>
                                <li>
                                    <div class="notif-scroll scrollbar-outer">
                                        <div class="notif-center">
                                            <a href="#">
                                                <div class="notif-icon notif-primary"> <i class="fa fa-user-plus"></i>
                                                </div>
                                                <div class="notif-content">
                                                    <span class="block">
                                                        New user registered
                                                    </span>
                                                    <span class="time">5 minutes ago</span>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notif-icon notif-success"> <i class="fa fa-comment"></i>
                                                </div>
                                                <div class="notif-content">
                                                    <span class="block">
                                                        Rahmad commented on Admin
                                                    </span>
                                                    <span class="time">12 minutes ago</span>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div class="notif-img">
                                                    <img src="${contextPath}/assets/img/profile2.jpg" alt="Img Profile">
                                                </div>
                                                <div class="notif-content">
                                                    <span class="block">
                                                        Reza send messages to you
                                                    </span>
                                                    <span class="time">12 minutes ago</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a class="see-all" href="javascript:void(0);">See all notifications<i
                                            class="fa fa-angle-right"></i> </a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="nav-item dropdown hidden-caret">
                            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"
                                aria-expanded="false">
                                <div class="avatar-sm">
                                    <img src="${contextPath}/assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                                </div>
                            </a>
                            <c:if test="${principal ne 'anonymousUser'}">
	                            <ul class="dropdown-menu dropdown-user animated fadeIn">
	                                <div class="dropdown-user-scroll scrollbar-outer">
	                                    <li>
	                                        <div class="user-box">
	                                            <div class="avatar-lg"><img src="${contextPath}/assets/img/profile.jpg"
	                                                    alt="image profile" class="avatar-img rounded"></div>
	                                            <div class="u-text">
	                                                <h4>${principal.dbUser.firstName} ${principal.dbUser.lastName}</h4>
													<p class="text-muted">${principal.dbUser.designation}</p>
	                                            </div>
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="${contextPath}/umt/user/profile">View Profile</a>
	                                        <a class="dropdown-item" href="${contextPath}/umt/user/change/password">Change Password</a>
	                                        <div class="dropdown-divider"></div>
	                                        <a class="dropdown-item" href="#" id="switchlogout">Logout</a>
	                                    </li>
	                                </div>
	                            </ul>
                            </c:if></li>
                       </ul>
            
         </div>
	</nav>
	<!-- End Navbar -->
</div>
<form action="" method="get" enctype="multipart/form-data" id="change-lang">
	<input type="hidden" name="lang" id="lang">
</form>

<!-- End Navbar -->
<form method="post" action="${contextPath}/umt/logout" id="frmLogout">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<input type="submit" style="display: none" />
</form>

<script>
	$(function() {
		$('#siteLangSelector').change(function() {
			const lang = $(this).val();
			switchLanguage(lang);
		});
	});

	$('#switchlogout').on('click', function() {
		$("#frmLogout").submit();
	});

	$("#langId1").change(function(){
		$('#lang').val(this.value);
		$('#change-lang').submit();
	});
		
	

</script>


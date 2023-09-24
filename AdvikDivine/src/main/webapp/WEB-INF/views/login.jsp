<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
	<meta charset="UTF-8">
	<title>Advic Devine </title>
	<meta name="keywords" content="Kaushalya Matritva Yojana" />
	<meta name="description" content="Kaushalya Matritva Yojana">
	<meta name="author" content="Aashdit Technologies">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<link rel="shortcut icon" href="${contextPath}/loginPage/images/logo.png">
	<link rel="stylesheet" href="${contextPath}/loginPage/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/loginPage/css/login.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
</head>

<body>
<div id="demo" class="carousel carousel-fade slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextPath}/loginPage/images/kbg.jpg">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/loginPage/images/kbg2.jpg">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/loginPage/images/kbg3.jpg">
    </div>
  </div>

</div>
	<section class="login_content">
		<div class="container">
				<c:if test="${not empty err_msg}">
					<div id="messageDiv" class="alert alert-danger" style="width:400px;">
						<span>${err_msg}</span>
					</div>
				</c:if>
				<div class="lc_left">
					<div class="icon_con"> <img src="${contextPath}/loginPage/images/logo.png"> </div>
					<label>advik divine</label>
					<h1>Advik Divine</h1>
					<span>Advik Divine</span>
				</div>
			<div class="lc_right">
				<div class="lc_right_con">
					<h2>
						Login Here
					</h2>
					<div class="districtcon">
						<form class="form-horizontal" id="login-window" method="POST" action="${contextPath}/overwrite/umt/login" autocomplete="off">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-group" id="unm">
								<label class="col-sm-12" for="email">Username:</label>
								<div class="col-sm-12">
									<input placeholder="" class="form-control plc" name="userName" id="userName" autocomplete="off" type="text" maxlength="36">
								</div>
								<span class="invalid-message" id="invalidUser" style="color: #ff6565; text-transform: initial;"></span>
							</div>
							<div class="form-group" id="pas">
								<label class="col-sm-12" for="pwd">Password:</label>
								<div class="col-sm-12">
									<input placeholder="" for="pwd" type="password" class="form-control plc" name="password" id="password" type="password" autocomplete="off" maxlength="30">
									<i toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password" style="position: absolute;margin-left:165px; margin-top:-25px"></i>
								</div>
								<span class="invalid-message" id="invalidPassword" style="color: #ff6565; text-transform: initial;"></span>
							</div>
							<div class="form-group" id="cap" style="padding: 0 14px;">
								<div class="col-sm-7 cinp" style="float: left; padding-left: 2px;">
									<input class="form-control" name="captcha" id="captcha" type="text" autocomplete="off" maxlength="5" placeholder="Enter Captcha">
								</div>
								<div class="col-sm-5 cimg" style="float: left; background: #c1c1c1;">
									<img src="${contextPath}/captcha/5" style="height: 36px;" />
								</div>
							</div>
							<div class="text-center">
								<!-- <button type="submit" class="btn btn-success cus-btn" id="btn_submit">Login</button> -->
								<button type="button" class="btn btn-success cus-btn" id="btn_submit" onclick="userLogin()">Login</button>
							</div>
							<div class="form-footer">
								<label style="display: block;text-align: center;text-transform: none;color: #000;margin: 10px 0 0 0;" id=""> 
									<a href="#" data-toggle="modal" data-target="#forgotPassModal" style="color:#333;"> Forgot Password?</a>
								</label>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="copyright_con">
    	<div class="container">
              <p>&copy; 2022
                  <a href="${contextPath}">Advik Divine </a> All Rights Reserved. Powered by
                  <a href="http://aashdit.com" target="_blank">A-D Group</a>
              </p>
          </div>
    </div>

	<div id="forgotPassModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Forgot Password ?</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<span id="SecondsUntilExpire" style="display: none;"></span>
				</div>
				<div class="modal-body col-md-12">
					<div class="" id="contents">
						<form class="form-horizontal" id="resetform" action="${contextPath}/reset/forgot-password" onsubmit="disableButton()" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="col-md-3">
								<label>Username<span style="color: #ff0808;">*</span> :</label>
							</div>
							<div class="col-md-7">
								<input type="text" class="form-control" id="username" name="username" required maxlength="64">
							</div>
							<div class="col-md-12 text-center">
								<button style="margin-left: 10%;" type="submit" id="passwordResetBtn" class="btn btn-sm btn-success">Submit</button>
								<button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">Cancel</button>
							</div>
							<div class="col-md-12">
								<label style="margin-top: 10px; font-style: italic; color: #ff0808; font-size: 12px;">Note:
									Password will be sent to the registered email.</label>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer text-center"></div>
			</div>
		</div>
	</div>

<script src="${contextPath}/loginPage/js/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/loginPage/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/appJs/encrypt/AesUtil.js"></script>
<script src="${pageContext.request.contextPath}/assets/appJs/encrypt/aes.js"></script>
<script src="${pageContext.request.contextPath}/assets/appJs/encrypt/pbkdf2.js"></script>
<script src="${pageContext.request.contextPath}/assets/appJs/encrypt/lbase.js"></script>
<script src="${contextPath}/assets/vendor/bootbox5/bootbox.js"></script>
<script src="${contextPath}/assets/vendor/bootbox5/bootbox.min.js"></script>
<script type="text/javascript">
function disableButton(){
	$("#passwordResetBtn").attr('disabled', true);
}
$(function() {
	$(this).bind("contextmenu", function(e) {
		e.preventDefault();
		}); 
	$(this).bind('cut copy paste', function (e) {
	    e.preventDefault();
		});
	$('form').attr("autocomplete", "off");
});
var err = '${err_msg}';
if(err !=""){
	setTimeout(function() {
	    $('#errorMsg').fadeOut('slow');
	}, 3000);
}
function userLogin() {
  	var username = $("#userName").val();
  	var password = $("#password").val();
  	var generateCaptcha=$("#captcha").val();
    
  	if (username == "") {
  		bootbox.alert("Username Can't Be Empty");
  		return false;
  	}else if (password == "") {
  		bootbox.alert("Password Can't Be Empty");
  		return false;
  	}else if (generateCaptcha == "") {
	    bootbox.alert("Please enter the CAPTCHA"); 
	    return false;
	}else {
  		$('#password').val(enc_password(password)); 
  		$("#login-window").submit();
  		return false;
  	}
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
<script>
	$(document).on('click', '.toggle-password', function() {

    $(this).toggleClass("fa-eye fa-eye-slash");
    
    var input = $("#password");
    input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
});
</script>
</body>
</html>
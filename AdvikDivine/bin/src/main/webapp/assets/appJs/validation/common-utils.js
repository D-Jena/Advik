$(function() {

	$('.AlphabetsOnly').keypress(function(e) {
		var regex = new RegExp(/^[a-zA-Z\s]+$/);
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (regex.test(str)) {
			return true;
		} else {
			e.preventDefault();
			return false;
		}
	});

	$('.emailsOnly').keypress(function (e) {
	    var regex = new RegExp("/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/");
	    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	    if (regex.test(str)) {
	        return true;
	    }
	    else {
	        e.preventDefault();
	        return false;
	    }
	});
/*function fileCheck(that){
		var ValidFileExtension = ['pdf'];

	if($(that).val().split('.').length == 2 ) {
		  if ($.inArray($(that).val().split('.').pop().toLowerCase(), ValidFileExtension) == -1) {
				bootbox.alert("Sorry! allowed format is pdf only.");
				$(that).val("");
				return false;
			}
			if ((that.files[0].size) > 2097152) {
				bootbox.alert("File size exceeds maximun file size of 2 MB!");
				$(that).val("");
				return false;
			}
		}else{
	  	   bootbox.alert("Unsupported file format,Please check your file extension");
	  	   $(that).val("");
	 }
	}*/
	$('.NumbersOnly').on(
			'keypress',
			function(event) {
				var regex = new RegExp("^[0-9.]+$");
				var key = String.fromCharCode(!event.charCode ? event.which
						: event.charCode);
				if (!regex.test(key)) {
					event.preventDefault();
					return false;
				}
			});

	$('.AlphaNumericOnly').keypress(function(e) {
		var regex = new RegExp(/^[a-zA-Z0-9@#*%_\s]+$/);
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		console.log(str);
		if (regex.test(str)) {
			return true;
		} else {
			e.preventDefault();
			return false;
		}
	});

});

function validateEmail(emailField) {
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	if (reg.test(emailField.value) == false) {
		bootbox.alert("Please Provide a Vaild Email Id");
		var result = emailField.value.replace(
				/[a-zA-Z!&#@^/#+()$~%&\\\|\.''"":;*?<>{}]/g, '');
		emailField.value = result;
		emailField.value = '';
		emailField.focus();
		return false;
	}
	return true;
}

function validateMobileNo(element) {
	/*alert("mobile vaildate function id---------->"+element);*/
	var re = /^[0-9]+$/;

	var str = element.toString();

	var str1 = element.value;

	element = (element) ? element : window.event;
	var charCode = (element.which) ? element.which : element.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}

	if (isNaN(str1) || str1.indexOf(" ") != -1) {
		bootbox.alert("Please Provide a Vaild Mobile Number");
		var result = element.value.replace(
				/[a-zA-Z!&#@^/#+()$~%&\\\|\.''"":;*?<>{}]/g, '');
		element.value = result;
		element.value='';
		this.value='';
		//document.getElementById('txtMobile').focus();
		return false;
	}

	if (str1.length > 10 || str1.length < 10) {
		bootbox.alert("Please Provide a Vaild Mobile Number");
		var result = element.value.replace(
				/[a-zA-Z!&#@^/#+()$~%&\\\|\.''"":;*?<>{}]/g, '');
		//element.value = result;
		element.value='';
		this.value='';
		//document.getElementById('txtMobile').value = '';
		return false;
	}

	/*$("input[type='text']").on('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9_ ]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});
	
	$('textarea').on('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z0-9. ]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	});*/
}

function imageCheck(that){
	var ValidFileExtension = [ 'jpg','jpeg'];
	if ($.inArray($("#"+that.id).val().split('.').pop().toLowerCase(), ValidFileExtension) == -1) {
		$("#"+that.id).val("");
		bootbox.alert("Sorry! allowed format is jpg or jpeg only.");
		event.preventDefault();
		return false;
	}
	if ((that.files[0].size) > 2097152) {
		$(that).val("");
		bootbox.alert("File size exceeds maximun image size of 1 MB!");
		return false;
	}
}


function checkSpaces(that){
debugger;
var id= that.id;
var value = that.value;
var replacedValue = value.replaceAll(" ","");
if(replacedValue.length==0){
	bootbox.alert("Field value cannot contain only spaces.");
	$("#"+id).val("");
	return false;
	}else{
	return true;
	}
}

function currencyConverter(that,fieldId){
	if(that!=""){
		var value = that.replaceAll(",","");
		if(value.includes(".")){
			var splitValues = value.split(".");
			if(splitValues.length>=2){
				if(splitValues[0]==""){
					splitValues[0]="0";
				}
				value=splitValues[0]+"."+splitValues[1];
				if(splitValues[1].length==1){
					value=splitValues[0]+"."+splitValues[1]+"0";		
				}
				if(splitValues[1].length>2 || splitValues[1]==""){
					value=splitValues[0]+".00";		
				}
			}else{
				value=splitValues[0];
			}
		}else{
			value=value+".00";
		}
		var hiddenFieldId = fieldId.split("Conv")[0];
		$("#"+hiddenFieldId).val(value);
		value = value.replace(/(\d)(?=(\d{2})+\d\.)/g, '$1,');
		$("#"+fieldId).val(value);
	}
}

	$('.NumbersOnlyForAmount').keypress(
		function(event) {
			var regex = new RegExp("^[0-9.]+$");
			var key = String.fromCharCode(!event.charCode ? event.which
					: event.charCode);
			if (!regex.test(key)) {
				event.preventDefault();
				return false;
			}
});

function CheckFileType(cntr, ftype) {
	// Get the file upload control file extension
	var extn = $('#' + cntr).val().split('.').pop().toLowerCase(); 
	if (extn != '') {
		//debugger;        
		   // Create array with the files extensions to upload
		   var fileListToUpload;  
		   if (parseInt(ftype) == 1){
		       fileListToUpload = new Array('pdf', 'gif', 'jpg', 'jpeg', 'png');
		   }
		   else if (parseInt(ftype) == 2){
		       fileListToUpload = new Array('png', 'jpg', 'jpeg');
		   }
		   else if (parseInt(ftype) == 5){
		       fileListToUpload = new Array('mp4', '3gp', 'avi');
		   }
		   else{
		       fileListToUpload = new Array('pdf');	
		   } 
		   //Check the file extension is in the array.               
		   var isValidFile = $.inArray(extn, fileListToUpload);		        
		   // isValidFile gets the value -1 if the file extension is not in the list.  
		   if (isValidFile == -1) {	        	
		       if (parseInt(ftype) == 1){
		          bootbox.alert("Please select a valid file of type pdf, gif, jpg, jpeg, png."); 
		       }
		       else if (parseInt(ftype) == 2){ 
		          bootbox.alert("Please select a valid file of type png, jpg or jpeg."); 
		       }
			   else if (parseInt(ftype) == 5){ 
		          bootbox.alert("Please select a valid file of type mp4, 3gp or avi."); 
		       }
		       else{
		          bootbox.alert("Please select a valid pdf file only."); 
		       } 
		       $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
		   } 
		   else {
		       // Restrict the file size to 500 KB.
		       if ($('#' + cntr).get(0).files[0].size > (1024 * 500)) {
				   if(parseInt(ftype) != 5) {
			           bootbox.alert("File size should not exceed 500 KB.");		           
			           $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));
			           $("#uph").attr('src','resources/admin_pannel/images/profile_pic.png'); 
			           $("#uphOther").attr('src','resources/admin_pannel/images/profile_pic.png'); 
				   } 
		       }
		       if ($('#' + cntr).get(0).files[0].name.length > 100) {
		           bootbox.alert("File name should be maximum 100 characters."); 
		           $('#' + cntr).replaceWith($('#' + cntr).val('').clone(true));		       
		       } 
		       else {
		           return true;
		       }
		   }
	}
	else {
	   return true;
	} 
}  
function validateNumber() { 
	if((event.keyCode<48 || event.keyCode>57))
	{
		event.returnValue = false;
	} 
}  
function ValidateEmail(cntr) {
    var email = $('#' + cntr).val();
    //bootbox.alert(email);
    if (email != "") {
        var reg = /^[A-Za-z0-9]([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if (!reg.test(email)) {
        	bootbox.alert('Enter a valid email id'); 
            return false;
        }
        else
            return true;
    }
    else
        return true;
}; 
function validateMobileNo(element) {
	/*bootbox.alert("mobile vaildate function id---------->"+element);*/
	var re = /^[0-9]+$/;

	var str = element.toString();

	var str1 = element.value;

	element = (element) ? element : window.event;
	var charCode = (element.which) ? element.which : element.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}

	if (isNaN(str1) || str1.indexOf(" ") != -1) {
		bootbox.alert("Invalid Mobile No.");
		var result = element.value.replace(
				/[a-zA-Z!&#@^/#+()$~%&\\\|\.''"":;*?<>{}]/g, '');
		element.value = result;
		//document.getElementById('txtMobile').focus();
		return false;
	}

	if (str1.length > 10 || str1.length < 10) {
		bootbox.alert("Mobile No. should be 10 digit");
		var result = element.value.replace(
				/[a-zA-Z!&#@^/#+()$~%&\\\|\.''"":;*?<>{}]/g, '');
		element.value = result;
		//document.getElementById('txtMobile').value = '';
		return false;
	}
}
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
	
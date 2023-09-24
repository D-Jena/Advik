function checkPdfTypeExtension(selector) { 
	
  var file = document.querySelector(selector);
  var regex = new RegExp("(.*?)\.(pdf)$", "i");
  if ( regex.test(file.files[0].name) === false ) { 
	  bootbox.alert("Only PDF files less than 200 KB allowed."); 
	  file.value = null;
  }
 else
  {
	  //Check for Double Extension
	  var ext = file.files[0].name.split('.');
	  if(ext.length > 2) {
    	 bootbox.alert("No files with multiple extensions are allowed."); 
    	 file.value = null;
	  }	    
  	  //Check for file size. Max 200 KB 
	  if (file.files[0].size > 204800)
	  {
		  bootbox.alert("Only PDF files less than 200 KB allowed."); 
		  file.value = null;
	  }
  }

}

function checkImageTypeExtension(selector) {
	
  var file = document.querySelector(selector);
  var regex = new RegExp("(.*?)\.(jpg|jpeg|png)$", "i");  
  if ( regex.test(file.files[0].name) === false ) { 
	  bootbox.alert("Only PDF files less than 200 KB allowed."); 
	  file.value = null;
  }
  else
  {
	  //Check for Double Extension
	  var ext = file.files[0].name.split('.');
	  if(ext.length > 2) {
		  bootbox.alert("No files with multiple extensions are allowed."); 
    	 file.value = null;
	  }    
  	  //Check for file size. Max 200 KB 
	  if (file.files[0].size > 204800)
	  {
		  bootbox.alert("Only Image files less than 200 KB allowed."); 
		  file.value = null;
	  } 
  }

}

function checkVideoTypeExtension(selector) {
	
  var file = document.querySelector(selector);
  var regex = new RegExp("(.*?)\.(mp4|3gp|avi)$", "i");  
  if ( regex.test(file.files[0].name) === false ) { 
	  bootbox.alert("Only PDF files less than 200 KB allowed."); 
	  file.value = null;
  }
  else
  {
	  //Check for Double Extension
	  var ext = file.files[0].name.split('.');
	  if(ext.length > 2) {
		  bootbox.alert("No files with multiple extensions are allowed."); 
    	 file.value = null;
	  }    
  	  //Check for file size. Max 500 MB 
	  if (file.files[0].size > 524288000)
	  {
		  bootbox.alert("Only Image files less than 200 KB allowed."); 
		  file.value = null;
	  } 
  }

}

function checkMultipleExtension(selector) { 
	
	var file = document.querySelector(selector);
	var ext = file.files[0].name.split('.');
	if(ext.length > 2) {
		bootbox.alert("No files with multiple extensions are allowed."); 
		file.value = null;
	}   
	
}
	

function makeOTPRequest() {
	showTimer();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$.ajax({
		type: 'POST',
		url: window.ctxPath +"/webapi/mst/generateOTP?v=" + new Date().getTime(),
		async: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function(response) {
			if(response.outcome)
			{
				$('#ref').val(response.data);
				$('#myModal').modal('show');
			}
			else{
				bootbox.alert("OTP Generation failed : " + response.message);
			}
		}
	});
}

function verifyOTP() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	var sOTP = "";
	$('div#otp input[type="text"]').each(function(idx, elem) {
		sOTP += $(elem).val();
	});

	$('#txtOTP').val(sOTP);

	var data = {};
	data.otp = $('#txtOTP').val();
	data.uc = "FTO_SIGN";
	data.ref = $('#ref').val();

	$.ajax({
		type: 'POST',
		url: window.ctxPath + "/webapi/mst/checkAndValidateOTP",
		data: data,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success: function(response) {
			if(response.outcome)
			{
				$('#myModal').modal('hide');
				$('#frmSign').submit();
			}else{
				alert('Could not verify OTP : ' + response.message);
				$(".removeOtp").val("");
				$('#myModal').modal('hide');
			}
		}
	});
}

function showTimer() {
	const second = 1000,
		  minute = second * 60,
		  hour = minute * 60;

	countDown = new Date().getTime() + 10 * 60000;
	x = setInterval(function() {
		let now = new Date().getTime(),
		distance = window.countDown - now;

		$('#minutes').text(Math.floor((distance % (hour)) / (minute)));
		$('#seconds').text(Math.floor((distance % (minute)) / second));

		//do something later when date is reached
		if (distance <= 1) {
			clearInterval(x);
		}
	}, second);
}
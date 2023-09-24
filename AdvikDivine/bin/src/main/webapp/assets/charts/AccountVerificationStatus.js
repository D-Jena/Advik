function getAccountVerificationStatusDetails(roleLevel,levelId) {
	$.ajax({
				type : "GET",
				url : window.ctxPath+'/dashboard/getAccountVerificationStatusDetails',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var data = response.data;
					  // Themes begin
					  am4core.useTheme(am4themes_animated);
					  // Themes end
					  
					  // Create chart instance
					  var chart = am4core.create("AccountVerificationStatus", am4charts.PieChart);
					  chart.radius = am4core.percent(70);
					  // Add data
					  chart.data = [{
					    "Status": "Verified",
					    "Value": data.verified
					  }, {
					    "Status": "Not-verified",
					    "Value": data.notVerified
					  }, {
					    "Status": "Bank Rejected",
					    "Value": data.rejectedAccount
					  }];
					  
					  
					  // Add and configure Series
					  var pieSeries = chart.series.push(new am4charts.PieSeries());
					  pieSeries.dataFields.value = "Value";
					  pieSeries.dataFields.category = "Status";
					  pieSeries.slices.template.stroke = am4core.color("#fff");
					  pieSeries.slices.template.strokeOpacity = 1;
					  pieSeries.labels.template.text = "{category}";
					  
					  // This creates initial animation
					  pieSeries.hiddenState.properties.opacity = 1;
					  pieSeries.hiddenState.properties.endAngle = -90;
					  pieSeries.hiddenState.properties.startAngle = -90;
					  pieSeries.slices.template.tooltipText = "Account Verification Status For [bold]{category}: {value} [/]";
					  
					  chart.hiddenState.properties.radius = am4core.percent(0);
					  pieSeries.labels.template.maxWidth = 80;
					  pieSeries.labels.template.wrap = true;
					
					  // Add a legend
					chart.legend = new am4charts.Legend();
					chart.legend.position = "bottom";
					chart.legend.valign = "center";
					chart.logo.disabled = true;
					chart.legend.labels.template.truncate = false;
					chart.legend.labels.template.wrap = true;
					
					
					// pieSeries.alignLabels = false;
					// pieSeries.labels.template.bent = true;
					// pieSeries.labels.template.radius = 3;
					// pieSeries.labels.template.padding(0,0,0,0);
					// pieSeries.labels.template.radius = am4core.percent(-40);
					// pieSeries.labels.template.text = "{value.value}";
					// pieSeries.ticks.template.disabled = true;
					  
					  pieSeries.colors.list = [
					    am4core.color("#23b100"),
					    am4core.color("#ffa500"),
					    am4core.color("#fb5607"),
					    am4core.color("#2bb907"),
					    am4core.color("#3cb44b"),
					    am4core.color("#42d4f4"),
					    am4core.color("#4363d8"),
					    am4core.color("#911eb4"),
					    am4core.color("#f032e6")
					  ];
					  },
			error : function(error) {
				bootbox.alert("Something Went Wrong, Please Try Sometimes.");
			}
		});
}

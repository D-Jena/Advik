function getAdharNonAdharDetails(roleLevel,levelId) {
		$.ajax({
				type : "GET",
				url : window.ctxPath+'/dashboard/getAdharNonAdharDetails',
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
						
						// Create chart
						var chart = am4core.create("aVsNonAadharBeneficiaryStatus", am4charts.PieChart);
						chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
						
						chart.data = [
						  {
						    "Beneficiary Status": "Aadhar",
						    value: data.aadhar
						  },
						  {
						    "Beneficiary Status": "Non-aadhar",
						    value: data.nonAadhar
						  }
						];
						
						chart.logo.disabled = true;
						
						var series = chart.series.push(new am4charts.PieSeries());
						series.dataFields.value = "value";
						series.dataFields.radiusValue = "value";
						series.dataFields.category = "Beneficiary Status";
						series.slices.template.cornerRadius = 6;
						series.colors.step = 3;
						
						series.hiddenState.properties.endAngle = -90;
						
						chart.legend = new am4charts.Legend();
						
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
function getTrasactionStatusDetails(roleLevel,levelId)
		{
			$.ajax({
				type : "GET",
				url : window.ctxPath+'/dashboard/getTrasactionStatus',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var data = response.data;
						am4core.useTheme(am4themes_animated);
						// Themes end
						
						// Create chart instance
						var chart = am4core.create("TotalBeneficiaryPayment", am4charts.PieChart);
						
						// Add and configure Series
						var pieSeries = chart.series.push(new am4charts.PieSeries());
						pieSeries.dataFields.value = "litres";
						pieSeries.dataFields.category = "country";
						
						// Let's cut a hole in our Pie chart the size of 30% the radius
						chart.innerRadius = am4core.percent(30);
						
						// Put a thick white border around each Slice
						pieSeries.slices.template.stroke = am4core.color("#fff");
						pieSeries.slices.template.strokeWidth = 2;
						pieSeries.slices.template.strokeOpacity = 1;
						pieSeries.slices.template
						  // change the cursor on hover to make it apparent the object can be interacted with
						  .cursorOverStyle = [
						    {
						      "property": "cursor",
						      "value": "pointer"
						    }
						  ];
						
						pieSeries.alignLabels = false;
						pieSeries.labels.template.bent = true;
						pieSeries.labels.template.radius = 3;
						pieSeries.labels.template.padding(0,0,0,0);
						
						pieSeries.ticks.template.disabled = true;
						
						// Create a base filter effect (as if it's not there) for the hover to return to
						var shadow = pieSeries.slices.template.filters.push(new am4core.DropShadowFilter);
						shadow.opacity = 0;
						
						// Create hover state
						var hoverState = pieSeries.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists
						
						// Slightly shift the shadow and make it more prominent on hover
						var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
						hoverShadow.opacity = 0.7;
						hoverShadow.blur = 5;
						
						// Add a legend
						//chart.legend = new am4charts.Legend();
						
						chart.data = [{
						  "country": "Success",
						  "litres": data.success
						},{
						  "country": "Pending",
						  "litres": data.pending
						},{
						  "country": "Rejected",
						  "litres": data.rejected
						}];
					
						// Add a legend
//						chart.legend = new am4charts.Legend();
//						chart.legend.position = "right";
//						chart.legend.valign = "center";
//						chart.logo.disabled = true;
//						chart.legend.labels.template.truncate = false;
//						chart.legend.labels.template.wrap = true;
						
						
						pieSeries.alignLabels = false;
						pieSeries.labels.template.bent = true;
						pieSeries.labels.template.radius = 3;
						pieSeries.labels.template.padding(0,0,0,0);
						//pieSeries.labels.template.radius = am4core.percent(-40);
						//pieSeries.labels.template.text = "{value.value}";
						//pieSeries.ticks.template.disabled = true;
						chart.logo.disabled = true;
						
						
						pieSeries.colors.list = [
						  am4core.color("green"),
						  am4core.color("lightblue"),
						  am4core.color("red"),
						  am4core.color("#01ff83"),
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


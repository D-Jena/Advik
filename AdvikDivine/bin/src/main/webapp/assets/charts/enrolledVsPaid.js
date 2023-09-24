function getEnrollvsPaid(roleLevel,levelId)
		{
			$.ajax({
				type : "GET",
				url :  window.ctxPath + '/dashboard/getEnrollvsPaid',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var newRowContent;
					var catogaryWiseBenificiaryList = response.data;
					var array=[];
					$.each(response.data, function(i, item){
						var obj = {"District":item.district,"Beneficiary enrolled":item.totalBeneficiaryEnrolled, "Beneficiary Paid":item.noOfBeneficiaryBenefited};
						array.push(obj);
					});
					
					
									// Themes begin
									am4core.useTheme(am4themes_animated);
									// Themes end
									
									// Create chart instance
									var chart = am4core.create("enrolledVsPaid", am4charts.XYChart);
									
									// Add data
									chart.data =array;
									/*[ {
									  "District": "Angul",
									  "Beneficiary enrolled": 32583,
									  "Beneficiary Paid": 25869
									}, {
									  "District": "Balangir",
									  "Beneficiary enrolled": 72056,
									  "Beneficiary Paid": 84500
									}, {
									  "District": "Balasore",
									  "Beneficiary enrolled": 12535,
									  "Beneficiary Paid": 11480
									}, {
									  "District": "Bargarh",
									  "Beneficiary enrolled": 24868,
									  "Beneficiary Paid": 28458
									}, {
									  "District": "Bhadrak",
									  "Beneficiary enrolled": 21702, 
									  "Beneficiary Paid": 22125
									}, {
									  "District": "Boudh",
									  "Beneficiary enrolled": 38562,
									  "Beneficiary Paid": 18590
									}, {
									  "District": "Cuttack",
									  "Beneficiary enrolled": 48528,
									  "Beneficiary Paid": 28431
									}, {
									  "District": "Deogarh",
									  "Beneficiary enrolled": 21470,
									  "Beneficiary Paid": 21820
									}, {
									  "District": "Dhenkanal",
									  "Beneficiary enrolled": 89023,
									  "Beneficiary Paid": 78508
									}, {
									  "District": "Gajapati",
									  "Beneficiary enrolled": 23632,
									  "Beneficiary Paid": 19267
									}, {
									  "District": "Ganjam",
									  "Beneficiary enrolled": 89526,
									  "Beneficiary Paid": 42810
									}, {
									  "District": "Jagatsinghapur",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Jajpur",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Jharsuguda",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Kalahandi",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Kandhamal",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Kendrapara",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Keonjhar",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Khordha",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Koraput",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Malkangiri",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Mayurbhanj",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Nabarangpur",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Nayagarh",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Nuapada",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Puri",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Rayagada",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Sambalpur",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Sonepur",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}, {
									  "District": "Sundargarh",
									  "Beneficiary enrolled": 95635,
									  "Beneficiary Paid": 24587
									}]*/;
									
									
									// Create axes
									var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
									categoryAxis.renderer.labels.template.horizontalCenter = "right";
									categoryAxis.renderer.labels.template.verticalCenter = "middle";
									categoryAxis.renderer.labels.template.rotation = 270;
									categoryAxis.renderer.minHeight = 110;
									
									categoryAxis.dataFields.category = "District";
									categoryAxis.renderer.grid.template.location = 0;
									categoryAxis.renderer.minGridDistance = 10;
									categoryAxis.renderer.cellStartLocation = 0.1;
									categoryAxis.renderer.cellEndLocation = 0.6;
									
									var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
									valueAxis.title.text = "Beneficiary enrolled";
									valueAxis.title.fontWeight = 600;
									
									// Create series
									var series = chart.series.push(new am4charts.ColumnSeries());
									series.dataFields.valueY = "Beneficiary enrolled";
									series.dataFields.categoryX = "District";
									series.tooltipText = "Beneficiary enrolled: [bold]{valueY}[/]";
									series.fill = am4core.color("#ffa500");
									series.stroke = am4core.color("#ffa500");
									//series.stacked = true;
									//series.columns.template.column.cornerRadiusTopLeft = 10;
									series.columns.template.column.cornerRadiusTopRight = 10;
									//series.columns.template.column.fillOpacity = 0.8;
									
									//series2.stacked = true;
									//series2.columns.template.column.cornerRadiusTopLeft = 10;
									//series2.columns.template.column.cornerRadiusTopRight = 10;
									//series2.columns.template.column.fillOpacity = 0.8;
									
									var series3 = chart.series.push(new am4charts.ColumnSeries());
									series3.dataFields.valueY = "Beneficiary Paid";
									series3.dataFields.categoryX = "District";
									series3.columns.template.width = am4core.percent(50);
									series3.tooltipText = "Beneficiary Paid: [bold]{valueY}[/]";
									series3.fill = am4core.color("#008000");
									series3.stroke = am4core.color("#008000");
									//series3.stacked = true;
									//series3.columns.template.column.cornerRadiusTopLeft = 10;
									series3.columns.template.column.cornerRadiusTopRight = 10;
									//series3.columns.template.column.fillOpacity = 0.8;
									
									chart.cursor = new am4charts.XYCursor();
									chart.cursor.lineX.disabled = true;
									chart.cursor.lineY.disabled = true;
									chart.logo.disabled=true;
									chart.colors.list = [
									  am4core.color("#008000"),
									  am4core.color("#ffa500"),
									  am4core.color("#028900"),
									  am4core.color("#ffeb3b"),
									  am4core.color("#fb5607"),
									  am4core.color("#1992ca"),
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

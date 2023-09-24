function getBenifPaymentStatus(roleLevel,levelId)
		{
			$.ajax({
				type : "GET",
				url :  window.ctxPath + '/dashboard/getBenifPaymentStatus',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var array=[];
					$.each(response.data, function(i, item){
						let obj = {"District":item.district,"value1":parseInt(item.noOfBeneficiaryBenefited), "value2":parseInt(item.totalBeneficiaryPayment)};
						array.push(obj);
					});
									// Themes begin
									am4core.useTheme(am4themes_animated);
									// Themes end
									
									var chart = am4core.create("BeneficiaryPaymentStatus", am4charts.XYChart);
									chart.hiddenState.properties.opacity = 0; // this makes initial fade in effect
									chart.data = array;
									/*chart.data = [{
									  "District": "Angul",
									  "value1": 125,
									  "value2": 525
									}, {
									  "District": "Balangir",
									  "value1": 825,
									  "value2": 225
									}, {
									  "District": "Balasore",
									  "value1": 525,
									  "value2": 325
									},
									{
									  "District": "Bargarh",
									  "value1": 125,
									  "value2": 525
									}, {
									  "District": "Bhadrak",
									  "value1": 825,
									  "value2": 225
									}, {
									  "District": "Boudh",
									  "value1": 525,
									  "value2": 325
									},
									{
									  "District": "Cuttack",
									  "value1": 125,
									  "value2": 525
									}, {
									  "District": "Deogarh",
									  "value1": 825,
									  "value2": 225
									}, {
									  "District": "Dhenkanal",
									  "value1": 525,
									  "value2": 325
									},
									{
									  "District": "Gajapati",
									  "value1": 125,
									  "value2": 525
									}, {
									  "District": "Ganjam",
									  "value1": 825,
									  "value2": 225
									}, {
									  "District": "Jagatsinghapur",
									  "value1": 525,
									  "value2": 395
									}, {
									  "District": "Jajpur",
									  "value1": 985,
									  "value2": 315
									}, {
									  "District": "Jharsuguda",
									  "value1": 455,
									  "value2": 375
									}, {
									  "District": "Kalahandi",
									  "value1": 895,
									  "value2": 385
									}, {
									  "District": "Kandhamal",
									  "value1": 155,
									  "value2": 328
									}, {
									  "District": "Kendrapara",
									  "value1": 698,
									  "value2": 525
									}, {
									  "District": "Keonjhar",
									  "value1": 525,
									  "value2": 325
									}, {
									  "District": "Khordha",
									  "value1": 525,
									  "value2": 325
									}, {
									  "District": "Koraput",
									  "value1": 525,
									  "value2": 365
									}, {
									  "District": "Malkangiri",
									  "value1": 525,
									  "value2": 225
									}, {
									  "District": "Mayurbhanj",
									  "value1": 525,
									  "value2": 325
									}, {
									  "District": "Nabarangpur",
									  "value1": 535,
									  "value2": 325
									}, {
									  "District": "Nayagarh",
									  "value1": 525,
									  "value2": 325
									}, {
									  "District": "Nuapada",
									  "value1": 525,
									  "value2": 325
									}, {
									  "District": "Puri",
									  "value1": 525,
									  "value2": 825
									}, {
									  "District": "Rayagada",
									  "value1": 525,
									  "value2": 329
									}, {
									  "District": "Sambalpur",
									  "value1": 525,
									  "value2": 305
									}, {
									  "District": "Sonepur",
									  "value1": 785,
									  "value2": 225
									}, {
									  "District": "Sundargarh",
									  "value1": 525,
									  "value2": 325
									}];
									*/
									var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
									categoryAxis.renderer.grid.template.location = 0;
									categoryAxis.dataFields.category = "District";
									categoryAxis.renderer.minGridDistance = 40;
									
									var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
									
									var series = chart.series.push(new am4charts.CurvedColumnSeries());
									series.dataFields.categoryX = "District";
									
									series.dataFields.valueY = "value1";
									series.tooltipText = " No of Beneficiary: {valueY.value}"
									series.columns.template.strokeOpacity = 0;
									series.clustered = false;
									series.hiddenState.properties.visible = true; // this is added in case legend is used and first series is hidden.
									
									var series2 = chart.series.push(new am4charts.CurvedColumnSeries());
									series2.dataFields.categoryX = "District";
									
									series2.dataFields.valueY = "value2";
									series2.tooltipText = "Total Transaction Amount (INR): {valueY.value}"
									series2.columns.template.strokeOpacity = 0;
									series2.clustered = false;
									
									var series3 = chart.series.push(new am4charts.CurvedColumnSeries());
									series3.dataFields.categoryX = "District";
									
									series3.dataFields.valueY = "value3";
									series3.tooltipText = "{valueY.value}"
									series3.columns.template.strokeOpacity = 0;
									series3.clustered = false;
									
									chart.logo.disabled = true;
									
									chart.cursor = new am4charts.XYCursor();
									chart.cursor.maxTooltipDistance = 0;
									
									//chart.scrollbarX = new am4core.Scrollbar();
									
									
									series.dataItems.template.adapter.add("width", (width, target) => {
									  return am4core.percent(target.valueY / valueAxis.max * 100);
									})
									
									series2.dataItems.template.adapter.add("width", (width, target) => {
									  return am4core.percent(target.valueY / valueAxis.max * 100);
									})
									
									series3.dataItems.template.adapter.add("width", (width, target) => {
									  return am4core.percent(target.valueY / valueAxis.max * 100);
									})
									
									series.columns.template.events.on("parentset", function(event){
									  event.target.zIndex = valueAxis.max - event.target.dataItem.valueY;
									})
									
									series2.columns.template.events.on("parentset", function(event){
									  event.target.parent = series.columnsContainer;
									  event.target.zIndex = valueAxis.max - event.target.dataItem.valueY;  
									})
									
									series3.columns.template.events.on("parentset", function(event){
									  event.target.parent = series.columnsContainer;
									  event.target.zIndex = valueAxis.max - event.target.dataItem.valueY;  
									});
									
									
									series.colors.list = [
									  am4core.color("green"),
									  am4core.color("lightblue"),
									  am4core.color("orange"),
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
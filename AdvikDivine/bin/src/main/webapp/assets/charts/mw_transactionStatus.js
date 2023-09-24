function getTransactionMonthlyStatus(roleLevel,levelId)
		{
			$.ajax({
				type : "GET",
				url :  window.ctxPath + '/dashboard/getTransactionMonthlyStatus',
				dataType : "json",
				data : {
					"roleLevel" : roleLevel,
					"levelId" : levelId,
					},
				success : function(response) {
					var array=[];
					$.each(response.data, function(i, item){
						var obj = {"Month":item.month,"year2004":parseInt(item.noOfBeneficiaryBenefited), "year2005":parseInt(item.totalBeneficiaryPayment)};
						array.push(obj);
					});
										
										// Themes begin
										am4core.useTheme(am4themes_animated);
										// Themes end
										
										// Create chart instance
										var chart = am4core.create("mw_transactionStatus", am4charts.XYChart);
										
										// Add percent sign to all numbers
										chart.numberFormatter.numberFormat = "#.#";
										
										// Add data
										chart.data =array;
										/*chart.data = [{
										    "Month": "Jan",
										    "year2004": 3.5,
										    "year2005": 4.2
										}, {
										    "Month": "Feb",
										    "year2004": 1.7,
										    "year2005": 3.1
										}, {
										    "Month": "Mar",
										    "year2004": 2.8,
										    "year2005": 2.9
										}, {
										    "Month": "Apr",
										    "year2004": 2.6,
										    "year2005": 2.3
										}, {
										    "Month": "May",
										    "year2004": 1.4,
										    "year2005": 2.1
										}, {
										    "Month": "Jun",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Jul",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Aug",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Sep",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Oct",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Nov",
										    "year2004": 2.6,
										    "year2005": 4.9
										}, {
										    "Month": "Dec",
										    "year2004": 2.6,
										    "year2005": 4.9
										}];*/
										
										
										
										// Create axes
										var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
										categoryAxis.dataFields.category = "Month";
										categoryAxis.renderer.grid.template.location = 0;
										categoryAxis.renderer.minGridDistance = 30;
										
										categoryAxis.renderer.labels.template.rotation = 90;
										categoryAxis.renderer.labels.template.horizontalCenter = "left";
										categoryAxis.renderer.labels.template.verticalCenter = "middle";
										
										 
										
										var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
										valueAxis.title.text = "Transaction & Payment";
										valueAxis.title.fontWeight = 800;
										
										
										// Create series
										var series = chart.series.push(new am4charts.ColumnSeries());
										series.dataFields.valueY = "year2004";
										series.dataFields.categoryX = "Month";
										series.clustered = false;
										series.tooltipText = "Total Transaction in {categoryX}: [bold]{valueY}[/]";
										
										var series2 = chart.series.push(new am4charts.ColumnSeries());
										series2.dataFields.valueY = "year2005";
										series2.dataFields.categoryX = "Month";
										series2.clustered = false;
										series2.columns.template.width = am4core.percent(50);
										series2.tooltipText = "Total Payment {categoryX} : [bold]{valueY}[/]";
										
										
										chart.cursor = new am4charts.XYCursor();
										chart.cursor.lineX.disabled = true;
										chart.cursor.lineY.disabled = true;
										chart.logo.disabled=true;
										chart.colors.list = [
										  am4core.color("#ffa500"),
										  am4core.color("#028900"),
										  am4core.color("#008000"),
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
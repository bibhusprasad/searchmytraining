<%@ include file="/WEB-INF/layouts/includes.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery/canvasjs.min.js"></script>

</head>
<style>
.shadow{
 -webkit-box-shadow: 3px 3px 5px -1px rgba(0,0,0,0.75);
-moz-box-shadow: 3px 3px 5px -1px rgba(0,0,0,0.75);
box-shadow: 3px 3px 5px -1px rgba(0,0,0,0.75); 
height: 300px; 
width: 500px;
float: left; 
margin: 10px;

}
.shadow:HOVER {
-webkit-box-shadow: 0px -1px 8px 2px rgba(13,236,252,1);
-moz-box-shadow: 0px -1px 8px 2px rgba(13,236,252,1);
box-shadow: 0px -1px 8px 2px rgba(13,236,252,1);
}

</style>
<body onload="canas();">
<script type="text/javascript">
$(document).ready(canh());
 function canh () {
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "theme1",//theme1
		title:{
			text: "Insights Of TrainingProvider",
			fontFamily: "Helvetica",
			fontSize: 25 
		},
		animationEnabled: true,   // change to true
		data: [              
		{
			// Change type to "bar", "splineArea", "area", "spline", "pie",etc.
			type: "column",
			dataPoints: [
				{ label: "SentMail",  y: 10  },
				{ label: "RecivedMail", y: 15  },
				{ label: "DownloadCalender", y: 25  },
				{ label: "Request",  y: 30  },
				{ label: "Call",  y: 28  }
			]
		}
		]
	});
	 chart.render(); 
	
}
 
 $(document).ready(canm());
 function canm (){
 var chart = new CanvasJS.Chart("MchartContainer",
		    {
		        title: {
		            text: "Email Analysis",
		            	fontFamily: "Helvetica",
						fontSize: 25
		        },
		        animationEnabled: true,
		        axisX:{      
		            interval: 3
		            // labelAngle : 30,
		            // valueFormatString: "HHmm'hrs'"

		        },
		        axisY: {
		            title: "Number of Messages",
		            fontFamily: "Helvetica" 
		        },
		        legend: {
		            verticalAlign: "bottom",
		            horizontalAlign: "center",
		            fontFamily: "Helvetica"
		        },

		        data: [{        
		            name: "received",
		            showInLegend: true,
		            legendMarkerType: "square",
		            type: "area",
		            color: "rgba(40,175,101,0.6)",
		            markerSize: 0,
		            
		            dataPoints: [
		            {x:new Date(2013,0,1,00,00) ,label: "midnight", y: 7  },
		            {x:new Date(2013,0,1,01,00) , y: 8},
		            {x:new Date(2013,0,1,02,00) , y: 5},
		            {x:new Date(2013,0,1,03,00) , y: 7},
		            {x:new Date(2013,0,1,04,00) , y: 6},
		            {x:new Date(2013,0,1,05,00) , y: 8},
		            {x:new Date(2013,0,1,06,00) , y: 12},
		            {x:new Date(2013,0,1,07,00) , y: 24},
		            {x:new Date(2013,0,1,08,00) , y: 36},
		            {x:new Date(2013,0,1,09,00) , y: 35},
		            {x:new Date(2013,0,1,10,00) , y: 37},
		            {x:new Date(2013,0,1,11,00) , y: 29},         
		            {x:new Date(2013,0,1,12,00) , y: 34, label: "noon" },                
		            {x:new Date(2013,0,1,13,00) , y: 38},
		         
		            ]
		        },
		        {        
		            name: "sent",
		            showInLegend: true,
		            legendMarkerType: "square",
		            type: "area",
		            color: "rgba(0,75,141,0.7)",
		            markerSize: 0,
		            label: "",
		            dataPoints: [

		            {x:new Date(2013,0,1,00,00) , label: "midnight", y: 12  },
		            {x:new Date(2013,0,1,01,00) , y: 10},
		            {x:new Date(2013,0,1,02,00) , y: 3},
		            {x:new Date(2013,0,1,03,00) , y: 5},
		            {x:new Date(2013,0,1,04,00) , y: 2},
		            {x:new Date(2013,0,1,05,00) , y: 1},
		            {x:new Date(2013,0,1,06,00) , y: 3},
		            {x:new Date(2013,0,1,07,00) , y: 6},
		            {x:new Date(2013,0,1,08,00) , y: 14},
		            {x:new Date(2013,0,1,09,00) , y: 15},
		            {x:new Date(2013,0,1,10,00) , y: 21},
		            {x:new Date(2013,0,1,11,00) , y: 24},         
		            {x:new Date(2013,0,1,12,00) , y: 28, label: "noon" },                
		            {x:new Date(2013,0,1,13,00) , y: 26},
		          
		            ]
		        }
		        
		        
		        
		        ]
		    });

		chart.render();
	
		}
 
 canp();
 function canp () {
	 var chart = new CanvasJS.Chart("pchartContainer",
				{
					title:{
						text: "Enquiry In Institute",
						fontFamily: "Helvetica",
						fontSize: 30
					},
			                animationEnabled: true,
					legend:{
						verticalAlign: "center",
						horizontalAlign: "left",
						fontSize: 15,
						fontFamily: "Helvetica"        
					},
					theme: "theme2",
					data: [
					{        
						type: "pie",       
						indexLabelFontFamily: "Garamond",       
						indexLabelFontSize: 12,
						indexLabel: "{label} {y}%",
						startAngle:-20,      
						showInLegend: true,
						toolTipContent:"{legendText} {y}%",
						dataPoints: [
							{  y: 83.24, legendText:"java", label: "java" },
							{  y: 8.16, legendText:"DotNet", label: "DotNet" },
							{  y: 4.67, legendText:"Web Design", label: "Web Design" },
							{  y: 1.67, legendText:"Oracle" , label: "Oracle"},       
							{  y: 0.98, legendText:"Others" , label: "Others"}
						]
					}
					]
				});
				chart.render();
	
}
 $(document).ready(cann());
 function cann (){
	 var chart = new CanvasJS.Chart("NchartContainer",
				{
					title: {
						text: " Viewer On Web",
						fontFamily: "Helvetica",
						fontSize: 25 
					},
		                        animationEnabled: true,
					axisX:{      
						valueFormatString: "DD-MMM" ,
						interval: 10,
						intervalType: "day",
						labelAngle: -50,
						labelFontColor: "rgb(0,75,141)",
						minimum: new Date(2012,06,10)
					},
					axisY: {
						title: "Views on Web",
						interlacedColor: "#F0FFFF",
						tickColor: "azure",
						titleFontColor: "rgb(0,75,141)",
						valueFormatString: "#M,,.",
						interval: 100000000
					},
					data: [
					{        
						indexLabelFontColor: "darkSlateGray",
						name: 'views',
						type: "area",
						color: "rgba(0,75,141,0.7)",
						markerSize:8,
						dataPoints: [
						{ x: new Date(2012, 06, 15), y: 0,  indexLabel: "Release", indexLabelOrientation: "vertical", indexLabelFontColor: "orangered", markerColor: "orangered"},       
						{ x: new Date(2012, 06, 18), y: 2000000 }, 
						{ x: new Date(2012, 06, 23), y: 6000000 }, 
						{ x: new Date(2012, 07, 1), y: 10000000, indexLabel:"10m"}, 
						{ x: new Date(2012, 07, 11), y: 21000000 }, 
						{ x: new Date(2012, 07, 23), y: 50000000 }, 
						{ x: new Date(2012, 07, 31), y: 75000000  }, 
						{ x: new Date(2012, 08, 04), y: 100000000, indexLabel:"100m" },
						{ x: new Date(2012, 08, 10), y: 125000000 },
						{ x: new Date(2012, 08, 13), y: 150000000},	
						{ x: new Date(2012, 08, 16), y: 175000000},	
						{ x: new Date(2012, 08, 18), y: 200000000, indexLabel:"200m"},	
						{ x: new Date(2012, 08, 21), y: 225000000},	
						{ x: new Date(2012, 08, 24), y: 250000000},	
						{ x: new Date(2012, 08, 26), y: 275000000},	
						{ x: new Date(2012, 08, 28), y: 302000000, indexLabel:"300m"}	
						]
					}
					
					]
				});

		chart.render();
	
		}


</script>

<div class="shadow" id="chartContainer" style=" "> </div>
<div class="shadow" id="MchartContainer" style="height: 300px; width: 500px;float: left; margin: 10px; "> </div>
<div class="shadow" id="pchartContainer" style="height: 300px; width: 500px;float: left; margin: 10px; "> </div>
<div class="shadow" id="NchartContainer" style="height: 300px; width: 500px;float: left; margin: 10px; "> </div>

</body>
</html>
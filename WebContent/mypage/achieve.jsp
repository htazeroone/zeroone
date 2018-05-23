<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />

<style type="text/css">

#barchart_values{
/*	background-color: pink;
   /*  margin: 0 auto; */

  	 position: absolute;

	 left: 37%;
	 top: 20%;
 	 margin-left: -250px;
	 margin-top: -250px; 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학습성취도</title>


  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
  <script type="text/javascript">
 
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  var arrName = new Array();
  var arrO = new Array();
  var arrX = new Array();

  var arrP = new Array();

 	window.onload=function(){

	function console(ddd){
		$("#conn").append(ddd+"<br>");
	}

	   /* alert("들어오는가"); */

	  <c:forEach var="n" items="${chName}" varStatus="no">
	  	arrName.push("${n}");
	  </c:forEach>

	  <c:forEach var="o" items="${resultONum}" varStatus="no">
	  	arrO.push("${o}");
	  </c:forEach>

	  <c:forEach var="x" items="${resultXNum}" varStatus="no">
	  	arrX.push("${x}");
	  </c:forEach>

  };
  function drawChart() {
/* 	var data = google.visualization.arrayToDataTable([
          ['Genre', '맞은 개수', '틀린 개수', { role: 'annotation' } ],
          [arrName[0], Number(arrO[0]), Number(arrX[0]), ''] 
        ]); 
      
	 for(var i = 1; i< ${totalChNum}; i++){
		data.addRow([arrName[i], Number(arrO[i]),  Number(arrX[i]), '']);
	 }  */
	 
	 var data = new google.visualization.DataTable(); 
     
	 data.addColumn('string', 'AA');
	 data.addColumn('number', '맞은 개수');
	 data.addColumn('number', '틀린 개수');
	 data.addColumn('string', { role: 'annotation' });
	 
	 for(var i = 0; i< ${totalChNum}; i++){
 		 if(Number(arrO[i])==0 && Number(arrX[i])==0){
			data.addRow([arrName[i], null,  null, '']);
		 }else if(Number(arrO[i])==0){
			data.addRow([arrName[i], null,  Number(arrX[i]), '']);
			
		 } else if(Number(arrX[i])==0){
			data.addRow([arrName[i], Number(arrO[i]),  null, '']);
			
		 } else{ 
		 	data.addRow([arrName[i], Number(arrO[i]),  Number(arrX[i]), '']);
		 }
	 } 		
      var view = new google.visualization.DataView(data);

      view.setColumns([0, 
          { calc: "stringify",
            sourceColumn: 1,
            type: "string",
            role: "annotation" },
          1,
          2,
          { calc: "stringify",
            sourceColumn: 2,
            type: "string",
            role: "annotation" }

          ]);

      var options = {
    	  title: 'JAVA 문제 정오답 결과',
    	  fontSize: 15,
    	  vAxis: {title:'Chapter'},
    	  hAxis: {title:'Number of Quiz'},
          width: 990,
          height: 600,
          legend: { position: 'top', maxLines: 5},
          bar: { groupWidth: '75%' }, 
          isStacked: true
        };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  };


  </script>

</head>
<body>

		<div id="barchart_values" ></div>
<!-- <div id="conn" style="width: 900px; height: 500px;"></div> -->

</body>
</html>
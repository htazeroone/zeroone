<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학습성취도</title>

<%
/* ArrayList<String> chName = (ArrayList)request.getAttribute("chName");
ArrayList<Double> percent = (ArrayList)request.getAttribute("percent"); */

int totalChNum = (int)request.getAttribute("totalChNum");
String test = "test";
%>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawStuff);
  var arrN = new Array();
  var arrP = new Array();

window.onload=function(){

/* 	function console(ddd){
		$("#conn").append(ddd+"<br>");
	} */


	/*   alert("들어오는가"); */

	  <c:forEach var="n" items="${chName}" varStatus="no">
	  	arrN.push("${n}");
	  	/* console(arrN[${no.index}]); */
	  </c:forEach>

	  <c:forEach var="p" items="${percent}" varStatus="no">
	  	arrP.push("${p}");
	  	/* console(arrP[${no.index}]); */
	  /* 	obj[key] = arrN[${no.index}];
	  	obj[value] = Number(arrP[${no.index}]);
	  	console(obj['1단원']); */
	  </c:forEach>


  };


  function drawStuff() {
    var data = new google.visualization.arrayToDataTable([
      ['Chapter', 'Correction Percentage'],
      [arrN[0], Number(arrP[0])],

    ]);

	for(var i = 1; i< ${totalChNum}; i++){
		 data.addRow([arrN[i], Number(arrP[i])]);
	}

    var options = {
      title: 'JAVA 퀴즈 정답 현황',
      width: 900,
      legend: { position: 'none' },
      chart: { title: 'JAVA 퀴즈 정답 현황'},
      bars: 'horizontal', // Required for Material Bar Charts.
      axes: {
        x: {
          0: { side: 'top', label: 'Percentage'} // Top x-axis.
        }
      },
      bar: { groupWidth: "90%" }
    };

    var chart = new google.charts.Bar(document.getElementById('top_x_div'));
    chart.draw(data, options);
  };
  </script>

</head>
<body>

<div id="top_x_div" style="width: 900px; height: 500px;"></div>
<!-- <div id="conn" style="width: 900px; height: 500px;"></div> -->

</body>
</html>
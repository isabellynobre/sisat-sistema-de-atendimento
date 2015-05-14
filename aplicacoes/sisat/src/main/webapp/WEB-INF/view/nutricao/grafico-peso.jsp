<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
	<meta charset="UTF-8"/>
	<jsp:include page="../modulos/header-estrutura.jsp" />
	<title>Grafico do Peso</title>

	<style>
		.chart div {
			font: 10px sans-serif;
			background-color: steelblue;
			text-align: right;
			padding: 3px;
			margin: 1px;
			color: white;
		}
	</style>
</head>
<body>
	<jsp:include page="../modulos/header.jsp" />
	
	<div class="container">
		<div class="form" align="center">
			<h1>Peso do paciente ao longo do tempo</h1>
		</div>
		<div class="chart"></div>
	</div>

	<jsp:include page="../modulos/footer.jsp" />
	<script>
	
	var data = [4, 8, 15, 16, 23, 42];
	
	var x = d3.scale.linear()
	    .domain([0, d3.max(data)])
	    .range([0, 420]);

	d3.select(".chart")
	  .selectAll("div")
	    .data(data)
	  .enter().append("div")
	    .style("width", function(d) { return x(d) + "px"; })
	    .text(function(d) { return d; });
	</script>		
	

</body>
</html>
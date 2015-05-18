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
	<jsp:include page="../../modulos/header-estrutura.jsp" />
	<title>Grafico do Peso</title>

	<style type="text/css">
	</style>
</head>
<body>

	<div class="container" align="center"><br>

	    <div class="btn-group" align="center">
	        <button type="button" class="btn btn-primary">Peso</button>
	        <button type="button" class="btn btn-primary">Circunferencia</button>
	        <button type="button" class="btn btn-primary">IMC</button>
	    </div><br>

		<div class="chart" align="center"></div>
		
		<p></p>
	</div>
	
	<script	src="<c:url value="/webjars/d3js/3.5.5/d3.min.js" />"></script>

	<script type="text/javascript">
		var events = '[{"data":"2014-10-10","value":4},]';

	</script>

</body>
</html>
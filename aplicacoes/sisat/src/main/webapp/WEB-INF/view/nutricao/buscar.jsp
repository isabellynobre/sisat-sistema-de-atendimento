<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<jsp:include page="../modulos/header-estrutura.jsp" />
<title>Buscar paciente</title>
</head>
<body>

	<jsp:include page="../modulos/header.jsp" />



	<div class="container">
		<div class="buscar-paciente" align="left">

			<c:if test="${not empty erro }">
				<div class="alert alert-danger" role="alert">${erro}</div>
			</c:if>
			<c:if test="${not empty info }">
				<div class="alert alert-info" role="alert">${info}</div>
			</c:if>
		<label>aaa = ${agendamento }</label>

			<form:form id="buscarPacienteForm" role="form"
				servletReltiveAction="/nutricao/buscar" method="POST"
				cssClass="form-horizontal" class="inline">
				<select name="tipoPesquisa" cssClass="form-control">
					<option value="nome">Nome</option>
					<option value="cpf">CPF</option>
				</select>
				<input id="campo" name="campo" cssClass="form-control"
					placeholder="" size="40" required="required" autofocus="true"/>
				</td>
				<button class="btn btn-primary" name="submit" type="submit" class="btn btn-primary"
					value="Buscar" >
					 Buscar
					 <span class="glyphicon glyphicon-search"/> 
				</button>
				
 			</form:form>


			<%-- <c:if test="${empty pessoas}">
				<div class="alert alert-warning" role="alert">Pessoa não
					encontrada.</div>
			</c:if> --%>
			<c:if test="${not empty pessoas}">
				<div class="panel panel-default">

					<div class="panel-heading" align="center"></div>

					<!-- Table -->
					<table class="table" id="table">
						<thead>
							<tr>
								<th>Nome</th>
								<th>Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pessoa" items="${pessoas}">
								<tr class="linha">
									<td><a href="<c:url value="/nutricao/${pessoa.id}/detalhes"></c:url>">${pessoa.nome}
									</a></td>
									<td><a id="detalhes" data-toggle="modal" href="${pessoa.id}/detalhes">
											<button class="btn btn-info">
												Detalhes <span class="glyphicon glyphicon-eye-open"></span>
											</button></a>
											<a href="/buscar.jsp#myModal" id="m" data-ident="${pessoa.id}" class="btn btn-info" data-toggle="modal">Agendar Consulta</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
<div id="myModal" class="modal fade">
       <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                    <h4 class="modal-title">Agendar Consulta</h4>
			                </div>
			                <form:form id="form" servletRelativeAction="agendar_buscar" method="POST" modelAttribute="agendamento" >
			                	<input type="hidden" name="identificar" value="" >
				                <div class="modal-body">
				                    <div class="col-sm-12">
										<label>Data</label><input type="date" name="data" value="">		
										<label>Hora</label><input type="time" name="hora" value="">
				                	</div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					                    <input type="submit" class="btn btn-info" value="Agendar"/>
					                </div>
				            	</div>
				            </form:form>
			        	</div>
		    		</div>
		    	</div>
							</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="../modulos/footer.jsp" />
	

<script type="text/javascript">
$(document).ready(function(){
	$("a#m").click(function(){
		 var ident = $(this).data("ident");
		 $("#form input[type='hidden']").val(ident);
	});
});

</script>


</body>

</html>
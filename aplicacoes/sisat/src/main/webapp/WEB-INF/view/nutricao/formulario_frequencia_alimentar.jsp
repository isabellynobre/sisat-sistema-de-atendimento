<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
    <jsp:include page="../modulos/header-estrutura.jsp" />
    <title>Frequência Alimentar</title>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <jsp:include page="../modulos/header.jsp" />
     <div class="container">
		<div class="frequencia-alimentar" align="left">
			<div class="form" align="center">
				<form:form id="frequenciaAlimentar" role="form" commandName="frequenciaAlimentar" 
				servletRelativeAction="/nutricao/formulario_frequência_alimentar" 
				method="POST" cssClass="form-horizontal">
			
			<ul class="nav nav-tabs">
			<li class="active"><a href="#">Exames Laboratoriais</a></li>
			<li><a href="#">Avaliação nutricional</a></li>
			<li><a href="#">Questionario de frequencia alimentar</a></li>
		</ul>
		
		
	   <fieldset>
		 <legend>07:00 - Desjejum</legend>
		   <table class="table table-bordered table-hover table-condensed" id="frequenciaalimentar">
			 <thead>
			   <tr>
		           <th>Alimento/Preparo</th>
				   <th>Porção</th>
				   <th>Ação</th>
			   </tr>
			  </thead>
				<tbody>
				  <tr>
                    <td>Café</td>
                    <td>2 xc</td>
                    <td>X</td>
                     </tr>
                     
                     
				       
							</tbody>
							
				<tfoot>
				<form:form commandName="frequenciaAlimentar" servletRelativeAction="nutricao/frequenciaAlimentar" method="post" cssClass="form-control">
					<td>
					  <div class="col-sm-12">
						<form:input id="alimento" path="alimento" cssClass="form-control" placeholder="Digite o Alimento" />
					  </div>
					</td>
					   <td>
						<div class="col-sm-8">
						<form:input id="porcao" path="porcao" cssClass="form-control" placeholder="Digite a Porcao" />
										</div>
									</td>

									<td><input type="button" value="Adicionar" onclick="inserirLinhaTabela()" /></td>
								</form:form>
							</tfoot>
							
		<script language="javascript">
        
        function inserirLinhaTabela() {
           
            var table = document.getElementById("frequenciaalimentar");
           
            var numOfRows = table.rows.length;
            
            var numOfCols = table.rows[numOfRows-1].cells.length;
       
            var newRow = table.insertRow(numOfRows);
        }
 
            </script>
			</table>
		    </fieldset> </br></br></br>
		    
		    
		 <form class="form-inline">
						   <label for="horario" class="col-sm-4 control-label">Hora:</label>
						   <div class="col-sm-2">
						   <form:input id="horario" path="horario" cssClass="form-control" placeholder="Horario"/> 
						   </div>
						   
						   <div class="col-sm-3">
						   <select style="width: 100px" class="form-control">
						   
									<c:forEach items="#{refeicoes}" var="refeicao">
										<option value="${refeicao}">${refeicao.nome}</option>
									</c:forEach>
								</select>
						   </div>
						   
						<div class="col-sm-3">
								<input type="submit" value="Adicionar refeição">
							</div> </br></br></br>
					
					
		</form>
		
		<div class="controls">
						<input name="submit" type="submit" class="btn btn-primary" value="Finalizar Consulta" />
					</div>
		</form:form>
	</div> 
	
	<jsp:include page="../modulos/footer.jsp" />            
</body>
</html>
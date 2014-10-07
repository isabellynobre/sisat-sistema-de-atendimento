<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>

<fieldset>
			<legend>Adicione as refeições</legend>
			
			
			
			<div class="form-group">
				<label for="horaAdd" class="col-sm-2 control-label">Horario:</label>
				<input id="horaAdd" type="time" name="horaAdd"/>
			</div>

			<div class="form-group">	
				<label for="refeicaoAdd" class="col-sm-2 control-label">Refeicao:</label>
				
			  <select name="refeicaoAdd" id="refeicaoAdd" class="col-xs-2">
				  <option value="Desjejum">Desjejum</option>
				  <option value="Lanche da Manha">Lanche da Manhã</option>
				  <option value="Almoco">Almoço</option>
				  <option value="Lanche da Tarde">Lanche da Tarde</option>
				  <option value="Jantar">Jantar</option>
				  <option value="Ceia">Ceia</option>
			</select>
			
			</div>	
			
			
			
			
			      <div class="col-sm-1">
						<a><input type="button" class="btn btn-primary" value="Adiciona Frequencia" id="addFrequencia" /></a>
					</div>
			      <!--  <a id="addFrequencia">Adiciona Frequencia</a>	-->
			      
			      
		</fieldset><br><br>
		
		<div id="frequenciasAdds">
			
		</div>
	
		
<script type="text/javascript">

	var cont = 0;
	var contFrequencia = 0;
	
$(document).ready(function() {
		
		//ADICIONA FREQUENCIA
    $("#addFrequencia").click(function() {
    	var horaFrequencia = $("#horaAdd").val();
    	var refeicaoFrequencia = $("#refeicaoAdd").val();	
    	if(!$('#horaAdd').val() || !$('#refeicaoAdd').val() ) {
				
			return false;
			
    	} else if(contFrequencia < 6){
			var fieldset = $("<fieldset>");
			var divnone = $("<div style='display:none;'>");
			fieldset.append($("<legend>").text(horaFrequencia + ", " + refeicaoFrequencia));
			//fieldset.append($("<a id='deletarfrequencia="+contFrequencia+"'> Deletar Refeicao</a>"));
			fieldset.append($("<a href='javascript:deletarfrequencia(" + contFrequencia + ")' id='deletarfrequencia"+contFrequencia+"'>Deletar alimentos</a>"));
			        
			
			fieldset.append($("<input type='hidden' name='frequencias["+contFrequencia+"].horario' cssClass='form-control' value="+horaFrequencia+">"));
			fieldset.append($("<input type='hidden' name='frequencias["+contFrequencia+"].refeicao' cssClass='form-control' value="+refeicaoFrequencia+">"));

			fieldset.append(
					$("<table class='table'>")
					.append($("<thead>")
							.append($("<tr>")
									.append($("<td  width='40%'>").text("Alimento/Preparo"))
									.append($("<td>").text("Porção"))
									.append($("<td>").append($("<a class='addAlimento btn btn-primary' data-frequenciaAlimentar='"+contFrequencia+"'>adicionar alimentos</a>")))
							)
					)
					.append($("<tbody id='frequenciaAlimentar"+contFrequencia+"'>"))
			);
			$("#frequenciasAdds").append(fieldset);
			contFrequencia++;
		}			
    });
		

	 
    $("#frequenciasAdds").on('click', 'a.addAlimento', function() {
  	  var frequenciaAlimentar = $(this).data("frequenciaalimentar");
  		if(frequenciaAlimentar >= 0 && frequenciaAlimentar < 6){
  		var recipiente = "tbody#frequenciaAlimentar" + frequenciaAlimentar;
  		var contAlimentos = $(recipiente + " tr").length;				
  		$(recipiente)
  			.append($("<tr>")
  					.append($("<td>").append($("<input size='50' name='frequencias["+frequenciaAlimentar+"].alimentos["+contAlimentos+"].alimento' cssClass='form-control'/>")))
  					.append($("<td>").append($("<input size='10' name='frequencias["+frequenciaAlimentar+"].alimentos["+contAlimentos+"].porcao' cssClass='form-control'/>")))
  					.append($("<td>").append($("<a href='javascript:deletarLinha(" + frequenciaAlimentar + ", " + contAlimentos + ")' class='delAlimento btn btn-danger glyphicon glyphicon-edit'>Deletar alimentos</a>")))
  					
  			);
  		contAlimentos = $(recipiente + " tr").length;
 	}

    });
  });
  
  
	 function deletarLinha(frequenciaAlimentar, index) {
			if(frequenciaAlimentar >= 0 && frequenciaAlimentar < 6){
				alert("teste");
				var recipiente = "tbody#frequenciaAlimentar" + frequenciaAlimentar;
				alert(recipiente);
				var size = $("table > "+recipiente+" tr" ).length;
				$( "table > "+recipiente+" tr" ).eq( index ).remove();
	            
				size = $("table > "+recipiente+" tr" ).length;
				for( var i = 0; i < size; ++i){
					$( "table > "+recipiente+" tr:eq(" + i + ") td > a" ).attr("href", "javascript:deletarLinha(" + frequenciaAlimentar +", " + i + ")");
					$( "table > "+recipiente+" tr:eq(" + i + ") td > input[name$='alimento']" ).attr("name", "frequencias[" + frequenciaAlimentar + "].alimentos[" + i + "].alimento");
					$( "table > "+recipiente+" tr:eq(" + i + ") td > input[name$='porcao']" ).attr("name", "frequencias[" + frequenciaAlimentar + "].alimentos[" + i + "].porcao");
				}
			}
		}
	 
	 
	 function deletarfrequencia(contFrequencia){
	   // $("#frequenciasAdds").on('click', 'a.deletarfrequencia', function() {
	    	alert("teste" + $("#frequenciasAdds fieldset").length);
			//alert($("a.deletarfrequencia").parent().parent().html());
			if(contFrequencia >= 0 && contFrequencia < 6){
			   var deletar = "a#deletarfrequencia" + contFrequencia;
			   $(deletar).parent().remove();
			   
			   var size = $("#frequenciasAdds fieldset").length;
			   
			   for(var i = 0; i < size; ++i){
				   $( "fieldset + input[type$='hidden']" ).attr("type", "deletarfrequencia[" + i + "]");
				  
	        //$("a.deletarfrequencia").parent().remove();
	      
	    }
	 //}
	   }
	 }
 
				
</script>

<style type="text/css">




</style>


</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Desjejum -->
<fieldset>
	<legend>Desjejum</legend>
	
	<div class="form-inline">
		<label for="horario" class="col-sm-4 control-label">Hora:</label>
		<div class="col-sm-8">
		<input id="horario" path="horario" cssClass="form-control" placeholder="Horario"/>
		</div>
	</div>

	<table class="table table-bordered table-hover table-condensed" id="frequenciaalimentar">
		<thead>
			<tr>
				<th>Alimento/Preparo</th>
				<th>Porção</th>
				<th>
					<div class="col-sm-1">
						<a><input type="button" value="Adicionar" id="incluir" /></a>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</fieldset>



<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#incluir").click(function() {
			$("#frequenciaalimentar").append("<tr id='+cont+'><td><div class=col-sm-5><input type='text' name='campo1' cssClass='form-control' placeholder='Digite o alimento'/></div></td> <td><input type='text' name='campo2'cssClass='form-control' placeholder='Digite a porcao'/></td><td><input type='button' value='Excluir' id='bot2'/</td></tr>");
		});
	});
</script>
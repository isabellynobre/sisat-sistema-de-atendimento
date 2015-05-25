package br.ufc.quixada.npi.sisat.service;

import java.util.List;

import br.ufc.quixada.npi.service.GenericService;
import br.ufc.quixada.npi.sisat.model.ConsultaNutricional;

public interface ConsultaNutricionalService extends GenericService<ConsultaNutricional> {
	
	public abstract List<ConsultaNutricional> getPesoAndData(Long id);

	public abstract List<ConsultaNutricional> getCircunferenciaAndData(Long id);

	public abstract List<ConsultaNutricional> getIMCAndData(Long id);

	public abstract ConsultaNutricional getConsultaNutricionalWithDocumentosById(Long id);
}

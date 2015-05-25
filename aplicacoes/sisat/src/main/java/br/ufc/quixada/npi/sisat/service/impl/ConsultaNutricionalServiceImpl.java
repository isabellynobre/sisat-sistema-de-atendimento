package br.ufc.quixada.npi.sisat.service.impl;

import java.util.List;

import javax.inject.Named;

import br.ufc.quixada.npi.service.impl.GenericServiceImpl;
import br.ufc.quixada.npi.sisat.model.ConsultaNutricional;
import br.ufc.quixada.npi.sisat.service.ConsultaNutricionalService;
import br.ufc.quixada.npi.util.SimpleMap;

@Named
public class ConsultaNutricionalServiceImpl extends GenericServiceImpl<ConsultaNutricional> implements ConsultaNutricionalService {

	@Override
	public ConsultaNutricional getConsultaNutricionalWithDocumentosById(Long id) {
		return (ConsultaNutricional) findFirst("ConsultaNutricional.findConsultaNutricionalWithDocumentosById", new SimpleMap<String, Object>("id", id)); 
	}

	@Override
	public List<ConsultaNutricional> getPesoAndData(Long id) {
		return (List<ConsultaNutricional>) find("ConsultaNutricional.findPesoAndData", new SimpleMap<String, Object>("id", id)); 
	}

	@Override
	public List<ConsultaNutricional> getCircunferenciaAndData(Long id) {
		return find("ConsultaNutricional.findCircunferenciaAndData", new SimpleMap<String, Object>("id", id)); 
	}

	@Override
	public List<ConsultaNutricional> getIMCAndData(Long id) {
		return find("ConsultaNutricional.findIMCAndData", new SimpleMap<String, Object>("id", id));
	}	
}

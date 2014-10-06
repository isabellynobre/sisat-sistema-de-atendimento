package br.com.ufc.quixada.npi.sisat.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.ufc.quixada.npi.sisat.enumerator.Classificacao;
import br.com.ufc.quixada.npi.sisat.model.Agendamento;
import br.com.ufc.quixada.npi.sisat.model.ConsultaNutricional;
import br.com.ufc.quixada.npi.sisat.model.Paciente;
import br.com.ufc.quixada.npi.sisat.model.Pessoa;
import br.com.ufc.quixada.npi.sisat.service.AgendamentoService;
import br.com.ufc.quixada.npi.sisat.service.ConsultaNutricionalService;
import br.com.ufc.quixada.npi.sisat.service.PacienteService;
import br.com.ufc.quixada.npi.sisat.service.PessoaService;

@Controller
@RequestMapping("nutricao")
public class NutricaoController {
	
	@Inject
	private PacienteService servicePaciente;
	
	@Inject
	private PessoaService servicePessoa;
	
	@Inject
	private ConsultaNutricionalService consultaNutricionalService;
	
	@Inject
	private AgendamentoService serviceAgendamento;

	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String index() {
		return "nutricao/buscar";
	}
	
	@RequestMapping(value = {"/buscar"}, method = RequestMethod.GET)
	public String buscarPaciente(Model model) {		
		return "nutricao/buscar";
	}
	
	@RequestMapping(value = {"/agendar_consulta"}, method = RequestMethod.GET)
	public String agendamento(Model model) {
		model.addAttribute("agendamento", new Agendamento());
		model.addAttribute("paciente", new Pessoa());
		return "nutricao/agendar_consulta";
	}
	
	@RequestMapping(value = {"/agendar"}, method = RequestMethod.POST)
	public String agendamento(@ModelAttribute("paciente") Pessoa paciente, @ModelAttribute("agendamento") Agendamento agendamento ) {
		System.out.println(paciente.toString());
		return "nutricao/agendar_consulta";
	}
	
	@RequestMapping(value = "/buscar", method = RequestMethod.POST)
	public String buscarPaciente(@RequestParam("tipoPesquisa") String tipoPesquisa, @RequestParam("campo") String campo, Model model) {
		if(tipoPesquisa.equals("cpf")){
			model.addAttribute("pessoas", servicePessoa.getPessoasByCpf(campo));
		}else if(tipoPesquisa.equals("nome")){
			model.addAttribute("pessoas", servicePessoa.getPessoasByNome(campo));
		}
		return "/nutricao/buscar";
	}
	
	@RequestMapping(value = "/agendar_buscar", method = RequestMethod.POST)
	public String buscarPessoa(@RequestParam("identificar") Long id, @ModelAttribute("agendamento") Agendamento agendamento) {
		Paciente paciente = servicePaciente.find(Paciente.class, id);
		
		if(paciente == null){
			paciente = new Paciente();
			paciente.setPessoa(servicePessoa.find(Pessoa.class, id));
			servicePaciente.save(paciente);
		} 
		
		agendamento.setPaciente(paciente);
		serviceAgendamento.save(agendamento);
		
		System.out.println("idididi = "+id);
		return "nutricao/buscar";
	}	
	
	@RequestMapping(value = {"/{id}/detalhes"})
	public String getDetalhes(Pessoa p, @PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes){
		Pessoa pessoa = servicePessoa.find(Pessoa.class, id);
		if(pessoa == null){
			redirectAttributes.addFlashAttribute("erro", "Paciente não encontrado.");
			return "redirect:/nutricao/buscar";
		}
		model.addAttribute("pessoa", pessoa);
		return "nutricao/detalhes";
	}
	
	
	@RequestMapping(value = {"/consulta"}, method = RequestMethod.GET)
	public String consulta(Model model, HttpSession session) {
		System.out.println("consulta get");
		ConsultaNutricional consultaNutricional = new ConsultaNutricional();
		model.addAttribute("consulta", consultaNutricional);
		Classificacao[] cla= Classificacao.values();
		model.addAttribute("classificacao", cla);
		return "nutricao/consulta";
	}

	@RequestMapping(value = {"/{id}/realizar"}, method = RequestMethod.GET)
	public void realizarConsulta(Model model, @PathVariable("id") Long id) {
		System.out.println("realizarConsulta teste " + id);
		Pessoa pessoa = servicePessoa.find(Pessoa.class, id);
		Paciente paciente = new Paciente();
		paciente.setPessoa(pessoa);
		servicePaciente.save(paciente);
	}

	@RequestMapping(value = {"/consulta"}, method = RequestMethod.POST)
	public String consulta(@ModelAttribute("consulta") ConsultaNutricional consulta, BindingResult result) {
		if (result.hasErrors()) {
			return ("/paciente/cadastrar");
		}
		if(consulta.getAgua().length()==0){
			consulta.setAgua(null);
		}
		if(consulta.getMedicamentoComentario()!=null && consulta.getMedicamentoComentario().isEmpty()){
			consulta.setMedicamentoComentario(null);
		}
		if(consulta.getMastigacaoComentario()!=null && consulta.getMastigacaoComentario().isEmpty()){
			consulta.setMastigacaoComentario(null);
		}
		if(consulta.getAlergiaComentario()!=null && consulta.getAlergiaComentario().isEmpty()){
			consulta.setAlergiaComentario(null);
		}
		if(consulta.getCarneVermelhaComentario()!=null && consulta.getCarneVermelhaComentario().isEmpty()){
			consulta.setCarneVermelhaComentario(null);
		}
		if(consulta.getAtividadeFisicaComentario()!=null && consulta.getAtividadeFisicaComentario().isEmpty()){
			consulta.setAtividadeFisicaComentario(null);
		}
		if(consulta.getBebidaAlcoolicaComentario()!=null && consulta.getBebidaAlcoolicaComentario().isEmpty()){
			consulta.setBebidaAlcoolicaComentario(null);
		}
		consultaNutricionalService.save(consulta);
		return "nutricao/consulta";
	}
}


package br.ufc.quixada.npi.sisat.controller;

import java.util.Date;
import java.util.List;

import javassist.expr.NewArray;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.quixada.npi.sisat.model.Alimentacao;
import br.ufc.quixada.npi.sisat.model.ConsultaNutricional;
import br.ufc.quixada.npi.sisat.model.FrequenciaAlimentar;
import br.ufc.quixada.npi.sisat.model.Paciente;
import br.ufc.quixada.npi.sisat.model.Pessoa;
import br.ufc.quixada.npi.sisat.model.enuns.Classificacao;
import br.ufc.quixada.npi.sisat.model.enuns.Refeicao;
import br.ufc.quixada.npi.sisat.service.ConsultaNutricionalService;
import br.ufc.quixada.npi.sisat.service.PacienteService;
import br.ufc.quixada.npi.sisat.service.PessoaService;

@Controller
@RequestMapping("nutricao")
public class NutricaoController {

	@Inject
	private PacienteService pacienteService;

	@Inject
	private PessoaService pessoaService;

	@Inject
	private ConsultaNutricionalService consultaNutricionalService;

	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String index() {
		return "nutricao/buscar";
	}


	//Buscar paciente (get)
	@RequestMapping(value = {"/buscar"}, method = RequestMethod.GET)
	public String buscarPaciente(Model model, HttpSession session) {
		getUsuarioLogado(session);
		return "nutricao/buscar";
	}

	//Buscar paciente (post)
	@RequestMapping(value = "/buscar", method = RequestMethod.POST)
	public String buscarPaciente(@RequestParam("busca") String busca, ModelMap map, RedirectAttributes redirectAttributes, Authentication authentication) {
		map.addAttribute("busca", busca);
		List<Pessoa> pessoas = pessoaService.getPessoasByNomeOuCpf(busca);

		Pessoa pessoa = pessoaService.getPessoaByLogin(authentication.getName());;		

		pessoas.remove(pessoa);

		if(!pessoas.isEmpty()){
			map.addAttribute("pessoas", pessoas); 
		}else{
			redirectAttributes.addFlashAttribute("erro", "Paciente não encontrado.");
			return "redirect:/nutricao/buscar";
		}

		return "/nutricao/buscar";
	}


	@RequestMapping(value = "editarConsulta/{id}", method = RequestMethod.GET)
	public String editarConsulta(@PathVariable("id") long id, Model model) {
		ConsultaNutricional consultaNutricional = consultaNutricionalService.find(ConsultaNutricional.class, id);
		model.addAttribute("action", "editar");
		model.addAttribute("consultaNutricional", consultaNutricional);
		Classificacao[] cla= Classificacao.values();
		model.addAttribute("classificacao", cla);		
		return "/nutricao/consulta";
	}
	
	@RequestMapping(value = "obterFrequenciaAlimentar/{id}", method = RequestMethod.GET)
	public void obterFrequenciaAlimentar(@PathVariable("id") long id, Model model) {
			
		System.err.println(id);
	}
	
	@RequestMapping(value = {"/editarConsulta"}, method = RequestMethod.POST)
	public String editarConsulta(Model model, @Valid ConsultaNutricional consulta, BindingResult result, RedirectAttributes redirectAttributes) {
		model.addAttribute("action", "editar");

		if (result.hasErrors()) {
			return ("nutricao/consulta");
		}		
		Paciente paciente = pacienteService.find(Paciente.class, consulta.getPaciente().getId());

		Date data = consultaNutricionalService.find(ConsultaNutricional.class, consulta.getId()).getData(); 

		consulta.setData(data);
		consulta.setPaciente(paciente);

		consultaNutricionalService.update(atualizarConsulta(consulta));
		redirectAttributes.addFlashAttribute("success", "Consulta do paciente <strong>" + consulta.getPaciente().getPessoa().getNome() + "</strong> atualizada com sucesso.");
		return "redirect:/nutricao/detalhes/" + consulta.getPaciente().getId();
	}

	@RequestMapping(value = "/frequencia-alimentar.json", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<FrequenciaAlimentar> getFrequencias() {
		Long id = (long) 14;
		List<FrequenciaAlimentar> frequenciaAlimentars = consultaNutricionalService.getConsultaNutricionalWithFrequenciaByID(id).getFrequencias();
		
		return frequenciaAlimentars;
	}

	private ConsultaNutricional atualizarConsulta(ConsultaNutricional consulta) {
		if (consulta.getFrequencias() != null) {
			for (FrequenciaAlimentar frequencia : consulta.getFrequencias()) {
				frequencia.setConsultaNutricional(consulta);
				if (frequencia.getAlimentos() != null) {
					for (Alimentacao alimentacao : frequencia.getAlimentos()) {
						alimentacao.setFrequenciaAlimentar(frequencia);
					}
				}
			}
		}
		return consulta;
	}

	//Detalhes de paciente
	@RequestMapping(value = {"detalhes/{id}"})
	public String getDetalhes(Pessoa p, @PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes){
		Pessoa pessoa = pessoaService.find(Pessoa.class, id);
		if(pessoa == null){
			redirectAttributes.addFlashAttribute("erro", "Paciente não encontrado.");
			return "redirect:/nutricao/buscar";
		}

		model.addAttribute("pessoa", pessoa);
		return "nutricao/detalhes";
	}



	//=========================== Consulta Nutricional ===========================
	//Consulta Nutricional --> Create
	@RequestMapping(value = {"consulta/{id}"}, method = RequestMethod.GET)
	public String realizarConsulta(Model model, @PathVariable("id") Long id, RedirectAttributes redirectAttributes) {

		model.addAttribute("action", "cadastrar");

		Pessoa pessoa = pessoaService.find(Pessoa.class, id);		


		if(pessoa == null){
			redirectAttributes.addFlashAttribute("erro", "Paciente não encontrado.");
			return "redirect:/nutricao/buscar";
		}

		if(pessoa.getPaciente() == null){
			pessoa.setPaciente(new Paciente());
			pessoa.getPaciente().setPessoa(pessoa);

			pessoaService.update(pessoa);
		}

		ConsultaNutricional consulta = new ConsultaNutricional();
		Paciente paciente = pessoa.getPaciente();
		consulta.setPaciente(paciente);
		model.addAttribute("consultaNutricional", consulta);
		model.addAttribute("classificacao", Classificacao.values());
		model.addAttribute("refeicoes", Refeicao.values());		

		return "nutricao/consulta";
	}

	@RequestMapping(value = {"/consultar"}, method = RequestMethod.POST)
	public String consulta(Model model, @Valid ConsultaNutricional consulta, BindingResult result, RedirectAttributes redirectAttributes) {		
		model.addAttribute("action", "cadastrar");

		if (result.hasErrors()) {
			return ("nutricao/consulta");
		}

		Paciente paciente = pacienteService.find(Paciente.class, consulta.getPaciente().getId());
		double altura = consulta.getPaciente().getAltura();
		Date data = new Date(System.currentTimeMillis());
		consulta.setData(data);
		consulta.setPaciente(paciente);
		consulta.getPaciente().setAltura(altura);

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

		redirectAttributes.addFlashAttribute("success", "Consulta de <strong>id = " + consulta.getId() + "</strong> e paciente <strong>" + consulta.getPaciente().getPessoa().getNome() + "</strong> realizada com sucesso.");
		return "redirect:/nutricao/buscar";

	}

	//Consulta Nutricional --> Read
	@RequestMapping(value = {"detalhesConsulta/{id}"})
	public String getDetalhesConsulta(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes){
		ConsultaNutricional consulta = consultaNutricionalService.find(ConsultaNutricional.class, id);

		if(consulta == null){
			redirectAttributes.addFlashAttribute("erro", "Consulta não encontrado.");
			return "redirect:/nutricao/buscar";
		}

		model.addAttribute("consulta", consulta);
		return "nutricao/detalhesConsulta";
	}


	private Pessoa getUsuarioLogado(HttpSession session) {
		if (session.getAttribute("usuario") == null) {
			Pessoa pessoa = pessoaService.getPessoaByLogin(SecurityContextHolder.getContext().getAuthentication().getName());
			session.setAttribute("usuario", pessoa);
		}
		return (Pessoa) session.getAttribute("usuario");
	}
}

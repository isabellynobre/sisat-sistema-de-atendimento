package br.com.ufc.quixada.npi.sisat.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class FrequenciaAlimentar {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern="hh:mm")
	private Date horario;
	
	@Enumerated(EnumType.STRING)
	private Refeicoes refeicao;
	
    @ManyToOne
	private ConsultaNutricional consultaNutricional;
    
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name= "frequenciaAlimentar_id")
	private List<Alimentacao> alimentos;
	
	public enum Refeicoes {

		DESJEJUM("Desjejum"), LANCHE_DA_MANHA("Lanche da Manha"), ALMOCO("Almoço"), LANCHE_DA_TARDE("Lanche da Tarde"), JANTAR("Jantar"), CEIA("Ceia");

		private final String nome;

		Refeicoes(String nome){
			this.nome = nome;

		}

		public String getNome(){
			return this.nome;
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public List<Alimentacao> getAlimentos() {
		return alimentos;
	}

	public void setAlimentos(List<Alimentacao> alimentos) {
		this.alimentos = alimentos;
	}

	
	public ConsultaNutricional getConsultaNutricional() {
		return consultaNutricional;
	}

	public void setConsultaNutricional(ConsultaNutricional consultaNutricional) {
		this.consultaNutricional = consultaNutricional;
	}

	@Override
	public String toString() {
		return "FrequenciaAlimentar [id=" + id + ", horario=" + horario
				+ ", refeicao=" + refeicao + ", \n   alimentos=" + alimentos + "]";
	}


	public void setRefeicao(Refeicoes refeicao) {
		this.refeicao = refeicao;
	}

	public Refeicoes getRefeicao() {
		return refeicao;
	}

	public Date getHorario() {
		return horario;
	}

	public void setHorario(Date horario) {
		this.horario = horario;
	}
	   
}



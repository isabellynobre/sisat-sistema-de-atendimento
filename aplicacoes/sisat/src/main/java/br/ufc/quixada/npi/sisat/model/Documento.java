package br.ufc.quixada.npi.sisat.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

@Entity
public class Documento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nomeOriginal;

	private String nome;

	private String tipo;

	@Type(type = "org.hibernate.type.BinaryType")
	private byte[] arquivo;

	@ManyToOne
	@JoinColumn(name = "consultaNutricional_id")
	private ConsultaNutricional consultaNutricional;

	public Documento() {
		super();
	}

	public Documento(String nomeOriginal, String nome, String tipo,
			byte[] arquivo, ConsultaNutricional consultaNutricional) {
		super();
		this.nomeOriginal = nomeOriginal;
		this.nome = nome;
		this.tipo = tipo;
		this.arquivo = arquivo;
		this.consultaNutricional = consultaNutricional;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeOriginal() {
		return nomeOriginal;
	}

	public void setNomeOriginal(String nomeOriginal) {
		this.nomeOriginal = nomeOriginal;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public byte[] getArquivo() {
		return arquivo;
	}

	public void setArquivo(byte[] arquivo) {
		this.arquivo = arquivo;
	}

	public ConsultaNutricional getConsultaNutricional() {
		return consultaNutricional;
	}

	public void setConsultaNutricional(ConsultaNutricional consultaNutricional) {
		this.consultaNutricional = consultaNutricional;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Documento) {
			Documento other = (Documento) obj;
			if (other != null && other.getId() != null && this.id != null
					&& other.getId().equals(this.id)) {
				return true;
			}
		}
		return false;
	}
}

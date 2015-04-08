package br.ufc.quixada.npi.sisat.model.enuns;

public enum Classificacao {
		
	VAZIO(null),
	MUITOALTO("Muito Alto"),	
	ALTO("Alto"),
	DESEJAVEL("Desejavel"),
	BAIXO("Baixo"),
	MUITOBAIXO("Muito Baixo");

	private String tipo;
		
	private Classificacao(String tipo){
		this.tipo = tipo;
	}

	public String getTipo() {
		return tipo;
	}
	
}

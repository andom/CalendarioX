package br.com.calenderx;

public class Agenda {
    private int IdAgenda;
    private int IdTpCompromisso;
    private String DtInicio;
    private String DtFim;
    private String DsAssunto;
    private String DsObservacao;

    public int getIdAgenda() {
        return IdAgenda;
    }

    public void setIdAgenda(int IdAgenda) {
        this.IdAgenda = IdAgenda;
    }

    public int getIdTpCompromisso() {
        return IdTpCompromisso;
    }

    public void setIdTpCompromisso(int IdTpCompromisso) {
        this.IdTpCompromisso = IdTpCompromisso;
    }

    public String getDtInicio() {
        return DtInicio;
    }

    public void setDtInicio(String DtInicio) {
        this.DtInicio = DtInicio;
    }

    public String getDtFim() {
        return DtFim;
    }

    public void setDtFim(String DtFim) {
        this.DtFim = DtFim;
    }

    public String getDsAssunto() {
        return DsAssunto;
    }

    public void setDsAssunto(String DsAssunto) {
        this.DsAssunto = DsAssunto;
    }

    public String getDsObservacao() {
        return DsObservacao;
    }

    public void setDsObservacao(String DsObservacao) {
        this.DsObservacao = DsObservacao;
    }
}

package br.com.calenderx;

public class GenericRet {
    
    private int CodRetorno;
    private String MsgRetorno;
    
    public GenericRet(int p_cod , String p_msg){
        CodRetorno = p_cod;
        MsgRetorno = p_msg;
    }
    
    public int getCodRetorno() {
        return CodRetorno;
    }

    public String getMsgRetorno() {
        return MsgRetorno;
    }
}

package br.com.calenderx;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AgendaDAO {

    private Connection conn;

    public AgendaDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Agenda> selecionar() throws SQLException {
        return selecionar(0);
    }
    
    public List<Agenda> selecionar(int p_idagenda) throws SQLException {
        List<Agenda> resultados = new ArrayList<Agenda>();
        ResultSet rs;
        try {
            Statement stat = conn.createStatement();
            
            if (p_idagenda > 0)
                rs = stat.executeQuery("SELECT IdAgenda,IdTpCompromisso,DtInicio,DtFim,DsAssunto,DsObservacao FROM agenda WHERE IdAgenda = " + p_idagenda);
            else
                rs = stat.executeQuery("SELECT IdAgenda,IdTpCompromisso,DtInicio,DtFim,DsAssunto,DsObservacao FROM agenda");
                
            while (rs.next()) {
                Agenda objAgenda = new Agenda();
                objAgenda.setIdAgenda(rs.getInt("IdAgenda"));
                objAgenda.setIdTpCompromisso(rs.getInt("IdTpCompromisso"));
                objAgenda.setDtInicio(rs.getString("DtInicio"));
                objAgenda.setDtFim(rs.getString("DtFim"));
                objAgenda.setDsAssunto(rs.getString("DsAssunto"));
                objAgenda.setDsObservacao(rs.getString("DsObservacao"));
                resultados.add(objAgenda);
            }
            return resultados;
        } 
        catch (SQLException e) {
            throw e;
        }
    }   

    public void atualizar(Agenda agenda) throws SQLException {
        try {
            String strSQL;

            strSQL  = "UPDATE agenda SET IdTpCompromisso=?, DtInicio=?, DtFim=?, DsAssunto=?, DsObservacao=? WHERE IdAgenda=?";
            PreparedStatement pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, agenda.getIdTpCompromisso());
            pstmt.setString(2, agenda.getDtInicio());
            pstmt.setString(3, agenda.getDtFim());
            pstmt.setString(4, agenda.getDsAssunto());
            pstmt.setString(5, agenda.getDsObservacao());
            pstmt.setInt(6, agenda.getIdAgenda());

            pstmt.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void inserir(Agenda agenda) throws SQLException {
        try {
            String strSQL;

            strSQL  = "INSERT INTO agenda (IdTpCompromisso,DtInicio,DtFim,DsAssunto,DsObservacao) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, agenda.getIdTpCompromisso());
            pstmt.setString(2, agenda.getDtInicio());
            pstmt.setString(3, agenda.getDtFim());
            pstmt.setString(4, agenda.getDsAssunto());
            pstmt.setString(5, agenda.getDsObservacao());

            pstmt.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deletar(int p_idagenda) throws SQLException {
        try {
            String strSQL;

            strSQL  = "DELETE FROM agenda WHERE IdAgenda=?";
            PreparedStatement pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, p_idagenda);

            pstmt.executeUpdate();
            
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }    
    
}

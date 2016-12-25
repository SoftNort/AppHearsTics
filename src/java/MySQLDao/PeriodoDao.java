package MySQLDao;

import ClasesDTO.Periodo;
import InterfazDatos.IPeriodoDao;
import Util.Conexion;
import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PeriodoDao implements Serializable, IPeriodoDao {

    private Conexion conexion;

    public PeriodoDao() throws SQLException {
        this.conexion = new Conexion();
    }

    @Override
    public boolean insertarPeriodo(Periodo periodo) {
        String consulta = "INSERT INTO Periodo (idPeriodo, fechaInicial, fechaFinal, year) "
                + "VALUES (?,?,?,?)";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setLong(1, periodo.getNumero());
            pst.setDate(2, new java.sql.Date(periodo.getFechaInicio().getTime()));
            pst.setDate(3, new java.sql.Date(periodo.getFechaFin().getTime()));
            pst.setLong(4, periodo.getYear());
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean activarPeriodo() {
        String consulta = "UPDATE Periodo "
                + "SET estado=? "
                + "WHERE fechaInicial<curdate() AND fechaFinal>curdate()";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, "ACTIVO");
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }
    
    @Override
    public boolean desactivarPeriodo() {
        String consulta = "UPDATE Periodo "
                + "SET estado=? "
                + "WHERE fechaInicial>curdate() OR fechaFinal<curdate()";
        boolean b = true;
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, "INACTIVO");
            b = pst.execute();
            pst.close();
            this.conexion.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return b;
    }

    @Override
    public Periodo obtenerPeriodoActivo() {
        Periodo i = null;
        String consulta = "Select idPeriodo, year, fechaInicial, fechaFinal "
                + "FROM Periodo "
                + "WHERE estado=?";
        try {
            PreparedStatement pst = this.conexion.getConexion().prepareStatement(consulta);
            pst.setString(1, "ACTIVO");
            ResultSet rs = pst.executeQuery();
            System.out.println("Antes del if ");
            if(rs.next()){
                System.out.println("En el if");
                i = new Periodo(rs.getByte(1), rs.getInt(2), rs.getDate(3),rs.getDate(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PeriodoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return i;
    }
    
    
    
}

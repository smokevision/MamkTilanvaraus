package tilanvaraus.oliot;
import java.io.*;
import java.sql.*;

public class TietokantaPerus implements Serializable {
    protected Connection yhteys = null;
    protected PreparedStatement komento = null;
    protected ResultSet vastaus = null;
    
    public Boolean avaaYhteys(String ktunnus, String sala) {
        boolean tila = true;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String yhteysjono = "jdbc:mysql://localhost:3306/tilanvaraus_mamk?useEncoding=true&characterEncoding=UTF-8";
            this.yhteys = DriverManager.getConnection(yhteysjono,ktunnus,sala);
        } catch(Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public Boolean suljeYhteys() {
        boolean tila = true;
        try {
            this.yhteys.close();
        } catch(Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public ResultSet getVastaus() {
        return this.vastaus;
    }
    
}
package tilanvaraus.oliot;
import java.sql.*;
import org.joda.time.DateTime;
 
public class Joda extends TietokantaPerus {
    private ResultSet varaukset = null;
    
    private String nykPaivays = "";

    private boolean yhteys_auki = false;
    public Joda() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public String testi(){
        String tulos = "";
        this.varaukset = haeTilanVaraukset(1);
        DateTime kalenteri = new DateTime(2014,4,11,12,0);
        this.nykPaivays = kalenteri.toString("YYYY-MM-dd");
        
        try{
            while (this.varaukset.next()) {
                DateTime paiva = new DateTime(new Long(this.varaukset.getString("pvm")));
                if(this.nykPaivays.equals(paiva.toString("YYYY-MM-dd"))){
                    tulos = "vapaita";
                } else {
                    tulos = paiva.toString("YYYY-MM-dd");
                }
            }
        } catch(Exception e){
            tulos = e.getMessage();
        }

        
        return tulos;
    }
    
    private ResultSet haeTilanVaraukset(int tilaId){
        ResultSet varaukset = null;
        try {
             String lause = "select * from varaus where tilaid = ? order by loppuAika asc;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, tilaId);
             varaukset = komento.executeQuery();
        } catch (Exception e1) {
            varaukset = null;
        } finally {
            return varaukset;
        }
    }    
}

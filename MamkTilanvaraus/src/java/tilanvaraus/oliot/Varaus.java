package tilanvaraus.oliot;
import java.sql.*;

public class Varaus extends TietokantaPerus {
    private int varausId = 0;
    private int tilaId = 0;
    private int asiakasId = 0;
    private String pvm = "";
    private int alkuaika = 0;
    private int loppuaika = 0;
    private double hinta = 0.0;
    private int maksutilanne = 0;
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Varaus() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public void setVarausId(int id) {
        this.varausId = id;
    }
    
    public void setTilaId(int tilaId) {
        this.tilaId = tilaId;
    }
    
    public void setAsiakasId(int asiakasId) {
        this.asiakasId = asiakasId;
    }
    
    public void setPvm(String pvm) {
        this.pvm = pvm;
    }
 
    public void setAlkuaika(int alkuaika) {
        this.alkuaika = alkuaika;
    }
    
    public void setLoppuaika(int loppuaika) {
        this.loppuaika = loppuaika;
    }
    
    public void setHinta(double hinta) {
        this.hinta = hinta;
    }
    
    public void setMaksutilanne(int maksutilanne) {
        this.maksutilanne = maksutilanne;
    }
    
    public boolean haeVaraukset() {
        boolean tila = true;
        try {
             String lause = "select v.id,v.asiakasId,k.etunimi,k.sukunimi,v.tilaId,t.nimi,v.varausaika,vt.pvm,v.maksutapa,v.maksutilanne,v.summa "
                     + "from varaukset as v "
                     + "join varauksentunnit as vt on v.id = vt.varausnumero "
                     + "join tila as t on v.tilaId = t.id "
                     + "join kayttaja as k on v.asiakasId = k.id "
                     + "group by v.id order by v.id asc;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeTilanVaraukset() {
        boolean tila = true;
        try {
             String lause = "select * from varaus where tilaid = ? order by loppuAika asc;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.tilaId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeVaraus() {
        boolean tila = true;
        try {
             String lause = "select v.id,v.asiakasId,k.etunimi,k.sukunimi,k.katuosoite,k.postinumero,k.postitoimipaikka,k.email,k.puh,k.yritys,v.tilaId,v.varausaika,v.pvm,v.summa,v.maksutapa,v.maksutilanne "
                     + "from varaukset as v join kayttaja as k on v.asiakasId = k.id where v.id = ?";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.varausId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
    
    public boolean haeVarauksenTunnit() {
        boolean tila = true;
        try {
             String lause = "select * from varauksentunnit where varausnumero = ?";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.varausId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
    
    public boolean lisaaVaraus() {
        boolean tila = true;
        try {
             String lause = "INSERT INTO `varaus`(tilaid, asiakasid, pvm, alkuAika, loppuAika, hinta, maksutilanne) VALUES (?,?,?,?,?,?,?);";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.tilaId);
             komento.setInt(2, this.asiakasId);
             komento.setString(3, this.pvm);
             komento.setInt(4, this.alkuaika);
             komento.setInt(5, this.loppuaika);
             komento.setDouble(6, this.hinta);
             komento.setInt(7, this.maksutilanne);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
}

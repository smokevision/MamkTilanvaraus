package tilanvaraus.oliot;
import java.sql.*;
import java.security.*;

public class Asiakas extends TietokantaPerus {
    private int asiakasId = 0;
    private String etunimi = "";
    private String sukunimi = "";
    private String katuosoite = "";
    private String postinumero = "";
    private String postitoimipaikka = "";
    private String email = "";
    private String puh = "";
    private String yritys = "";
    private String ytunnus = "";
    private String salasana = "";
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Asiakas() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public void setAsiakasId(int id) {
        this.asiakasId = id;
    }
    public void setEtunimi(String etunimi) {
        this.etunimi = etunimi;
    }
    public void setSukunimi(String sukunimi) {
        this.sukunimi = sukunimi;
    }
    public void setKatuosoite(String katuosoite) {
        this.katuosoite = katuosoite;
    }
    public void setPostinumero(String postinumero) {
        this.postinumero = postinumero;
    }
    public void setPostitoimipaikka(String postitoimipaikka) {
        this.postitoimipaikka = postitoimipaikka;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPuh(String puh) {
        this.puh = puh;
    }
    public void setYritys(String yritys) {
        this.yritys = yritys;
    }
    public void setYtunnus(String ytunnus) {
        this.ytunnus = ytunnus;
    }
    public void setSalasana(String salasana) {
        this.salasana = salasanaMuunnos(salasana);
    }
    public String salasanaMuunnos(String salasana){
        String muunnettuSalasana = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(salasana.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for(int i=0; i<bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            muunnettuSalasana = sb.toString();
            
        } catch (NoSuchAlgorithmException e) {
        }
        return muunnettuSalasana;
    }
    
    public boolean lisaaAsiakas() {
         boolean tila = true;
         try {
             String lause = "insert into kayttaja (etunimi, sukunimi, katuosoite, postinumero, postitoimipaikka, email, puh, yritys, ytunnus, salasana) values (?,?,?,?,?,?,?,?,?,?);";
             komento = yhteys.prepareStatement(lause);
             komento.setString(1, this.etunimi);
             komento.setString(2, this.sukunimi);
             komento.setString(3, this.katuosoite);
             komento.setString(4, this.postinumero);
             komento.setString(5, this.postitoimipaikka);
             komento.setString(6, this.email);
             komento.setString(7, this.puh);
             komento.setString(8, this.yritys);
             komento.setString(9, this.ytunnus);
             komento.setString(10, this.salasana);
             komento.executeUpdate();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean paivitaAsiakastiedot() {
         boolean tila = true;
         try {
             String lause = "update kayttaja set etunimi=?, sukunimi=?, katuosoite=?, postinumero=?, postitoimipaikka=?, puh=?, yritys=?, ytunnus=? where id=?;";
             komento = yhteys.prepareStatement(lause);
             komento.setString(1, this.etunimi);
             komento.setString(2, this.sukunimi);
             komento.setString(3, this.katuosoite);
             komento.setString(4, this.postinumero);
             komento.setString(5, this.postitoimipaikka);
             komento.setString(6, this.puh);
             komento.setString(7, this.yritys);
             komento.setString(8, this.ytunnus);
             komento.setInt(9, this.asiakasId);
             komento.executeUpdate();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean vaihdaSalasana(String vanhaPw, String uusiPw) {
        boolean tila = true;
        String vanhaSalasana = salasanaMuunnos(vanhaPw);
        try {
            ResultSet dbPw = null;
            String lause = "select salasana from kayttaja where id = ? and salasana = ?;";
            komento = yhteys.prepareStatement(lause);
            komento.setInt(1, this.asiakasId);
            komento.setString(2, vanhaSalasana);
            dbPw = komento.executeQuery();
            if (dbPw.next()) {
                String uusiSalasana = salasanaMuunnos(uusiPw);
                lause = "update kayttaja set salasana=? where id=?;";
                komento = yhteys.prepareStatement(lause);
                komento.setString(1, uusiSalasana);
                komento.setInt(2, this.asiakasId);
                komento.executeUpdate();
            } else {
                tila = false;
            }
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeAsiakkaat() {
        boolean tila = true;
        try {
             String lause = "select * from kayttaja order by id asc;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeAsiakas() {
        boolean tila = true;
        try {
             String lause = "select * from kayttaja where id = ?;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.asiakasId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
}

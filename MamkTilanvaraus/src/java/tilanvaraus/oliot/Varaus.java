package tilanvaraus.oliot;
import java.sql.*;

public class Varaus extends Paivamaarat {
    private int varausId = 0;
    private int tilaId = 0;
    private int asiakasId = 0;
    private Long pvm = null;
    private double hinta = 0.0;
    private int maksutilanne = 0;
    
    private String etunimi = "";
    private String sukunimi = "";
    private String yritys = "";
    private String ytunnus = "";
    private String katuosoite = "";
    private String postinumero = "";
    private String postitoimipaikka = "";
    private String email = "";
    private String puhelin = "";
    private String maksutapa = "";
    private String[] valitutAjat = null;
    
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
    public void setPvm(int vuosi, int kuukausi, int paiva) {
        this.pvm = haePaivanAikaleima(vuosi,kuukausi,paiva);
    }
    public void setHinta(double hinta) {
        this.hinta = hinta;
    }
    public void setMaksutilanne(int maksutilanne) {
        this.maksutilanne = maksutilanne;
    }
    public void setEtunimi(String etunimi) {
        this.etunimi = etunimi;
    }
    public void setSukunimi(String sukunimi) {
        this.sukunimi = sukunimi;
    }
    public void setYritys(String yritys) {
        this.yritys = yritys;
    }
    public void setYtunnus(String ytunnus) {
        this.ytunnus = ytunnus;
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
    public void setPuhelin(String puhelin) {
        this.puhelin = puhelin;
    }
    public void setMaksutapa(String maksutapa) {
        this.maksutapa = maksutapa;
    }
    public void setValitutAjat(String valitutAjat[]) {
        this.valitutAjat = valitutAjat;
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
             String lause = "select * from varaukset where tilaid = ? order by id asc;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.tilaId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeAsiakkaanVaraukset() {
        boolean tila = true;
        try {
             String lause = "select * from varaukset as v join tila as t on v.tilaId = t.id where v.asiakasId = ? order by v.id asc;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.asiakasId);
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
        Long varausaika = haeNykyinenAikaleima();
        try {
            String lause = "insert into varaukset (asiakasId,tilaId,varausaika,pvm,summa,maksutapa,maksutilanne) values (?,?,?,?,?,?,?);";
            komento = yhteys.prepareStatement(lause,Statement.RETURN_GENERATED_KEYS);
            komento.setInt(1, this.asiakasId);
            komento.setInt(2, this.tilaId);
            komento.setLong(3, varausaika);
            komento.setLong(4, this.pvm);
            komento.setDouble(5, this.hinta);
            komento.setString(6, this.maksutapa);
            komento.setInt(7, this.maksutilanne);
            vastaus = komento.executeQuery();
            ResultSet rs = komento.getGeneratedKeys();
            if (rs.next()){
                int varausId = rs.getInt(1);
                setVarausId(varausId);
                lisaaVarauksenTunnit();
            }
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
    
    private boolean lisaaVarauksenTunnit(){
        boolean tila = true;
        for(int i=0;i<this.valitutAjat.length;i++){
            try {
                String lause = "insert into varauksentunnit (varausnumero,tilaid,pvm,kello) values (?,?,?,?);";
                komento = yhteys.prepareStatement(lause);
                komento.setInt(1, this.varausId);
                komento.setInt(2, this.tilaId);
                komento.setLong(3, this.pvm);
                komento.setString(4, this.valitutAjat[i]);
                vastaus = komento.executeQuery();
           } catch (Exception e1) {}
        }
        return true;
    }
    
    public Double haeTuntihinta(int tunti, int paivaNumero){
        Double tuntihinta = 0.0;
        try {
            String lause = "select hinta from hinnasto where tilaId = ? and pvm = ? and tunti = ?";
            komento = yhteys.prepareStatement(lause);
            komento.setInt(1, this.tilaId);
            komento.setInt(2, paivaNumero);
            komento.setInt(3, tunti);
            vastaus = komento.executeQuery();
            while(vastaus.next()){
               tuntihinta = vastaus.getDouble("hinta");
            }
        } catch (Exception e1) {}
        return tuntihinta;
    }
    
    public Double laskeVarauksenHinta(String valitutAjat[], int vuosi, int kuukausi, int paiva){
        Double hinta = 0.0;
        int viikonpaiva = haeViikonpaivanNumero(vuosi, kuukausi, paiva);
        for(int i=0;i<valitutAjat.length;i++){
            hinta += haeTuntihinta(Integer.parseInt(valitutAjat[i]), viikonpaiva);
        }
        return hinta;
    }
    
}

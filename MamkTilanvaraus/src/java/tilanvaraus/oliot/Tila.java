package tilanvaraus.oliot;

public class Tila extends TietokantaPerus {
    private int tilaId = 0;
    private String nimi = "";
    private String tunnus = "";
    private String kuvaus = "";
    private String hinta = "";
    private String henkilomaara = "";
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Tila() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public void setTilaId(int id) {
        this.tilaId = id;
    }
    public void setNimi(String nimi) {
        this.nimi = nimi;
    }
    public void setTunnus(String tunnus) {
        this.tunnus = tunnus;
    }
    public void setKuvaus(String kuvaus) {
        this.kuvaus = kuvaus;
    }
    public void setHinta(String hinta) {
        this.hinta = hinta;
    }
    public void setHenkilomaara(String henkilomaara) {
        this.henkilomaara = henkilomaara;
    }
    
    public boolean lisaaTila() {
         boolean tila = true;
         try {
             String lause = "insert into tila (tunnus, nimi, kuvaus, hinta, henkilomaara) values (?,?,?,?,?);";
             komento = yhteys.prepareStatement(lause);
             komento.setString(1, this.tunnus);
             komento.setString(2, this.nimi);
             komento.setString(3, this.kuvaus);
             komento.setString(4, this.hinta);
             komento.setString(5, this.henkilomaara);
             komento.executeUpdate();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean paivitaTila() {
         boolean tila = true;
         try {
             String lause = "update tila set tunnus=?, nimi=?, kuvaus=?, hinta=?, henkilomaara=? where id=?;";
             komento = yhteys.prepareStatement(lause);
             komento.setString(1, this.tunnus);
             komento.setString(2, this.nimi);
             komento.setString(3, this.kuvaus);
             komento.setString(4, this.hinta);
             komento.setString(5, this.henkilomaara);
             komento.setInt(6, this.tilaId);
             komento.executeUpdate();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
     
    public boolean listaaTilat() {
        boolean tila = true;
        try {
             String lause = "select * from tila order by nimi asc;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean listaaTila() {
        boolean tila = true;
        try {
             String lause = "select * from tila where id = ?;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.tilaId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        } 
    }
}

package tilanvaraus.oliot;
import org.apache.commons.lang3.RandomStringUtils;


public class Kuva extends TietokantaPerus {
    private final String tallennusPolku = "D:/Asennukset/wamp/www/MamkTilanvaraus/MamkTilanvaraus/web/kuvat/tilat";

    private int tilaId = 0;
    private String nimi = "";
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Kuva() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public void setTilaId(int id){
        this.tilaId = id;
    }
    
    public boolean haeTilanEsittelykuvat(int id) {
        boolean tila = true;
        try {
             String lause = "select * from tilakuvat where tilaid = ? and tyyppi = 'esittely';";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, id);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeTilanBanneri(int id) {
        boolean tila = true;
        try {
             String lause = "select * from tilakuvat where tilaid = ? and tyyppi = 'banneri';";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, id);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeBanneri() {
        boolean tila = true;
        try {
             String lause = "select * from sivukuvat order by rand() limit 1;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeKaikkienTilojenEsittelykuvat() {
        boolean tila = true;
        try {
             String lause = "select * from tilakuvat where tyyppi = 'esittely';";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public String luoRandomNimi(){
        String nimi = "";
        nimi = RandomStringUtils.random(15,true,true);
        return nimi;
    }
    
}

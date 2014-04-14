package tilanvaraus.oliot;

public class Kuva extends TietokantaPerus {
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Kuva() {
        this.yhteys_auki = this.avaaYhteys("root", "");
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
    
    public boolean haeKaikkienTilojenKuvat() {
        boolean tila = true;
        try {
             String lause = "select * from tilakuvat;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
}

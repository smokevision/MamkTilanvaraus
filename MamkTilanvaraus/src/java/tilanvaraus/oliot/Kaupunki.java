package tilanvaraus.oliot;

public class Kaupunki extends TietokantaPerus {
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Kaupunki() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public boolean haeKaupungit() {
        boolean tila = true;
        try {
             String lause = "select * from kaupunki";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
}

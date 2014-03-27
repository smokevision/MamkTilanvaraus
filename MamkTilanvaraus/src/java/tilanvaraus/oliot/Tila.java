package tilanvaraus.oliot;

public class Tila extends TietokantaPerus {
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Tila() {
        this.yhteys_auki = this.avaaYhteys("root", "");
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
    
}

package tilanvaraus.oliot;


public class Palvelu extends TietokantaPerus {
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Palvelu() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public boolean listaaPalvelut() {
        boolean tila = true;
        try {
             String lause = "select * from palvelu;";
             komento = yhteys.prepareStatement(lause);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    
}

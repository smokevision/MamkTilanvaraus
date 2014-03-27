package tilanvaraus.oliot;

public class Tila extends TietokantaPerus {
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Tila() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
}

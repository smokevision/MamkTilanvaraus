package tilanvaraus.oliot;

public class Sivu extends TietokantaPerus {
    private int sivuId = 0;
    private String sivuNimi = null;
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public void setSivuNimi(String nimi) {
        this.sivuNimi = nimi;
    }
    
    public void setSivuId(int id) {
        this.sivuId = id;
    }
    
    
    public Sivu() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
        
    public boolean haeSivuNimi() {
        boolean tila = true;
        try {
             String lause = "select * from sivut where nimi = ?;";
             komento = yhteys.prepareStatement(lause);
             komento.setString(1, this.sivuNimi);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
    public boolean haeSivuId() {
        boolean tila = true;
        try {
             String lause = "select * from sivut where id = ?;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, this.sivuId);
             vastaus = komento.executeQuery();
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
}

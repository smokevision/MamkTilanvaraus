package tilanvaraus.oliot;

import java.security.*;
import java.sql.ResultSet;

public class LoginPapu extends TietokantaPerus {
    protected ResultSet tulosjoukko = null;
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public LoginPapu() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    //salasanan muuntaminen MD5 muotoon
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
    
    public boolean kirjauduSisaan(String tunnus, String salasana) {
        boolean tila = false;
        try {
             String lause = "select count(*) from yllapito where tunnus=? and salasana=?";
             this.komento = this.yhteys.prepareStatement(lause);
             komento.setString(1, tunnus);
             komento.setString(2, salasana);
             tulosjoukko = komento.executeQuery();
             while (tulosjoukko.next()) {
                if(tulosjoukko.getInt(1) == 1){
                    tila = true;
                }
             }
        } catch (Exception e1) {
            tila = false;
        } finally {
            return tila;
        }
    }
    
}

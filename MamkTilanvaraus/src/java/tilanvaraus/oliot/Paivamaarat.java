package tilanvaraus.oliot;
import java.text.*;

public class Paivamaarat extends TietokantaPerus {
    
    private int varausId = 0;

    public Paivamaarat() {
    }
    
    public void setVarausId(int id) {
        this.varausId = id;
    }
    
    public String muunnaAikaleima(String leima){
        String muunnettu = "";
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        muunnettu = sdf.format(Long.parseLong(leima));
        return muunnettu;
    } 
    
}

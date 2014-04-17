package tilanvaraus.oliot;
import org.joda.time.DateTime;

public class Paivamaarat extends TietokantaPerus {
    
    private int varausId = 0;

    public Paivamaarat() {
    }
    
    public void setVarausId(int id) {
        this.varausId = id;
    }
    
    public String muunnaAikaleima(long aikaleima){
        String muunnettu = "";
        DateTime aika = new DateTime(new Long(aikaleima));
        muunnettu = aika.toString("dd.MM.YYYY");
        return muunnettu;
    }
    public int paivaAikaleimasta(long aikaleima){
        int muunnettu = 0;
        DateTime aika = new DateTime(new Long(aikaleima));
        muunnettu = aika.getDayOfMonth();
        return muunnettu;
    }
    public int kuukausiAikaleimasta(long aikaleima){
        int muunnettu = 0;
        DateTime aika = new DateTime(new Long(aikaleima));
        muunnettu = aika.getMonthOfYear();
        return muunnettu;
    }
    public int vuosiAikaleimasta(long aikaleima){
        int muunnettu = 0;
        DateTime aika = new DateTime(new Long(aikaleima));
        muunnettu = aika.getYear();
        return muunnettu;
    }
    public int haeViikonpaivanNumero(int vuosi, int kuukausi, int paiva){
        int numero = 0;
        DateTime aika = new DateTime(vuosi,kuukausi,paiva,12,0);
        numero = aika.getDayOfWeek();
        return numero;
    }
    public Long haeNykyinenAikaleima(){
        Long aikaleima = null;
        DateTime aika = new DateTime();
        aikaleima = aika.getMillis();
        return aikaleima;
    }
    public Long haePaivanAikaleima(int vuosi, int kuukausi, int paiva){
        Long aikaleima = null;
        DateTime aika = new DateTime(vuosi,kuukausi,paiva,12,0);
        aikaleima = aika.getMillis();
        return aikaleima;
    }
    
}

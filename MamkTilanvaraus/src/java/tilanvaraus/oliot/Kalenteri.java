package tilanvaraus.oliot;
import org.joda.time.DateTime;
import java.util.*;
import java.sql.*;

public class Kalenteri extends TietokantaPerus {
    private String[] paivienNimet = {"Ma","Ti","Ke","To","Pe","La","Su"};
    private int nykVuosi = 0;
    private int nykKuukausi = 0;
    private int nykPaiva = 0;
    private int paiviaKuukaudessa = 0;
    private String naviLinkki = "";    
    private String nykPaivays = "";
    private String nykyinenPaivays = "";
    private int tilaId = 0;
    
    private boolean yhteys_auki = false;
    public Kalenteri() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public String luoKalenteri(int hakuVuosi, int hakuKuukausi, int tilaId){
        String sisalto = "";
        this.tilaId = tilaId;
        int vuosi = 0;
        int kuukausi = 0;
        DateTime paivays = new DateTime();
        this.nykyinenPaivays = paivays.toString("YYYY-MM-dd");
            
        if(hakuVuosi != 0 && hakuKuukausi != 0){
            DateTime paiva = new DateTime(hakuVuosi,hakuKuukausi,1,12,0);
            vuosi = paiva.getYear();
            kuukausi = paiva.getMonthOfYear();
        } else {
            DateTime paiva = new DateTime();
            vuosi = paiva.getYear();
            kuukausi = paiva.getMonthOfYear();
        }

        this.nykVuosi = vuosi;
        this.nykKuukausi = kuukausi;
        this.paiviaKuukaudessa = paiviaKuukaudessa(kuukausi, vuosi);
        
        sisalto = "<div id='kalenteri'>"
                    + "<div class='box'>"
                        + luoNavi()
                    + "</div>"
                    + "<div class='box-content'>"
                        + "<ul class='label'>" + luoNimet() + "</ul>"
                        + "<div class='tyhja'></div>"
                        + "<ul class='paivat'>";
                        int viikkojaKuukaudessa = viikkojaKuukaudessa(kuukausi, vuosi);
                        for(int i = 0; i < viikkojaKuukaudessa; i++){
                            for(int k = 1; k <= 7; k++){
                                sisalto += naytaPaiva(i*7+k);
                            }
                        }
               sisalto += "</ul>"
                        + "<div class='tyhja'></div>"
                    + "</div>"
                + "</div>";
        return sisalto;
    }
    
    private String naytaPaiva(int solunumero){
        String sisalto = "";
        String solunSisalto = "";
        String luokka = "";
        String varausTila = "";
        if(this.nykPaiva == 0){
            DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,1,12,0);
            int ensimmainenViikonpaiva = kalenteri.getDayOfWeek();
            if(solunumero == ensimmainenViikonpaiva){
                this.nykPaiva = 1;
            }
        }
        if(this.nykPaiva != 0 && this.nykPaiva <= this.paiviaKuukaudessa){
            DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,this.nykPaiva,12,0);
            this.nykPaivays = kalenteri.toString("YYYY-MM-dd");
            solunSisalto = Integer.toString(this.nykPaiva);
            DateTime aikaleima = new DateTime(this.nykVuosi,this.nykKuukausi,this.nykPaiva,12,0);
            long paivays = aikaleima.getMillis();
            int varaukset = haeTilanVaraukset(this.tilaId, paivays);
            if(varaukset==0){
                varausTila = "";
            } else if(varaukset>0 && varaukset<14){
                varausTila = " vapaita";
            } else if(varaukset==14){
                varausTila = " varattu";
            } else {
                varausTila = "";
            }
            
            this.nykPaiva++;
        } else{
            this.nykPaivays = "";
            solunSisalto = "";
        }
        if(this.nykPaivays.equals(this.nykyinenPaivays)){
            luokka = "nykyinen";
        } else {
            luokka = "";
        }
        
        sisalto = "<li id='li-" + this.nykPaivays + "' class='" + (solunumero%7==1?"start ":(solunumero%7==0?"end ":"")) +
                    (solunSisalto==""?"mask":"paiva") + (varausTila==""?"":varausTila) + (luokka=="nykyinen"?" nykyinen":"") + "'>" 
                    + solunSisalto + "</li>";
        return sisalto;
        
    }
    
    private String luoNavi(){
        String navi = "";
        int seuraavaKuukausi = this.nykKuukausi==12?1:this.nykKuukausi+1;
        int seuraavaVuosi = this.nykKuukausi==12?this.nykVuosi+1:this.nykVuosi;
        int edellinenKuukausi = this.nykKuukausi==1?12:this.nykKuukausi-1;
        int edellinenVuosi = this.nykKuukausi==1?this.nykVuosi-1:this.nykVuosi;    
        DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,1,12,0);
        String nykyinenKuukausi = kalenteri.toString("MMM", new Locale("fi","FI"));
        navi = "<div class='header'>" +
                "<a class='edellinen' value='" + edellinenKuukausi + "," + edellinenVuosi + "' href='#'><</a>"
                + nykyinenKuukausi + " " + this.nykVuosi
                + "<a class='seuraava' value='" + seuraavaKuukausi + "," + seuraavaVuosi + "' href='#'>></a>"
            + "</div>";
        return navi;
    }
    
    private String luoNimet(){
        String nimet = "";
        for(String pv : this.paivienNimet){
            nimet +="<li class='title'>" + pv + "</li>";
        }
        return nimet;
    }
    
    private int viikkojaKuukaudessa(int kuukausi, int vuosi){
        int viikkoja = 0;
        DateTime kalenteri = new DateTime(vuosi,kuukausi,1,12,0,0);
        int maxViikko = kalenteri.dayOfMonth().withMaximumValue().weekOfWeekyear().get();
        int minViikko = kalenteri.weekOfWeekyear().get();
        if(maxViikko == 1){
            maxViikko = 53;
        }
        viikkoja = maxViikko-minViikko + 1;
        return viikkoja;
    }
    
    private int paiviaKuukaudessa(int kuukausi, int vuosi){
        int paivia = 0;
        DateTime kalenteri = new DateTime(vuosi,kuukausi,1,12,0,0);
        paivia = kalenteri.dayOfMonth().getMaximumValue();
        return paivia;
    }
    
    private int haeTilanVaraukset(int tilaId, long pvm){
        int varaukset = 0;
        try {
             String lause = "select count(kello) as total from varaus where tilaid = ? and pvm = ?";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, tilaId);
             komento.setLong(2, pvm);
             ResultSet tulos = komento.executeQuery();
             while(tulos.next()){
                varaukset = tulos.getInt("total");
             }
        } catch (Exception e1) {
            varaukset = 0;
        } finally {
            return varaukset;
        }
    }
    
    public String luoKellolista(int vuosi, int kuukausi, int paiva, int tilaId){
        String sisalto = "";
        DateTime kalenteri = new DateTime(vuosi,kuukausi,paiva,12,0);
        long paivays = kalenteri.getMillis();
        
        ResultSet varaukset = null;
        try {
            String lause = "select * from varaus where tilaid = ? and pvm = ? order by kello asc;";
            komento = yhteys.prepareStatement(lause);
            komento.setInt(1, tilaId);
            komento.setLong(2, paivays);
            varaukset = komento.executeQuery();
            List<String> lista = new ArrayList<String>();
            while(varaukset.next()){
                lista.add(varaukset.getString("kello"));
            }
            for(int i = 8; i <=21; i++){
                if(lista.contains(Integer.toString(i))){
                    sisalto += "<li class='varattu' value='" + i + "'>" + i + ":00 Varattu</li>";
                } else {
                    sisalto += "<li class='vapaa' value='" + i + "'>" + i + ":00 Vapaa</li>";
                }
            }
            
        } catch (Exception e1) {
            varaukset = null;
        }
        return sisalto;
    }
}
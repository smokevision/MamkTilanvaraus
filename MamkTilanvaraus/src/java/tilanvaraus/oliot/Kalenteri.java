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
    private ResultSet varaukset = null;
    
    private boolean yhteys_auki = false;
    public Kalenteri() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public String luoKalenteri(int hakuVuosi, int hakuKuukausi, int tilaId){
        String sisalto = "";
        this.tilaId = tilaId;
        this.varaukset = haeTilanVaraukset(this.tilaId);
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
        ResultSet varausloop = null;
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
        varausloop = this.varaukset;
        try{
            while (varausloop.next()) {
                DateTime kalenteri = new DateTime(new Long(this.varaukset.getString("pvm")));
                if(this.nykPaivays.equals(kalenteri.toString("YYYY-MM-dd"))){
                    varausTila = "vapaita";
                } else {
                    varausTila = "";
                }
            }
        } catch(Exception e){}
        
        
        sisalto = "<li id='li-" + this.nykPaivays + "' class='" + (solunumero%7==1?"start ":(solunumero%7==0?"end ":"")) +
                    (solunSisalto==""?"mask":"paiva") + (varausTila=="vapaita"?" vapaita ":varausTila) + (luokka=="nykyinen"?" nykyinen":"") + "'>" 
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
    
    private ResultSet haeTilanVaraukset(int tilaId){
        ResultSet varaukset = null;
        try {
             String lause = "select * from varaus where tilaid = ? order by loppuAika asc;";
             komento = yhteys.prepareStatement(lause);
             komento.setInt(1, tilaId);
             varaukset = komento.executeQuery();
        } catch (Exception e1) {
            varaukset = null;
        } finally {
            return varaukset;
        }
    }    
}
package tilanvaraus.oliot;
import java.util.*;
import java.text.*;

public class Kalenteri extends TietokantaPerus {
    private String[] paivienNimet = {"Ma","Ti","Ke","To","Pe","La","Su"};
    private int nykVuosi = 0;
    private int nykKuukausi = 0;
    private int nykPaiva = 0;
    private String nykPaivays = null;
    private int paiviaKuukaudessa = 0;
    private String naviLinkki = null;
    private String nykyinenPaiva = null;
    
    private boolean yhteys_auki = false;
    public boolean getYhteysAuki() {
        return this.yhteys_auki;
    }
    
    public Kalenteri() {
        this.yhteys_auki = this.avaaYhteys("root", "");
    }
    
    public String luoKalenteri(int hakuVuosi, int hakuKuukausi){
        String sisalto = "";
        DateFormat dateFormat = new SimpleDateFormat("Y-M-d");
        Calendar cal = Calendar.getInstance();
        this.nykyinenPaiva = dateFormat.format(cal.getTime());
        int vuosi = 0;
        int kuukausi = 0;
        
        dateFormat = new SimpleDateFormat("Y");
        vuosi = Integer.parseInt(dateFormat.format(cal.getTime()));
        dateFormat = new SimpleDateFormat("M");
        kuukausi = Integer.parseInt(dateFormat.format(cal.getTime()));

        
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
        Calendar cal = Calendar.getInstance();
        if(this.nykPaiva == 0){
            cal.setTime(new Date(this.nykVuosi, this.nykKuukausi-1, 0));
            int ensimmainenViikonpaiva = cal.get(Calendar.DAY_OF_WEEK);
            if(solunumero == ensimmainenViikonpaiva){
                    this.nykPaiva = 1;
            }
        }
        if(this.nykPaiva != 0 && this.nykPaiva <= this.paiviaKuukaudessa){
            DateFormat dateFormat = new SimpleDateFormat("Y-MM-dd");
            cal.setTime(new Date(this.nykVuosi, this.nykKuukausi-1, this.nykPaiva));
            this.nykPaivays = dateFormat.format(cal.getTime());
            solunSisalto = Integer.toString(this.nykPaiva);
            this.nykPaiva++;
        } else{
            this.nykPaivays = null;
            solunSisalto = null;
        }
        if(this.nykPaivays == this.nykyinenPaiva){
            luokka = "nykyinen";
        } else {
            luokka = "";
        }
        
        sisalto = "<li id='li-" + this.nykPaivays + "' class='" + (solunumero%7==1?"start ":(solunumero%7==0?"end ":"")) +
			(solunSisalto==null?"mask":"") + (luokka==""?"":"nykyinen") + "'>" + solunSisalto + "</li>";
        return sisalto;
        
    }
    
    private String luoNavi(){
        String navi = "";
        int seuraavaKuukausi = this.nykKuukausi==12?1:this.nykKuukausi+1;
        int seuraavaVuosi = this.nykKuukausi==12?this.nykVuosi+1:this.nykVuosi;
        int edellinenKuukausi = this.nykKuukausi==1?12:this.nykKuukausi-1;
        int edellinenVuosi = this.nykKuukausi==1?this.nykVuosi-1:this.nykVuosi;
        
        DateFormat dateFormat = new SimpleDateFormat("MMMM");
        Calendar cal = Calendar.getInstance();
        String nykyinenKuukausi = dateFormat.format(cal.getTime());
        navi = "<div class='header'>" +
                "<a class='edellinen' href='" + this.naviLinkki + "?sivu=kalenteri&kuukausi=" + edellinenKuukausi + "&vuosi=" + edellinenVuosi + "'>Edellinen</a>"
                + nykyinenKuukausi + " " + this.nykVuosi
                + "<a class='seuraava' href='" + this.naviLinkki + "?sivu=kalenteri&kuukausi=" + seuraavaKuukausi + "&vuosi=" + seuraavaVuosi + "'>Seuraava</a>"
            + "</div>";
        return navi;
    }
    
    private String luoNimet(){
        String nimet = "";
        for(String pv : this.paivienNimet){
            nimet +="<li class='" + " title'>" + pv + "</li>";
        }
        return nimet;
    }
    
    private int viikkojaKuukaudessa(int kuukausi, int vuosi){
        int viikkoja = 0;
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, vuosi);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.MONTH, kuukausi-1);
        viikkoja = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
        return viikkoja;
    }
    
    private int paiviaKuukaudessa(int kuukausi, int vuosi){
        int paivia = 0;
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, vuosi);
        calendar.set(Calendar.MONTH, kuukausi-1);
        paivia = calendar.getActualMaximum(Calendar.DATE);
        return paivia;
    }
    
}

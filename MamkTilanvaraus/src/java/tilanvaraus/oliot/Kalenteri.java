package tilanvaraus.oliot;
import org.joda.time.DateTime;
import java.util.*;

public class Kalenteri extends Varaus {
    private String[] paivienNimet = {"Ma","Ti","Ke","To","Pe","La","Su"};
    private int nykVuosi = 0;
    private int nykKuukausi = 0;
    private int nykPaiva = 0;
    private String nykPaivays = null;
    private int paiviaKuukaudessa = 0;
    private String naviLinkki = "kalenteri.jsp";
    private String nykyinenPaiva = null;
    
    public Kalenteri() {
        
    }
    
    public String luoKalenteri(int hakuVuosi, int hakuKuukausi){
        String sisalto = "";
        DateTime paiva = new DateTime();
        this.nykyinenPaiva = paiva.toString("Y-MM-dd");
        int vuosi = 0;
        int kuukausi = 0;
        
        vuosi = paiva.getYear();
        kuukausi = paiva.getMonthOfYear();

        
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
        if(this.nykPaiva == 0){
            DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,1,12,0,0);
            int ensimmainenViikonpaiva = kalenteri.getDayOfWeek();
            if(solunumero == ensimmainenViikonpaiva){
                    this.nykPaiva = 1;
            }
        }
        if(this.nykPaiva != 0 && this.nykPaiva <= this.paiviaKuukaudessa){
            DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,this.nykPaiva,12,0,0);
            kalenteri.toString("Y-MM-dd");
            this.nykPaivays = kalenteri.toString("Y-MM-dd");
            solunSisalto = Integer.toString(this.nykPaiva);
            this.nykPaiva++;
        } else{
            this.nykPaivays = null;
            solunSisalto = "";
        }
        if(this.nykPaivays == this.nykyinenPaiva){
            luokka = "nykyinen";
        } else {
            luokka = "";
        }
        
        sisalto = "<li id='li-" + this.nykPaivays + "' class='" + (solunumero%7==1?"start ":(solunumero%7==0?"end ":"")) +
			(solunSisalto==""?"mask":"") + (luokka==""?"":"nykyinen") + "'>" + solunSisalto + "</li>";
        return sisalto;
        
    }
    
    private String luoNavi(){
        String navi = "";
        int seuraavaKuukausi = this.nykKuukausi==12?1:this.nykKuukausi+1;
        int seuraavaVuosi = this.nykKuukausi==12?this.nykVuosi+1:this.nykVuosi;
        int edellinenKuukausi = this.nykKuukausi==1?12:this.nykKuukausi-1;
        int edellinenVuosi = this.nykKuukausi==1?this.nykVuosi-1:this.nykVuosi;    
        DateTime kalenteri = new DateTime(this.nykVuosi,this.nykKuukausi,1,12,0,0);
        String nykyinenKuukausi = kalenteri.toString("MMM", new Locale("fi","FI"));
        navi = "<div class='header'>" +
                "<a class='edellinen' href='" + this.naviLinkki + "?kuukausi=" + edellinenKuukausi + "&vuosi=" + edellinenVuosi + "'><</a>"
                + nykyinenKuukausi + " " + this.nykVuosi
                + "<a class='seuraava' href='" + this.naviLinkki + "?kuukausi=" + seuraavaKuukausi + "&vuosi=" + seuraavaVuosi + "'>></a>"
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
        DateTime kalenteri = new DateTime(vuosi,kuukausi,1,12,0,0);
        viikkoja = kalenteri.dayOfMonth().withMaximumValue().weekOfWeekyear().get() - kalenteri.weekOfWeekyear().get() + 1;
        return viikkoja;
    }
    
    private int paiviaKuukaudessa(int kuukausi, int vuosi){
        int paivia = 0;
        DateTime kalenteri = new DateTime(vuosi,kuukausi,1,12,0,0);
        paivia = kalenteri.dayOfMonth().getMaximumValue();
        return paivia;
    }
    
}

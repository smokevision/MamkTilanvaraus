package tilanvaraus.oliot;
import org.joda.time.DateTime;
 
public class Joda {
    
    
    public int testi(){
    DateTime today = new DateTime(2014,5,1,12,0,0);
    int viikkoja = today.dayOfMonth().withMaximumValue().weekOfWeekyear().get() - today.weekOfWeekyear().get() + 1 ;
    
    return viikkoja;
    }
}

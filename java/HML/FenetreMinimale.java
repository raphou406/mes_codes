
import java.awt.*;                        // 1

public class FenetreMinimale extends Frame    // 2
{  

   public FenetreMinimale()                   // 3
   {  
      this.setTitle   ("Fenetre");            // 4
      this.setSize    (250,350);              // 5
      this.setLocation( 20,200);              // 6

      this.setVisible(true);                  // 8
   }

   public static void main(String [] args)    // 9
   { 
      new FenetreMinimale();                  // 10
   }
}
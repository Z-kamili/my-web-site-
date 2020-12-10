import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	 String name = ""  ,Desc = "" ,cni = "";
	 int quiter = 2,choice ,id ;
	 
	 Scanner myInput = new Scanner(System.in);
	 
	 
	 while(quiter == 2) {
		 
		 System.out.println(" if you want to add choice    1 ");
		 System.out.println(" if you want to Update choice 2 ");
		 System.out.println(" if you want to delete choice 3 ");
		 choice  = myInput.nextInt();
		 ApprenantDB apprenant = new ApprenantDB();
		 switch(choice) {
		 
		 case 1: System.out.println("Enter your name : ");
		         myInput.nextLine();
			     name = "";
			     name += myInput.next();
		         System.out.println("Enter your Description : ");
		         myInput.nextLine();
			     Desc = "";
			     Desc += myInput.next();
		         System.out.println("Enter your cni : ");
		         myInput.nextLine();
			     cni = "";
			     cni += myInput.next();
		         apprenant.AddApprenant(name,Desc,cni);
		         break;
		  
		 case 2: 
			     apprenant.Affichage();
			     
			     System.out.println("Enter your name : ");
			     myInput.nextLine();
			     name = "";
			     name += myInput.next();
                 System.out.println("Enter your Description : ");
                 myInput.nextLine();
			     Desc = "";
			     Desc += myInput.next();
                 System.out.println("Enter your cni : ");
                 myInput.nextLine();
			     cni = "";
			     cni += myInput.next();
                 System.out.println("Enter your id : ");
                 id = myInput.nextInt();
                 apprenant.UpdateApprenant(name, Desc, cni, id);
         
         break;
         
		 case 3 : 
			 apprenant.Affichage();
			    
			 System.out.println("Enter your id : ");
			 id = myInput.nextInt();
			 apprenant.Delete(id);
			 break;
			 
		         
		 
		default : System.out.println("Error ");break; 
		 
		 }
		 
		 System.out.println("If you want to close choice 1-yes 2-No");
		 
		 quiter = myInput.nextInt();
		 
	 }
	 System.out.println("Close");
		
		
		

	}

}

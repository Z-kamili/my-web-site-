import java.util.Scanner;

public class Brief1Java {
	
	/*Voici la fonction permettant l'affichage du message du bonjour avec la nom et le prenom de l'utilisateur*/
	
	public static String Bonjour(String nom,String prenom)
	{
		return "Bienvenue "+nom+" "+prenom;
	}
	/*Ici c'est la fonction qui calcul l'indemnisation en DH*/
	public static void Calcul(int nbrHeure) 

	{
		double NewTarif = 0;
		/*verification de la condition si le nbr d'here est inferieur ou egal a 60*/
		if(nbrHeure<=60)
		{
			Scanner in = new Scanner(System.in);
			System.out.println("Entrer le tarif par heure");
			double Tph = Double.parseDouble(in.nextLine());
			
			double bonus = (nbrHeure-40);
			/*ici c'est pour voir si le bonus est superieur a 0 pour calculer le bonus*/
			if(bonus>0)
			{
				NewTarif=(Tph*40)+(Tph*bonus)+(Tph*bonus*0.5);
			}
			else
			{
				NewTarif=(Tph*nbrHeure);
			}
			
			System.out.println("Votre indemnisation est de "+NewTarif+" MAD");
		}else if(nbrHeure>60)
		{
			System.out.println("Informations erronés !");
		}
		
	}

	public static void main(String[] args) {
		 
		System.out.println("Bonjour\n veuillez saisir votre nom et prenom");
		System.out.println("  Votre nom :\n");
		Scanner SC = new Scanner(System.in);
		String nom = SC.nextLine();
		System.out.println("  Votre prénom :\n");
		String prenom = SC.nextLine();
		System.out.println(Bonjour( nom, prenom) );
		System.out.println(" Veuillez saisir le nombre d'heure que vous avez travailler \n");
		int nbr_heure = SC.nextInt();
		
		Calcul( nbr_heure) ;
		
		

	}

}

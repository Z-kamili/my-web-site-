

package consoleEmployees.app;

public class Main {

	public static void main(String[] args) {
		Personne[] personnes = new Personne[2];
		personnes[0] = new Medecin("Ahmed",31);
		personnes[1] = new Technicien("Mouad",33);
		for (int i = 0; i < personnes.length; i++)
		personnes[i].afficher();


	}

}

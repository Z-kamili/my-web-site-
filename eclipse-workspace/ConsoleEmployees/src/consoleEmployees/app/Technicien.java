package consoleEmployees.app;

public class Technicien extends Personne {

	public Technicien(String name, int age) {
		super(name, age);
		
	}
	
	@Override
	public void afficher() {
		super.afficher();
		System.out.print(" et je travaille en tant que Technicien !");
	}

}

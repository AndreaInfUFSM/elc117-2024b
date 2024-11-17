class Rabbit extends Thread {
	private String name;

	public Rabbit(String name) {
		this.name = name;
	}

	private void runLikeRabbit() {
		System.out.println(name + " is running fast");
	}

	public void run() {
		System.out.println(name + " rabbit is at the start of the race!");
		for (int pos = 10; pos > 0; pos--) {
			runLikeRabbit();
			System.out.println(name + " is at position " + pos);
		}
		System.out.println(name + " rabbit finished the race!");
	}
}

class Turtle implements Runnable {
	private String name;

	public Turtle(String name) {
		this.name = name;
	}

	private void runLikeTurtle() {
		System.out.println(name + " is running slow");
	}

	public void run() {
		System.out.println(name + " turtle is at the start of the race!");
		for (int pos = 10; pos > 0; pos--) {
			runLikeTurtle();
			System.out.println(name + " is at position " + pos);
		}
		System.out.println(name + " turtle finished the race!");

	}
}

class ThreadRace {
	public static void main(String[] args) {
		Rabbit r = new Rabbit("Snowball");
		Thread t = new Thread(new Turtle("Donatello"));
		r.start();
		t.start();
	}
}

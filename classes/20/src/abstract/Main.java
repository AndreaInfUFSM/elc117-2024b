abstract class Figura {
  private String label;
  public Figura() {
    this("empty label");
  }
  public Figura(String label) {
    this.label = label;
  }
  public String getLabel() {
    return this.label;
  } 
  public abstract void desenha();
}

class Triangulo extends Figura {
  // override obrigatório
  public void desenha() {
    System.out.println("Desenhando Triangulo");
  }
}

class Retangulo extends Figura {
  // override obrigatório
  public void desenha() {
    System.out.println("Desenhando Retangulo");
  }
}

class Main {
  public static void main(String[] args) {
    Figura figs[] = {
      new Triangulo(),
      new Triangulo(),
      new Retangulo(),
      new Retangulo() 
    };

    // Erro: Figura is abstract, não pode ser instanciada
    // Figura f = new Figura(); // erro!

    // Referência f pode designar qualquer objeto de classe derivada de Figura
    for (Figura f : figs) {
      f.desenha();
      System.out.println(f.getLabel());
    }
  }
}
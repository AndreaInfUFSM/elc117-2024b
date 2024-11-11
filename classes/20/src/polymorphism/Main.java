class Figura {
  public void desenha() {
    System.out.println("Desenhando Figura");
  }
}

class Triangulo extends Figura {
  public void desenha() {
    System.out.println("Desenhando Triangulo");
  }
}

class Retangulo extends Figura {
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
    for (Figura f : figs)
      f.desenha();
  }
}
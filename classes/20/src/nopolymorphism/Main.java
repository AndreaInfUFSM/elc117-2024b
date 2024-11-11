class Triangulo {
  public void desenhaTriangulo() {
    System.out.println("Desenhando Triangulo");
  }
}

class Retangulo {
  public void desenhaRetangulo() {
    System.out.println("Desenhando Retangulo");
  }
}

class Main {
  public static void main(String[] args) {
    Triangulo tris[] = { 
      new Triangulo(),
      new Triangulo() 
    };
    Retangulo rets[] = { 
      new Retangulo(),
      new Retangulo() 
    };
    for (Triangulo t : tris)
      t.desenhaTriangulo();
    for (Retangulo r : rets)
      r.desenhaRetangulo();
  }
}
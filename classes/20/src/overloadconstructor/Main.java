
class Retangulo {
  float x, y, w, h;
  public Retangulo() { // default constructor
    this(0, 0, 10, 10);    
  }
  public Retangulo(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = h;
    this.h = h;
  }
  @Override
  public String toString() {
    return "{" +
      " x='" + this.x + "'" +
      ", y='" + this.y + "'" +
      ", w='" + this.w + "'" +
      ", h='" + this.h + "'" +
      "}";
  }
}
public class Main {
  public static void main(String[] args) {
    Retangulo r1 = new Retangulo();
    Retangulo r2 = new Retangulo(10,10,20,20);
    System.out.println(r1);
    System.out.println(r2);
  }
}
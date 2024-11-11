
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
  public void grow(float dw, float dh) {
    this.w += dw;
    this.h += dh;
  }
  public void grow(int percent) {
    this.w += this.w * percent / 100;
    this.h += this.h * percent / 100;
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
    Retangulo r2 = new Retangulo(10,10,100,100);
    System.out.println(r1);
    System.out.println(r2);
    r1.grow(0.5f, 0.5f);
    r2.grow(20);
    System.out.println(r1);
    System.out.println(r2);
    
  }
}
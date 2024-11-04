class TestCircle {
  public static void main(String[] args) {
    Circle c1 = new Circle();
    Circle c2 = new Circle(2.5, 0.0, 5.0);
    //c1.r = 3.0;
    Circle c;
    System.out.println(c1.area());
    System.out.println(c2.area());
    c = c1;
    System.out.println(c.area());
  }
}
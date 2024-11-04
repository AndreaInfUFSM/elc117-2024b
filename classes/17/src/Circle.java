class Circle {
  private double x;
  private double y;
  private double r;

  public Circle() {
    this.x = this.y = 0.0;
    this.r = 1.0;
    // Equivalente a:
    // x = y = 0.0;
    // r = 1.0;
  }

  public Circle(double x, double y, double r) {
    this.x = x;
    this.y = y;
    this.r = r;
    // Isto seria ambíguo:
    // x = x;
    // y = y;
    // r = r;
  }

  public double area() {
    return 3.1416 * r * r;
  }
}

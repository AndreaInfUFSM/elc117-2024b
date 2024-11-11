class Person {
  protected String name;
  public Person() {    
    this.name = "empty name";    
  }
  public String getName() {
    return this.name;
  }
  public String toString() {
    return "I'm a Person";
  }
}
class Student extends Person {
  private String course;
  public Student() {    
    this.course = "default course";
  }
  public String toString() {
    return "I'm a Student";
  }
}
public class Main {
  public static void main(String[] args) {
    Person p = new Person();
    Student s = new Student();
    p = s; 
    System.out.println(p); 
  }
}

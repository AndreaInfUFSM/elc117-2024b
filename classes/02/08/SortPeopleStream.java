import java.util.*;

public class SortPeople {
  public static void main(String[] args) {
    List<Person> people = Arrays.asList(
      new Person("John", 25),
      new Person("Jane", 30),
      new Person("Doe", 22)
    );
    
    people.stream()
      .sorted(Comparator.comparingInt(p -> p.age))
      .forEach(System.out::println);
    }

  static class Person {
    String name;
    int age;

    Person(String name, int age) {
      this.name = name;
      this.age = age;
    }

    @Override
    public String toString() {
      return "(" + name + ", " + age + ")";
    }
  }
}


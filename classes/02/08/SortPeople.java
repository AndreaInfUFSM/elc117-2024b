import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

// Define a Person class with name and age fields
class Person {
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

public class SortPeople {
  public static void main(String[] args) {
  
    List<Person> people = new ArrayList<>();
    people.add(new Person("John", 25));
    people.add(new Person("Jane", 30));
    people.add(new Person("Doe", 22));

    people.sort(Comparator.comparingInt(person -> person.age));

    for (Person person : people) {
      System.out.println(person);
    }
  }
}


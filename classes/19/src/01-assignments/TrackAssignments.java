import java.util.ArrayList;
import java.time.LocalDate;


public class TrackAssignments {

  public static void main(String[] args) {
    
    ArrayList<Assignment> list = new ArrayList<Assignment>();
    list.add(new GroupAssignment(LocalDate.of(2024,11,28), "game", "teamMate1, teamMate2"));
    list.add(new Assignment(LocalDate.of(2024,11,1),"java01"));
    list.add(new GroupAssignment(LocalDate.of(2024,11,2), "java02", "teamMate1"));
    list.add(new GroupAssignment(LocalDate.of(2024,11,3), "java03", "teamMate1"));


    System.out.println("\n==> Printing all assignment **OBJECTS**:");
    for (Assignment item : list) {
      System.out.println(item);
    }


    System.out.println("\n==> Printing all assignment **MESSAGES**:");
    for (Assignment item : list) {
      System.out.println(item.message());
    }

    for (Assignment item : list) {
      if (item.getDescription() == "game") {
        item.complete(LocalDate.now());
      }
    }

    System.out.println("\n==> Printing all assignment messages **AGAIN**:");
    for (Assignment item : list) {
      System.out.println(item.message());
    }

    // COMPLETE-ME: count completed assignments
  }
  
}

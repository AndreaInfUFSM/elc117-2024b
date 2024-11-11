import java.time.LocalDate;

public class GroupAssignment extends Assignment {
  private String teamMates;

  public String message() {
    return "COMPLETE-ME";
  }

  public GroupAssignment(LocalDate dueDate, String description, String teamMates) {
    super(dueDate, description);
    this.teamMates = teamMates;
  }

}

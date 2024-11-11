import java.time.LocalDate;
import java.util.ArrayList;

public class Assignment {

  protected LocalDate dueDate;
  protected String description;
  protected boolean pending;
  protected LocalDate submitDate;
  
  public Assignment(LocalDate dueDate, String description) {
    this.dueDate = dueDate;
    this.description = description;
    this.submitDate = null;
    this.pending = true;
  }

  public String getDescription() {
    return this.description;
  }

  public boolean isPending() {
    return this.pending;
  }


  public void complete(LocalDate date) {
    this.submitDate = date;
    this.pending = false;
  }


  public int daysLeft() {
    return dueDate.compareTo(LocalDate.now());
  }

  private String status() {
    return "COMPLETE-ME";
  }


  public String message() {
    return "Assignment " + this.description + " is " + status();
    
  }

}

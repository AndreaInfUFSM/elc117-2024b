public class Student {
  private String name;
  private String userId;
  private String course;

  public Student() {
  }

  public Student(String name, String userId, String course) {
    this.name = name;
    this.userId = userId;
    this.course = course;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getUserId() {
    return this.userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getCourse() {
    return this.course;
  }

  public void setCourse(String course) {
    this.course = course;
  }

  public String getContactInfo() {
    return "{" +
      "class='Student'" +
      ", name='" + getName() + "'" +
      ", userId='" + getUserId() + "'" +
      "}";
  }


}
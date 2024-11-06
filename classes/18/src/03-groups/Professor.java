public class Professor {
  private String name;
  private String userId;
  private String room;
  private String building;

  public Professor() {
  }

  public Professor(String name, String userId, String room, String building) {
    this.name = name;
    this.userId = userId;
    this.room = room;
    this.building = building;
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

  public String getRoom() {
    return this.room;
  }

  public void setRoom(String room) {
    this.room = room;
  }

  public String getBuilding() {
    return this.building;
  }

  public void setBuilding(String building) {
    this.building = building;
  }

  public String getContactInfo() {
    return "{" +
      "class='Professor'" +
      ", name='" + getName() + "'" +
      ", userId='" + getUserId() + "'" +
      ", room='" + getRoom() + "'" +
      ", building='" + getBuilding() + "'" +
      "}";
  }

}



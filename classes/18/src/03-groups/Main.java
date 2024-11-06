import java.util.ArrayList;

public class Main {
  public static void main(String[] args) {
    Student s1 = new Student("Nome1 Sobrenome1", "username1", "course1");
    Student s2 = new Student("Nome2 Sobrenome2", "username2", "course2");
    Professor p = new Professor("Andrea Charao", "andrea", "376", "Anexo B");
    Group lab = new Group("NCC");
    lab.addMember(s1);
    lab.addMember(s2);
    lab.addMember(p);
    System.out.println(lab.getName() + " has " + lab.countMembers() + " members");
    ArrayList<String> contacts = lab.getContactInfos();
    System.out.println(contacts);
    System.out.println("User andrea " + (lab.userExists("andrea") ? "found" : "not found"));
  }
  
}
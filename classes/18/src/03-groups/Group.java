import java.util.ArrayList;

public class Group {
  private String name;
  private ArrayList<Student> students;
  private ArrayList<Professor> professors;

  public Group() {
  }

  public Group(String name) {
    this.name = name;
    this.students = new ArrayList<Student>();
    this.professors = new ArrayList<Professor>();
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void addMember(Student s) {
    this.students.add(s);
  }

  public void addMember(Professor p) {
    this.professors.add(p);
  }
  
  public ArrayList<String> getContactInfos() {
    ArrayList<String> contact = new ArrayList<String>();
    for (Student s: students) {
      contact.add(s.getContactInfo());
    }
    for (Professor p: professors) {
      contact.add(p.getContactInfo());
    }
    return contact;
  }

  public boolean userExists(String userId) {
    // COMPLETE-ME
    // Verifique se existe o userId na lista de estudantes ou de professores
    // Veja no método anterior como percorrer as listas de estudantes e professores

  }

  public int countMembers() {
    // COMPLETE-ME
    // Retorne o total de membros do grupo (estudantes e professores)
    // Para isso, descubra qual método chamar para obter o tamanho de um ArrayList
  }


}
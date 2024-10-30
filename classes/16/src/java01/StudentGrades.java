import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// A class to represent a Student
class Student {
    private String name;
    private String id;
    private double grade;

    public Student(String name, String id, double grade) {
        this.name = name;
        this.id = id;
        this.grade = grade;
    }

    public double getGrade() {
        return grade;
    }

    @Override
    public String toString() {
        return name + "," + id + "," + String.format("%.1f", grade);
    }
}

// This is the main class. It is callable from the JVM.
public class StudentGrades {
    public static void main(String[] args) {
        String csvFile = "students.csv";  // Path to the CSV file in the SAME FOLDER as the program
        List<Student> students = new ArrayList<>();

        // Read CSV file and populate the student list
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] values = line.split(",");
                if (values.length == 3) {
                    String name = values[0];
                    String id = values[1];
                    double grade = Double.parseDouble(values[2]);
                    Student student = new Student(name, id, grade);
                    students.add(student);
                    // Shorter version of the previous two lines
                    // students.add(new Student(name, id, grade));
                    
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading file: " + e.getMessage());
        }

        // // Calculate the arithmetic mean of grades like in C, using indexes
        // double totalGrade = 0.0;
        // for (int i = 0; i < students.size(); i++) {
        //     totalGrade += students.get(i).getGrade();
        // }        
        // double meanGrade = students.size() > 0 ? totalGrade / students.size() : 0.0;

        // Calculate the arithmetic mean of grades using for-each syntax (no indexes)
        double totalGrade = 0.0;
        for (Student student : students) {
            totalGrade += student.getGrade();
        }
        double meanGrade = students.size() > 0 ? totalGrade / students.size() : 0.0;


        // // Calculate the arithmetic mean of grades in a declarative, functional style using Java Streams
        // // In Haskell, this would be: 
        // // students = [("Alice",1001,8.55),("Bob", 1002,7.8),("Charlie", 1003,9.2)]
        // // meanGrade 
        // //   | length students > 0 = sum [grade | (_, _, grade) <- students] / fromIntegral (length students) 
        // //   | otherwise = 0.0
        // double meanGrade = students.stream()
        //         .mapToDouble(Student::getGrade)  // Extract grades as a DoubleStream
        //         .average()                       // Calculate average
        //         .orElse(0.0);

        System.out.println("Arithmetic Mean of Grades: " + meanGrade);
    }
}


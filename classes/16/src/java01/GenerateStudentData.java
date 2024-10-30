import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URL;
import java.util.Scanner;

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





class RandomStudentGenerator {
    private static final String API_URL = "https://randomuser.me/api/?results=1&nat=BR";


    public static List<Student> generateStudents(int count) {
        List<Student> students = new ArrayList<>();
        Random random = new Random();

        for (int i = 0; i < count; i++) {
            String jsonResponse = fetchJson(API_URL);            
            String name = parseJsonName(jsonResponse);
            System.out.println("Random name " + i + ": " + name);

            String id = String.valueOf(1000 + i); // Simple ID generation
            double grade = 5 + random.nextDouble() * 5; // Random grades between 5 and 10
            students.add(new Student(name, id, grade));
        }

        return students;
    }


    private static String fetchJson(String apiUrl) {
        StringBuilder response = new StringBuilder();
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
            }
        } catch (IOException e) {
            System.out.println("Error fetching data: " + e.getMessage());
        }
        return response.toString();
    }

    private static String parseJsonName(String json) {
        // Very basic and not robust JSON parsing
        // Do not try this at home :-)
        // For better JSON parsing, see org.json package
        String name = "Unknown";
        int startIndex = json.indexOf("\"name\":") + 8; // Adjusted to skip to the name object
        if (startIndex != -1) {
            int firstNameIndex = json.indexOf("\"first\"", startIndex) + 9; // Skip to first name
            int firstNameEnd = json.indexOf("\"", firstNameIndex);
            int lastNameIndex = json.indexOf("\"last\"", firstNameEnd) + 8; // Skip to last name
            int lastNameEnd = json.indexOf("\"", lastNameIndex);
            String firstName = json.substring(firstNameIndex, firstNameEnd);
            String lastName = json.substring(lastNameIndex, lastNameEnd);
            name = firstName + " " + lastName;
        }
        return name;
    }
}


public class GenerateStudentData {

    public static void main(String[] args) {
        List<Student> students = RandomStudentGenerator.generateStudents(10); // Generate 10 students
        writeCSV(students, "morestudents.csv"); // Write to CSV file
    }


    private static void writeCSV(List<Student> students, String fileName) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            writer.write("Name,ID,Grade\n"); // Write header
            for (Student student : students) {
                writer.write(student.toString() + "\n");
            }
        } catch (IOException e) {
            System.out.println("Error writing to CSV: " + e.getMessage());
        }
    }
}

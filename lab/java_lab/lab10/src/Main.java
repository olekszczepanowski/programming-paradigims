public class Main {
    public static void main(String[] args) throws IllegalAccessException {
        Debug debug = new Debug();

        Student student = new Student("Aleksander", "Szczepanowski", 272739);

        Point p = new Point(4,5,"test");

        Prostokat prostokat = new Prostokat(4.5,2.5);

        System.out.println("Test dla klasy Student");
        debug.fields(student);
        System.out.println("\nTest dla klasy Point");
        debug.fields(p);
        System.out.println("\nTest dla klasy Prostokat");
        debug.fields(prostokat);
    }
}
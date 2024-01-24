import java.lang.reflect.Field;

public class Debug {
    public void fields(Object obj) throws IllegalAccessException {
        Class<?> klasa = obj.getClass();
        Field[] pola = klasa.getDeclaredFields();
        for(Field pole : pola){
            pole.setAccessible(true);
            String nazwaPola = pole.getName();
            String typPola = pole.getType().getName();
            Object wartoscPola = pole.get(obj);
            System.out.println("Pole: " + nazwaPola + " => " + typPola + ", " + wartoscPola);
        }
    }
}

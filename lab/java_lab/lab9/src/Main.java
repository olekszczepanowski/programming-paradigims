import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Map<String, Map<String, Integer>> edges_1 = new HashMap<>();
        edges_1.put("A", Map.of("B", 1, "C", 2));
        edges_1.put("B", Map.of("A", 1, "C", 3));
        edges_1.put("C", Map.of("A", 2, "B", 3));
        Graf<String, Integer> graf_1 = new Graf<>(edges_1);

        Map<String, Map<String, Integer>> edges_2 = new HashMap<>();
        edges_2.put("A", Map.of("D", 1));
        edges_2.put("B", Map.of( "C", 3));
        edges_2.put("C", Map.of());
        edges_2.put("D", Map.of());
        Graf<String, Integer> graf_2 = new Graf<>(edges_2);

        Map<String, Map<String, Integer>> edges_3 = new HashMap<>();
        Graf<String, Integer> pustyGraf = new Graf<>(edges_3);

        System.out.println("Testy dla grafu 1:");

        List<String> wierzcholki_1 = graf_1.wierzcholki();
        System.out.println("Wierzchołki grafu: " + wierzcholki_1);

        String wierzcholek1 = "A";
        String wierzcholek2 = "C";
        Object krawedzAC_1 = graf_1.krawedz(wierzcholek1, wierzcholek2);
        System.out.println("Krawędź między " + wierzcholek1 + " a " + wierzcholek2 + ": " + krawedzAC_1);

        List<String> polaczoneWierzcholki_1 = graf_1.krawedzie("C");
        System.out.println("Wierzchołki połączone z " + "C" + ": " + polaczoneWierzcholki_1);

        SkladoweSpojne<String, Integer> helper = new SkladoweSpojne<>();
        List skladoweSpojne_1 = helper.findConnectedComponents(graf_1);
        System.out.println("Spójne składowe grafu:");
        for (Object skladowa : skladoweSpojne_1) {
            System.out.println(skladowa);
        }

        System.out.println("\nTesty dla grafu 2:");

        List<String> wierzcholki_2 = graf_2.wierzcholki();
        System.out.println("Wierzchołki grafu: " + wierzcholki_2);

        List<String> polaczoneWierzcholki_2 = graf_2.krawedzie("A");
        System.out.println("Wierzchołki połączone z " + "A" + ": " + polaczoneWierzcholki_2);

        String wierzcholek3 = "D";
        Object krawedzAC_2 = graf_2.krawedz(wierzcholek1, wierzcholek2);
        System.out.println("Krawędź między " + wierzcholek1 + " a " + wierzcholek2 + ": " + krawedzAC_2);
        Object krawedzAD_2 = graf_2.krawedz(wierzcholek1, wierzcholek3);
        System.out.println("Krawędź między " + wierzcholek1 + " a " + wierzcholek3 + ": " + krawedzAD_2);

        List skladoweSpojne_2 = helper.findConnectedComponents(graf_2);
        System.out.println("Spójne składowe grafu:");
        for (Object skladowa : skladoweSpojne_2) {
            System.out.println(skladowa);
        }

        System.out.println("\nTesty dla grafu pustego:");
        List<String> wierzcholki_3 = pustyGraf.wierzcholki();
        System.out.println("Wierzchołki grafu: " + wierzcholki_3);

        List<String> polaczoneWierzcholki_3 = pustyGraf.krawedzie("A");
        System.out.println("Wierzchołki połączone z " + "A" + ": " + polaczoneWierzcholki_3);

        Object krawedzAC_3 = pustyGraf.krawedz(wierzcholek1, wierzcholek2);
        System.out.println("Krawędź między " + wierzcholek1 + " a " + wierzcholek2 + ": " + krawedzAC_3);

        List skladoweSpojne_3 = helper.findConnectedComponents(pustyGraf);
        System.out.println("Spójne składowe grafu:");
        for (Object skladowa : skladoweSpojne_3) {
            System.out.println(skladowa);
        }
    }
}
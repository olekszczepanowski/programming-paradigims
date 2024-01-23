import java.util.ArrayList;
import java.util.List;
public class SkladoweSpojne<W,S> {
    public List<List<W>> findConnectedComponents(IGraf<W, S> graph) {
        List<List<W>> connectedComponents = new ArrayList<>();
        List<W> visited = new ArrayList<>();
        for (W vertex : graph.wierzcholki()) {
            if (!visited.contains(vertex)) {
                List<W> connectedComponent = new ArrayList<>();
                dfs(graph, vertex, visited, connectedComponent);
                connectedComponents.add(connectedComponent);
            }
        }
        return connectedComponents;
    }
    private void dfs(IGraf<W, S> graph, W vertex, List<W> visited, List<W> connectedComponent) {
        visited.add(vertex);
        connectedComponent.add(vertex);

        for (W neighbor : graph.krawedzie(vertex)) {
            if (!visited.contains(neighbor)) {
                dfs(graph, neighbor, visited, connectedComponent);
            }
        }
    }
}


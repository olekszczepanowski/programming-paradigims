import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Graf <W,S> implements IGraf{
    private final List<List<Edge>> adjList;
    public Graf(Map<W, Map<W,S>> edges){
        adjList = new ArrayList<>();
        for (Map.Entry<W, Map<W,S>> entry : edges.entrySet()){
            ArrayList<Edge> currList = new ArrayList<>();
            W source = entry.getKey();
            Map<W,S> destinationMap = entry.getValue();
            for(Map.Entry<W,S> destination : destinationMap.entrySet()){
                W dst = destination.getKey();
                S label = destination.getValue();
                currList.add(new Edge(source,dst,label));
            }
            adjList.add(currList);
        }
    }

    @Override
    public List wierzcholki() {
        List vertices = new ArrayList<>();
        for (List<Edge> edges : adjList) {
            for (Edge edge : edges) {
                if (!vertices.contains(edge.getSource())) {
                    vertices.add(edge.getSource());
                }
                if (!vertices.contains(edge.getDestination())) {
                    vertices.add(edge.getDestination());
                }
            }
        }
        return vertices;
    }

    @Override
    public Object krawedz(Object w1, Object w2) {
        for (List<Edge> edges : adjList) {
            for (Edge edge : edges) {
                if (edge.getSource().equals(w1) && edge.getDestination().equals(w2)) {
                    return edge.getLabel();
                }
            }
        }
        return null;
    }

    @Override
    public List krawedzie(Object o) {
        List connectedVertices = new ArrayList<>();
        for (List<Edge> edges : adjList) {
            for (Edge edge : edges) {
                if (edge.getSource().equals(o)) {
                    connectedVertices.add(edge.getDestination());
                }
            }
        }
        return connectedVertices;
    }
    private class Edge{
        private final W source;
        private final W destination;
        private final S label;

        public Edge(W source, W destination, S label) {
            this.source = source;
            this.destination = destination;
            this.label = label;
        }
        public W getSource() {
            return source;
        }
        public W getDestination() {
            return destination;
        }
        public S getLabel() {
            return label;
        }
    }
}



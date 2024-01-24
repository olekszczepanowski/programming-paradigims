public class Prostokat {
    private double x;
    private double y;

    public Prostokat(double x, double y) {
        if(x<=0 || y<=0){
            this.x = 5.5;
            this.y = 5.5;
        }
        else{
            this.x = x;
            this.y = y;
        }

    }
}

import java.util.concurrent.Semaphore;
class IntCell {
    private int n = 0;
    public int getN() {return n;}
    public void setN(int n) {this.n = n;}
}

class Count extends Thread {
    private static IntCell n = new IntCell();
    private static Semaphore semaphore = new Semaphore(1);

    @Override public void run() {
      int temp;
      for (int i = 0; i < 200000; i++) {
          try {
              semaphore.acquire(); // Oczekiwanie na dostęp do zasobu
              temp = n.getN();
              n.setN(temp + 1);
          } catch (InterruptedException e) {
              e.printStackTrace();
          } finally {
              semaphore.release(); // Zwolnienie zasobu po operacjach
          }
      }
    }

    public static void main(String[] args) {
      Count p = new Count();
      Count q = new Count();
      p.start();
      q.start();
      try { p.join(); q.join(); }
      catch (InterruptedException e) { }
      System.out.println("The value of n is " + n.getN());
    }
}

//class IntCell {
//    private int n = 0;
//
//    public int getN() {
//        return n;
//    }
//
//    public void setN(int n) {
//        this.n = n;
//    }
//}
//
//class Count extends Thread {
//    private static IntCell n = new IntCell();
//
//    @Override
//    public void run() {
//        int temp;
//        for (int i = 0; i < 200000; i++) {
//            synchronized (n) {
//                temp = n.getN();
//                n.setN(temp + 1);
//            }
//        }
//    }
//
//    public static void main(String[] args) {
//        Count p = new Count();
//        Count q = new Count();
//
//        p.start();
//        q.start();
//
//        try {
//            p.join();
//            q.join();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//
//        System.out.println("The value of n is " + n.getN());
//    }
//}

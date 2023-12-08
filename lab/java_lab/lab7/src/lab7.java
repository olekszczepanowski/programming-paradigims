import java.util.Arrays;

public class lab7 {
    public static void main(String[] args) throws UnsortedArray {
        int [] array = {1,2,3,5,6};
        int [] unsortedArray = {4,3,2,4,6,1};
        int [] emptyArray = {};
        int [] oneElemArray = {1};
        int [] test1 = insert(array,4);
        int [] test2 = insert(test1,-3);
        int [] test3 = insert(emptyArray,3);
        int [] test4 = insert(oneElemArray,4);
        System.out.println(Arrays.toString(test1));
        System.out.println(Arrays.toString(test2));
        System.out.println(Arrays.toString(test3));
        System.out.println(Arrays.toString(test4));
        int [] test5 = insert(unsortedArray,2);
    }
    public static int[] insert(int[] tab, int value) throws UnsortedArray {
        for(int i = 0 ; i< tab.length-2;i++){
            if(tab[i]>tab[i+1])
                throw new UnsortedArray();
        }
        int[] retTab = new int[tab.length+1];
        int i = tab.length-1;
        while(i>=0 && tab[i]>value){
            retTab[i+1] = tab[i];
            i--;
        }
        retTab [i+1] = value;
        while (i>=0){
            retTab[i] = tab[i];
            i--;
        }
        return retTab;
    }
}
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

/**
 * Created by cj on 7/10/16.
 */
class identicalPairs{

    static <T extends Comparable<T>> int getCount(ArrayList<T> items){
        if (items.size() <= 1)
            return 0;
        else if (items.size() > 2)
            Collections.sort(items);

        int count = 0;
        T lastKey = items.get(0);
        int lastKeyCount = 0;
        for(int i=0;i<items.size();i++){
            if (lastKey.compareTo(items.get(i)) != 0){
                count += (lastKeyCount * (lastKeyCount-1))/2;
                lastKey = items.get(i);
                lastKeyCount = 0;
            }
            lastKeyCount++;
        }
        return count;
    }
}

class identicalPair {
    static ArrayList<Integer> items = new ArrayList<>(Arrays.asList(1,2,3,1,1,3,5,1,2));

    public static void main(String args[]){
        System.out.print(identicalPairs.getCount(items));
    }


}

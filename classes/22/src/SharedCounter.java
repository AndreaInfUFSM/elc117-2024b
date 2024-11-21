class Counter {
  private int count = 0;
  public void increment() {
    this.count++;
  }
  public int getCount() {
    return this.count;
  }
}


class Worker extends Thread {

  private Counter c;
  private int repetitions;

  public Worker(Counter c, int repetitions) {
    this.c = c;
    this.repetitions = repetitions;
  }
  
  @Override
  public void run() {
    for (int i = 0; i < repetitions; i++) {
      // do some work    
      Levenshtein.calculate("paradigmas","paradinhas");
      // increment counter
      c.increment();
    }
  }
}

class SharedCounter {

  public static void main(String[] args) {
  
    Counter c = new Counter();
    
    Thread thread1 = new Worker(c, 1000);
    Thread thread2 = new Worker(c, 1000);

    thread1.start();
    thread2.start();

    try {
      thread1.join();
      thread2.join();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }

    System.out.println("Final count: " + c.getCount());
  }
}

// Calculate Levenshtein distance
// https://www.baeldung.com/java-levenshtein-distance 
class Levenshtein {

  public static int calculate(String x, String y) {
  
    int[][] dp = new int[x.length() + 1][y.length() + 1];

    for (int i = 0; i <= x.length(); i++) {
      for (int j = 0; j <= y.length(); j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        }
        else {
          dp[i][j] = min(dp[i - 1][j - 1] 
            + costOfSubstitution(x.charAt(i - 1), y.charAt(j - 1)), 
              dp[i - 1][j] + 1, 
              dp[i][j - 1] + 1);
        }
      }
    }
    return dp[x.length()][y.length()];
  }
  
  private static int costOfSubstitution(char a, char b) {
    return a == b ? 0 : 1;
  }
  
  private static int min(int... numbers) {
    return java.util.Arrays.stream(numbers)
          .min().orElse(Integer.MAX_VALUE);
  }
  
}

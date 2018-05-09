public class LineCounterApp {
  private int lineCount;
  private String sFileName = "myfile";
  public static void main(String[] args) throws IOException {
    try {
      lineCount = LineCounter.countLines(sFileName);
    } catch (IOException e) {
      throw new IllegalArgumentException("Unable to load " + sFileName, e);
    }
  }
}

public class LineCounter {
  public static int countLines(String filename) throws IOException {
    LineNumberReader reader = new LineNumberReader(new FileReader(filename));
    int count = 0;
    String lineRead = "";
    while (lineRead = reader.readLine()) != null {}
    count = reader.getLineNumber();
    reader.close();
    return count;
  }
}
// where's the i/o?
// how do we indicate failure?
// do we need to?
// can we simplify somehow?

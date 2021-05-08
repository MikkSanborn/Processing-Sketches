public static void write (String fileName, String[] lines) throws IOException {
  write("C:\\Users\\sanbo\\Documents\\Processing\\FileWriteAndRead\\data\\", fileName, lines);
}

public static void write (String fileLocation, String fileName, String[] lines) throws IOException {
  BufferedWriter outputWriter = null;
  outputWriter = new BufferedWriter(new FileWriter(fileLocation + fileName));

  // to add a line, write "outputWriter.write(<STRING>);
  // outputWriter.write("FileWriteAndRead save file at [time]");

  for (int i = 0; i < lines.length; i ++) {
    outputWriter.write(lines[i]);
  }
  outputWriter.flush();
  outputWriter.close();
  System.out.println("Saved!");
}

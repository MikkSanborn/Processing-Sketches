class Student {
  public final short uid;
  public final String firstName, lastName;
  public final byte cohort, grade;
  
  public final boolean[] afs = new boolean[6];
  
  public final ArrayList<Short> contacts = new ArrayList<Short>();
  
  public float x, y;
  
  public color col;
  
  public final ArrayList<Line> lines;
  
  Student(final String raw_in) {
    final String[] in = raw_in.split("\t");
    
    this.uid = Short.parseShort(in[0]);
    this.firstName = in[1];
    this.lastName = in[2];
    this.cohort = Byte.parseByte(in[3]);
    this.grade = Byte.parseByte(in[4]);

    for (int i = 0; i < 6; i++) {
      afs[i] = Boolean.parseBoolean(in[i+5]);
    }
    
    for (int i = 11; i < in.length; i++) {
      contacts.add(Short.parseShort(in[i]));
    }
    
    this.x = 0;
    this.y = 0;
    
    col = color((cohort*7)%255, 255-((cohort*7)%255), (cohort*14+122)%255); // base it on cohorts somehow
    
    this.lines = new ArrayList<Line>();
  }
  
  public void cleanContacts(HashMap<Short, Student> students) { // by grade level
    for (int i = 0; i < contacts.size(); i++) { // for each contact, check if they are in same grade.
      // try {
      if (students.get(contacts.get(i)) == null) { // if already removed
        contacts.remove(i);
        i--;
      } else if (students.get(contacts.get(i)).grade != grade) { // else if not in grade
        contacts.remove(i);
        i--;
      }
      /*} catch (Exception e) {
        System.err.println(i + " " + contacts.get(i));
        println(students.get(contacts.get(i)));
      }*/
    }
  }
  
}

import java.util.Vector;
import java.util.Set;

String[] lines;

// students11 (maybe have a list of hashmaps to represent the four grades)
public static HashMap<Short, Student> students = new HashMap<Short, Student>();

Set<Short> uids;

HashMap<Vector<Short>, Line> lines_by_endpoints = new HashMap<Vector<Short>, Line>();

/*

 x and y (non-final) stored in the Student class, as well as maybe a colour?
 Line/Connection/Contact class that represents the lines between two points? Contains magnitudes as well?
 - new Contact(uid, uid); (makes a connection between the two)
 
 can make each point a circle with a fill (cohort col?) and a stroke (grade?)
 
 next try the cohort-individual model (biggest cohort free into block then sort from there)
 - store lowest # of extra contacts along with the best model(s)
 - have a "model[5] best" and check each new model against the "best" list to see if it fits (else discard)
 - system layout below
 /// *for one grade, in one block
 in: students free (uid, contacts, cohort), free classes, free classes capacity
 
 students_free
 vacant_rooms[] (capacity, students list?)
 
 
 out: a list of classes with length = # of free classes, and each's capacity being equal to its capacity
 
 ///
 
 */

void setup() {
  size(800, 800);

  strokeWeight(3);
  background(100);

  lines = loadStrings("./students_totals.tsv");

  // println(lines[0]);

  for (int i = 0; i < lines.length; i++) {
    Student s = new Student(lines[i]);
    if (s.grade == 11) {
      s.x = random(0, width);
      s.y = random(0, height);
      students.put(s.uid, s);
    }
  }

  uids = students.keySet();

  for (Short s : uids) {
    students.get(s).cleanContacts(students); // contacts only contain people from the same grade
    for (Short s2 : uids) {
      if (s == s2) continue;
      Line l = null;
      if (s > s2) {
        l = new Line(s2, s, (byte) -1);
        lines_by_endpoints.put(new Vector<Short>(s2, s), l);
      } else {
        l = new Line(s, s2, (byte) -1);
        lines_by_endpoints.put(new Vector<Short>(s, s2), l);
      }
    }
  }
}

void draw() {
  // println("drawing");
  background(255);

  for (Short uid : uids) {
    // println(uid);

    Student s = students.get(uid);
    stroke(s.col);
    strokeWeight(3);
    if (uid == 451) strokeWeight(18);
    point(s.x, s.y);

    strokeWeight(1);
    stroke(0, 8);

    ArrayList<Short> contacts = s.contacts;
    for (Short c_uid : contacts) {
      if (c_uid == uid) continue;
      getLine(uid, c_uid).increment();
      // l.display();
      // Student c_stu = students.get(c_uid);
      // line(s.x, s.y, c_stu.x, c_stu.y);
    }
  }
  
  Set<Vector<Short>> line_keys = lines_by_endpoints.keySet();
  
  int n = 0;
  for (Vector<Short> line_ids : line_keys) {
    Line l = lines_by_endpoints.get(line_ids);
    l.display();
    n++;
  }
  // println(n);
}

Line getLine(short uid1, short uid2) { // may return null
  return (uid1 > uid2 ? lines_by_endpoints.get(new Vector(uid2, uid1)):lines_by_endpoints.get(new Vector<Short>(uid1, uid2)));
}

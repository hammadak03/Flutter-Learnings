// ignore_for_file: file_names, unused_local_variable, use_super_parameters, unnecessary_this

abstract class Person {
  String name;

  Person(this.name);

  // Getter and setters
  String get personName => name;
  set personName(String name) => this.name = name;

  bool isOutstanding();
}

class Student extends Person {
  double cgpa;

  Student(String name, this.cgpa) : super(name);

  // Getter and setters
  double get studentCGPA => cgpa;
  set studentCGPA(double cgpa) => this.cgpa = cgpa;

  @override
  bool isOutstanding() {
    return cgpa > 3.5;
  }
}

class Professor extends Person {
  int numberOfPublications;

  Professor(String name, this.numberOfPublications) : super(name);

  // Getter and setters
  int get publicationsCount => numberOfPublications;
  set publicationsCount(int count) => this.numberOfPublications = count;

  @override
  bool isOutstanding() {
    return numberOfPublications > 50;
  }
}

void main() {
  Student student = Student("Hammad", 3.8);
  Professor professor = Professor("Dr. Irfan", 45);

  List<Person> persons = [student, professor];

  professor.publicationsCount = 100;
  print(
      "${professor.personName} is outstanding professor? ${professor.isOutstanding()}");
  print("${student.name} is outstanding student ? ${student.isOutstanding()}");
}

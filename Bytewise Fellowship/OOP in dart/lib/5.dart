// ignore_for_file: file_names

class Job {
  String designation;
  double salary;
  int id;

  Job(this.designation, this.salary, this.id);

  // Getters and setters
  String get jobDesignation => designation;
  set jobDesignation(String designation) => this.designation = designation;

  double get jobSalary => salary;
  set jobSalary(double salary) => this.salary = salary;

  int get jobId => id;
  set jobId(int id) => this.id = id;
}

class Employee {
  String name;
  int age;
  Job job; // Job object as data member

  Employee(this.name, this.age, this.job);

  // Getter and setters
  String get employeeName => name;
  set employeeName(String name) => this.name = name;

  int get employeeAge => age;
  set employeeAge(int age) => this.age = age;

  bool isHighSalary() {
    return job.jobSalary > 50000;
  }

  void display() {
    print("Employee Name: $name");
    print("Employee Age: $age");
    print("Job Designation: ${job.jobDesignation}");
    print("Job Salary: ${job.jobSalary}");
    print("Job ID: ${job.jobId}");
  }
}

void main() {
  Job softwareDeveloper = Job("Software Developer", 80000, 1);
  Employee employee1 = Employee("Hammad", 30, softwareDeveloper);
  employee1.display();

  // Check if employee's salary is greater than 50,000
  if (employee1.isHighSalary()) {
    print("${employee1.employeeName} has a high salary.");
  } else {
    print("${employee1.employeeName} does not have a high salary.");
  }
}

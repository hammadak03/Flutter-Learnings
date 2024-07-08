class Person {
  String _name;
  String _address;
  String _phoneNo;
  String _emailAdd;

  Person(this._name, this._address, this._phoneNo, this._emailAdd);

  String get name => _name;
  String get address => _address;
  String get phoneNo => _phoneNo;
  String get emailAdd => _emailAdd;

  set name(String name) => _name = name;
  set address(String address) => _address = address;
  set phoneNumber(String phoneNo) => _phoneNo = phoneNo;
  set email(String emailAdd) => _emailAdd = emailAdd;
}

class Student extends Person {
  String _status;
  Student(String name, String address, String phoneNo, String emailAdd,
      this._status)
      : super(name, address, phoneNo, emailAdd);

  String get status => _status;

  set status(String status) => _status = status;
}

class Employee extends Person {
  String _office;
  double _salary;
  DateTime _dateHired;

  Employee(String name, String address, String phoneNo, String emailAdd,
      this._office, this._salary, this._dateHired)
      : super(name, address, phoneNo, emailAdd);

  String get office => _office;
  double get salary => _salary;
  DateTime get dateHired => _dateHired;

  set office(String office) => _office = office;
  set salary(double salary) => _salary = salary;
  set dateHired(DateTime dateHired) => _dateHired = dateHired;
}

mixin DisplayInfo {
  void display();
}

class Faculty extends Employee with DisplayInfo {
  double _officeHours;
  String _rank;
  Faculty(
      String name,
      String address,
      String phoneNumber,
      String email,
      String office,
      double salary,
      DateTime dateHired,
      this._officeHours,
      this._rank)
      : super(name, address, phoneNumber, email, office, salary, dateHired);

  double get officeHours => _officeHours;
  String get rank => _rank;

  set officeHours(double officeHours) => _officeHours = officeHours;
  set rank(String rank) => _rank = rank;

  @override
  void display() {
    print(
        "Name: $_name, Address: $_address, Phone no: $_phoneNo, Email: $_emailAdd \nOffice: $_office, Salary: $_salary, Date Hired: $_dateHired, Office Hours: $_officeHours, Rank: $_rank");
  }
}

class Staff extends Employee with DisplayInfo {
  String _title;

  Staff(String name, String address, String phoneNumber, String email,
      String office, double salary, DateTime dateHired, this._title)
      : super(name, address, phoneNumber, email, office, salary, dateHired);

  String get title => _title;

  set title(String title) => _title = title;

  @override
  void display() {
    print(
        "Name: $_name, Address: $_address, Phone no: $_phoneNo, Email: $_emailAdd \nOffice: $_office, Salary: $_salary, Date Hired: $_dateHired, Title: $_title");
  }
}

void main() {
  Faculty faculty = Faculty('John McTavish', 'Korangi', '1234',
      'soap@example.com', '100', 50000.0, DateTime.now(), 8, 'Professor');
  Staff staff = Staff('Jon Snow', 'Winterfell', '456', 'winterIs@comming.com',
      'main hall', 40000.0, DateTime.now(), 'King');

  faculty.display();
  staff.display();
}

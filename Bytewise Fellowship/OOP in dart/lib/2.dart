class Student {
  late String _name;
  late List<int> _resultArray = List<int>.filled(5, 0);

  // Default constructor
  Student() {
    this._name = '';
    this._resultArray = [];
  }

  // One-argument wala constructor
  Student.withName(this._name);

  // Two-argument wala constructor
  Student.withDetails(this._name, this._resultArray);

  //Getters
  String get name => _name;
  List<int> get resultArray => _resultArray;

  //Setters
  set name(String name) => _name = name;
  set resultArray(List<int> resultArray) => _resultArray = resultArray;

  // Method average calculate kerne k liye
  double average() {
    if (_resultArray.isEmpty) return 0.0;
    double total = _resultArray.reduce((a, b) => a + b).toDouble();
    return total / _resultArray.length;
  }

  // Method average compare kerne k liye
  String compareAverage(Student other) {
    double avg1 = this.average();
    double avg2 = other.average();

    if (avg1 > avg2) {
      return '${this._name} has a higher average (${avg1.toStringAsFixed(2)}) than ${other._name} (${avg2.toStringAsFixed(2)})';
    } else if (avg1 < avg2) {
      return '${other._name} has a higher average (${avg2.toStringAsFixed(2)}) than ${this._name} (${avg1.toStringAsFixed(2)})';
    } else {
      return '${this._name} and ${other._name} have the same average (${avg1.toStringAsFixed(2)})';
    }
  }
}

void main() {
  Student student1 = Student.withDetails('Adil', [80, 85, 90, 75, 88]);
  Student student2 = Student.withDetails('Hammad', [85, 90, 95, 70, 82]);

  print('${student1.compareAverage(student2)}');
}

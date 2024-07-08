abstract class Movie {
  int id;
  String title;
  int daysRented;

  Movie(this.id, this.title, this.daysRented);

  //Getters and setters
  int get movieId => id;
  set movieId(int id) => this.id = id;

  String get movieTitle => title;
  set movieTitle(String title) => this.title = title;

  int get rentedDays => daysRented;
  set rentedDays(int days) => daysRented = days;

  // Equals method
  bool equals(Movie other) {
    return this.id == other.id &&
        this.title == other.title &&
        this.daysRented == other.daysRented;
  }

  // Abstract method to calculate late fees
  double calcLateFees(int lateDays);
}

// Action class derived from Movie
class Action extends Movie {
  Action(int id, String title, int daysRented) : super(id, title, daysRented);

  // Override calcLateFees method
  @override
  double calcLateFees(int lateDays) {
    return 3.0 * lateDays;
  }
}

// Comedy class derived from Movie
class Comedy extends Movie {
  Comedy(int id, String title, int daysRented) : super(id, title, daysRented);

  // Override calcLateFees method
  @override
  double calcLateFees(int lateDays) {
    return 2.5 * lateDays;
  }
}

// Drama class derived from Movie
class Drama extends Movie {
  Drama(int id, String title, int daysRented) : super(id, title, daysRented);

  // Override calcLateFees method
  @override
  double calcLateFees(int lateDays) {
    return 2.0 * lateDays;
  }
}

void main() {
  // Creating instances of Action, Comedy, and Drama movies
  Movie interstellar = Action(1, "Interstellar", 5);
  Movie inception = Comedy(2, "Inception", 3);
  Movie shawshankRedemption = Drama(3, "The Shawshank Redemption", 2);

  // Testing the equals method
  print(
      "Are interstellar and inception equal? ${interstellar.equals(inception)}"); // false

  // Polymorphic method call to calcLateFees
  print(
      "Late fee for Interstellar: \$${interstellar.calcLateFees(2).toStringAsFixed(2)}");
  print(
      "Late fee for Inception: \$${inception.calcLateFees(3).toStringAsFixed(2)}");
  print(
      "Late fee for The Shawshank Redemption: \$${shawshankRedemption.calcLateFees(1).toStringAsFixed(2)}");
}

enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  double _baseSalary = 4000;
  final Address _address;
  final int _yearOfExperience;
  List<Skill> _skill;

  Employee(this._name, this._address, this._yearOfExperience, this._skill);

  String get name {
    return _name;
  }

  double get baseSalary {
    return _baseSalary;
  }

  Address get address {
    return _address;
  }

  int get yearOfExperience {
    return _yearOfExperience;
  }

  List<Skill> get skill {
    return _skill;
  }

  double computeTheSalary() {
    double salary = _baseSalary + (_yearOfExperience * 2000);

    for (var skill in _skill) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else {
        salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print(
        'Employee: $name, Base Salary: \$${baseSalary}, Address: $address, Experience: $yearOfExperience, Skill: ${_skill.join(", ")}');
  }

  Employee.mobileDeveloper(String name, Address address, int yearOfExperience)
      : this(name, address, yearOfExperience, [Skill.FLUTTER, Skill.DART]);

  Employee.marketing(String name, Address address, int yearOfExperience)
      : this(name, address, yearOfExperience, [Skill.OTHER]);
}

class Address {
  final String _street;
  final String _city;
  final int _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street {
    return _street;
  }

  String get city {
    return _city;
  }

  int get zipCode {
    return _zipCode;
  }

  @override
  String toString() {
    return "($_street, $_city, $_zipCode)";
  }
}

void main() {
  var emp1 = Employee(
      'Sunly', Address('St. 007', 'Phnom Penh', 001122), 4, [Skill.DART]);

  emp1.printDetails();

  print('Compute Salary: \$${emp1.computeTheSalary()}');

  var emp2 = Employee.marketing(
      'Diddy', Address('Time Square', 'New York', 227494), 10);

  emp2.printDetails();

  print('Compute Salary: \$${emp2.computeTheSalary()}');
}

class Student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String image = "";
  String _status = "";

  Student.withId(
      this.id, this.firstName, this.lastName, this.grade, this.image);

  Student(String firstName, String lastName, int grade, String image) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Student.withoutInfo();

  String getStatus() {
    if (grade > 50) {
     return "Passed";
    }
    return "Failed";
  }

  void setStatus(String status) {
    _status = status;
  }

}

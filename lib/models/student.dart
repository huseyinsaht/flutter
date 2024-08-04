class Student {
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String image = "";
  String status = "";

  Student(String firstName, String lastName, int grade, String image) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  String getStatus() {
    return this.status;
  }

  void setStatus(String status) {
    this.status = status;
  }
}

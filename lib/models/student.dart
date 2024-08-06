class Student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String image = "";
  String status = "";

  Student.withId(this.id, this.firstName, this.lastName, this.grade, this.image);

  Student(this.firstName, this.lastName, this.grade, this.image);

  Student.withoutInfo();

  String getStatus() {
    return status;
  }

  void setStatus(String status) {
    this.status = status;
  }
}

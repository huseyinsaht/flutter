class Student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String image = "";
  String status = "";

  Student.withId(int id, String firstName, String lastName, int grade, String image) {
    this.id =id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }

  Student(String firstName, String lastName, int grade, String image) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.image = image;
  }
  Student.withoutInfo() {

  }

  String getStatus() {
    return this.status;
  }

  void setStatus(String status) {
    this.status = status;
  }
}

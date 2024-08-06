mixin StudentValidationFirstName {
  String? validateFirstName(String value) {
    if (value.length < 2) {
      return 'Please enter some text';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 2) {
      return 'Please enter some text';
    }
    return null;
  }


  String? validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Note should be between 0 and 100 ";
    }
    return null;
  }
}

mixin StudentValidationFirstName {
  static String? validateFirstName(String? value) {
    if (value ==null || value.isEmpty) {
      return 'Please enter some text';
    }
    return value;
  }
}

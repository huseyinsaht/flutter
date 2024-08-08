import 'package:flutter/material.dart';

import '../models/student.dart';
import '../validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;

  const StudentAdd(this.students, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationFirstName {
  List<Student> students = List.empty();
  var student = Student.withoutInfo();
  var _formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new student"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton()
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "First Name", hintText: "Engin"),
      validator: (value) => validateFirstName(value!),
      onSaved: (value) {
        student.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Last Name", hintText: "demirog"),
      validator: (value) => validateLastName(value!),
      onSaved: (value) {
        student.lastName = value.toString();
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Grade", hintText: "65"),
      validator: (value) => validateGrade(value!),
      onSaved: (value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        var state = _formKey.currentState;
        if (state!.validate()) {
          state.save();
          setState(() {
            students.add(student);
          });
          Navigator.pop(context);
        }
      },
      child: const Text("Submit"),
    );
  }
}

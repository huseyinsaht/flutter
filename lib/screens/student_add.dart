import 'package:flutter/material.dart';

import '../models/student.dart';
import '../validation/student_validator.dart';


class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationFirstName {
  var student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new student"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "First Name", hintText: "Engin"),
                  validator: validateFirstName,
                  onSaved: (value) {
                    student.firstName = value.toString();
                  },
                )
              ],
            ),
          ),
        ));
  }
}

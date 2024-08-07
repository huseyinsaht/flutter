import 'package:first_flutter/models/student.dart';
import 'package:first_flutter/screens/student_add.dart';
import 'package:first_flutter/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var message = "Ogrenci takip sistemi";
  Student selectedStudent = Student.withoutInfo();

  List<Student> students = [
    Student.withId(1, "engin", "demirog", 25,
        "https://media.istockphoto.com/id/1057623146/de/foto/blick-von-der-r%C3%BCckseite-eines-m%C3%A4dchens-in-einem-hut-liegt-auf-einem-h%C3%BCgel-und-befasst-sich-mit.jpg?s=2048x2048&w=is&k=20&c=jThsONVolCVC4MvdMlPdqBehx653RpQfLH9b8q-q-bI="), //
    Student.withId(2, "as", "aba", 100,
        "https://cdn.pixabay.com/photo/2020/09/27/03/38/woman-5605529_640.jpg"), //
    Student.withId(3, "kerem", "ava", 50,
        "https://cdn.pixabay.com/photo/2016/01/25/19/48/man-1161337_640.jpg") //
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
        backgroundColor: Colors.blueGrey,
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String sinavSonucu) {
    var alert = AlertDialog(
      title: const Text("Note"),
      content: Text(sinavSonucu),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: checkCircleAvatar(students[index]),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Note : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus() +
                        "] "),
                    trailing: buildStatusIcon(students[index]),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        Text("Choosen student: ${selectedStudent.firstName}"),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.add), //
                      SizedBox(
                        width: 5,
                      ),
                      Text("Add"), //
                    ],
                  ),
                  onPressed: () async {
                    final newStudent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                    setState(() {
                      if (newStudent != null) {
                        students.add(newStudent);
                      }
                    });
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.update), //
                      SizedBox(
                        width: 5,
                      ),
                      Text("Update"), //
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentEdit(selectedStudent)));
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.delete), //
                      SizedBox(
                        width: 5,
                      ),
                      Text("Delete"), //
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                      mesajGoster(context, "Deleted");
                    });
                  },
                ))
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(Student student) {
    if (student.grade > 50) {
      return const Icon(Icons.done);
    }
    return const Icon(Icons.clear);
  }

  checkCircleAvatar(Student student) {
    if (student.image.isNotEmpty) {
      return CircleAvatar(backgroundImage: NetworkImage(student.image));
    }
    var letter = student.firstName[0];
    return CircleAvatar(
      backgroundColor: Colors.blueAccent.shade100,
      child: Text(letter),
    );
  }
}

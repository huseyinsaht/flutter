import 'package:first_flutter/models/student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  var message = "Ogrenci takip sistemi";
  String seciliOgrenci = "";
  List<Student> students = [//
    Student("engin", "demirog",25, "https://media.istockphoto.com/id/1057623146/de/foto/blick-von-der-r%C3%BCckseite-eines-m%C3%A4dchens-in-einem-hut-liegt-auf-einem-h%C3%BCgel-und-befasst-sich-mit.jpg?s=2048x2048&w=is&k=20&c=jThsONVolCVC4MvdMlPdqBehx653RpQfLH9b8q-q-bI="),//
    Student("as", "aba",100, "https://cdn.pixabay.com/photo/2020/09/27/03/38/woman-5605529_640.jpg"),//
    Student("kerem", "ava",50, "https://cdn.pixabay.com/photo/2016/01/25/19/48/man-1161337_640.jpg")//
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

  String sinavhesapla(int not) {
    var sinavSonucu = "";
    if (not > 70) {
      return sinavSonucu = "gecti";
    }
    return sinavSonucu = "kaldi";
  }

  void mesajGoster(BuildContext context, String sinavSonucu) {
    var alert = AlertDialog(
      title: Text("Sinav sonucu"),
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
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].image)),
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle: Text("Sinavdan aldigi not : " + students[index].grade.toString() + " [" + students[index].getStatus() + "] "),
                    trailing: buildStatusIcon(students[index]),
                    onTap: (){
                      seciliOgrenci =students[index].firstName + " " + students[index].lastName;
                      print(students[index].firstName + " " + students[index].lastName);
                    },
                  );
                })),
        Text("Secili ogrenci : " + seciliOgrenci),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  var mesaj = sinavhesapla(85);
                  mesajGoster(context, mesaj);
                },
                child: Text("sonucu gor"))),
      ],
    );
  }

  Widget buildStatusIcon(Student student) {
     if(student.grade > 50){
       student.setStatus("Gecti");
       return  Icon(Icons.done);
     }
     student.setStatus("kaldi");
        return Icon(Icons.clear);
  }
}


class PersonalManager{
  void add(){
    print("Eklendi");
  }

  void guncelle(){
    print("Guncellendi");
  }

  void sil(){
    print("silindi");
  }
}
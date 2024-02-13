import 'package:flutter/material.dart';
import 'package:flutter_ornekler/models/student.dart';
import 'package:flutter_ornekler/screens/student.add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<Student> students = [
  Student.as( "suleyman", "ersoy", 65),
  Student.as("arif", "ersoy", 40),
  Student.as( "mehmet", "yilmaz", 20)
];

class _MyAppState extends State<MyApp> {
  String baslik = " Öğrenci Takip Sistemi";
  String update_button_name = "Güncelle";
  String add_button_name = "Ekle";
  String delete_button_name = "Sil";

  Student selectedStudent = Student.as( "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(baslik),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: renkSecimi(students[index].getGrade),
            title: Text(
                "${students[index].firstName} ${students[index].lastName}"),
            subtitle: Text(
                "Sinav notu : ${students[index].getGrade.toString()} [${students[index].getStatus}]"),
            trailing: buildStatusIcon(students[index].grade),
            onTap: () {
              setState(() {
                selectedStudent = students[index];
              });
            },
          );
        },
      )),
      Text("Seçili öğrenci: ${selectedStudent.getFirstName}"),
      Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: ElevatedButton(
              child: Row(
                children: [
                  const Icon(Icons.delete),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    update_button_name,

                    /// update ///
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: Row(
                  children: [
                    const Icon(Icons.delete),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      add_button_name,

                      /// add ///
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amberAccent,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  });

                },
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ElevatedButton(
                child: Row(
                  children: [
                    const Icon(Icons.delete),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      delete_button_name,

                      /// delete ///
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.amberAccent,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                    mesajGoster(context, "Silindi", selectedStudent);
                  });
                },
              ))
        ],
      ),
    ]);
  }

  Widget buildStatusIcon(int? grade) {
    if (grade! >= 50) {
      return const Icon(Icons.done);
    } else {
      return const Icon(Icons.clear);
    }
  }

  Widget renkSecimi(int? grade) {
    if (grade! >= 50) {
      return const CircleAvatar(
        backgroundColor: Colors.green,
      );
    } else {
      return const CircleAvatar(
        backgroundColor: Colors.red,
      );
    }
  }
}

void mesajGoster(BuildContext context, String text, Student student) {
  String alertBaslik = "İşlem Sonucu";
  var alert = AlertDialog(
    title: Text(alertBaslik),
    content: Text("$text : ${student.getFirstName}"),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}

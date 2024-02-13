import 'package:flutter/material.dart';
import 'package:flutter_ornekler/models/student.dart';
import 'package:flutter_ornekler/validation/student_validation.dart';

class StudentAdd extends StatefulWidget {

  List<Student> students;
  StudentAdd(this.students, {super.key});


  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {

   List<Student> students;
  _StudentAddState(this.students);

  var student = Student.withoutinfo();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String addStudentCaption = "Yeni Öğrenci Ekleme";
    return Scaffold(
        appBar: AppBar(
          title: Text(addStudentCaption),
        ),
        body: Container(
          margin: const EdgeInsets.all(40.0),
          child:Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeNameField(),
                buildSubmitButton()
              ],
            ),
          ),

        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: "Ögrenci Adı: ", hintText: "Arif"),
      validator: validationFirstName,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Ögrenci Soyadı: ", hintText: "Ersoy"),
      validator: validationLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
        decoration:
            const InputDecoration(labelText: "Ögrenci notu:", hintText: "65"),
        validator: validationGradeName,
        onSaved: (String? value) {
          student.grade = int.parse(value!);
        });
  }
  Widget buildSubmitButton()
  {
    return ElevatedButton(
        onPressed: ()
        {
          if(formKey.currentState!.validate())
          {
            formKey.currentState!.save();
            students.add(student);
            saveStudent();
            Navigator.pop(context);
          }
        },
        child: const Text("Kaydet")
    );
  }

  void saveStudent()
  {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}



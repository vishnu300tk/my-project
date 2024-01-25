import 'package:flutter/material.dart';
import 'package:flutter_application_1/student_model.dart';


// ignore: must_be_immutable
class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();

  List<StudentModel> studentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
               keyboardType: TextInputType.number,
              controller: classController,
              decoration: const InputDecoration(hintText: "Enter Class"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: rollnoController,
              decoration: const InputDecoration(hintText: "Enter RollNo"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
              
                addDetails();
              },
              child: const Text("Add Details")),
          Expanded(
            child: ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text('Name: ${studentList[index].name}'),
                    subtitle:
                        Text('Roll Number: ${studentList[index].rollno}'),
                      trailing: Text('Class: ${studentList[index].classs}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addDetails() {
    setState(() {
      String name = nameController.text;
      String classs = classController.text;
      String rollno = rollnoController.text;
      if (name.isNotEmpty && classs.isNotEmpty && rollno.isNotEmpty) {
        studentList
            .add(StudentModel(name: name, classs: classs, rollno: rollno));
        nameController.clear();
        classController.clear();
        rollnoController.clear();
      }
    });
  }
}

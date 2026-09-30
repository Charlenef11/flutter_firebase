import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
} 

class _StudentPageState extends State<StudentPage> {

final studentNoController = TextEditingController();
final nameController = TextEditingController();
final courseController = TextEditingController();

 
 Future<void> saveTestData() async {

  final studentNo = studentNoController.text.trim();
  final name = nameController.text.trim();
  final course = courseController.text.trim();

  await FirebaseFirestore.instance.collection('students').add({
    'name': name,
    'course': course,
    'Student_No': studentNo,
    'createdAt': FieldValue.serverTimestamp(),
  });

  // Notification Snackbar
  const snackBar = SnackBar(content: Text('Created successfully'));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);

  // Clear Textfield
  studentNoController.clear();
  nameController.clear();
  courseController.clear();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("student Page"), backgroundColor: Colors.blueAccent, foregroundColor: Colors.white,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Register Student Info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              SizedBox(height: 40,),

              TextField(
                controller: studentNoController,
                decoration: InputDecoration(
                  labelText: "Student No",
                  border: OutlineInputBorder(),
                )
              ),

              
              SizedBox(height: 10,),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                )
              ),

                 SizedBox(height: 10,),

              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: "Course",
                  border: OutlineInputBorder(),
                )
              ),

              SizedBox(height: 15,),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(onPressed: saveTestData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white
                ), child: Text('Create')))


            ],
          ),),
        
      ),
      // body: Column(
      //   children: [
      //     FilledButton(
      //       onPressed: saveTestData,
      //       child: const Text('Save Test Student'),
      //     ),
      //   ],
      // ),
    );
  }
}

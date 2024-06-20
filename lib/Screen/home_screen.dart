import 'package:flutter/material.dart';

import '../Global/student_lists.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [
    Student(name: 'Name', Grid: 1001,Std: 12, imagePath: 'assets/images/john.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: const Text('Students',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(students[index].imagePath),
              ),
              title: Text(students[index].name),
              subtitle: Text('Std: ${students[index].Std}'),
              trailing: Text('GrId: ${students[index].Grid}',style: TextStyle(fontSize: 20),),
              onTap: () {
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDataPage()),
          ).then((newStudent) {
            if (newStudent != null) {
              setState(() {
                students.add(newStudent);
              });
            }
          });
        },
        child: Icon(Icons.add,color: Colors.black,size: 25,),
      ),
    );
  }
}

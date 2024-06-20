import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Global/student_lists.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;

class AddDataPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gridController = TextEditingController();
  final TextEditingController stdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('Add New Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red.shade200,
                backgroundImage:
                (fileImage != null) ? FileImage(fileImage!) : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      XFile? xfileImage =
                      await imagePicker.pickImage(source: ImageSource.camera);
          
          
                      fileImage = File(xfileImage!.path);
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 40,
                    ),
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () async {
                      XFile? xfileImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      // setState(() {
                      //
                      // });
                      fileImage = File(xfileImage!.path);
                    },
                    icon: Icon(
                      Icons.photo_rounded,
                      size: 40,
                    ),
                    color: Colors.black,
                  ),
                ],
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: gridController,
                decoration: InputDecoration(labelText: 'GrId'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: stdController,
                decoration: InputDecoration(labelText: 'Std'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  int grid = int.tryParse(gridController.text) ?? 0;
                  int std = int.tryParse(stdController.text) ?? 0;
          
                  Navigator.pop(
                    context,
                    Student(name: name, Grid: grid,Std: std, imagePath: 'assets/images/default_avatar.jpg',),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

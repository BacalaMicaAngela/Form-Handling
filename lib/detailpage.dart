import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map data;

  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text('ID Number: ${data['id']}'),
              Text('Name: ${data['name']}'),
              Text('Birthday: ${data['birthday']}'),
              Text('Gender: ${data['gender']}'),
              Text('Course: ${data['course']}'),
              Text('Section: ${data['section']}'),
            ],
          ),
        ));
  }
}
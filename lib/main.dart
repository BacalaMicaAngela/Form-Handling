import 'package:flutter/material.dart';

import 'formpage.dart';
import 'detailpage.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Act 4',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // two global empty lists
  List receiver = [];
  List student = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity #4'),
      ),
      body: ListView.builder(
          itemCount: student.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text(student[index]['name']),
                subtitle: Text(student[index]['course']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(data: student[index])));
                },
              ),
              onDismissed: (direction) =>
                  setState(() {
                    student.removeAt(index);
                    receiver.removeAt(index);
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            receiver.add(await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FormPage())));

            setState(() {
              //.map loop passing receiver list value to student list
              student = receiver
                  .map((item) =>
              {
                'name': item[0]['name'],
                'id': item[0]['id'],
                'birthday': item[0]['birthday'],
                'course': item[0]['course'],
                'section': item[0]['section'],
                'gender': item[0]['gender'],
              }).toList();
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
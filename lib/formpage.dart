import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController section = TextEditingController();
  var drop = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              TextFormField(
                controller: id,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Ex. 2020123456', labelText: 'ID Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    icon: Icon(Icons.face),
                    hintText: 'Full Name', labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: birthday,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    hintText: 'Ex. 01/01/1999', labelText: 'Birthday'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: course,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon( Icons.school),
                    hintText: 'Ex. BSIT', labelText: 'Course'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: section,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.business),
                    hintText: 'Ex. IT3R1', labelText: 'Section'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                  onChanged: (value) {
                    drop = value.toString();
                  }),
              SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          List data = <Map<String, dynamic>>[
                            {
                              'id': id.text,
                              'name': name.text,
                              'birthday': birthday.text,
                              'course': course.text,
                              'section': section.text,
                              'gender': drop
                            }
                          ];

                          Navigator.pop(context, data);
                        }
                      },
                      child: const Text('SUBMIT')))
            ],
          )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String? _processing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Add Record',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              SizedBox(
                height: 10,
              ),
              Text('Select product image',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              Image.asset('assets/joana.png'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a product name';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: () {
                  final date = showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime.now());
                },
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a date';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                hint: Text('Select a category'),
                value: _processing,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      'Harvest',
                    ),
                    value: 'Harvest',
                  ),
                  DropdownMenuItem(
                    child: Text('Activity'),
                    value: 'Activity',
                  ),
                ],
                onChanged: (value) {
                  _processing = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: Text('Add Record',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ));
  }
}

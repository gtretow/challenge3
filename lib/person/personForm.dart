// ignore_for_file: file_names

import 'package:challenge3/classes/person.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonFormState createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  void _addPerson() {
    final String name = nameController.text;
    final double height = double.parse(heightController.text);
    final double weight = double.parse(weightController.text);

    final person = Person(name, height, weight);

    final personsBox = Hive.box<Person>('persons');
    personsBox.add(person);

    nameController.clear();
    heightController.clear();
    weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: heightController,
            decoration: const InputDecoration(labelText: 'Altura'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: weightController,
            decoration: const InputDecoration(labelText: 'Peso'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: _addPerson,
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}

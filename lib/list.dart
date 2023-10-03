import 'package:challenge3/classes/person.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PersonListPage extends StatelessWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final personsBox = Hive.box<Person>('persons');
    final List<Person> persons = personsBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pessoas Cadastradas'),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
          final String imc = person.calculateIMC();

          return ListTile(
            title: Text(person.name),
            subtitle:
                Text('Altr: ${person.height} cm, Peso: ${person.weight} kg'),
            trailing: Text('IMC: $imc'),
          );
        },
      ),
    );
  }
}

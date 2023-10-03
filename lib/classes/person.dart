import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  double height;

  @HiveField(2)
  double weight;

  Person(this.name, this.height, this.weight);

  String calculateIMC() {
    var imc = weight / ((height / 100) * (height / 100));
    if (imc < 18.5) {
      return "${imc.toStringAsFixed(2)} Abaixo do Peso";
    } else if (imc >= 18.5 && imc < 24.9) {
      return "${imc.toStringAsFixed(2)} Peso Normal";
    } else if (imc >= 25.0 && imc < 29.9) {
      return "${imc.toStringAsFixed(2)} Sobrepeso";
    } else if (imc >= 30.0 && imc < 34.9) {
      return "${imc.toStringAsFixed(2)} Obesidade Grau I";
    } else if (imc >= 35.0 && imc < 39.9) {
      return "${imc.toStringAsFixed(2)} Obesidade Grau II";
    } else {
      return "${imc.toStringAsFixed(2)} Obesidade Grau III";
    }
  }
}

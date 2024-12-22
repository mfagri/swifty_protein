// lib/models/molecule.dart
import 'atom.dart';

class Molecule {
  final String name;
  final String formula;
  final double weight;
  final String letterCode;
  final String type;
  List<Atom> atomList = [];

  Molecule(this.name, this.formula, this.weight, this.letterCode, this.type);

  @override
  String toString() {
    return 'Molecule($name, $formula, $letterCode)';
  }

  // Helper method to get atom count
  int get atomCount => atomList.length;

  // Helper method to get bond count
  int get bondCount {
    int count = 0;
    for (var atom in atomList) {
      count += atom.connect.length;
    }
    // Each bond is counted twice (once from each atom), so divide by 2
    return count ~/ 2;
  }
}
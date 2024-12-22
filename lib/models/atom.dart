// lib/models/atom.dart
// import 'package:three_dart/three_dart.dart' as three;

class Atom {
  final double x;
  final double y;
  final double z;
  final String name;
  List<int> connect = [];
  
  Atom(this.x, this.y, this.z, this.name);
  
  // three.Vector3 get coordinates => three.Vector3(x, y, z);
  
  @override
  String toString() {
    return 'Atom($name at $x,$y,$z with ${connect.length} connections)';
  }
}
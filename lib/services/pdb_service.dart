// lib/services/pdb_service.dart
import 'package:http/http.dart' as http;
import '../models/molecule.dart';
import '../utils/pdb_parser.dart';

class PDBService {
  static Future<Molecule?> loadPDBFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        return PDBParser.parsePDBContent(
          response.body,
          name: url.split('/').last.replaceAll('.pdb', '')
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<Molecule?> loadPDBFromContent(String content, {String name = ''}) async {
    try {
      return PDBParser.parsePDBContent(content, name: name);
    } catch (e) {
      return null;
    }
  }
}
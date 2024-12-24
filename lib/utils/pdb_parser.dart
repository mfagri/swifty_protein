// lib/utils/pdb_parser.dart
import '../models/atom.dart';
import '../models/molecule.dart';

class PDBParser {
  static Molecule parsePDBContent(String pdbContent, {String name = "", String formula = ""}) {
    List<Atom> atoms = [];
    Map<int, int> atomIndexMap = {}; // Maps PDB atom indices to our list indices
    int currentIndex = 0;

    // Create molecule instance
    Molecule molecule = Molecule(
      name,
      formula,
      0.0,  // Weight will be calculated
      "PDB",
      "PROTEIN"
    );

    // Process PDB content line by line
    List<String> lines = pdbContent.split('\n');
    
    // First pass: Create atoms
    for (String line in lines) {
      if (line.startsWith('ATOM') || line.startsWith('HETATM')) {
        try {
          // Parse atom coordinates and info
          int pdbIndex = int.parse(line.substring(6, 11).trim());
          String element = _getElement(line.substring(76, 78).trim());
          
          double x = double.parse(line.substring(30, 38).trim());
          double y = double.parse(line.substring(38, 46).trim());
          double z = double.parse(line.substring(46, 54).trim());

          atoms.add(Atom(x, y, z, element));
          atomIndexMap[pdbIndex] = currentIndex;
          currentIndex++;
        } catch (e) {
          continue;
        }
      }
    }

    // Second pass: Process connections
    for (String line in lines) {
      if (line.startsWith('CONECT')) {
        try {
          List<String> parts = line.trim().split(RegExp(r'\s+'));
          if (parts.length < 2) continue;

          int sourceAtomPDB = int.parse(parts[1]);
          int sourceIndex = atomIndexMap[sourceAtomPDB] ?? -1;
          
          if (sourceIndex == -1) continue;

          // Process all connected atoms
          for (int i = 2; i < parts.length; i++) {
            int targetAtomPDB = int.parse(parts[i]);
            int targetIndex = atomIndexMap[targetAtomPDB] ?? -1;
            
            if (targetIndex != -1 && !atoms[sourceIndex].connect.contains(targetIndex)) {
              atoms[sourceIndex].connect.add(targetIndex);
            }
          }
        } catch (e) {
          continue;
        }
      }
    }

    molecule.atomList = atoms;
    return molecule;
  }

  static String _getElement(String rawElement) {
    // Clean up and standardize element symbols
    String element = rawElement.trim();
    
    // Handle common cases
    if (element.isEmpty) return 'C';  // Default to Carbon if not specified
    
    // Capitalize first letter and lowercase rest
    element = element[0].toUpperCase() + 
              (element.length > 1 ? element.substring(1).toLowerCase() : '');
    
    // Map of common PDB atom names to elements
    const Map<String, String> elementMap = {
      'Ca': 'Ca',  // Calcium
      'Na': 'Na',  // Sodium
      'Fe': 'Fe',  // Iron
      'Mg': 'Mg',  // Magnesium
      'Zn': 'Zn',  // Zinc
      'Cl': 'Cl',  // Chlorine
      'Cu': 'Cu',  // Copper
    };

    return elementMap[element] ?? element;
  }
}
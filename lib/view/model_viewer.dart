import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:swifty_protein/services/pdb_service.dart';
import 'package:swifty_protein/utils/constants.dart';
import 'package:swifty_protein/utils/draw_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoleculeScreen extends StatefulWidget {
  final String id;
  const MoleculeScreen({super.key, this.id = '000'});

  @override
  State<MoleculeScreen> createState() => _MoleculeScreenState();
}

class _MoleculeScreenState extends State<MoleculeScreen> {
  bool isLoading = true;
  String error = '';
  String pdbData = '';

  @override
  void initState() {
    super.initState();

    loadPDBMolecule();
  }

  void despose() {
    pdbData = '';
    super.dispose();
  }

  Future<void> loadPDBMolecule() async {
    try {
      setState(() {
        isLoading = true;
        error = '';
      });

      String pdbUrl =
          'https://files.rcsb.org/ligands/${widget.id[0]}/${widget.id}/${widget.id}_model.pdb';
      final response = await http.get(Uri.parse(pdbUrl));
      if (response.statusCode == 200) {
        pdbData = response.body;

        if (pdbData.isNotEmpty) {
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            error = 'Failed to load PDB data';
            isLoading = false;
          });
        }
      } else {
        setState(() {
          error = 'Failed to load PDB data';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Model of ${widget.id}'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)))
          : error.isNotEmpty
              ? Center(
                  child: Text(error, style: const TextStyle(color: Colors.red)))
              : pdbData.isEmpty
                  ? const Center(
                      child: Text('No data found',
                          style: TextStyle(color: Colors.red)))
                  : Column(
                      children: [
                        Expanded(
                          child: PdbViewer(pdbData: pdbData),
                        ),
                      ],
                    ),
    );
  }
}

class PdbViewer extends StatefulWidget {
  final String pdbData;

  const PdbViewer({super.key, required this.pdbData});

  @override
  State<PdbViewer> createState() => _PdbViewerState();
}

class _PdbViewerState extends State<PdbViewer> {
  late final WebViewController controller;

  void despose() {
    controller.clearCache();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Flutter',
        onMessageReceived: (JavaScriptMessage message) {
          // Handle atom click events from JavaScript
          showAtomInfo(message.message);
        },
      )
      ..loadHtmlString("""
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
          <script src="https://3dmol.org/build/3Dmol-min.js"></script>
          <style>
            body { margin: 0; overflow: hidden; background-color: white; }
            #viewer { width: 100%; height: 100vh; position: relative; }
          </style>
        </head>
        <body>
          <div id="viewer"></div>
          <script>
            \$(document).ready(function() {
              let element = \$('#viewer');
              let config = { backgroundColor: 'white' };
              let viewer = \$3Dmol.createViewer(element, config);
              
              let pdbData = `${widget.pdbData}`;
              let model = viewer.addModel(pdbData, "pdb");
              
              viewer.setStyle({}, {
                stick: {radius: 0.15},
                sphere: {radius: 0.25}
              });
              
              // Add click handler
              viewer.setClickable({}, true, function(atom, viewer) {
                let atomInfo = {
                  element: atom.elem,
                  serial: atom.serial,
                  chain: atom.chain,
                  residue: atom.resn,
                  position: {x: atom.x, y: atom.y, z: atom.z}
                };
                Flutter.postMessage(JSON.stringify(atomInfo));
              });
              
              viewer.zoomTo();
              viewer.render();
              viewer.rotate(90);
            });
          </script>
        </body>
        </html>
      """);
  }

  void showAtomInfo(String atomData) {
    final atom = jsonDecode(atomData);
    final element = atom['element'] as String;
    final Color color = DrawHelper.atomColors[element] ?? Colors.grey;
    final radius = DrawHelper.atomRadii[element] ?? 0.4;
    final fullName = Constants.atomsFullName[element] ?? element;
    final bonds = Constants.atomBonds[element] ?? 0;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  element,
                  style: TextStyle(
                    color: _isLightColor(color) ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Atomic Information',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _InfoRow(
              icon: Icons.science,
              title: 'Element Symbol',
              value: element,
            ),
            _InfoRow(
              icon: Icons.link,
              title: 'Maximum Bonds',
              value: bonds.toString(),
            ),
            _InfoRow(
              icon: Icons.radio_button_unchecked,
              title: 'Atomic Radius',
              value: '${radius.toStringAsFixed(2)} Å',
            ),
            _InfoRow(
              icon: Icons.tag,
              title: 'Serial',
              value: atom['serial'].toString(),
            ),
            if (atom['chain'] != null)
              _InfoRow(
                icon: Icons.link_outlined,
                title: 'Chain',
                value: atom['chain'],
              ),
            if (atom['residue'] != null)
              _InfoRow(
                icon: Icons.account_tree,
                title: 'Residue',
                value: atom['residue'],
              ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(key: UniqueKey(), controller: controller);
  }
}

bool _isLightColor(Color color) {
  final luminance = color.computeLuminance();
  return luminance > 0.5;
}

class _InfoRow extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String value;
  // final bool showIcon;

  const _InfoRow({
    this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

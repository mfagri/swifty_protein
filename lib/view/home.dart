import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swifty_protein/view/model_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> _ligands = [];
  bool isLoading = true;
  String _selectedLigand = '';

  @override
  void initState() {
    super.initState();
    _loadData().then(_parseData);
  }

  Future<String> _loadData() async {
    return await rootBundle.loadString('assets/ligands.txt');
  }

  Future<void> _parseData(String content) async {
    List<String> lines = content.split('\n');
    List<List<String>> tempLigands = [];

    for (var line in lines) {
      if (line.trim().isNotEmpty) {
        List<String> parts = line.split(',');
        tempLigands.add(parts);
      }
    }

    setState(() {
      _ligands = tempLigands;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLoading)
                const CircularProgressIndicator()
              else
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchAnchor(
                    viewBackgroundColor: Colors.white,
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.grey[200],
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        onTap: () {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                        hintText: 'Search for ligands',
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      final keyword = controller.text.toLowerCase();
                      return _ligands
                          .where((ligand) => ligand.any((element) =>
                              element.toLowerCase().contains(keyword)))
                          .map((ligand) => ListTile(
                                title: Text(ligand[0]),
                                subtitle:
                                    Text(ligand.length > 1 ? ligand[1] : ''),
                                onTap: () {
                                  controller.closeView(ligand[0]);
                                  setState(() {
                                    _selectedLigand = ligand[0];
                                  });
                                },
                              ))
                          .toList();
                    },
                  ),
                ),
              const SizedBox(height: 20),
              if (_selectedLigand.isNotEmpty)
                Text(
                  'Selected ligand: $_selectedLigand',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                const SizedBox(),
              const SizedBox(height: 20),
              if (_selectedLigand.isNotEmpty)
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MoleculeScreen(id: _selectedLigand),
                        ),
                      ).then((value) {
                        setState(() {
                          _selectedLigand = '';
                        });
                      });
                    },
                    child: const Text('View Model'),
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:swifty_protein/pages/login.dart';
import 'package:swifty_protein/view/model_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<String>> _ligands = [];
  List<List<String>> _filteredLigands = [];
  bool isLoading = true;
  String _selectedLigand = '';
  String _searchQuery = '';
  final Set<int> _expandedCards = {};

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
      _filteredLigands = tempLigands;
      isLoading = false;
    });
  }

  void _filterLigands(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredLigands = _ligands;
      } else {
        _filteredLigands = _ligands
            .where((ligand) => ligand.any((element) =>
                element.toLowerCase().contains(query.toLowerCase())))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Swifty Protein',
          style: TextStyle(
            fontFamily: '_2',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.logout_1, color: Colors.white),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
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
                        onChanged: (value) {
                          _filterLigands(value);
                        },
                        leading: const Icon(Icons.search),
                        hintText: 'Search for ligands',
                        hintStyle: WidgetStateProperty.all<TextStyle>(
                          const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: '_2',
                          ),
                        ),
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      final keyword = controller.text.toLowerCase();
                      return _ligands
                          .where((ligand) => ligand.any((element) =>
                              element.toLowerCase().contains(keyword)))
                          .map((ligand) => ListTile(
                                title: Text(ligand[0],
                                    style: const TextStyle(
                                        fontFamily: '_2',
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    ligand.length > 1 ? ligand[1] : '',
                                    style: const TextStyle(fontFamily: '_2')),
                                onTap: () {
                                  controller.closeView(ligand[0]);
                                  _filterLigands(ligand[0]);
                                  setState(() {
                                    _selectedLigand = ligand[0];
                                  });
                                },
                              ))
                          .toList();
                    },
                  ),
                ),
              if (_searchQuery.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search results for: $_searchQuery',
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: '_2',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _searchQuery = '';
                            _filteredLigands = _ligands;
                            _selectedLigand = '';
                          });
                        },
                        child: const Text(
                          'Clear',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: '_2',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _filteredLigands.length,
                  itemBuilder: (context, index) {
                    bool isExpanded = _expandedCards.contains(index);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _expandedCards.clear();
                          if (!isExpanded) {
                            _expandedCards.add(index);
                          }
                          _selectedLigand = _filteredLigands[index][0];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/atom3.png',
                                        height: 70,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      _filteredLigands[index][0],
                                      style: const TextStyle(
                                        fontFamily: '_2',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 200),
                                left: 0,
                                right: 0,
                                bottom: isExpanded ? 0 : -30,
                                child: Container(
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MoleculeScreen(
                                                    id: _selectedLigand),
                                          ),
                                        ).then((value) {
                                          setState(() {
                                            _selectedLigand = '';
                                          });
                                        });
                                      },
                                      child: const Text(
                                        'Show in 3D',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: '_2',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

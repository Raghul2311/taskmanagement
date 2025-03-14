import 'package:flutter/material.dart';
import 'package:taskmangament/utils/appcolors.dart';
import 'package:taskmangament/utils/spacerwidget.dart';

class Generaldata extends StatefulWidget {
  const Generaldata({super.key});

  @override
  State<Generaldata> createState() => _GeneraldataState();
}

class _GeneraldataState extends State<Generaldata> {
  final TextEditingController areaController = TextEditingController();
  final TextEditingController schoolCountController = TextEditingController();

  int _schoolCount = 0;

  String _selectedSection = "General Data";

  void _updateSchoolCount() {
    setState(() {
      int count = int.tryParse(schoolCountController.text) ?? 0;
      _schoolCount = (count > 5) ? 5 : count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppsColors.sliver,
        title: Text("Task Commencement → General Data"),
      ),
      body: Row(
        children: [
          // Side Bar
          Container(
            width: 200,
            color: Colors.orange[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacerWidget.size16,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSection = "General Data";
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      color:
                          _selectedSection == "General Date"
                              ? Colors.orange[600]
                              : Colors.orange[200],
                      child: Text(
                        "General Data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  for (int i = 1; i <= _schoolCount; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedSection = "School-$i";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
              
                        color:
                            _selectedSection == "School-$i"
                                ? Colors.orange[600]
                                : Colors.orange[200],
                        child: Text(
                          "School-$i",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_selectedSection == "General Data") ...[
                    Text(
                      "General Data",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SpacerWidget.size16,
                    TextField(
                      controller: areaController,
                      decoration: InputDecoration(
                        labelText: "Name of the Area",
                        filled: true,
                        fillColor: AppsColors.sliver,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SpacerWidget.size16,
                    TextField(
                      controller: schoolCountController,
                      decoration: InputDecoration(
                        labelText: "Total No. of Schools (Max 5)",
                        filled: true,
                        fillColor: AppsColors.sliver,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => _updateSchoolCount(),
                    ),
                  ] else ...[
                    Text(
                      "Data Entry for $_selectedSection",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

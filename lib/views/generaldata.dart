import 'package:flutter/material.dart';
import 'package:taskmangament/utils/appcolors.dart';
import 'package:taskmangament/utils/spacerwidget.dart';
import 'package:taskmangament/views/home.dart';

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

  /// Store selections separately for each school
  Map<int, Set<String>> selectedCurriculums = {};
  Map<int, Set<String>> selectedGrades = {};

  void _updateSchoolCount() {
    setState(() {
      int count = int.tryParse(schoolCountController.text) ?? 0;
      _schoolCount = (count > 5) ? 5 : count; // Limit max to 5
    });
  }

  void _handleSchoolSelection(int schoolIndex) {
    setState(() {
      _selectedSection = "School-$schoolIndex";
      selectedCurriculums.putIfAbsent(schoolIndex, () => {});
      selectedGrades.putIfAbsent(schoolIndex, () => {});
    });
  }

  void _finishTask() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppsColors.sliver,
        title: const Text("Task Commencement → General Data"),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.orange[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(8),
                      color:
                          _selectedSection == "General Data"
                              ? Colors.orange[600]
                              : Colors.orange[200],
                      child: const Text(
                        "General Data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Dynamic school list
                  for (int i = 1; i <= _schoolCount; i++)
                    GestureDetector(
                      onTap: () => _handleSchoolSelection(i),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(8),
                        color:
                            _selectedSection == "School-$i"
                                ? Colors.orange[600]
                                : Colors.orange[200],
                        child: Text(
                          "School-$i",
                          style: const TextStyle(
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
              padding: const EdgeInsets.all(12.0),
              child:
                  _selectedSection == "General Data"
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "General Data",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
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
                          SpacerWidget.medium,
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
                        ],
                      )
                      : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedSection,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SpacerWidget.large,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppsColors.sliver,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Name of the School",
                                ),
                              ),
                              SpacerWidget.size16,
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppsColors.sliver,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Type of School",
                                ),
                                items:
                                    [
                                          "Public",
                                          "Private",
                                          "Govt Aided",
                                          "Special",
                                        ]
                                        .map(
                                          (type) => DropdownMenuItem(
                                            value: type,
                                            child: Text(type),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {},
                              ),
                              SpacerWidget.size16,
                              TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppsColors.sliver,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: "Established On",
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                              SpacerWidget.size16,
                              Wrap(
                                children:
                                    ["CBSE", "ICSE", "IB", "State Board"]
                                        .map(
                                          (curriculum) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            child: FilterChip(
                                              label: Text(curriculum),
                                              selected:
                                                  selectedCurriculums[int.tryParse(
                                                            _selectedSection
                                                                .replaceAll(
                                                                  "School-",
                                                                  "",
                                                                ),
                                                          ) ??
                                                          0]
                                                      ?.contains(curriculum) ??
                                                  false,
                                              selectedColor: Colors.orange,
                                              backgroundColor:
                                                  AppsColors.sliver,
                                              checkmarkColor: Colors.white,
                                              onSelected: (selected) {
                                                setState(() {
                                                  int schoolIndex =
                                                      int.tryParse(
                                                        _selectedSection
                                                            .replaceAll(
                                                              "School-",
                                                              "",
                                                            ),
                                                      ) ??
                                                      0;
                                                  if (selected) {
                                                    selectedCurriculums[schoolIndex]!
                                                        .add(curriculum);
                                                  } else {
                                                    selectedCurriculums[schoolIndex]!
                                                        .remove(curriculum);
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                              SpacerWidget.medium,
                              Wrap(
                                children:
                                    ["Primary", "Secondary", "Higher Secondary"]
                                        .map(
                                          (grade) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                            child: FilterChip(
                                              label: Text(grade),
                                              selected:
                                                  selectedGrades[int.tryParse(
                                                            _selectedSection
                                                                .replaceAll(
                                                                  "School-",
                                                                  "",
                                                                ),
                                                          ) ??
                                                          0]
                                                      ?.contains(grade) ??
                                                  false,
                                              selectedColor: Colors.orange,
                                              backgroundColor:
                                                  AppsColors.sliver,
                                              checkmarkColor: Colors.white,
                                              onSelected: (selected) {
                                                setState(() {
                                                  int schoolIndex =
                                                      int.tryParse(
                                                        _selectedSection
                                                            .replaceAll(
                                                              "School-",
                                                              "",
                                                            ),
                                                      ) ??
                                                      0;
                                                  if (selected) {
                                                    selectedGrades[schoolIndex]!
                                                        .add(grade);
                                                  } else {
                                                    selectedGrades[schoolIndex]!
                                                        .remove(grade);
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                              SpacerWidget.size32,
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                  ),
                                  onPressed: _finishTask,
                                  child: const Text(
                                    "Finish",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

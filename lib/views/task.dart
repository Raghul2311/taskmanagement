import 'package:flutter/material.dart';
import 'package:taskmangament/utils/appcolors.dart';
import 'package:taskmangament/utils/spacerwidget.dart';
import 'package:taskmangament/views/generaldata.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
} //ok

class _TaskState extends State<Task> {
  double progressValue = 45;
  DateTime? startDate;
  DateTime? dueDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          dueDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Column
            Expanded(
              child: Column(
                children: [
                  _buildTextField("Title *"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown("Assign To *", [
                          "Not Started",
                          "In Progress",
                        ]),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildDropdown("Priority *", [
                          "High",
                          "Medium",
                          "Low",
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: _buildTextField("Created By *")),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField("Division *")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildTextField("Description *", maxLines: 4),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Right Column
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    _buildDropdown("Task Status *", [
                      "Not Started",
                      "In Progress",
                      "Completed",
                    ]),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("% Complete *"),
                        Slider(
                          value: progressValue,
                          thumbColor: AppsColors.sliver,
                          activeColor: Colors.amber,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          label: "${progressValue.round()}%",
                          onChanged: (value) {
                            setState(() {
                              progressValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildDropdown("Group *", ["Not Started", "In Progress"]),
                    const SizedBox(height: 10),
                    _buildDatePicker(
                      "Start Date *",
                      startDate,
                      () => _selectDate(context, true),
                    ),
                    const SizedBox(height: 10),
                    _buildDatePicker(
                      "Due Date *",
                      dueDate,
                      () => _selectDate(context, false),
                    ),
                    SpacerWidget.large,
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Generaldata(),
                              ),
                            );
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SpacerWidget.size16w,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
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
      ),
    );
  }

  // Reusable Text Field
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SpacerWidget.small,
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppsColors.sliver,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Reusable Dropdown
  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppsColors.sliver,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  // Reusable Date Picker
  Widget _buildDatePicker(String label, DateTime? date, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        InkWell(
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              fillColor: AppsColors.sliver,
              filled: true,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            child: Text(
              date == null ? "Select Date" : "${date.toLocal()}".split(' ')[0],
            ),
          ),
        ),
      ],
    );
  }
}

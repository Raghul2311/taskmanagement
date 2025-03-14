import 'package:flutter/material.dart';
import 'package:taskmangament/utils/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        children: [
          // Side bar........
          Container(
            width: screenWidth * 0.2,
            height: screenHeight,
            color: Colors.blue.shade900,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Home", style: sidebarTextStyle),
                  SizedBox(height: 20),
                  Text("Sheduled Task", style: sidebarTextStyle),
                  SizedBox(height: 20),
                  Text("Completed Tasks", style: sidebarTextStyle),
                  SizedBox(height: 20),
                  Text("With-held Tasks", style: sidebarTextStyle),
                ],
              ),
            ),
          ),

          // Main Dashboard section..............
          Expanded(
            child: Column(
              children: [
                // Top Bar.........
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("+ Add Task"),
                            ),
                            SizedBox(width: 16),

                            // User profile menu button..............
                            PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == "Home") {
                                  //navigate to home page
                                } else if (value == "Setting") {
                                  //navigate to setting page
                                } else if (value == "SignOut") {
                                  //perform sign out action
                                }
                              },
                              itemBuilder:
                                  (context) => [
                                    PopupMenuItem(
                                      value: "Home",
                                      child: Text("Home"),
                                    ),
                                    PopupMenuItem(
                                      value: "Setting",
                                      child: Text("Setting"),
                                    ),
                                    PopupMenuItem(
                                      value: "SignOut",
                                      child: Text("Sign Out"),
                                    ),
                                  ],
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Task list (Dashboard Table)................
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('URN')),
                          DataColumn(label: Text('Task Name')),
                          DataColumn(label: Text('Assigned By')),
                          DataColumn(label: Text('Assigned To')),
                          DataColumn(label: Text('Commencement Date')),
                          DataColumn(label: Text('Due Date')),
                          DataColumn(label: Text('Client Name')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List.generate(
                          5,
                          (index) => DataRow(
                            cells: [
                              DataCell(Text('URN-${index + 1}')),
                              DataCell(Text('Task ${index + 1}')),
                              DataCell(Text('John Doe')),
                              DataCell(Text('Jane Smith')),
                              DataCell(Text('2025-03-01')),
                              DataCell(Text('2025-03-10')),
                              DataCell(
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Client ${index + 1}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                DropdownButton<String>(
                                  items: [
                                    DropdownMenuItem(
                                      value: "New",
                                      child: Text("New"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Ongoing",
                                      child: Text("Ongoing"),
                                    ),
                                    DropdownMenuItem(
                                      value: "Completed",
                                      child: Text("Completed"),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                  hint: Text("Select"),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_arrow,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of 'batch_mobile_imports.dart';

class BatchMobile extends StatefulWidget {
  const BatchMobile({super.key});
  @override
  _BatchMobileState createState() => _BatchMobileState();
}

class _BatchMobileState extends State<BatchMobile> {
  bool isLoading = false; // To manage loading state
  bool selectAll = false; // To manage select all state
  List<Map<String, dynamic>> students = []; // Placeholder for student data
  List<String> batches = ["Batch A", "Batch B", "Batch C"]; // Dummy batches

  // Dummy search function
  void _searchStudents() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        students = [
          {
            "id": "1",
            "firstName": "John",
            "lastName": "Doe",
            "batch": "Batch A",
            "selected": false
          },
          {
            "id": "2",
            "firstName": "Jane",
            "lastName": "Smith",
            "batch": "Batch B",
            "selected": false
          },
          // Add more student data here
        ];
      });
    });
  }

  // Function to handle select all toggle
  void _toggleSelectAll(bool? value) {
    setState(() {
      selectAll = value ?? false;
      students = students.map((student) {
        student["selected"] = selectAll;
        return student;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Batch"),
        actions: [
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => _AddPopup());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              foregroundColor: MyColors.white,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, size: 20),
                Text(" Add"),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => _ViewPopup());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              foregroundColor: MyColors.white,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.view_agenda_outlined, size: 20),
                Text(" View"),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Adjusted padding for mobile
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 30,
                shadowColor: MyColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const Text(
                        "Search Student",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Search Form
                      TextField(
                        cursorColor: MyColors.grey,
                        decoration: InputDecoration(
                          hintText: 'ID',
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: MyColors.grey,
                          fillColor: Colors.white.withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        cursorColor: MyColors.grey,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: MyColors.grey,
                          fillColor: Colors.white.withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        cursorColor: MyColors.grey,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: MyColors.grey,
                          fillColor: Colors.white.withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: MyColors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),

                      // Search Button
                      FadeAnimation(
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _searchStudents,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      MyColors.black),
                                )
                              : const Text("Search",
                                  style: TextStyle(
                                      color: MyColors.black, fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),

            // Student Table
            if (students.isNotEmpty) ...[
              const Text(
                "Student Results:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20, // Adjusted column spacing for mobile
                    columns: [
                      DataColumn(
                        label: Checkbox(
                          value: selectAll,
                          onChanged: _toggleSelectAll,
                        ),
                      ),
                      const DataColumn(label: Text("ID")),
                      const DataColumn(label: Text("First Name")),
                      const DataColumn(label: Text("Last Name")),
                      const DataColumn(label: Text("Current Batch")),
                      const DataColumn(label: Text("Select Batch")),
                    ],
                    rows: students
                        .map(
                          (student) => DataRow(
                            selected: student["selected"] ?? false,
                            cells: [
                              DataCell(
                                Checkbox(
                                  value: student["selected"],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      student["selected"] = value!;
                                    });
                                  },
                                ),
                              ),
                              DataCell(Text(student["id"]!)),
                              DataCell(Text(student["firstName"]!)),
                              DataCell(Text(student["lastName"]!)),
                              DataCell(Text(student["batch"]!)),
                              DataCell(
                                DropdownButton<String>(
                                  value: student["batch"],
                                  items: batches.map((String batch) {
                                    return DropdownMenuItem<String>(
                                      value: batch,
                                      child: Text(batch),
                                    );
                                  }).toList(),
                                  onChanged: (newBatch) {
                                    setState(() {
                                      student["batch"] = newBatch!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
                child: const Text("Save", style: TextStyle(fontSize: 18)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Add Popup Widget
class _AddPopup extends StatefulWidget {
  @override
  _AddPopupState createState() => _AddPopupState();
}

class _AddPopupState extends State<_AddPopup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Batch'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              cursorColor: MyColors.grey,
              decoration: InputDecoration(
                hintText: 'Batch Code',
                filled: true,
                prefixIcon: const Icon(Icons.group),
                prefixIconColor: MyColors.grey,
                fillColor: Colors.white.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.red,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.black,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Add student logic here
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class _ViewPopup extends StatefulWidget {
  @override
  _ViewPopupState createState() => _ViewPopupState();
}

class _ViewPopupState extends State<_ViewPopup> {
  bool _allSelected = false;
  final List<int> _selectedIndices = []; // To manage selected checkboxes

  final List<Map<String, dynamic>> _students = [
    {"id": 1, "batchCode": "Batch 1", "createDate": "2022-01-01"},
    {"id": 2, "batchCode": "Batch 2", "createDate": "2022-01-02"},
    {"id": 3, "batchCode": "Batch 3", "createDate": "2022-01-03"},
    {"id": 4, "batchCode": "Batch 4", "createDate": "2022-01-04"},
    {"id": 5, "batchCode": "Batch 5", "createDate": "2022-01-05"},
  ];

  // Function to toggle selection for individual checkboxes
  void _toggleSelection(int index, bool? value) {
    setState(() {
      if (value == true) {
        _selectedIndices.add(index);
      } else {
        _selectedIndices.remove(index);
      }
      _allSelected = _selectedIndices.length == _students.length;
    });
  }

  // Function to toggle select all checkboxes
  void _toggleSelectAll(bool? value) {
    setState(() {
      _allSelected = value ?? false;
      _selectedIndices.clear();
      if (_allSelected) {
        _selectedIndices
            .addAll(List.generate(_students.length, (index) => index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('View Batches'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DataTable(
              columnSpacing: 12,
              horizontalMargin: 12,
              columns: [
                DataColumn(
                  label: Checkbox(
                    value: _allSelected,
                    onChanged: _toggleSelectAll,
                  ),
                ),
                const DataColumn(label: Text('Batch Code')),
                const DataColumn(label: Text('Create Date')),
                const DataColumn(label: Text('Edit')),
              ],
              rows: List<DataRow>.generate(
                _students.length,
                (index) => DataRow(
                  selected: _selectedIndices.contains(index),
                  cells: [
                    DataCell(
                      Checkbox(
                        value: _selectedIndices.contains(index),
                        onChanged: (bool? value) {
                          _toggleSelection(index, value);
                        },
                      ),
                    ),
                    DataCell(Text(_students[index]["batchCode"] ?? '')),
                    DataCell(Text(_students[index]["createDate"] ?? '')),
                    DataCell(
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.blue,
                          foregroundColor: MyColors.white,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Edit'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => _EditPopup(
                                    value: _students[index]["batchCode"] ?? '',
                                  ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (_selectedIndices.isNotEmpty)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.red,
              foregroundColor: MyColors.white,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            child: const Text('Delete'),
            onPressed: () {
              // Delete logic here
            },
          ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.black,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class _EditPopup extends StatefulWidget {
  final String value;

  const _EditPopup({super.key, required this.value});

  @override
  State<_EditPopup> createState() => __EditPopupState();
}

class __EditPopupState extends State<_EditPopup> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _batchCodeController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the passed value
    _batchCodeController = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _batchCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Batch'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _batchCodeController,
              cursorColor: MyColors.grey,
              decoration: InputDecoration(
                hintText: 'Batch Code',
                filled: true,
                prefixIcon: const Icon(Icons.group),
                prefixIconColor: MyColors.grey,
                fillColor: Colors.white.withOpacity(0.5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.red,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.black,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Save the edited batch code logic here
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

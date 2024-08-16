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
    final double width = MediaQuery.of(context).size.width;
    const double minSize = MySizes.minMobileScreenSize;

    return ScreenUtilInit(
        designSize: const Size(MySizes.maxMobileScreenSize, minSize * 1.6),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Scaffold(
            backgroundColor: MyColors.white,
            floatingActionButton:
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                backgroundColor: MyColors.primaryColor,
                foregroundColor: MyColors.white,
                shape: const StadiumBorder(),
                tooltip: "Create new Batch",
                onPressed: () {
                  showDialog(context: context, builder: (_) => _AddPopup());
                },
                child: Icon(Icons.add, color: MyColors.white, size: 20.sp),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                backgroundColor: MyColors.primaryColor,
                foregroundColor: MyColors.white,
                shape: const StadiumBorder(),
                tooltip: "View Batches",
                onPressed: () {
                  showDialog(context: context, builder: (_) => _ViewPopup());
                },
                child: Icon(Icons.remove_red_eye,
                    color: MyColors.white, size: 20.sp),
              )
            ]),
            // appBar: AppBar(
            //   backgroundColor: MyColors.white,
            //   title: Text(
            //     "Batch",
            //     style: TextStyle(
            //       color: MyColors.black,
            //       fontSize: 24.sp,
            //     ),
            //   ),
            //   actions: [
            //     ElevatedButton(
            //       onPressed: () {
            //         showDialog(context: context, builder: (_) => _AddPopup());
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: MyColors.primaryColor,
            //         foregroundColor: MyColors.white,
            //         shape: const StadiumBorder(),
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 20.w,
            //           vertical: 10.w,
            //         ),
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(Icons.add, size: 20.sp),
            //           Text(
            //             " Add",
            //             style: TextStyle(fontSize: 16.sp),
            //           ),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //     ElevatedButton(
            //       onPressed: () {
            //         showDialog(context: context, builder: (_) => _ViewPopup());
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: MyColors.primaryColor,
            //         foregroundColor: MyColors.white,
            //         shape: const StadiumBorder(),
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 20.w,
            //           vertical: 10.w,
            //         ),
            //       ),
            //       child: Row(
            //         children: [
            //           Icon(Icons.view_agenda_outlined, size: 20.w),
            //           Text(" View", style: TextStyle(fontSize: 16.sp)),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(width: 10),
            //   ],
            // ),
            body: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(
                      title: MyStrings.welcomeMessage,
                      breadcrumb: Row(
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                          MyBreadcrumb(
                            onPressed: () {
                              return context.router
                                  .push(const DashboardRoute());
                            },
                            title: "Dashboard",
                            size: 16.sp,
                          ),
                          MyBreadcrumb(
                            onPressed: () {
                              return context.router.push(const AcademicRoute());
                            },
                            title: "Academic",
                            size: 16.sp,
                          ),
                          MyBreadcrumb(
                            onPressed: () {
                              return context.router.push(const BatchRoute());
                            },
                            title: "Batch",
                            size: 16.sp,
                            isActive: true,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(20.w),
                      color: MyColors.white,
                      elevation: 20,
                      shadowColor: MyColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(18.0.w),
                        child: Column(
                          children: [
                            Text(
                              "Search Student",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            MyInput(
                              hintText: "ID",
                              prefixIcon: Icons.person,
                              color: MyColors.grey,
                              controller: TextEditingController(),
                            ),
                            const SizedBox(height: 10),
                            MyInput(
                              hintText: "First Name",
                              prefixIcon: Icons.person,
                              color: MyColors.grey,
                              controller: TextEditingController(),
                            ),
                            const SizedBox(height: 10),
                            MyInput(
                              hintText: "Last Name",
                              prefixIcon: Icons.person,
                              color: MyColors.grey,
                              controller: TextEditingController(),
                            ),
                            const SizedBox(height: 10),
                            FadeAnimation(
                              child: ElevatedButton(
                                onPressed: isLoading ? null : _searchStudents,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.primaryColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50.w,
                                    vertical: 5.w,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.w),
                                  ),
                                  minimumSize: Size(double.infinity, 40.h),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                MyColors.black),
                                      )
                                    : Text(
                                        "Search",
                                        style: TextStyle(
                                            color: MyColors.black,
                                            fontSize: 18.sp),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                    if (students.isNotEmpty) ...[
                      Text(
                        "Student Results:",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 10.w,
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
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          // Handle save action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50.w,
                            vertical: 5.w,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          minimumSize: Size(double.infinity, 30.h),
                        ),
                        child: const Text("Save",
                            style:
                                TextStyle(color: MyColors.black, fontSize: 18)),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
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
      backgroundColor: MyColors.white,
      title: const Text('Add Batch'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            MyInput(
              hintText: "Batch Code",
              prefixIcon: Icons.group,
              color: MyColors.grey,
              controller: TextEditingController(),
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.red,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.w,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.black,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.w,
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Add student logic here
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Add',
            style: TextStyle(fontSize: 15.sp),
          ),
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
    return ScreenUtilInit(
      designSize: const Size(460, 736),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final double width = MediaQuery.of(context).size.width;
        return AlertDialog(
          title: Text(
            'View Batches',
            style: TextStyle(fontSize: 20.sp),
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DataTable(
                    columnSpacing: 12.w,
                    horizontalMargin: 12.w,
                    columns: [
                      DataColumn(
                        label: Checkbox(
                          value: _allSelected,
                          onChanged: _toggleSelectAll,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Code',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Edit',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
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
                          DataCell(Text(
                            _students[index]["batchCode"] ?? '',
                            style: TextStyle(fontSize: 12.sp),
                          )),
                          DataCell(Text(
                            _students[index]["createDate"] ?? '',
                            style: TextStyle(fontSize: 12.sp),
                          )),
                          DataCell(
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    MyColors.blue, // Adjust the text color
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 10.h,
                                ),
                              ),
                              child: Text(
                                'Edit',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => _EditPopup(
                                    value: _students[index]["batchCode"] ?? '',
                                  ),
                                );
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
          ),
          actions: [
            if (_selectedIndices.isNotEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.red,
                  foregroundColor: MyColors.white,
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                ),
                child: Text(
                  'Delete',
                  style: TextStyle(fontSize: 16.sp),
                ),
                onPressed: () {
                  // Delete logic here
                },
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: MyColors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
              ),
              child: Text(
                'Close',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        );
      },
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

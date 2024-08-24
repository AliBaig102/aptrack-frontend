part of 'employee_mobile_imports.dart';

// Main Employee Mobile Screen
class EmployeeMobile extends StatelessWidget {
  const EmployeeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        MySizes.maxMobileScreenSize,
        MySizes.maxMobileScreenSize * 1.6,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          backgroundColor: MyColors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyColors.primaryColor,
            foregroundColor: MyColors.white,
            shape: const StadiumBorder(),
            tooltip: "Create new Employee",
            onPressed: () {
              showDialog(
                  context: context, builder: (_) => const AddEmployeePopup());
            },
            child: Icon(Icons.add, color: MyColors.white, size: 20.sp),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          return context.router.push(const DashboardRoute());
                        },
                        title: "Dashboard",
                        size: 16.sp,
                      ),
                      MyBreadcrumb(
                        onPressed: () {
                          return context.router.push(const EmployeeRoute());
                        },
                        title: "Employee",
                        size: 16.sp,
                        isActive: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(child: EmployeeTable()),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Employee Table Widget
class EmployeeTable extends StatefulWidget {
  @override
  _EmployeeTableState createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  final List<Map<String, dynamic>> _employees = [
    {"id": 1, "name": "John Doe", "role": "Manager"},
    {"id": 2, "name": "Jane Smith", "role": "Developer"},
    {"id": 3, "name": "Sam Brown", "role": "Designer"},
  ];

  bool _allSelected = false;
  final List<int> _selectedIndices = [];
  bool _isRoleChanged = false;
  Map<int, String?> _changedRoles = {};

  // Toggle selection for individual checkboxes
  void _toggleSelection(int index, bool? value) {
    setState(() {
      if (value == true) {
        _selectedIndices.add(index);
      } else {
        _selectedIndices.remove(index);
      }
      _allSelected = _selectedIndices.length == _employees.length;
    });
  }

  // Toggle select all checkboxes
  void _toggleSelectAll(bool? value) {
    setState(() {
      _allSelected = value ?? false;
      _selectedIndices.clear();
      if (_allSelected) {
        _selectedIndices
            .addAll(List.generate(_employees.length, (index) => index));
      }
    });
  }

  // Handle role change
  void _onRoleChanged(int index, String? newRole) {
    if (newRole != null && newRole != _employees[index]["role"]) {
      setState(() {
        _changedRoles[index] = newRole;
        _isRoleChanged = true;
      });
    }
  }

  // Save role changes
  void _saveRoleChanges() {
    setState(() {
      _changedRoles.forEach((index, newRole) {
        _employees[index]["role"] = newRole;
      });
      _isRoleChanged = false;
      _changedRoles.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Role changes saved successfully!')),
      );
    });
  }

  // Handle deleting selected employees
  void _deleteSelectedEmployees() {
    setState(() {
      _employees.removeWhere((employee) =>
          _selectedIndices.contains(_employees.indexOf(employee)));
      _selectedIndices.clear();
      _allSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Employee Table
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                dataRowMinHeight: 20.h,
                // columnSpacing: 28.w,
                columns: [
                  DataColumn(
                    label: Checkbox(
                      value: _allSelected,
                      onChanged: _toggleSelectAll,
                    ),
                  ),
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis))),
                  DataColumn(
                      label: Text('Role',
                          style: TextStyle(
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis))),
                  DataColumn(
                      label: Text('Change Role',
                          style: TextStyle(
                              fontSize: 10.sp,
                              overflow: TextOverflow.ellipsis))),
                  // DataColumn(label: Text('Actions', style: TextStyle(fontSize: 12.sp,overflow: TextOverflow.ellipsis))),
                ],
                rows: List<DataRow>.generate(
                  _employees.length,
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
                      DataCell(Text(_employees[index]["name"],
                          style: TextStyle(
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis))),
                      DataCell(Text(_employees[index]["role"],
                          style: TextStyle(
                              fontSize: 12.sp,
                              overflow: TextOverflow.ellipsis))),
                      DataCell(
                        DropdownButton<String>(
                          value:
                              _changedRoles[index] ?? _employees[index]["role"],
                          isExpanded: true,
                          items: ["Manager", "Developer", "Designer"]
                              .map((role) => DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis)),
                                  ))
                              .toList(),
                          onChanged: (newRole) {
                            _onRoleChanged(index, newRole);
                          },
                        ),
                      ),
                      // DataCell(
                      //   Row(
                      //     children: [
                      //       TextButton(
                      //         onPressed: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (_) => _DeleteConfirmationDialog(
                      //               onConfirm: () {
                      //                 setState(() {
                      //                   _employees.removeAt(index);
                      //                 });
                      //                 Navigator.pop(context);
                      //               },
                      //             ),
                      //           );
                      //         },
                      //         child: const Text('Delete'),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        // Action Buttons below the table
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Conditionally show Delete All button
            if (_selectedIndices.isNotEmpty)
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => _DeleteConfirmationDialog(
                          onConfirm: _deleteSelectedEmployees));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.red,
                    foregroundColor: MyColors.white),
                icon: const Icon(Icons.delete),
                label: Text(_selectedIndices.length == 1
                    ? "Delete Employee"
                    : "Delete Selected Employees"),
              ),
            SizedBox(width: 8.w),
            SizedBox(width: 8.w),
            // Conditionally show Save button
            if (_isRoleChanged)
              ElevatedButton.icon(
                onPressed: _saveRoleChanges,
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryColor,
                    foregroundColor: MyColors.white),
                icon: const Icon(Icons.save),
                label: const Text("Save Changes"),
              ),
          ],
        ),
      ],
    );
  }
}

class AddEmployeePopup extends StatefulWidget {
  const AddEmployeePopup({super.key});

  @override
  _AddEmployeePopupState createState() => _AddEmployeePopupState();
}

class _AddEmployeePopupState extends State<AddEmployeePopup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedRole;
  final List<String> _roles = ['Manager', 'Developer', 'Designer'];

  // Function to generate a random password
  String _generateRandomPassword() {
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        8, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  void _showConfirmationPopup(String name, String password) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Employee Added'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Username: $name'),
            SizedBox(height: 8.h),
            Text('Password: $password'),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: MyColors.red, foregroundColor: MyColors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.white,
      title: const Text('Add New Employee'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Employee Name',
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                  fillColor: Colors.white.withOpacity(0.5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter employee name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: InputDecoration(
                  hintText: 'Select Role',
                  filled: true,
                  prefixIcon: const Icon(Icons.work),
                  fillColor: Colors.white.withOpacity(0.5),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                items: _roles.map((role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: MyColors.red, foregroundColor: MyColors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Generate random password
              String generatedPassword = _generateRandomPassword();

              // Show confirmation popup with username and password
              // _showConfirmationPopup(_nameController.text, generatedPassword);
              Navigator.of(context).pop();
              showDialog(
                  context: context,
                  builder: (_) => ShowUserCreatedPopup(
                      name: _nameController.text, password: generatedPassword));
              // Add employee logic (you can implement saving the new employee here)
              // Close popup
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            foregroundColor: MyColors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class ShowUserCreatedPopup extends StatelessWidget {
  final String name;
  final String password;

  const ShowUserCreatedPopup(
      {super.key, required this.name, required this.password});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Employee Added'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Username: $name'),
          SizedBox(height: 8.h),
          Text('Password: $password'),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: MyColors.red, foregroundColor: MyColors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

// // Delete Confirmation Popup
// class _DeleteConfirmationDialog extends StatelessWidget {
//   final VoidCallback onConfirm;
//
//   const _DeleteConfirmationDialog({required this.onConfirm});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Confirm Delete'),
//       content: const Text('Are you sure you want to delete this employee?'),
//       actions: [
//         TextButton(
//           style: TextButton.styleFrom(backgroundColor: MyColors.transparent, foregroundColor: MyColors.red),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: onConfirm,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: MyColors.red,
//             foregroundColor: MyColors.white,
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
//           ),
//           child: const Text('Delete'),
//         ),
//       ],
//     );
//   }
// }
// Delete Confirmation Popup
class _DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const _DeleteConfirmationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Delete'),
      content: const Text('Are you sure you want to delete this employee?'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: MyColors.transparent,
              foregroundColor: MyColors.red),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

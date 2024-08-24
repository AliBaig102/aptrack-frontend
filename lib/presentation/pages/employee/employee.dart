part of 'employee_imports.dart';

@RoutePage()
class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return const MyLayout(
      mobileScreen: EmployeeMobile(),
      tabletScreen: EmployeeMobile(),
      desktopScreen: EmployeeMobile(),
    );
  }
}

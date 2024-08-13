part of 'academic_mobile_imports.dart';

class AcademicMobile extends StatefulWidget {
  const AcademicMobile({super.key});

  @override
  State<AcademicMobile> createState() => _AcademicMobileState();
}

class _AcademicMobileState extends State<AcademicMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white, // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(title: "Welcome to Aptrack Academic"),
            const SizedBox(height: 16),
            // Grid Items
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildGridItem(
                    context,
                    title: "Attendance",
                    subtitle: "Session Wise Attendance",
                    icon: Icons.person,
                    color: MyColors.black,
                  ),
                  _buildGridItem(
                    context,
                    title: "Batch",
                    subtitle: "Create Batch ,View Batch",
                    icon: Icons.group,
                    color: MyColors.black,
                    onTab: () {
                      context.router.push(const BatchRoute());
                    },
                  ),
                  _buildGridItem(
                    context,
                    title: "Attendence",
                    subtitle: "Student Wise Attendence",
                    icon: Icons.person,
                    color: MyColors.black,
                  ),
                  _buildGridItem(
                    context,
                    title: "Session",
                    subtitle: "Add Extra Session",
                    icon: Icons.person,
                    color: MyColors.black,
                  ),
                  // _buildGridItem(
                  //   context,
                  //   title: "To do",
                  //   subtitle: "4 items",
                  //   icon: Icons.check_box,
                  //   color: Colors.teal,
                  // ),
                  // _buildGridItem(
                  //   context,
                  //   title: "Settings",
                  //   subtitle: "2 items",
                  //   icon: Icons.settings,
                  //   color: Colors.purple,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    VoidCallback? onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          color: MyColors.white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.primaryColor,
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: MyColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: MyColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

part of 'dashboard_mobile_imports.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white, // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(title: "Welcome to Aptrack"),
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
                    title: "Center",
                    subtitle: "Inquirys ,Enrollments",
                    icon: Icons.book,
                    color: MyColors.black,
                  ),
                  _buildGridItem(
                    context,
                    title: "Academic",
                    subtitle: "Attendence ,Batch",
                    icon: Icons.school,
                    color: MyColors.black,
                    onTab: () {
                      context.router.push(const AcademicRoute());
                    },
                  ),
                  _buildGridItem(
                    context,
                    title: "Examination",
                    subtitle: "Practical Marks ,Final Marks",
                    icon: Icons.assignment,
                    color: MyColors.black,
                  ),
                  _buildGridItem(
                    context,
                    title: "Employees",
                    subtitle: "Add Employee ,View Employee",
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

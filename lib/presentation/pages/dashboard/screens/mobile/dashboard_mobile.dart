part of 'dashboard_mobile_imports.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    const double minSize = MySizes.minMobileScreenSize;
    return ScreenUtilInit(
        designSize: const Size(
          MySizes.maxMobileScreenSize,
          MySizes.maxMobileScreenSize * 1.6,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Scaffold(
            backgroundColor: MyColors.white, // Background color
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
                          title: "Dashboard",
                          onPressed: () {
                            return context.router.push(const DashboardRoute());
                          },
                          size: 14.sp,
                          isActive: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.w),
                  // Grid Items
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: width < minSize ? 1 : 2,
                      crossAxisSpacing: width < minSize
                          ? MySizes.minMobilePaddingScreenSize
                          : MySizes.minMobilePaddingScreenSize,
                      mainAxisSpacing: width < minSize ? 10 : 16,
                      children: [
                        _buildGridItem(
                          context,
                          title: "Center",
                          subtitle: "Inquires ,Enrollments",
                          icon: Icons.book,
                          color: MyColors.black,
                        ),
                        _buildGridItem(
                          context,
                          title: "Academic",
                          subtitle: "Attendance ,Batch",
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
                        _buildGridItem(context,
                            title: "Employees",
                            subtitle: "Add Employee ,View Employee",
                            icon: Icons.person,
                            color: MyColors.black, onTab: () {
                          context.router.push(const EmployeeRoute());
                        }),
                        _buildGridItem(
                          context,
                          title: "Courses",
                          subtitle: "Add Courses ,View Courses",
                          icon: Icons.golf_course,
                          color: MyColors.black,
                        ),
                        _buildGridItem(
                          context,
                          title: "Accounts",
                          subtitle: "Add ,View Accounts",
                          icon: Icons.account_balance,
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
        });
  }

  Widget _buildGridItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    VoidCallback? onTab,
  }) {
    final double width = MediaQuery.of(context).size.width;
    const double minSize = MySizes.minMobileScreenSize;
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
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.primaryColor,
                  radius: width < minSize ? 50 : 30.w,
                  child: Icon(
                    icon,
                    color: color,
                    size: width < minSize ? 50 : 30.w,
                  ),
                ),
                SizedBox(height: 16.w),
                Text(
                  title,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: width < minSize ? 30 : 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: width < minSize ? 20 : 16.w,
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

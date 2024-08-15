part of 'academic_mobile_imports.dart';

class AcademicMobile extends StatefulWidget {
  const AcademicMobile({super.key});

  @override
  State<AcademicMobile> createState() => _AcademicMobileState();
}

class _AcademicMobileState extends State<AcademicMobile> {
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
      builder: (context, child) {
        return Scaffold(
          backgroundColor: MyColors.white, // Background color
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: "Welcome to Aptrack",
                  breadcrumb: Row(
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: MyColors.black,
                        size: 16.sp,
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: 16.sp,
                        ),
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
      },
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
            padding: EdgeInsets.all(16.w),
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
                      fontSize: width < minSize ? 20 : 16.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

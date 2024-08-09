part of 'dashboard_mobile_imports.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF322153), // Background color
      appBar: AppBar(
        backgroundColor: Color(0xFF322153),
        title: Text("My Family"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification click
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildGridItem(
              context,
              title: "Calendar",
              subtitle: "3 Events",
              icon: Icons.calendar_today,
              color: Colors.blue,
            ),
            _buildGridItem(
              context,
              title: "Groceries",
              subtitle: "4 items",
              icon: Icons.shopping_basket,
              color: Colors.green,
            ),
            _buildGridItem(
              context,
              title: "Locations",
              subtitle: "Lucy Mae going to Office",
              icon: Icons.location_on,
              color: Colors.pink,
            ),
            _buildGridItem(
              context,
              title: "Activity",
              subtitle: "Rose fertilized your Plant",
              icon: Icons.directions_run,
              color: Colors.orange,
            ),
            _buildGridItem(
              context,
              title: "To do",
              subtitle: "4 items",
              icon: Icons.check_box,
              color: Colors.teal,
            ),
            _buildGridItem(
              context,
              title: "Settings",
              subtitle: "2 items",
              icon: Icons.settings,
              color: Colors.purple,
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
  }) {
    return Card(
      color: Color(0xFF4A3D67),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

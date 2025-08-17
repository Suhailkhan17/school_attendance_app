import 'package:flutter/material.dart';

class ParentDashboard extends StatelessWidget {
  const ParentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'Parent Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              context,
              icon: Icons.assignment_outlined,
              title: "View Reports",
              color: Colors.blueAccent,
              onTap: () {

              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.fact_check_outlined,
              title: "Attendance",
              color: Colors.green,
              onTap: () {

              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.currency_rupee,
              title: "Fees & Payments",
              color: Colors.orange,
              onTap: () {

              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.chat_bubble_outline,
              title: "Messages",
              color: Colors.purple,
              onTap: () {

              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.event_note,
              title: "School Events",
              color: Colors.redAccent,
              onTap: () {
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.settings,
              title: "Settings",
              color: Colors.teal,
              onTap: () {
                //navi
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              radius: 30,
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

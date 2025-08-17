import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/teacher.png"), // add image
                ),
                title: const Text("Ms. Anjali Sharma",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text("Subject: Mathematics"),
                trailing: IconButton(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  onPressed: () {
                    // logout action
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions
            const Text("Quick Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _dashboardTile(Icons.event_available, "Mark Attendance",
                    Colors.blue, onTap: () {}),
                _dashboardTile(Icons.assignment, "Assignments", Colors.green,
                    onTap: () {}),
                _dashboardTile(Icons.grade, "Enter Marks", Colors.orange,
                    onTap: () {}),
                _dashboardTile(Icons.people, "Student List", Colors.teal,
                    onTap: () {}),
                _dashboardTile(Icons.announcement, "Post Notice", Colors.red,
                    onTap: () {}),
                _dashboardTile(Icons.schedule, "Class Timetable", Colors.purple,
                    onTap: () {}),
              ],
            ),

            const SizedBox(height: 25),

            // Recent Notices
            const Text("Recent Activities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.campaign, color: Colors.deepPurple),
                title: const Text("Notice Sent"),
                subtitle: const Text("Shared exam instructions with Class 10A"),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.deepPurple),
                title: const Text("Attendance Marked"),
                subtitle: const Text("Attendance completed for Class 9B"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _dashboardTile(IconData icon, String title, Color color,
      {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}


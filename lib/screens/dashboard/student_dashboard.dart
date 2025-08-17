import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
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
                  backgroundImage: AssetImage("assets/student.png"), // add your image
                ),
                title: const Text("John Doe",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: const Text("Class: 10th • Roll No: 23"),
                trailing: IconButton(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  onPressed: () {
                    // logout action
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            //actions
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
                _dashboardTile(Icons.event, "Attendance", Colors.blue,
                    onTap: () {}),
                _dashboardTile(Icons.assignment, "Assignments", Colors.green,
                    onTap: () {}),
                _dashboardTile(Icons.schedule, "Timetable", Colors.orange,
                    onTap: () {}),
                _dashboardTile(Icons.emoji_events, "Exams/Results", Colors.purple,
                    onTap: () {}),
                _dashboardTile(Icons.notifications, "Notices", Colors.red,
                    onTap: () {}),
                _dashboardTile(Icons.person, "Profile", Colors.teal,
                    onTap: () {}),
              ],
            ),

            const SizedBox(height: 25),

            //announcements
            const Text("Latest Announcements",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.campaign, color: Colors.indigo),
                title: const Text("Holiday Notice"),
                subtitle: const Text("School will remain closed on 20th Aug."),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.campaign, color: Colors.indigo),
                title: const Text("Exam Schedule"),
                subtitle: const Text("Mid-term exams start from 1st Sept."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dashboard ti
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
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      ),
    );
  }
}

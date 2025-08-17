import 'package:flutter/material.dart';
import '../dashboard/admin_dashboard.dart';
import '../dashboard/teacher_dashboard.dart';
import '../dashboard/student_dashboard.dart';
import '../dashboard/parent_dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Login as Admin'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminDashboard())),
            ),
            ElevatedButton(
              child: const Text('Login as Teacher'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TeacherDashboard())),
            ),
            ElevatedButton(
              child: const Text('Login as Student'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentDashboard())),
            ),
            ElevatedButton(
              child: const Text('Login as Parent'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ParentDashboard())),
            ),
          ],
        ),
      ),
    );
  }
}

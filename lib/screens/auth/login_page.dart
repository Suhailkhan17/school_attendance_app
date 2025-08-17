import 'package:flutter/material.dart';
import '../dashboard/admin_dashboard.dart';
import '../dashboard/teacher_dashboard.dart';
import '../dashboard/student_dashboard.dart';
import '../dashboard/parent_dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedRole = "Admin"; // default role
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App Logo or Title
                    const Icon(Icons.school,
                        size: 60, color: Colors.indigo),
                    const SizedBox(height: 12),
                    const Text(
                      "School Management System",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Email Field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      items: const [
                        DropdownMenuItem(
                            value: "Admin", child: Text("Admin")),
                        DropdownMenuItem(
                            value: "Teacher", child: Text("Teacher")),
                        DropdownMenuItem(
                            value: "Student", child: Text("Student")),
                        DropdownMenuItem(
                            value: "Parent", child: Text("Parent")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRole = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Select Role",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() {
                              rememberMe = val ?? false;
                            });
                          },
                        ),
                        const Text("Remember Me"),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            // TODO: Forgot password page
                          },
                          child: const Text("Forgot Password?"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          _navigateToDashboard(context, selectedRole);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text("OR"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Social Logins
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialLoginButton(
                            icon: Icons.g_mobiledata, color: Colors.red),
                        const SizedBox(width: 20),
                        _socialLoginButton(
                            icon: Icons.facebook, color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToDashboard(BuildContext context, String role) {
    Widget page;
    switch (role) {
      case "Teacher":
        page = const TeacherDashboard();
        break;
      case "Student":
        page = const StudentDashboard();
        break;
      case "Parent":
        page = const ParentDashboard();
        break;
      default:
        page = const AdminDashboard();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Social Login icon
  Widget _socialLoginButton({required IconData icon, required Color color}) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: color.withOpacity(0.2),
      child: IconButton(
        icon: Icon(icon, color: color, size: 28),
        onPressed: () {
          // TODO: Implement Google/Facebook login
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitness_app/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Change text color if needed
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white), // Change label color if needed
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.5), // Background color for the text field
                  ),
                  style: TextStyle(color: Colors.white), // Change text color if needed
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white), // Change label color if needed
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.5), // Background color for the text field
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white), // Change text color if needed
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => signup(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromRGBO(3, 91, 109, 1.0),
                    backgroundColor: Colors.white, // Text color
                  ),
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signup(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final email = emailController.text;
    final password = passwordController.text;

    prefs.setString('email', email);
    prefs.setString('password', password);

    Navigator.pop(context);
  }
}

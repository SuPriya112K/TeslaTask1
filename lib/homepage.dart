import 'package:authetication_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  Future<void> _signOut() async {
    try {
      // Sign out the user
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logged out successfully!')),
      );
    } catch (e) {
      // Handle sign out error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        ),
      ),
      body: Center(
        child: ElevatedButton(onPressed: _signOut,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                child: Text('Logout', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                ),
              ),
      ),
    );
  }
}
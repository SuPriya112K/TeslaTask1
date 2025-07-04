import 'package:authetication_app/homepage.dart';
import 'package:authetication_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController(); 
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Login successful, navigate to home page 
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
    } on FirebaseAuthException catch (e) {
      // Handle login error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:
        Text('Login', style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('Welcome!!!', style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20
                    ),
                    hintText: 'Enter your email address',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      ),
                    ),
                    prefixIcon: Icon(
                        Icons.email_sharp,
                        color: Colors.green
                    )
                ),
                controller: _emailController,
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 20
                  ),
                  hintText: 'Enter your password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    ),
                  ),
                  prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.green
                  ),
                ),
                controller: _passwordController,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: _login,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                child: Text('Login', style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account?", style: TextStyle(
                      fontSize: 15),
                  ),
                  TextButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                      child: Text('SignUp', style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontStyle: FontStyle.italic
                      ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() { 
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
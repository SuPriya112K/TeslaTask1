import 'package:authetication_app/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: Center(
            child: Text('SignUp',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('Create an Account', style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              ),
              SizedBox(height: 20,),
              TextField(
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
                //controller: ,
              ),
              SizedBox(height: 20,),
              TextField(
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
                //controller: ,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                  child: Text('Create', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account?', style: TextStyle(
                    fontSize: 15),
                  ),
                  TextButton(onPressed: () {},
                      child: Text('Login', style: TextStyle(
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
}


import 'package:social_app2/firebase_helper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_app2/backend_data.dart';
import 'package:social_app2/main.dart';
import 'package:social_app2/screens/register_screen.dart';
import 'package:social_app2/widgets.dart';

var appuser;
var currentUser;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  bool _isObscure = true;
  bool showSpinner = false;

  String email = "", pass = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: getheight(context, 131),
              ),
              Text(
                "Social App",
                style: TextStyle(
                    fontFamily: "Aviator",
                    fontSize: getheight(context, 95),
                    color: Colors.black),
              ),
              SizedBox(
                height: getheight(context, 124),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.email_sharp),
                        onPressed: null,
                      ),
                      hintText: "Your Email Address",
                    )),
              ),
              SizedBox(
                height: getheight(context, 58),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Your Password",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.key_outlined,
                          ),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 58),
              ),
              GestureDetector(
                onTap: () async {
                  // SharedPreferences pref =
                  //     await SharedPreferences.getInstance();
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    service.loginUser(
                        context, emailController.text, passwordController.text);
                    //pref.setString('email', emailController.text);
                  } else {
                    service.errorBox(context,
                        'Fields must not be empty, please provide a valid email and password');
                  }
                },
                child: Container(
                  height: getheight(context, 79),
                  width: getwidth(context, 300),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: getheight(context, 25)),
                  )),
                ),
              ),
              SizedBox(
                height: getheight(context, 30),
              ),
              Text(
                "OR",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getheight(context, 24)),
              ),
              SizedBox(
                height: getheight(context, 44),
              ),
              SignInButton(Buttons.Google, text: "Sign in with Google",
                  onPressed: () async {
                try {
                  GoogleSignIn gs = GoogleSignIn(scopes: ['email']);
                  GoogleSignInAccount? google_user = await gs.signIn();
                  GoogleSignInAuthentication googleAuth =
                      await google_user!.authentication;
                  final AuthCredential credential =
                      GoogleAuthProvider.credential(
                          idToken: googleAuth.idToken,
                          accessToken: googleAuth.accessToken);
                  final UserCredential authResult = await FirebaseAuth.instance
                      .signInWithCredential(credential);
                  User? user = authResult.user;
                  dynamic key = await FirebaseFirestore.instance
                      .collection("Users")
                      .doc(user!.uid)
                      .get();
                  print(key.data()["Name"]);
                  appuser = currentUser(
                      name: user.displayName as String,
                      email: user.email as String,
                      uid: user.uid);
                  Navigator.pushReplacementNamed(context, "/navbar");
                } catch (e) {
                  GoogleSignIn().signOut();
                }
              }),
              SizedBox(
                height: getheight(context, 69),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forget password? ",
                    style: TextStyle(fontSize: getheight(context, 20)),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (email != "") {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email);
                      }
                    },
                    child: Text(
                      "Click me",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 24)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 59,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: getheight(context, 20)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 24)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

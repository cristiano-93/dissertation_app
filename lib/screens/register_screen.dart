import 'package:social_app2/firebase_helper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:social_app2/backend_data.dart';
import 'package:social_app2/main.dart';

import 'package:social_app2/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  bool _isObscure = true;

  final _auth = FirebaseAuth.instance;
  late String name = "", email = "", pass = "";
  bool showSpinner = false;

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
                "Welcome",
                style: TextStyle(
                    fontSize: getheight(context, 64), color: Colors.black),
              ),
              SizedBox(
                height: getheight(context, 132),
              ),
              Text(
                "Register your details",
                style: TextStyle(fontSize: getheight(context, 36)),
              ),
              SizedBox(
                height: getheight(context, 60),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                  //onChanged: ((value) => name = value),
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: null,
                    ),
                    hintText: "Your Name",
                  ),
                ),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    //onChanged: ((value) => email = value),
                    controller: emailController,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Your Email Address",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.email),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                  obscureText: _isObscure,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    fillColor: Colors.white,
                    hintText: "Your Password",
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.key,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
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
                    service.createUser(
                        context, emailController.text, passwordController.text);
                    //pref.setString('email', emailController.text);
                    service.createUserInCollection(
                        nameController.text, emailController.text);
                  } else {
                    service.errorBox(context,
                        'Fields must not be empty, please provide a valid email and password');
                  }
                },
                child: Container(
                  height: getheight(context, 75),
                  width: getwidth(context, 300),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 25)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getheight(context, 20),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () async {
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
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(user!.uid)
                      .set(
                    {
                      "name": user.displayName,
                      "email": user.email,
                      "id": user.uid
                    },
                    SetOptions(merge: true),
                  );
                  // appuser = await currentUser(
                  //     name: user.displayName!,
                  //     email: user.email!,
                  //     uid: user.uid);
                  Navigator.pushReplacementNamed(context, "/loading");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

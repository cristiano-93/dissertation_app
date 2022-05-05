import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'backend_data.dart';
import 'main.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    checkAuth();
    setState(() {});
  }

  void checkAuth() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      try {
        if (user == null) {
          print('no user with this info');
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          dynamic key = await FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
          // try {
          //   appuser = current_user(
          //       name: key.data()["Name"],
          //       email: key.data()["Email"],
          //       phone: key.data()["Phone"],
          //       uid: key.data()["uid"]);
          // } catch (e) {
          //   appuser = current_user(
          //       name: key.data()["Name"],
          //       email: key.data()["Email"],
          //       uid: key.data()["uid"]);
          // }
          Navigator.pushReplacementNamed(context, '/new_chat_screen');
        }
      } catch (e) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Loading...",
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}

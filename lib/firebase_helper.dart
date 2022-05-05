import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/screens/login_screen.dart';
import 'package:social_app2/screens/recent_chats_screen.dart';

class Service {
  final auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Future<String?> getUserByEmail(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final snapshot = await users.doc(email).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['email'];
    } catch (e) {
      return 'Error fetching user';
    }
  }

  void createUserInCollection(name, email) {
    final User? user = currentUser;
    final CollectionReference<Map<String, dynamic>> usersRef =
        FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'name': name,
      'email': email,
    });
  }

  void createUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(),
                  ),
                )
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void loginUser(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(),
                  ),
                )
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void signOut(context) async {
    try {
      await auth.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LogIn(),
                ),
                (route) => false)
          });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("error"),
            content: Text(
              e.toString(),
            ),
          );
        });
  }
}

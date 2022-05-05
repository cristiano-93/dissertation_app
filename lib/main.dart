import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app2/loading_page.dart';
import 'package:social_app2/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

//late currentUser appuser;
//late currentUser appuser = currentUser(name: "", email: "", uid: "");

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initial = '/login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LogIn(),
        '/register': (context) => Register(),
        '/profile': (context) => Profile(),
        '/loading': (context) => LoadingPage(),
        '/new_chat_screen': (context) => ChatsScreen(),
        '/new_message_screen': (context) => MessageScreen(),
        '/new_contacts_screen': (context) => ContactsScreen(),
        '/helper': (context) => HelperPage(),
      },
      initialRoute: initial,
    );
  }
}

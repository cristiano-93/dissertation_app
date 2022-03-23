import 'package:flutter/material.dart';
import 'package:dissertation_app/screens/screens.dart';
import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/test': (context) => TestScreen(),
      },
    );
  }
}

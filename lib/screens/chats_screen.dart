import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

import 'package:dissertation_app/theme.dart';
import '../components/components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Current Page',
            style: TextStyle(
              color: AppColors.kTextDark,
              fontSize: 20,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Avatar(
              name: 'Cristiano Santos',
              textStyle: TextStyle(
                color: Colors.blue.shade300,
                fontSize: 30,
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(40),
                child: const Center(
                  child: Text(
                    'Recent Chats',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.kTextDark,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('All Chats'),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 20, color: Colors.white),
                          backgroundColor: Colors.blue.shade100,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Voice Calls'),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Video Calls'),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.grey.shade300,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [Text('data')],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

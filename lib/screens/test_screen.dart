import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/avatar.dart';
import '../components/elements.dart';
import '../components/helper.dart';
import '../theme.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Message Page',
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
            Avatar.medium(url: Helper.randomPictureUrl())
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // container for the filtering row
              margin: const EdgeInsets.only(
                  left: 70, top: 30, right: 70, bottom: 30),
              padding: const EdgeInsets.all(4),

              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 160,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.arrow_back_outlined,
                              color: AppColors.kIconDark,
                            ),
                            Text(
                              'Go Back',
                              style: TextStyle(color: AppColors.kTextDark),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.call,
                              color: AppColors.kIconDark,
                            ),
                            Text(
                              'Voice Call',
                              style: TextStyle(color: AppColors.kTextDark),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.videocam,
                              color: AppColors.kIconDark,
                            ),
                            Text(
                              'Video Call',
                              style: TextStyle(color: AppColors.kTextDark),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: const [
                Expanded(
                  child: DemoMessageList(),
                ),
                ActionBar(),
              ],
            ),
            Container(
              // container for the bottom toolbar
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chats');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.message,
                          size: 40,
                          color: AppColors.kIconDark,
                        ),
                        Text(
                          'Chat List',
                          style: TextStyle(
                              fontSize: 20, color: AppColors.kTextDark),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contacts');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.contact_page_outlined,
                          size: 40,
                          color: Colors.blue,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.account_circle,
                          size: 40,
                          color: AppColors.kIconDark,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 20, color: AppColors.kTextDark),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('helper');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.help_center,
                          size: 40,
                          color: AppColors.kIconDark,
                        ),
                        Text(
                          'Helper',
                          style: TextStyle(
                              fontSize: 20, color: AppColors.kTextDark),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

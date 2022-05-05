import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../elements.dart';
import '../helper.dart';
import '../model/avatar.dart';
import '../theme.dart';
import '../widgets.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Contact List',
            style: TextStyle(
              color: AppColors.kTextDark,
              fontSize: 30,
            ),
          ),
          actions: [
            SizedBox(
              height: 40,
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(width: getwidth(context, 10)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Hello,",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Text(
                    'Cristiano',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Avatar.medium(
                url: Helper.randomPictureUrl(),
              ),
            ),
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
                          Navigator.pushNamed(context, '/test');
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
            Container(
              height: 860,
              margin: const EdgeInsets.all(10),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: <Widget>[
                  DemoMessageList(),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      CupertinoIcons.camera_fill,
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 24.0,
                  ),
                  child: GlowingActionButton(
                    color: AppColors.accent,
                    icon: Icons.send_rounded,
                    onPressed: () {
                      print('TODO: send a message');
                    },
                  ),
                ),
              ],
            ),
            Container(
              // container for the bottom toolbar
              height: 80,
              margin: const EdgeInsets.only(
                  left: 50, right: 50, top: 30, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new_chat_screen');
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
                      Navigator.pushNamed(context, '/new_contacts_screen');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.contact_page_outlined,
                          size: 40,
                          color: AppColors.kIconDark,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(
                              fontSize: 20, color: AppColors.kTextDark),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
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
                              fontSize: 20, color: AppColors.kIconDark),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/helper');
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
            )
          ],
        ),
      ),
    );
  }
}
